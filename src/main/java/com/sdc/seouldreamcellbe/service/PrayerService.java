package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.prayer.*;
import com.sdc.seouldreamcellbe.dto.semester.SemesterDto;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.PrayerRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import com.sdc.seouldreamcellbe.repository.specification.PrayerSpecification;
import com.sdc.seouldreamcellbe.security.CurrentUserFinder;
import com.sdc.seouldreamcellbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Slf4j
public class PrayerService {

    private final PrayerRepository prayerRepository;
    private final MemberRepository memberRepository;
    private final UserRepository userRepository;
    private final CurrentUserFinder currentUserFinder;
    private final SemesterService semesterService; // Injected SemesterService
    private final ActiveSemesterService activeSemesterService;

    public List<Integer> getAvailableYears() {
        User currentUser = currentUserFinder.getCurrentUser();
        Role role = currentUser.getRole();
        Member member = currentUser.getMember();

        switch (role) {
            case EXECUTIVE:
                return prayerRepository.findDistinctYearsForExecutive();
            case CELL_LEADER:
                if (member != null && member.getCell() != null) {
                    return prayerRepository.findDistinctYearsForCellLeader(
                        member.getCell().getId(),
                        PrayerVisibility.ALL,
                        PrayerVisibility.CELL
                    );
                }
                break;
            case MEMBER:
                if (member != null && member.getCell() != null) {
                    return prayerRepository.findDistinctYearsForMember(
                        member.getCell().getId(),
                        currentUser.getId(),
                        PrayerVisibility.ALL,
                        PrayerVisibility.CELL,
                        PrayerVisibility.PRIVATE
                    );
                }
                break;
            default:
                return new ArrayList<>();
        }
        return new ArrayList<>();
    }

    @Transactional
    public PrayerDto createPrayer(CreatePrayerRequest request) {
        log.info("Creating prayer: memberId={}, meetingDate={}, content={}", request.memberId(), request.meetingDate(), request.content());
        Member member = memberRepository.findById(request.memberId())
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + request.memberId()));

        User createdBy = userRepository.findById(request.createdById())
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. ID: " + request.createdById()));

        // Check if a prayer already exists for this member and date
        Prayer prayer = prayerRepository.findByMember_IdAndMeetingDate(request.memberId(), request.meetingDate())
                .orElse(Prayer.builder()
                        .member(member)
                        .meetingDate(request.meetingDate())
                        .visibility(request.visibility() != null ? request.visibility() : PrayerVisibility.CELL)
                        .createdBy(createdBy)
                        .build());

        // Update content and other fields
        prayer.setContent(request.content());
        prayer.setWeekOfMonth(request.weekOfMonth());
        // Only update visibility if explicitly provided in request, otherwise keep existing or default
        if (request.visibility() != null) {
            prayer.setVisibility(request.visibility());
        }

        Prayer savedPrayer = prayerRepository.save(prayer);
        return PrayerDto.from(savedPrayer);
    }

    public PrayerDto getPrayerById(Long prayerId) {
        Prayer prayer = prayerRepository.findById(prayerId)
            .orElseThrow(() -> new NotFoundException("기도제목을 찾을 수 없습니다. ID: " + prayerId));
        // TODO: Add visibility check here for security
        return PrayerDto.from(prayer);
    }

    public Page<PrayerDto> getPrayers(UserDetails userDetails, Long memberId, Long cellId, Long createdById, Boolean isDeleted, LocalDate startDate, LocalDate endDate, Pageable pageable) {
        User currentUser = currentUserFinder.getCurrentUser();
        Long effectiveCellId = cellId;

        // Enforce cell-scoping for non-executives
        if (currentUser.getRole() != Role.EXECUTIVE) {
            Member currentMember = currentUser.getMember();
            if (currentMember == null || currentMember.getCell() == null) {
                if (cellId != null) throw new AccessDeniedException("셀에 소속되어 있지 않아 특정 셀의 기도제목을 조회할 수 없습니다.");
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


        // Remap sort properties to valid paths
        List<Sort.Order> orders = pageable.getSort().stream()
                .map(order -> {
                    if (order.getProperty().equals("creatorName") || order.getProperty().equals("createdBy.name")) {
                        return new Sort.Order(order.getDirection(), "createdBy.member.name");
                    }
                    if (order.getProperty().equals("memberName")) {
                        return new Sort.Order(order.getDirection(), "member.name");
                    }
                    return order;
                })
                .collect(Collectors.toList());
        Pageable remappedPageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Sort.by(orders));

        // Refactored Specification building
        List<Specification<Prayer>> specifications = new ArrayList<>();
        specifications.add(PrayerSpecification.hasDateBetween(startDate, endDate));


        if (memberId != null) {
            specifications.add(PrayerSpecification.hasMemberId(memberId));
        }
        if (effectiveCellId != null) {
            specifications.add(PrayerSpecification.hasCellId(effectiveCellId));
        }
        if (createdById != null) {
            specifications.add(PrayerSpecification.wasCreatedBy(createdById));
        }

        // Default to not showing deleted prayers if isDeleted is null
        specifications.add(PrayerSpecification.isDeleted(isDeleted != null ? isDeleted : false));


        Specification<Prayer> spec = Specification.allOf(specifications);

        Page<Prayer> prayerPage = prayerRepository.findAll(spec, remappedPageable);
        return prayerPage.map(PrayerDto::from);
    }

    public Page<PrayerMemberSummaryDto> getMemberPrayerSummary(
        LocalDate startDate, LocalDate endDate, Integer year, Integer month, Integer quarter, Integer half, Long semesterId,
        Long cellId, Long memberId, Long createdById, Boolean isDeleted, Pageable pageable) {

        DateUtil.DateRange dateRange = resolveDateRange(startDate, endDate, year, month, quarter, half, semesterId);
        Long effectiveCellId = resolveEffectiveCellId(cellId);
        Boolean finalIsDeleted = isDeleted != null ? isDeleted : false;

        LocalDate startLocalDate = dateRange.startDate();
        LocalDate endLocalDate = dateRange.endDate() != null ? dateRange.endDate().plusDays(1) : null;

        return prayerRepository.findMemberPrayerSummary(startLocalDate, endLocalDate, effectiveCellId, memberId, createdById, finalIsDeleted, pageable);
    }

    public Page<PrayerCellSummaryDto> getCellPrayerSummary(
        LocalDate startDate, LocalDate endDate, Integer year, Integer month, Integer quarter, Integer half, Long semesterId,
        Long cellId, Long memberId, Long createdById, Boolean isDeleted, Pageable pageable) {
        
        DateUtil.DateRange dateRange = resolveDateRange(startDate, endDate, year, month, quarter, half, semesterId);
        Long effectiveCellId = resolveEffectiveCellId(cellId);
        Boolean finalIsDeleted = isDeleted != null ? isDeleted : false;
        
        LocalDate startLocalDate = dateRange.startDate();
        LocalDate endLocalDate = dateRange.endDate() != null ? dateRange.endDate().plusDays(1) : null;

        return prayerRepository.findCellPrayerSummary(startLocalDate, endLocalDate, effectiveCellId, memberId, createdById, finalIsDeleted, pageable);
    }

    private Long resolveEffectiveCellId(Long requestedCellId) {
        User currentUser = currentUserFinder.getCurrentUser();
        if (currentUser.getRole() == Role.CELL_LEADER) {
            Member currentMember = currentUser.getMember();
            if (currentMember == null || currentMember.getCell() == null) {
                throw new AccessDeniedException("셀에 소속되어 있지 않아 셀 정보를 조회할 수 없습니다.");
            }
            return currentMember.getCell().getId();
        }
        return requestedCellId; // For EXECUTIVE or if no override is needed
    }

    private DateUtil.DateRange resolveDateRange(LocalDate startDate, LocalDate endDate, Integer year, Integer month, Integer quarter, Integer half, Long semesterId) {
        if (semesterId != null) {
            SemesterDto semester = semesterService.getSemesterById(semesterId);
            return new DateUtil.DateRange(semester.startDate(), semester.endDate());
        }
        if (startDate == null && endDate == null && year == null && month == null && quarter == null && half == null) {
            // If no date params, default to active semester
            com.sdc.seouldreamcellbe.domain.Semester activeSemester = activeSemesterService.getActiveSemester();
            return new DateUtil.DateRange(activeSemester.getStartDate(), activeSemester.getEndDate());
        }
        return DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
    }


    @Transactional
    public PrayerDto updatePrayer(Long prayerId, UpdatePrayerRequest request) {
        Prayer prayer = prayerRepository.findById(prayerId)
            .orElseThrow(() -> new NotFoundException("기도제목을 찾을 수 없습니다. ID: " + prayerId));

        if (request.meetingDate() != null) prayer.setMeetingDate(request.meetingDate());
        if (request.content() != null) prayer.setContent(request.content());
        if (request.weekOfMonth() != null) prayer.setWeekOfMonth(request.weekOfMonth());
        if (request.visibility() != null) prayer.setVisibility(request.visibility());
        
        return PrayerDto.from(prayer);
    }

    @Transactional
    public void deletePrayer(Long prayerId) {
        Prayer prayer = prayerRepository.findById(prayerId)
            .orElseThrow(() -> new NotFoundException("기도제목을 찾을 수 없습니다. ID: " + prayerId));
        
        // This will trigger the @SQLDelete annotation on the Prayer entity
        prayerRepository.delete(prayer);
    }
}
