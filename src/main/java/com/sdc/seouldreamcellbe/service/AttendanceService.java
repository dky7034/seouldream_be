package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.Semester;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.attendance.AttendanceDto;
import com.sdc.seouldreamcellbe.dto.attendance.ProcessAttendanceRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.PrayerRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import com.sdc.seouldreamcellbe.repository.specification.AttendanceSpecification;
import com.sdc.seouldreamcellbe.security.CurrentUserFinder;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;
    private final PrayerRepository prayerRepository;
    private final MemberRepository memberRepository;
    private final UserRepository userRepository;
    private final CurrentUserFinder currentUserFinder;
    private final ActiveSemesterService activeSemesterService;

    @Transactional
    public List<AttendanceDto> processAttendances(List<ProcessAttendanceRequest> requests, String username) {
        for (ProcessAttendanceRequest request : requests) {
            if (request.date().getDayOfWeek() != java.time.DayOfWeek.SUNDAY) {
                throw new IllegalArgumentException("출석 체크는 일요일만 가능합니다. 요청 날짜: " + request.date());
            }
        }

        User createdBy = userRepository.findByUsername(username)
                .orElseThrow(() -> new NotFoundException("인증된 사용자를 찾을 수 없습니다. Username: " + username));

        List<Attendance> attendancesToSave = requests.stream().map(request -> {
            Attendance attendance = attendanceRepository.findByMember_IdAndDateWithMemberAndCreatedBy(request.memberId(), request.date())
                .orElse(new Attendance());

            if (attendance.getMember() == null) {
                Member member = memberRepository.findById(request.memberId())
                    .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + request.memberId()));
                attendance.setMember(member);
            }

            // Snapshot the current cell for historical integrity
            if (attendance.getCell() == null && attendance.getMember() != null) {
                attendance.setCell(attendance.getMember().getCell());
            }

            attendance.setDate(request.date());
            attendance.setStatus(request.status());
            attendance.setMemo(request.memo());
            
            if (attendance.getId() == null) {
                attendance.setCreatedBy(createdBy);
            }
            
            return attendance;
        }).collect(Collectors.toList());

        List<Attendance> savedAttendances = attendanceRepository.saveAll(attendancesToSave);

        return savedAttendances.stream()
            .map(AttendanceDto::from)
            .collect(Collectors.toList());
    }

    public Page<AttendanceDto> getAttendances(LocalDate startDate, LocalDate endDate, Long memberId, Long cellId, AttendanceStatus status, Pageable pageable) {

        if (startDate == null && endDate == null) {
            Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }
        
        User currentUser = currentUserFinder.getCurrentUser();
        Long effectiveCellId = cellId;

        if (currentUser.getRole() != Role.EXECUTIVE) {
            Member currentMember = currentUser.getMember();
            if (currentMember == null || currentMember.getCell() == null) {
                if (cellId != null) {
                    throw new AccessDeniedException("셀에 소속되어 있지 않아 특정 셀의 출석을 조회할 수 없습니다.");
                }
            } else {
                Long currentUserCellId = currentMember.getCell().getId();
                if (cellId != null && !cellId.equals(currentUserCellId)) {
                    throw new AccessDeniedException("자신이 속한 셀의 정보만 조회할 수 있습니다.");
                }
                effectiveCellId = currentUserCellId;
            }

            if (memberId != null) {
                Member targetMember = memberRepository.findById(memberId)
                        .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));
                if (targetMember.getCell() == null || !targetMember.getCell().getId().equals(effectiveCellId)) {
                    throw new AccessDeniedException("자신이 속한 셀의 멤버 정보만 조회할 수 있습니다.");
                }
            }
        }

        List<Specification<Attendance>> specifications = new ArrayList<>();

        specifications.add(AttendanceSpecification.fetchRelated());
        specifications.add(AttendanceSpecification.hasDateBetween(startDate, endDate));

        if (memberId != null) {
            specifications.add(AttendanceSpecification.hasMemberId(memberId));
        }
        if (effectiveCellId != null) {
            specifications.add(AttendanceSpecification.hasCellId(effectiveCellId));
        }
        if (status != null) {
            specifications.add(AttendanceSpecification.hasStatus(status));
        }

        Specification<Attendance> spec = Specification.allOf(specifications);

        Page<Attendance> attendancePage = attendanceRepository.findAll(spec, pageable);

        List<Attendance> attendances = attendancePage.getContent();
        if (attendances.isEmpty()) {
            return attendancePage.map(AttendanceDto::from);
        }

        List<Long> memberIds = attendances.stream()
            .map(att -> att.getMember().getId())
            .distinct()
            .collect(Collectors.toList());

        LocalDate rangeStart = attendances.stream()
            .map(Attendance::getDate)
            .min(LocalDate::compareTo)
            .orElse(LocalDate.now());

        LocalDate rangeEnd = attendances.stream()
            .map(Attendance::getDate)
            .max(LocalDate::compareTo)
            .orElse(LocalDate.now());

        List<Prayer> prayers = prayerRepository.findByMember_IdInAndMeetingDateBetween(memberIds, rangeStart, rangeEnd);

        Map<String, String> prayerMap = prayers.stream()
            .filter(p -> p.getMeetingDate() != null) // ADDED: Ensure no NPEs from old data
            .collect(Collectors.toMap(
                p -> p.getMember().getId() + ":" + p.getMeetingDate(),
                Prayer::getContent,
                (existing, replacement) -> replacement // If duplicate key, take the last one
            ));

        return attendancePage.map(att -> {
            String key = att.getMember().getId() + ":" + att.getDate();
            String prayerContent = prayerMap.get(key);
            return AttendanceDto.from(att, prayerContent);
        });
    }
    
    @Transactional
    public void deleteAttendance(Long attendanceId) {
        if (!attendanceRepository.existsById(attendanceId)) {
            throw new NotFoundException("출석 기록을 찾을 수 없습니다. ID: " + attendanceId);
        }
        attendanceRepository.deleteById(attendanceId);
    }
}