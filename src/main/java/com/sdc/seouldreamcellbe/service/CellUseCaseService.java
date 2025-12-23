package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.CellReport;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.attendance.ProcessAttendanceRequest;
import com.sdc.seouldreamcellbe.dto.cell.AttendanceAndPrayerItem;
import com.sdc.seouldreamcellbe.dto.cell.ProcessAttendanceWithPrayersRequest;
import com.sdc.seouldreamcellbe.dto.prayer.CreatePrayerRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.CellReportRepository;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.security.CurrentUserFinder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class CellUseCaseService {

    private final AttendanceService attendanceService;
    private final PrayerService prayerService;
    private final MemberRepository memberRepository;
    private final CellRepository cellRepository;
    private final CellReportRepository cellReportRepository; // Added
    private final CurrentUserFinder currentUserFinder;

    @Transactional
    public void processAttendanceAndPrayers(Long cellId, ProcessAttendanceWithPrayersRequest request) {
        User currentUser = currentUserFinder.getCurrentUser();
        LocalDate meetingDate = request.meetingDate();
        log.info("Processing attendance/prayers for cellId: {}, meetingDate: {}", cellId, meetingDate);

        // 1. 권한 검증 (셀장 또는 임원)
        if (currentUser.getRole() != Role.EXECUTIVE && currentUser.getRole() != Role.CELL_LEADER) {
            throw new AccessDeniedException("출석 및 기도제목을 통합 저장할 권한이 없습니다.");
        }

        // 2. 셀 존재 여부 및 권한 확인 (셀장일 경우 자신의 셀에 대해서만)
        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));

        if (currentUser.getRole() == Role.CELL_LEADER) {
            Member leaderMember = currentUser.getMember();
            if (leaderMember == null || leaderMember.getCell() == null || !leaderMember.getCell().getId().equals(cellId)) {
                throw new AccessDeniedException("셀장은 자신의 셀에 대해서만 출석 및 기도제목을 저장할 수 있습니다.");
            }
        }

        // 3. 날짜 유효성 체크 (일요일만 허용)
        if (meetingDate.getDayOfWeek() != DayOfWeek.SUNDAY) {
            throw new IllegalArgumentException("출석 및 기도제목 저장 날짜는 일요일만 허용됩니다.");
        }
        
        // 4. 요청 데이터 검증 - 모든 memberId가 해당 cellId 소속인지 체크
        Set<Long> cellMemberIds = memberRepository.findByCell_IdAndActive(cellId, true).stream()
            .map(Member::getId)
            .collect(Collectors.toSet());

        for (AttendanceAndPrayerItem item : request.items()) {
            if (!cellMemberIds.contains(item.memberId())) {
                throw new IllegalArgumentException("요청된 memberId " + item.memberId() + "는 셀 ID " + cellId + "에 속하지 않거나 활성 상태가 아닙니다.");
            }
        }

        // 5. 셀 리포트 정보 처리
        CellReport cellReport = cellReportRepository.findByCell_IdAndMeetingDate(cellId, meetingDate)
            .orElse(CellReport.builder().cell(cell).meetingDate(meetingDate).build());

        cellReport.setCellShare(request.cellShare());
        cellReport.setSpecialNotes(request.specialNotes());

        cellReportRepository.save(cellReport);

        // 6. 출석 정보 처리 (AttendanceService 호출)
        List<ProcessAttendanceRequest> attendanceRequests = request.items().stream()
            .map(item -> new ProcessAttendanceRequest(
                item.memberId(),
                meetingDate, // Use unified meeting date
                item.status(),
                item.memo())
            )
            .collect(Collectors.toList());
        
        attendanceService.processAttendances(attendanceRequests, currentUser.getUsername());

        // 7. 기도제목 정보 처리 (PrayerService 호출)
        request.items().stream()
            .filter(item -> item.prayerContent() != null && !item.prayerContent().isBlank()) // 빈 기도제목은 건너뛰기
            .forEach(item -> {
                // Calculate week of month
                int dayOfMonth = meetingDate.getDayOfMonth();
                int weekOfMonth = (dayOfMonth - 1) / 7 + 1;
                
                CreatePrayerRequest createPrayerRequest = CreatePrayerRequest.builder()
                    .memberId(item.memberId())
                    .meetingDate(meetingDate) // ADDED
                    .content(item.prayerContent())
                    .visibility(PrayerVisibility.CELL) // A sensible default
                    .weekOfMonth(weekOfMonth)
                    .createdById(currentUser.getId()) // 현재 사용자 ID 사용
                    .build();
                prayerService.createPrayer(createPrayerRequest);
            });
    }
}

