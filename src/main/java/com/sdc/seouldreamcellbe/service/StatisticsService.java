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
    private final com.sdc.seouldreamcellbe.repository.MemberRepository memberRepository;
    private final com.sdc.seouldreamcellbe.repository.CellRepository cellRepository;
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

    public List<com.sdc.seouldreamcellbe.dto.statistics.NewcomerTrendDto> getNewcomerTrend(LocalDate startDate, LocalDate endDate, String groupBy) {
        List<Member> members = memberRepository.findAll((root, query, cb) -> 
            cb.between(root.get("createdAt"), startDate.atStartOfDay(), endDate.plusDays(1).atStartOfDay())); // Handle end date inclusively

        Map<String, Long> counts;
        
        if ("SEMESTER".equalsIgnoreCase(groupBy)) {
             List<Semester> semesters = semesterRepository.findAll(org.springframework.data.domain.Sort.by("startDate"));
             counts = members.stream()
                .collect(Collectors.groupingBy(m -> {
                    LocalDate created = m.getCreatedAt().toLocalDate();
                    return semesters.stream()
                        .filter(s -> !created.isBefore(s.getStartDate()) && !created.isAfter(s.getEndDate()))
                        .findFirst()
                        .map(Semester::getName)
                        .orElse("Unknown");
                }, Collectors.counting()));
        } else {
            // Default to MONTH
             counts = members.stream()
                .collect(Collectors.groupingBy(m -> m.getCreatedAt().toLocalDate().format(DateTimeFormatter.ofPattern("yyyy-MM")), Collectors.counting()));
        }

        List<com.sdc.seouldreamcellbe.dto.statistics.NewcomerTrendDto> result = new ArrayList<>();
        List<String> sortedKeys = new ArrayList<>(counts.keySet());
        Collections.sort(sortedKeys);

        Long previousCount = null;

        for (String key : sortedKeys) {
            Long count = counts.get(key);
            Double growthRate = null;
            if (previousCount != null && previousCount > 0) {
                growthRate = ((double) (count - previousCount) / previousCount) * 100.0;
                growthRate = Math.round(growthRate * 10.0) / 10.0;
            } else if (previousCount != null && previousCount == 0) {
                growthRate = (count > 0) ? 100.0 : 0.0; 
            }

            result.add(com.sdc.seouldreamcellbe.dto.statistics.NewcomerTrendDto.builder()
                .label(key)
                .count(count)
                .growthRate(growthRate)
                .build());
            
            previousCount = count;
        }

        return result;
    }

    public com.sdc.seouldreamcellbe.dto.statistics.SemesterSummaryDto getSemesterSummary(Long semesterId) {
        // Note: Currently returns snapshot of CURRENT state regardless of semesterId, 
        // as historical snapshots are not fully implemented. 
        // If semesterId is provided, we could fetch that semester's info for the name.
        
        String semesterName = "Current";
        if (semesterId != null) {
            semesterName = semesterRepository.findById(semesterId).map(Semester::getName).orElse("Unknown");
        } else {
             semesterName = activeSemesterService.getActiveSemester().getName();
        }

        // Current Stats
        Integer totalCellCount = cellRepository.findByActive(true).size();
        Integer totalMemberCount = (int) memberRepository.countByActive(true);
        Integer cellMemberCount = (int) memberRepository.countByCellIsNotNullAndActive(true);
        Integer unassignedCount = (int) memberRepository.countByCellIsNullAndActiveTrue(); // Note: This excludes executives based on repo query
        
        Integer executiveCount = (int) memberRepository.countByRoleAndActive(Role.EXECUTIVE, true);
        
        // Calculate cellLeaderCount: unique leaders of active cells
        Integer cellLeaderCount = (int) cellRepository.findByActive(true).stream()
            .map(com.sdc.seouldreamcellbe.domain.Cell::getLeader)
            .filter(java.util.Objects::nonNull)
            .map(Member::getId)
            .distinct()
            .count();

        // Age Group Summary (Calculated similarly to DashboardService)
        LocalDate now = LocalDate.now();
        
        // under20s: age < 20 (born after 20 years ago)
        LocalDate startUnder20 = now.minusYears(20).plusDays(1);
        Integer under20s = (int) memberRepository.countByBirthDateBetweenAndActive(startUnder20, now, true);

        // 20s: 20 <= age <= 29
        LocalDate start20s = now.minusYears(30).plusDays(1);
        LocalDate end20s = now.minusYears(20);
        Integer twenties = (int) memberRepository.countByBirthDateBetweenAndActive(start20s, end20s, true);

        // 30s: 30 <= age <= 39
        LocalDate start30s = now.minusYears(40).plusDays(1);
        LocalDate end30s = now.minusYears(30);
        Integer thirties = (int) memberRepository.countByBirthDateBetweenAndActive(start30s, end30s, true);

        // over40s: age >= 40
        LocalDate end40s = now.minusYears(40);
        Integer over40s = (int) memberRepository.countByBirthDateBetweenAndActive(now.minusYears(150), end40s, true);


        return com.sdc.seouldreamcellbe.dto.statistics.SemesterSummaryDto.builder()
            .semesterName(semesterName)
            .totalCellCount(totalCellCount)
            .totalMemberCount(totalMemberCount)
            .cellMemberCount(cellMemberCount)
            .unassignedCount(unassignedCount)
            .executiveCount(executiveCount)
            .cellLeaderCount(cellLeaderCount)
            .ageGroupSummary(com.sdc.seouldreamcellbe.dto.statistics.AgeGroupSummaryDto.builder()
                .under20s(under20s)
                .twenties(twenties)
                .thirties(thirties)
                .over40s(over40s)
                .build())
            .build();
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

                // Security Check: Allow if Current Year OR Active Semester
                int currentYear = LocalDate.now().getYear();
                boolean isCurrentYear = (startDate.getYear() == currentYear || endDate.getYear() == currentYear);
                boolean isActiveSemester = activeSemesterService.isDateRangeInActiveSemester(startDate, endDate);

                if (!isCurrentYear && !isActiveSemester) {
                    throw new AccessDeniedException("셀장은 현재 연도 또는 활성화된 학기의 데이터만 조회할 수 있습니다.");
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

        // Prepare for SEMESTER grouping
        Map<String, com.sdc.seouldreamcellbe.domain.Semester> semesterMap = new java.util.HashMap<>();
        if (groupBy == GroupBy.SEMESTER) {
             List<com.sdc.seouldreamcellbe.domain.Semester> allSemesters = semesterRepository.findAll(org.springframework.data.domain.Sort.by("startDate"));
             allSemesters.forEach(s -> semesterMap.put(s.getName(), s));
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
                 groupedAttendances = attendances.stream()
                    .collect(Collectors.groupingBy(att -> {
                        LocalDate attDate = att.getDate();
                        // Find matching semester from the map values (need to iterate or use previously fetched list)
                        // Efficient way: iterate the map values since it's small
                        return semesterMap.values().stream()
                            .filter(sem -> !attDate.isBefore(sem.getStartDate()) && !attDate.isAfter(sem.getEndDate()))
                            .findFirst()
                            .map(com.sdc.seouldreamcellbe.domain.Semester::getName)
                            .orElse("미분류");
                    }));
                break;
            default:
                throw new IllegalArgumentException("Unsupported group by type: " + groupBy);
        }

        final Long finalCellId = effectiveCellId;

        return groupedAttendances.entrySet().stream()
            .map(entry -> {
                String dateGroup = entry.getKey();
                List<Attendance> groupAttendances = entry.getValue();
                
                // 1. Calculate Present Records (Distinct Member+Week)
                long presentRecordsInGroup = groupAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
                    .map(att -> att.getMember().getId() + "_" + att.getDate().get(IsoFields.WEEK_BASED_YEAR) + "-W" + att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR))
                    .distinct()
                    .count();
                
                // 2. Determine Period Range for Denominator
                LocalDate periodStart;
                LocalDate periodEnd;
                
                if (groupBy == GroupBy.SEMESTER) {
                    if ("미분류".equals(dateGroup)) {
                        // For uncategorized, maybe use the min/max of the attendances
                        periodStart = groupAttendances.stream().map(Attendance::getDate).min(LocalDate::compareTo).orElse(LocalDate.now());
                        periodEnd = groupAttendances.stream().map(Attendance::getDate).max(LocalDate::compareTo).orElse(LocalDate.now());
                    } else {
                        com.sdc.seouldreamcellbe.domain.Semester sem = semesterMap.get(dateGroup);
                        if (sem != null) {
                            periodStart = sem.getStartDate();
                            periodEnd = sem.getEndDate();
                        } else {
                            periodStart = LocalDate.now(); periodEnd = LocalDate.now();
                        }
                    }
                } else {
                    periodStart = getPeriodStartDate(dateGroup, groupBy);
                    periodEnd = getPeriodEndDate(dateGroup, groupBy);
                }
                
                // 3. Calculate Total Possible (All Sundays in Period)
                LocalDate calculationEndDate = periodEnd.isAfter(LocalDate.now()) ? LocalDate.now() : periodEnd;
                List<LocalDate> allSundays = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(periodStart, calculationEndDate);
                
                // Get relevant members for this trend calculation
                List<Member> targetMembers;
                if (memberId != null) {
                    targetMembers = memberRepository.findById(memberId).map(List::of).orElse(Collections.emptyList());
                } else if (finalCellId != null) {
                    targetMembers = memberRepository.findByCell_IdAndRoleInAndActive(finalCellId, List.of(Role.MEMBER, Role.CELL_LEADER), true);
                } else {
                    targetMembers = memberRepository.findByCellIsNotNullAndRoleInAndActive(List.of(Role.MEMBER, Role.CELL_LEADER), true);
                }

                long totalPossible = calculatePossibleAttendance(allSundays, targetMembers);

                double attendanceRate = (totalPossible > 0) ? ((double) presentRecordsInGroup / totalPossible) * 100.0 : 0.0;
                attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;
                
                if (attendanceRate > 100.0) {
                    attendanceRate = 100.0;
                }

                return AggregatedTrendDto.builder()
                    .dateGroup(dateGroup)
                    .totalRecords(totalPossible) // Changed to represent denominator
                    .presentRecords(presentRecordsInGroup)
                    .attendanceRate(attendanceRate)
                    .build();
            })
            .sorted(Comparator.comparing(AggregatedTrendDto::dateGroup))
            .collect(Collectors.toList());
    }

    private long calculatePossibleAttendance(List<LocalDate> meetingDates, List<Member> members) {
        long count = 0;
        for (LocalDate date : meetingDates) {
            for (Member member : members) {
                LocalDate memberStartDate = member.getCellAssignmentDate();
                if (memberStartDate == null) {
                    memberStartDate = (member.getCreatedAt() != null) ? member.getCreatedAt().toLocalDate() : LocalDate.MIN;
                }
                if (!memberStartDate.isAfter(date)) {
                    count++;
                }
            }
        }
        return count;
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

            // Security Check: Allow if Current Year OR Active Semester
            int currentYear = LocalDate.now().getYear();
            boolean isCurrentYear = (startDate.getYear() == currentYear || endDate.getYear() == currentYear);
            boolean isActiveSemester = activeSemesterService.isDateRangeInActiveSemester(startDate, endDate);

            if (!isCurrentYear && !isActiveSemester) {
                throw new AccessDeniedException("셀장은 현재 연도 또는 활성화된 학기의 데이터만 조회할 수 있습니다.");
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
        List<Attendance> allAttendances = attendanceRepository.findAll(finalSpec);
        
        long totalRecords = allAttendances.stream()
            .map(att -> att.getMember().getId() + "_" + att.getDate().get(IsoFields.WEEK_BASED_YEAR) + "-W" + att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR))
            .distinct()
            .count();

        // NEW: Calculate strict denominator (totalPossible)
        LocalDate calculationEndDate = endDate.isAfter(LocalDate.now()) ? LocalDate.now() : endDate;
        List<LocalDate> allSundays = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, calculationEndDate);
        List<Member> targetMembers;
        if (memberId != null) {
            targetMembers = memberRepository.findById(memberId).map(List::of).orElse(Collections.emptyList());
        } else if (effectiveCellId != null) {
            targetMembers = memberRepository.findByCell_IdAndRoleInAndActive(effectiveCellId, List.of(Role.MEMBER, Role.CELL_LEADER), true);
        } else {
            targetMembers = memberRepository.findByCellIsNotNullAndRoleInAndActive(List.of(Role.MEMBER, Role.CELL_LEADER), true);
        }
        long totalPossible = calculatePossibleAttendance(allSundays, targetMembers);

        if (totalPossible == 0 && totalRecords == 0) {
             // Even if records are 0, we might have zero attendance count
            long zeroCount = attendanceRepository.countMembersWithZeroAttendance(startDate, endDate, effectiveCellId);
            return OverallAttendanceStatDto.builder()
                .totalRecords(0)
                .totalPossible(0)
                .attendanceRate(0.0)
                .weeklyAverage(0.0)
                .zeroAttendanceCount(zeroCount)
                .attendanceTrend(0.0)
                .build();
        }

        long presentCount;
        if (status == AttendanceStatus.PRESENT) {
            presentCount = totalRecords;
        } else if (status == AttendanceStatus.ABSENT) {
            presentCount = 0;
        } else {
            // Filter from the fetched list
             presentCount = allAttendances.stream()
                .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
                .map(att -> att.getMember().getId() + "_" + att.getDate().get(IsoFields.WEEK_BASED_YEAR) + "-W" + att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR))
                .distinct()
                .count();
        }

        double attendanceRate = (totalPossible > 0) ? ((double) presentCount / totalPossible) * 100.0 : 0.0;
        attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;
        
        if (attendanceRate > 100.0) {
            attendanceRate = 100.0;
        }

        // --- New Metrics Calculation ---
        Double weeklyAverage = attendanceRepository.calculateWeeklyAverageAttendance(startDate, endDate, effectiveCellId);
        if (weeklyAverage == null) weeklyAverage = 0.0;
        weeklyAverage = Math.round(weeklyAverage * 10.0) / 10.0; // Round to 1 decimal

        long zeroAttendanceCount = attendanceRepository.countMembersWithZeroAttendance(startDate, endDate, effectiveCellId);

        // Trend Calculation (Optional: Comparing with previous period of same length)
        Double trend = null;
        try {
            long days = java.time.temporal.ChronoUnit.DAYS.between(startDate, endDate);
            LocalDate prevStartDate = startDate.minusDays(days + 1);
            LocalDate prevEndDate = startDate.minusDays(1);
            
            Double prevAverage = attendanceRepository.calculateWeeklyAverageAttendance(prevStartDate, prevEndDate, effectiveCellId);
            if (prevAverage != null && prevAverage > 0) {
                trend = ((weeklyAverage - prevAverage) / prevAverage) * 100.0;
                trend = Math.round(trend * 10.0) / 10.0;
            } else if (weeklyAverage > 0) {
                 trend = 100.0; // From 0 to something is 100% increase (conceptually)
            } else {
                trend = 0.0;
            }
        } catch (Exception e) {
            // Ignore trend calculation errors
            trend = 0.0;
        }

        return OverallAttendanceStatDto.builder()
            .totalRecords(totalRecords)
            .totalPossible(totalPossible)
            .attendanceRate(attendanceRate)
            .weeklyAverage(weeklyAverage)
            .zeroAttendanceCount(zeroAttendanceCount)
            .attendanceTrend(trend)
            .build();
    }

    private LocalDate getPeriodStartDate(String dateGroup, GroupBy groupBy) {
        try {
            switch (groupBy) {
                case DAY:
                    return LocalDate.parse(dateGroup, DateTimeFormatter.ISO_LOCAL_DATE);
                case WEEK:
                    DateTimeFormatter weekFormatter = new java.time.format.DateTimeFormatterBuilder()
                        .appendPattern("YYYY-'W'ww")
                        .parseDefaulting(java.time.temporal.WeekFields.ISO.dayOfWeek(), 1) // Monday
                        .toFormatter(java.util.Locale.ENGLISH);
                    return LocalDate.parse(dateGroup, weekFormatter);
                case MONTH:
                    return java.time.YearMonth.parse(dateGroup, DateTimeFormatter.ofPattern("yyyy-MM")).atDay(1);
                case QUARTER:
                    String[] quarterParts = dateGroup.split("-Q");
                    int year = Integer.parseInt(quarterParts[0]);
                    int quarter = Integer.parseInt(quarterParts[1]);
                    return LocalDate.of(year, (quarter - 1) * 3 + 1, 1);
                case HALF_YEAR:
                    String[] halfParts = dateGroup.split("-H");
                    int halfYear = Integer.parseInt(halfParts[0]);
                    int half = Integer.parseInt(halfParts[1]);
                    return half == 1 ? LocalDate.of(halfYear, 1, 1) : LocalDate.of(halfYear, 7, 1);
                case YEAR:
                    return LocalDate.of(Integer.parseInt(dateGroup), 1, 1);
                default:
                    return LocalDate.now();
            }
        } catch (java.time.format.DateTimeParseException | NumberFormatException e) {
            return LocalDate.now();
        }
    }

    private LocalDate getPeriodEndDate(String dateGroup, GroupBy groupBy) {
        try {
            switch (groupBy) {
                case DAY:
                    return LocalDate.parse(dateGroup, DateTimeFormatter.ISO_LOCAL_DATE);
                case WEEK:
                    // Assuming format "YYYY-Www" e.g., "2023-W05"
                    DateTimeFormatter weekFormatter = new java.time.format.DateTimeFormatterBuilder()
                        .appendPattern("YYYY-'W'ww")
                        .parseDefaulting(java.time.temporal.WeekFields.ISO.dayOfWeek(), 7) // Sunday
                        .toFormatter(java.util.Locale.ENGLISH);
                    return LocalDate.parse(dateGroup, weekFormatter);
                case MONTH:
                    return java.time.YearMonth.parse(dateGroup, DateTimeFormatter.ofPattern("yyyy-MM")).atEndOfMonth();
                case QUARTER:
                    String[] quarterParts = dateGroup.split("-Q");
                    int year = Integer.parseInt(quarterParts[0]);
                    int quarter = Integer.parseInt(quarterParts[1]);
                    return LocalDate.of(year, quarter * 3, 1).with(java.time.temporal.TemporalAdjusters.lastDayOfMonth());
                case HALF_YEAR:
                    String[] halfParts = dateGroup.split("-H");
                    int halfYear = Integer.parseInt(halfParts[0]);
                    int half = Integer.parseInt(halfParts[1]);
                    return half == 1 ? LocalDate.of(halfYear, 6, 30) : LocalDate.of(halfYear, 12, 31);
                case YEAR:
                    return LocalDate.of(Integer.parseInt(dateGroup), 12, 31);
                default:
                    return LocalDate.now();
            }
        } catch (java.time.format.DateTimeParseException | NumberFormatException e) {
            return LocalDate.now();
        }
    }
}