package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.*;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.cell.CellDto;
import com.sdc.seouldreamcellbe.dto.cell.CellLeaderDashboardDto;
import com.sdc.seouldreamcellbe.dto.cell.CellMemberAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.cell.CreateCellRequest;
import com.sdc.seouldreamcellbe.dto.cell.UpdateCellRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.specification.CellSpecification;
import com.sdc.seouldreamcellbe.security.CurrentUserFinder;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class CellService {

    private final CellRepository cellRepository;
    private final MemberRepository memberRepository;
    private final com.sdc.seouldreamcellbe.repository.AttendanceRepository attendanceRepository;
    private final com.sdc.seouldreamcellbe.repository.SemesterRepository semesterRepository; // Added injection
    private final com.sdc.seouldreamcellbe.security.CurrentUserFinder currentUserFinder;
    private final ActiveSemesterService activeSemesterService;
    private final AttendanceSummaryService attendanceSummaryService; // Injected for accurate calculation

    public List<Integer> getAvailableYears(Long cellId) {
        return attendanceRepository.findDistinctYearsByCellId(cellId);
    }

    public List<Integer> getAllAvailableYears() {
        return semesterRepository.findAll().stream()
            .flatMap(semester -> java.util.stream.Stream.of(semester.getStartDate().getYear(), semester.getEndDate().getYear()))
            .distinct()
            .sorted(java.util.Collections.reverseOrder())
            .collect(Collectors.toList());
    }

    public CellLeaderDashboardDto getCellLeaderDashboardSummary(Long cellId, LocalDate startDate, LocalDate endDate) {
        // If no date range is specified, default to the active semester
        if (startDate == null && endDate == null) {
            Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }

        User currentUser = currentUserFinder.getCurrentUser();

        // 1. Validate cellId and apply security scoping
        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));

        if (currentUser.getRole() == Role.CELL_LEADER) {
            Member leaderMember = currentUser.getMember();
            if (leaderMember == null || leaderMember.getCell() == null || !leaderMember.getCell().getId().equals(cellId)) {
                throw new AccessDeniedException("셀장은 자신의 셀 대시보드만 조회할 수 있습니다.");
            }
            
            // Security Check: Allow if Current Year OR Active Semester
            int currentYear = LocalDate.now().getYear();
            boolean isCurrentYear = (startDate.getYear() == currentYear || endDate.getYear() == currentYear);
            boolean isActiveSemester = activeSemesterService.isDateRangeInActiveSemester(startDate, endDate);

            if (!isCurrentYear && !isActiveSemester) {
                throw new AccessDeniedException("셀장은 현재 연도 또는 활성화된 학기의 데이터만 조회할 수 있습니다.");
            }
        } else if (currentUser.getRole() != Role.EXECUTIVE) {
            // Neither CELL_LEADER nor EXECUTIVE, deny access.
            throw new AccessDeniedException("대시보드를 조회할 권한이 없습니다.");
        }

        // Get total active members in the cell
        long totalMembers = memberRepository.countByCell_IdAndActive(cellId, true);
        if (totalMembers == 0) {
            return CellLeaderDashboardDto.builder()
                .presentRecords(0).totalMembers(0).attendanceRate(0.0).incompleteCheckCount(0).build();
        }

        // Calculate attendance metrics using AttendanceSummaryService for accuracy (considers assignment date & excludes executives)
        com.sdc.seouldreamcellbe.dto.attendance.SimpleAttendanceRateDto rateDto = attendanceSummaryService.getCellAttendanceRate(cellId, startDate, endDate);
        
        long presentRecords = rateDto.presentCount();
        // long absentRecords = rateDto.absentCount();
        double attendanceRate = rateDto.attendanceRate();

        // Calculate incompleteCheckCount (Needs raw data)
        List<Attendance> attendances = attendanceRepository.findByCell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, startDate, endDate);
        int incompleteCheckCount = 0;
        
        LocalDate calculationEndDate = endDate.isAfter(LocalDate.now()) ? LocalDate.now() : endDate;
        List<LocalDate> sundaysInPeriod = startDate.datesUntil(calculationEndDate.plusDays(1))
            .filter(date -> date.getDayOfWeek() == DayOfWeek.SUNDAY)
            .collect(Collectors.toList());

        // Group attendances by date for quick lookup
        Map<LocalDate, List<Attendance>> attendancesByDate = attendances.stream()
            .collect(Collectors.groupingBy(Attendance::getDate));

        List<Member> activeMembersInCell = memberRepository.findByCell_IdAndActive(cellId, true);
        Set<Long> activeMemberIds = activeMembersInCell.stream().map(Member::getId).collect(Collectors.toSet());

        for (LocalDate sunday : sundaysInPeriod) {
            List<Attendance> recordsOnSunday = attendancesByDate.getOrDefault(sunday, Collections.emptyList());
            Set<Long> membersPresentOrAbsentOnSunday = recordsOnSunday.stream()
                .map(att -> att.getMember().getId())
                .collect(Collectors.toSet());

            // If the set of members with records is not equal to the set of active members, it's incomplete
            if (activeMemberIds.size() != membersPresentOrAbsentOnSunday.size() || !membersPresentOrAbsentOnSunday.containsAll(activeMemberIds)) {
                incompleteCheckCount++;
            }
        }

        return CellLeaderDashboardDto.builder()
            .presentRecords(presentRecords)
            .totalMembers(totalMembers)
            .attendanceRate(attendanceRate)
            .incompleteCheckCount(incompleteCheckCount)
            .build();
    }

    @Transactional
    public CellDto createCell(CreateCellRequest request) {
        Member leader = null;
        if (request.leaderId() != null) {
            leader = memberRepository.findById(request.leaderId())
                .orElseThrow(() -> new NotFoundException("리더로 지정된 멤버를 찾을 수 없습니다. ID: " + request.leaderId()));
        }

        Member viceLeader = null;
        if (request.viceLeaderId() != null) {
            viceLeader = memberRepository.findById(request.viceLeaderId())
                .orElseThrow(() -> new NotFoundException("부리더로 지정된 멤버를 찾을 수 없습니다. ID: " + request.viceLeaderId()));
        }

        Cell newCell = Cell.builder()
            .name(request.name())
            .leader(leader)
            .viceLeader(viceLeader)
            .description(request.description())
            .active(true)
            .build();

        Cell savedCell = cellRepository.save(newCell);

        // --- Bulk assign members to the new cell ---
        Set<Long> allMemberIdsToAssign = new HashSet<>();
        if (request.memberIds() != null) {
            allMemberIdsToAssign.addAll(request.memberIds());
        }
        // Also include leader and vice-leader in the assignment logic
        if (leader != null) {
            allMemberIdsToAssign.add(leader.getId());
        }
        if (viceLeader != null) {
            allMemberIdsToAssign.add(viceLeader.getId());
        }

                if (!allMemberIdsToAssign.isEmpty()) {

                    List<Member> membersToAssign = memberRepository.findAllById(allMemberIdsToAssign);

                    for (Member member : membersToAssign) {

                        member.setCell(savedCell);

                        member.setCellAssignmentDate(LocalDate.now()); // ADDED

                    }

                }

        // Refetch the cell to ensure the members list in the response is populated
        return getCellById(savedCell.getId());
    }

    public CellDto getCellById(Long cellId) {
        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));
        return CellDto.from(cell);
    }

    public Page<CellDto> getAllCells(String name, Boolean active, LocalDate startDate, LocalDate endDate, Pageable pageable) {
        List<Specification<Cell>> specifications = new ArrayList<>();

        if (name != null && !name.isBlank()) {
            specifications.add(CellSpecification.hasName(name));
        }
        if (active != null) {
            specifications.add(CellSpecification.isActive(active));
        }

        // Check if sorting by attendanceRate is requested
        boolean sortByAttendanceRate = pageable.getSort().stream()
            .anyMatch(order -> "attendanceRate".equals(order.getProperty()));

        if (sortByAttendanceRate) {
            // 1. Fetch ALL matching cells (unpaged)
            List<Cell> allCells = cellRepository.findAll(Specification.allOf(specifications));

            // 2. Calculate rates for ALL cells using the service
            Map<Long, Double> ratesMap = attendanceSummaryService.getCellAttendanceRates(allCells, startDate, endDate);

            List<CellDto> allCellDtos = allCells.stream()
                .map(cell -> {
                    Double rate = ratesMap.getOrDefault(cell.getId(), 0.0);
                    return CellDto.from(cell, rate);
                })
                .collect(Collectors.toList());

            // 3. Sort in memory
            Sort.Order rateOrder = pageable.getSort().getOrderFor("attendanceRate");
            if (rateOrder != null) {
                Comparator<CellDto> comparator = Comparator.comparingDouble(CellDto::attendanceRate);
                if (rateOrder.isDescending()) {
                    comparator = comparator.reversed();
                }
                allCellDtos.sort(comparator);
            }

            // 4. Manual Pagination
            int start = (int) pageable.getOffset();
            int end = Math.min((start + pageable.getPageSize()), allCellDtos.size());
            
            if (start > allCellDtos.size()) {
                 return new PageImpl<>(Collections.emptyList(), pageable, allCellDtos.size());
            }

            List<CellDto> pagedContent = allCellDtos.subList(start, end);
            return new PageImpl<>(pagedContent, pageable, allCellDtos.size());

        } else {
            // Existing logic for DB pagination
            Page<Cell> cellPage = cellRepository.findAll(Specification.allOf(specifications), pageable);

            // Calculate rates for the CURRENT PAGE of cells
            if (!cellPage.isEmpty()) {
                Map<Long, Double> ratesMap = attendanceSummaryService.getCellAttendanceRates(cellPage.getContent(), startDate, endDate);
                return cellPage.map(cell -> {
                    Double rate = ratesMap.getOrDefault(cell.getId(), 0.0);
                    return CellDto.from(cell, rate);
                });
            }

            return cellPage.map(CellDto::from);
        }
    }

    @Transactional
    public CellDto updateCell(Long cellId, UpdateCellRequest request) {
        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));

        if (request.name() != null) cell.setName(request.name());
        if (request.description() != null) cell.setDescription(request.description());
        if (request.active() != null) cell.setActive(request.active());

        // Handle leader change, including role updates
        if (request.leaderId() != null) {
            // Demote the old leader if they exist and are not the new leader
            Member oldLeader = cell.getLeader();
            if (oldLeader != null && !oldLeader.getId().equals(request.leaderId())) {
                // Only demote if they are a CELL_LEADER, not EXECUTIVE etc.
                if(oldLeader.getRole() == Role.CELL_LEADER) {
                    oldLeader.setRole(Role.MEMBER);
                }
            }

            // Promote the new leader
            Member newLeader = memberRepository.findById(request.leaderId())
                .orElseThrow(() -> new NotFoundException("리더로 지정된 멤버를 찾을 수 없습니다. ID: " + request.leaderId()));

            newLeader.setRole(Role.CELL_LEADER);
            newLeader.setCell(cell);
            cell.setLeader(newLeader);
        }

        // Handle vice-leader change (no role change, just membership)
        if (request.viceLeaderId() != null) {
            Member viceLeader = memberRepository.findById(request.viceLeaderId())
                .orElseThrow(() -> new NotFoundException("부리더로 지정된 멤버를 찾을 수 없습니다. ID: " + request.viceLeaderId()));
            cell.setViceLeader(viceLeader);
            viceLeader.setCell(cell); // Also update the member's cell
        } else {
            cell.setViceLeader(null); // Clear the vice-leader
        }

        // Refetch to ensure the DTO response is consistent with the changes
        return getCellById(cell.getId());
    }

    @Transactional
    public void deleteCell(Long cellId) {
        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));

        // Create a copy to iterate over, to avoid ConcurrentModificationException
        List<Member> membersToUpdate = new ArrayList<>(cell.getMembers());
        for (Member member : membersToUpdate) {
            member.setCell(null);
            // If the member was a leader of this cell, demote their role as well
            if (member.getRole() == Role.CELL_LEADER) {
                member.setRole(Role.MEMBER);
            }
        }
        // Clear references from the Cell side to ensure consistency
        cell.getMembers().clear();
        cell.setLeader(null);
        cell.setViceLeader(null);

        cellRepository.delete(cell);
    }

    public List<CellMemberAttendanceSummaryDto> getCellMembersAttendanceSummary(Long cellId) {
        // 1. Validate cell existence
        if (!cellRepository.existsById(cellId)) {
            throw new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId);
        }

        // 2. Fetch all active members of the cell
        List<Member> activeMembers = memberRepository.findByCell_IdAndActive(cellId, true);
        if (activeMembers.isEmpty()) {
            return Collections.emptyList();
        }

        // 3. Fetch all attendance records for these members in one query
        List<Long> memberIds = activeMembers.stream().map(Member::getId).collect(Collectors.toList());
        List<Attendance> allAttendances = attendanceRepository.findByMember_IdInOrderByDateDesc(memberIds);

        // 4. Group attendances by member for efficient processing
        Map<Long, List<Attendance>> attendancesByMember = allAttendances.stream()
            .collect(Collectors.groupingBy(att -> att.getMember().getId()));

        // 5. Process each member to create the DTO
        return activeMembers.stream()
            .map(member -> {
                List<Attendance> memberAttendances = attendancesByMember.getOrDefault(member.getId(), Collections.emptyList());

                // Calculate consecutive absences
                int consecutiveAbsences = 0;
                for (Attendance attendance : memberAttendances) { // Already sorted by date desc
                    if (attendance.getStatus() == AttendanceStatus.ABSENT) {
                        consecutiveAbsences++;
                    } else {
                        break; // Stop at the first non-absent record
                    }
                }

                // Find the last attendance date (PRESENT)
                Optional<LocalDate> lastAttendanceDate = memberAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
                    .map(Attendance::getDate)
                    .findFirst(); // Since the list is sorted desc, the first is the latest

                return CellMemberAttendanceSummaryDto.builder()
                    .memberId(member.getId())
                    .memberName(member.getName())
                    .gender(member.getGender() != null ? member.getGender().name() : null)
                    .birthDate(member.getBirthDate())
                    .joinYear(member.getJoinYear())
                    .active(member.getActive())
                    .lastAttendanceDate(lastAttendanceDate.orElse(null))
                    .consecutiveAbsences(consecutiveAbsences)
                    .cellAssignmentDate(member.getCellAssignmentDate())
                    .build();
            })
            .sorted(Comparator.comparing(CellMemberAttendanceSummaryDto::memberName))
            .collect(Collectors.toList());
    }
}