package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Semester;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.statistics.AggregatedTrendDto;
import com.sdc.seouldreamcellbe.dto.statistics.OverallAttendanceStatDto;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.SemesterRepository;
import com.sdc.seouldreamcellbe.repository.specification.AttendanceSpecification;
import com.sdc.seouldreamcellbe.security.CurrentUserFinder;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.IsoFields;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class StatisticsService {

    private final AttendanceRepository attendanceRepository;
    private final CurrentUserFinder currentUserFinder;
    private final ActiveSemesterService activeSemesterService;
    private final SemesterRepository semesterRepository; // For SEMESTER grouping

    public List<Integer> getAvailableYears(Long cellId) {
        User currentUser = currentUserFinder.getCurrentUser();
        Role role = currentUser.getRole();

        if (role == Role.EXECUTIVE) {
            if (cellId != null) {
                return attendanceRepository.findDistinctYearsByCellId(cellId);
            } else {
                return attendanceRepository.findDistinctYears();
            }
        } else if (role == Role.CELL_LEADER) {
            Member member = currentUser.getMember();
            if (member != null && member.getCell() != null) {
                return attendanceRepository.findDistinctYearsByCellId(member.getCell().getId());
            }
        }
        return Collections.emptyList();
    }

    public List<AggregatedTrendDto> getAttendanceTrend(
        LocalDate startDate,
        LocalDate endDate,
        Long cellId,
        Long memberId,
        AttendanceStatus status,
        GroupBy groupBy
    ) {
        // If no date range is specified, default to the active semester
        if (startDate == null && endDate == null) {
            Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }

        // Data-scoping for non-executives
        User currentUser = currentUserFinder.getCurrentUser();
        Long effectiveCellId = cellId;
        if (currentUser.getRole() != Role.EXECUTIVE) {
            Member currentMember = currentUser.getMember();
            if (currentMember != null && currentMember.getCell() != null) {
                Long currentUserCellId = currentMember.getCell().getId();
                if (cellId != null && !cellId.equals(currentUserCellId)) {
                    throw new AccessDeniedException("자신이 속한 셀의 정보만 조회할 수 있습니다.");
                }
                effectiveCellId = currentUserCellId;

                // Enforce current year restriction for Cell Leaders
                if (currentUser.getRole() == Role.CELL_LEADER) {
                    int currentYear = LocalDate.now().getYear();
                    if (startDate.getYear() != currentYear || endDate.getYear() != currentYear) {
                        throw new AccessDeniedException("셀장은 현재 연도의 데이터만 조회할 수 있습니다.");
                    }
                }

            } else if (cellId != null) {
                throw new AccessDeniedException("셀에 소속되어 있지 않아 특정 셀의 정보를 조회할 수 없습니다.");
            }
        }

        // Build Specification to fetch raw data
        List<Specification<Attendance>> specs = new ArrayList<>();
        specs.add(AttendanceSpecification.hasDateBetween(startDate, endDate));
        if (effectiveCellId != null) {
            specs.add(AttendanceSpecification.hasCellId(effectiveCellId));
        }
        if (memberId != null) {
            specs.add(AttendanceSpecification.hasMemberId(memberId));
        }
        if (status != null) {
            specs.add(AttendanceSpecification.hasStatus(status));
        }
        List<Attendance> attendances = attendanceRepository.findAll(Specification.allOf(specs));

        if (attendances.isEmpty()) {
            return Collections.emptyList();
        }

        // Group in-memory
        Map<String, List<Attendance>> groupedAttendances;
        switch (groupBy) {
            case DAY:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ISO_LOCAL_DATE)));
                break;
            case WEEK:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().get(IsoFields.WEEK_BASED_YEAR);
                    int week = att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);
                    return String.format("%d-W%02d", year, week);
                }));
                break;
            case MONTH:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM"))));
                break;
            case QUARTER:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int quarter = att.getDate().get(IsoFields.QUARTER_OF_YEAR);
                    return String.format("%d-Q%d", year, quarter);
                }));
                break;
            case HALF_YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int half = (att.getDate().getMonthValue() - 1) / 6 + 1;
                    return String.format("%d-H%d", year, half);
                }));
                break;
            case YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> String.valueOf(att.getDate().getYear())));
                break;
            case SEMESTER:
                List<com.sdc.seouldreamcellbe.domain.Semester> allSemesters = semesterRepository.findAll(org.springframework.data.domain.Sort.by("startDate"));
                groupedAttendances = attendances.stream()
                    .collect(Collectors.groupingBy(att -> {
                        LocalDate attDate = att.getDate();
                        return allSemesters.stream()
                            .filter(sem -> !attDate.isBefore(sem.getStartDate()) && !attDate.isAfter(sem.getEndDate()))
                            .findFirst()
                            .map(com.sdc.seouldreamcellbe.domain.Semester::getName)
                            .orElse("미분류"); // Uncategorized
                    }));
                break;
            default:
                throw new IllegalArgumentException("Unsupported group by type: " + groupBy);
        }

        return groupedAttendances.entrySet().stream()
            .map(entry -> {
                String dateGroup = entry.getKey();
                List<Attendance> groupAttendances = entry.getValue();
                long presentRecordsInGroup = groupAttendances.stream().filter(att -> att.getStatus() == AttendanceStatus.PRESENT).count();
                long totalRecordsInGroup = groupAttendances.size();

                double attendanceRate = (totalRecordsInGroup > 0) ? ((double) presentRecordsInGroup / totalRecordsInGroup) * 100.0 : 0.0;
                attendanceRate = Math.round(attendanceRate * 100.0) / 100.0; // Round to two decimal places

                return AggregatedTrendDto.builder()
                    .dateGroup(dateGroup)
                    .totalRecords(totalRecordsInGroup)
                    .presentRecords(presentRecordsInGroup)
                    .attendanceRate(attendanceRate)
                    .build();
            })
            .sorted(Comparator.comparing(AggregatedTrendDto::dateGroup))
            .collect(Collectors.toList());
    }

    public OverallAttendanceStatDto getOverallAttendanceStats(
        LocalDate startDate,
        LocalDate endDate,
        Long cellId,
        Long memberId,
        AttendanceStatus status
    ) {
        // If no date range is specified, default to the active semester
        if (startDate == null && endDate == null) {
            Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }

        User currentUser = currentUserFinder.getCurrentUser();
        Long effectiveCellId = cellId;

        if (currentUser.getRole() == Role.CELL_LEADER) {
            Member currentMember = currentUser.getMember();
            if (currentMember == null || currentMember.getCell() == null) {
                throw new AccessDeniedException("셀에 소속되어 있지 않아 통계를 조회할 수 없습니다.");
            }
            Long currentUserCellId = currentMember.getCell().getId();
            if (cellId != null && !cellId.equals(currentUserCellId)) {
                throw new AccessDeniedException("자신이 속한 셀의 통계만 조회할 수 있습니다.");
            }
            effectiveCellId = currentUserCellId;

            // Enforce current year restriction for Cell Leaders
            int currentYear = LocalDate.now().getYear();
            if (startDate.getYear() != currentYear || endDate.getYear() != currentYear) {
                throw new AccessDeniedException("셀장은 현재 연도의 데이터만 조회할 수 있습니다.");
            }

        } else if (currentUser.getRole() != Role.EXECUTIVE) {
            // Neither CELL_LEADER nor EXECUTIVE, deny access.
            throw new AccessDeniedException("통계를 조회할 권한이 없습니다.");
        }



        List<Specification<Attendance>> specs = new ArrayList<>();
        specs.add(AttendanceSpecification.hasDateBetween(startDate, endDate));

        if (effectiveCellId != null) {
            specs.add(AttendanceSpecification.hasCellId(effectiveCellId));
        }
        if (memberId != null) {
            specs.add(AttendanceSpecification.hasMemberId(memberId));
        }
        if (status != null) {
            specs.add(AttendanceSpecification.hasStatus(status));
        }

        Specification<Attendance> finalSpec = Specification.allOf(specs);
        long totalRecords = attendanceRepository.count(finalSpec);

        if (totalRecords == 0) {
            return new OverallAttendanceStatDto(0, 0.0);
        }

        long presentCount;
        if (status == AttendanceStatus.PRESENT) {
            presentCount = totalRecords;
        } else if (status == AttendanceStatus.ABSENT) {
            presentCount = 0;
        } else {
            List<Specification<Attendance>> presentSpecs = new ArrayList<>(specs);
            presentSpecs.add(AttendanceSpecification.hasStatus(AttendanceStatus.PRESENT));
            presentCount = attendanceRepository.count(Specification.allOf(presentSpecs));
        }

        double attendanceRate = (double) presentCount / totalRecords * 100.0;

        // Round to two decimal places
        attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;

        return new OverallAttendanceStatDto(totalRecords, attendanceRate);
    }
}