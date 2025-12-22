package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Notice;
import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.domain.common.SuggestionStatus; // Added import
import com.sdc.seouldreamcellbe.dto.attendance.AttendanceKeyMetricsDto;
import com.sdc.seouldreamcellbe.dto.attendance.CellAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.attendance.OverallAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.dashboard.DashboardDto;
import com.sdc.seouldreamcellbe.dto.dashboard.DashboardDto.BirthdayInfo;
import com.sdc.seouldreamcellbe.dto.dashboard.DashboardDto.RecentNoticeInfo;
import com.sdc.seouldreamcellbe.dto.dashboard.DashboardDto.RecentPrayerInfo;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.NoticeRepository;
import com.sdc.seouldreamcellbe.repository.PrayerRepository;
import com.sdc.seouldreamcellbe.repository.SuggestionRepository; // Added import
import com.sdc.seouldreamcellbe.repository.UserRepository;
import com.sdc.seouldreamcellbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class DashboardService {

    private final UserRepository userRepository;
    private final MemberRepository memberRepository;
    private final PrayerRepository prayerRepository;
    private final NoticeRepository noticeRepository;
    private final SuggestionRepository suggestionRepository; // Injected
    private final AttendanceSummaryService attendanceSummaryService;
    private final CellRepository cellRepository;
    private final CellService cellService; // Injected

    public DashboardDto getDashboard(String username, String period, LocalDate startDateParam, LocalDate endDateParam) {
        User user = userRepository.findWithMemberAndCellByUsername(username)
            .orElseThrow(() -> new NotFoundException("User not found: " + username));

        // 1. Determine requested date range
        LocalDate effectiveStartDate;
        LocalDate effectiveEndDate;
        LocalDateTime yearStartDateTime;

        if (startDateParam != null && endDateParam != null) {
            // Case A: Explicit date range provided (e.g. for specific semester/month)
            // Trust the provided dates completely (allow past years)
            effectiveStartDate = startDateParam;
            effectiveEndDate = endDateParam;
            yearStartDateTime = startDateParam.withDayOfYear(1).atStartOfDay(); // Base context for year-based queries
        } else {
            // Case B: Relative period (1m, 3m, etc.) within current year
            LocalDate requestedEndDate = LocalDate.now();
            LocalDate requestedStartDate = switch (period) {
                case "1m" -> requestedEndDate.minusMonths(1);
                case "6m" -> requestedEndDate.minusMonths(6);
                case "12m" -> requestedEndDate.minusMonths(12);
                default -> requestedEndDate.minusMonths(3); // Default to 3m
            };

            int currentYear = LocalDate.now().getYear();
            LocalDate yearStartDate = LocalDate.of(currentYear, 1, 1);
            LocalDate yearEndDate = LocalDate.of(currentYear, 12, 31);
            yearStartDateTime = yearStartDate.atStartOfDay();

            // Intersect with current year
            effectiveStartDate = requestedStartDate.isBefore(yearStartDate) ? yearStartDate : requestedStartDate;
            effectiveEndDate = requestedEndDate.isAfter(yearEndDate) ? yearEndDate : requestedEndDate;
        }

        // 2. Branch logic based on user role
        if (user.getRole() == Role.EXECUTIVE) {
            return getExecutiveDashboard(user, effectiveStartDate, effectiveEndDate, yearStartDateTime);
        } else {
            // CELL_LEADER and MEMBER roles are treated similarly
            return getCellLeaderDashboard(user, effectiveStartDate, effectiveEndDate, yearStartDateTime);
        }
    }

    private DashboardDto getExecutiveDashboard(User user, LocalDate startDate, LocalDate endDate, LocalDateTime yearStartDateTime) {
        // --- Birthday Infos (All Active Members) ---
        List<Member> todayBirthdayMembers = memberRepository.findByBirthMonthAndDay(LocalDate.now().getMonthValue(), LocalDate.now().getDayOfMonth());
        List<Member> weeklyBirthdayMembers = findWeeklyBirthdayMembers(LocalDate.now());
        List<Member> monthlyBirthdayMembers = memberRepository.findByBirthdayInMonth(LocalDate.now().getMonthValue());

        // --- Recent Prayers (within current year) ---
        List<Prayer> recentPrayers = prayerRepository.findTop5RecentForExecutive(yearStartDateTime, PageRequest.of(0, 6));

        // --- Recent Notices (All) ---
        List<Notice> recentNotices = noticeRepository.findAllByTargetOrderByPinnedDescCreatedAtDesc(NoticeTarget.ALL, PageRequest.of(0, 6));

        // --- Weekly Counts ---
        DateUtil.DateRange weekRange = DateUtil.getWeekRange(LocalDate.now());
        LocalDateTime weekStart = weekRange.startDate().atStartOfDay();
        LocalDateTime weekEnd = weekRange.endDate().atTime(LocalTime.MAX);
        Integer weeklyPrayerCount = prayerRepository.countByCreatedAtBetween(weekStart, weekEnd).intValue();
        Integer weeklyNoticeCount = noticeRepository.countByCreatedAtBetween(weekStart, weekEnd).intValue();
        
        // --- NEW: Additional Metrics ---
        // 1. Newcomer Count (This Week)
        Integer newcomerCount = (int) memberRepository.countByCreatedAtBetween(weekStart, weekEnd);
        
        // 2. Pending Suggestion Count (All)
        Integer pendingSuggestionCount = (int) suggestionRepository.countByStatus(SuggestionStatus.PENDING);
        
        // 3. Unassigned Member Count (All)
        Integer unassignedMemberCount = (int) memberRepository.countByCellIsNullAndActiveTrue();
        
        // 4. Attendance Change (This Week vs Last Week) - Calculated later

        // --- Long Term Absentees (>= 3 weeks) ---
        int totalLongTermAbsentees = 0;
        List<Cell> activeCells = cellRepository.findByActive(true);
        for (Cell cell : activeCells) {
             totalLongTermAbsentees += cellService.getCellMembersAttendanceSummary(cell.getId()).stream()
                 .filter(summary -> summary.consecutiveAbsences() >= 3)
                 .count();
        }

        // --- Attendance Stats (All, within effective date range) ---
        OverallAttendanceSummaryDto overallAttendanceSummary = null;
        AttendanceKeyMetricsDto attendanceKeyMetrics = null;
        List<CellAttendanceSummaryDto> cellAttendanceSummaries = Collections.emptyList();
        Integer attendanceChange = 0;

        if (startDate.isBefore(endDate.plusDays(1))) { // Only calculate if the date range is valid
            overallAttendanceSummary = attendanceSummaryService.getOverallAttendanceSummary(startDate, endDate, GroupBy.WEEK);

            cellAttendanceSummaries = cellRepository.findByActive(true).stream()
                .map(cell -> attendanceSummaryService.getCellAttendanceSummary(cell.getId(), startDate, endDate, GroupBy.MONTH))
                .collect(Collectors.toList());

            attendanceKeyMetrics = getAttendanceKeyMetrics(startDate, endDate, overallAttendanceSummary);
            
            // Calculate Attendance Change
            LocalDate today = LocalDate.now();
            OverallAttendanceSummaryDto thisWeekSummary = attendanceSummaryService.getOverallAttendanceSummary(today.minusDays(6), today, GroupBy.DAY);
            OverallAttendanceSummaryDto lastWeekSummary = attendanceSummaryService.getOverallAttendanceSummary(today.minusDays(13), today.minusDays(7), GroupBy.DAY);
            
            long thisWeekTotal = thisWeekSummary.totalSummary() != null ? thisWeekSummary.totalSummary().totalPresent() : 0;
            long lastWeekTotal = lastWeekSummary.totalSummary() != null ? lastWeekSummary.totalSummary().totalPresent() : 0;
            attendanceChange = (int) (thisWeekTotal - lastWeekTotal);
        }

        // --- Demographics (NEW) ---
        DashboardDto.DemographicsDto demographics = getDemographics();

        return buildDashboardDto(
            todayBirthdayMembers, todayBirthdayMembers.size(),
            weeklyBirthdayMembers, weeklyBirthdayMembers.size(),
            monthlyBirthdayMembers, monthlyBirthdayMembers.size(),
            totalLongTermAbsentees,
            newcomerCount, pendingSuggestionCount, attendanceChange, unassignedMemberCount, // NEW
            recentPrayers,
            weeklyPrayerCount,
            recentNotices,
            weeklyNoticeCount,
            overallAttendanceSummary,
            cellAttendanceSummaries,
            attendanceKeyMetrics,
            demographics
        );
    }

    private DashboardDto.DemographicsDto getDemographics() {
        LocalDate now = LocalDate.now();
        
        // 1. Basic Counts
        Integer totalCellCount = cellRepository.findByActive(true).size();
        Integer totalMemberCount = (int) memberRepository.countByActive(true);
        Integer cellMemberCount = (int) memberRepository.countByCellIsNotNullAndActive(true);
        Integer previousSemesterCount = 0;

        // 2. Detailed Age Counts
        // 10s and under: age < 20 (born after 20 years ago today)
        LocalDate start10s = now.minusYears(20).plusDays(1);
        Integer count10sAndUnder = (int) memberRepository.countByBirthDateBetweenAndActive(start10s, now, true);

        // 20s: 20 <= age <= 29
        LocalDate start20s = now.minusYears(30).plusDays(1);
        LocalDate end20s = now.minusYears(20);
        Integer count20s = (int) memberRepository.countByBirthDateBetweenAndActive(start20s, end20s, true);

        // 30s: 30 <= age <= 39
        LocalDate start30s = now.minusYears(40).plusDays(1);
        LocalDate end30s = now.minusYears(30);
        Integer count30s = (int) memberRepository.countByBirthDateBetweenAndActive(start30s, end30s, true);

        // 40s and over: age >= 40
        LocalDate end40s = now.minusYears(40);
        Integer count40sAndOver = (int) memberRepository.countByBirthDateBetweenAndActive(now.minusYears(150), end40s, true);

        // 3. Distribution (with gap filling)
        List<Object[]> distributionRaw = memberRepository.findBirthYearDistribution();
        if (distributionRaw.isEmpty()) {
            return new DashboardDto.DemographicsDto(totalCellCount, totalMemberCount, cellMemberCount, previousSemesterCount, count10sAndUnder, count20s, count30s, count40sAndOver, Collections.emptyList());
        }

        java.util.Map<Integer, DashboardDto.DemographicsDistribution> distMap = new java.util.HashMap<>();
        int minYear = Integer.MAX_VALUE;
        int maxYear = Integer.MIN_VALUE;

        for (Object[] row : distributionRaw) {
            Integer year = (Integer) row[0];
            com.sdc.seouldreamcellbe.domain.common.Gender gender = (com.sdc.seouldreamcellbe.domain.common.Gender) row[1];
            Long count = (Long) row[2];

            minYear = Math.min(minYear, year);
            maxYear = Math.max(maxYear, year);

            distMap.compute(year, (k, v) -> {
                int male = (v == null) ? 0 : v.maleCount();
                int female = (v == null) ? 0 : v.femaleCount();
                if (gender == com.sdc.seouldreamcellbe.domain.common.Gender.MALE) {
                    male += count.intValue();
                } else if (gender == com.sdc.seouldreamcellbe.domain.common.Gender.FEMALE) {
                    female += count.intValue();
                }
                return new DashboardDto.DemographicsDistribution(year, male, female);
            });
        }
        
        // Fill Gaps
        List<DashboardDto.DemographicsDistribution> distribution = new java.util.ArrayList<>();
        for (int y = minYear; y <= maxYear; y++) {
            distribution.add(distMap.getOrDefault(y, new DashboardDto.DemographicsDistribution(y, 0, 0)));
        }

        return new DashboardDto.DemographicsDto(
            totalCellCount,
            totalMemberCount,
            cellMemberCount,
            previousSemesterCount,
            count10sAndUnder,
            count20s,
            count30s,
            count40sAndOver,
            distribution
        );
    }

    private DashboardDto getCellLeaderDashboard(User user, LocalDate startDate, LocalDate endDate, LocalDateTime yearStartDateTime) {
        if (user.getMember() == null || user.getMember().getCell() == null) {
            return DashboardDto.empty(); // Return empty dashboard if no cell assigned
        }
        Long cellId = user.getMember().getCell().getId();

        // --- Birthday Infos (Cell Members Only) ---
        List<Member> todayBirthdayMembers = memberRepository.findByCell_IdAndBirthMonthAndDay(cellId, LocalDate.now().getMonthValue(), LocalDate.now().getDayOfMonth());
        List<Member> weeklyBirthdayMembers = findWeeklyBirthdayMembersByCell(cellId, LocalDate.now());
        List<Member> monthlyBirthdayMembers = memberRepository.findByCell_IdAndBirthdayInMonth(cellId, LocalDate.now().getMonthValue());

        // --- Recent Prayers (Cell's context, within current year) ---
        List<Prayer> recentPrayers = prayerRepository.findTop5RecentForCellLeader(cellId, yearStartDateTime, PageRequest.of(0, 6));

        // --- Recent Notices (All) ---
        List<Notice> recentNotices = noticeRepository.findAllByTargetOrderByPinnedDescCreatedAtDesc(NoticeTarget.ALL, PageRequest.of(0, 6));

        // --- Weekly Counts ---
        DateUtil.DateRange weekRange = DateUtil.getWeekRange(LocalDate.now());
        LocalDateTime weekStart = weekRange.startDate().atStartOfDay();
        LocalDateTime weekEnd = weekRange.endDate().atTime(LocalTime.MAX);
        Integer weeklyPrayerCount = prayerRepository.countForCellLeaderByCreatedAtBetween(cellId, weekStart, weekEnd).intValue();
        Integer weeklyNoticeCount = noticeRepository.countByCreatedAtBetween(weekStart, weekEnd).intValue();
        
        // --- NEW: Additional Metrics ---
        // 1. Newcomer Count (Not applicable for Cell Leader usually, or implement cell-specific logic)
        Integer newcomerCount = 0; 
        
        // 2. Pending Suggestion Count (My Cell)
        Integer pendingSuggestionCount = (int) suggestionRepository.countByCell_IdAndStatus(cellId, SuggestionStatus.PENDING);
        
        // 3. Unassigned Member Count (Not applicable)
        Integer unassignedMemberCount = 0;
        
        // 4. Attendance Change (My Cell: This Week vs Last Week) - Calculated later

        // --- Long Term Absentees (>= 3 weeks) ---
        int totalLongTermAbsentees = (int) cellService.getCellMembersAttendanceSummary(cellId).stream()
             .filter(summary -> summary.consecutiveAbsences() >= 3)
             .count();

        // --- Attendance Stats (Cell Members Only, within effective date range) ---
        OverallAttendanceSummaryDto overallAttendanceSummary = null;
        Integer attendanceChange = 0;
        
        if (startDate.isBefore(endDate.plusDays(1))) {
            CellAttendanceSummaryDto cellSummary = attendanceSummaryService.getCellAttendanceSummary(cellId, startDate, endDate, GroupBy.WEEK);
            overallAttendanceSummary = mapCellSummaryToOverall(cellSummary);
            
            // Calculate Attendance Change
            LocalDate today = LocalDate.now();
            CellAttendanceSummaryDto thisWeekSummary = attendanceSummaryService.getCellAttendanceSummary(cellId, today.minusDays(6), today, GroupBy.DAY);
            CellAttendanceSummaryDto lastWeekSummary = attendanceSummaryService.getCellAttendanceSummary(cellId, today.minusDays(13), today.minusDays(7), GroupBy.DAY);
            
            long thisWeekTotal = thisWeekSummary.totalSummary() != null ? thisWeekSummary.totalSummary().totalPresent() : 0;
            long lastWeekTotal = lastWeekSummary.totalSummary() != null ? lastWeekSummary.totalSummary().totalPresent() : 0;
            attendanceChange = (int) (thisWeekTotal - lastWeekTotal);
        }

        // Per request, these are empty/null for cell leaders
        List<CellAttendanceSummaryDto> cellAttendanceSummaries = Collections.emptyList();
        AttendanceKeyMetricsDto attendanceKeyMetrics = null;

        return buildDashboardDto(
            todayBirthdayMembers, todayBirthdayMembers.size(),
            weeklyBirthdayMembers, weeklyBirthdayMembers.size(),
            monthlyBirthdayMembers, monthlyBirthdayMembers.size(),
            totalLongTermAbsentees,
            newcomerCount, pendingSuggestionCount, attendanceChange, unassignedMemberCount, // NEW
            recentPrayers,
            weeklyPrayerCount,
            recentNotices,
            weeklyNoticeCount,
            overallAttendanceSummary,
            cellAttendanceSummaries,
            attendanceKeyMetrics,
            null // demographics for cell leader
        );
    }

    private DashboardDto buildDashboardDto(List<Member> today, Integer totalToday, List<Member> weekly, Integer totalWeekly, List<Member> monthly, Integer totalMonthly, Integer totalLongTermAbsentees, Integer newcomerCount, Integer pendingSuggestionCount, Integer attendanceChange, Integer unassignedMemberCount, List<Prayer> prayers, Integer weeklyPrayerCount, List<Notice> notices, Integer weeklyNoticeCount, OverallAttendanceSummaryDto overallSummary, List<CellAttendanceSummaryDto> cellSummaries, AttendanceKeyMetricsDto metrics, DashboardDto.DemographicsDto demographics) {
        return DashboardDto.builder()
            .todayBirthdays(mapToBirthdayInfo(today))
            .totalTodayBirthdays(totalToday)
            .weeklyBirthdays(mapToBirthdayInfo(weekly))
            .totalWeeklyBirthdays(totalWeekly)
            .monthlyBirthdays(mapToBirthdayInfo(monthly))
            .totalMonthlyBirthdays(totalMonthly)
            .totalLongTermAbsentees(totalLongTermAbsentees)
            .newcomerCount(newcomerCount) // NEW
            .pendingSuggestionCount(pendingSuggestionCount) // NEW
            .attendanceChange(attendanceChange) // NEW
            .unassignedMemberCount(unassignedMemberCount) // NEW
            .recentPrayers(mapToRecentPrayerInfo(prayers))
            .weeklyPrayerCount(weeklyPrayerCount)
            .recentNotices(mapToRecentNoticeInfo(notices))
            .weeklyNoticeCount(weeklyNoticeCount)
            .overallAttendanceSummary(overallSummary)
            .cellAttendanceSummaries(cellSummaries)
            .attendanceKeyMetrics(metrics)
            .demographics(demographics)
            .build();
    }

    private List<Member> findWeeklyBirthdayMembers(LocalDate today) {
        LocalDate weekLater = today.plusDays(6);
        if (today.getMonthValue() == weekLater.getMonthValue()) {
            return memberRepository.findByBirthdayInSameMonth(today.getMonthValue(), today.getDayOfMonth(), weekLater.getDayOfMonth());
        } else {
            return memberRepository.findByBirthdayInWrappingMonth(today.getMonthValue(), today.getDayOfMonth(), weekLater.getMonthValue(), weekLater.getDayOfMonth());
        }
    }

    private List<Member> findWeeklyBirthdayMembersByCell(Long cellId, LocalDate today) {
        LocalDate weekLater = today.plusDays(6);
        if (today.getMonthValue() == weekLater.getMonthValue()) {
            return memberRepository.findByCell_IdAndBirthdayInSameMonth(cellId, today.getMonthValue(), today.getDayOfMonth(), weekLater.getDayOfMonth());
        } else {
            return memberRepository.findByCell_IdAndBirthdayInWrappingMonth(cellId, today.getMonthValue(), today.getDayOfMonth(), weekLater.getMonthValue(), weekLater.getDayOfMonth());
        }
    }

    private OverallAttendanceSummaryDto mapCellSummaryToOverall(CellAttendanceSummaryDto cellSummary) {
        if (cellSummary == null) return null;

        List<OverallAttendanceSummaryDto.PeriodSummaryDto> overallPeriodSummaries = cellSummary.periodSummaries().stream()
            .map(cellPeriod -> OverallAttendanceSummaryDto.PeriodSummaryDto.builder()
                .dateGroup(cellPeriod.dateGroup())
                .totalPresent(cellPeriod.totalPresent())
                .totalAbsent(cellPeriod.totalAbsent())
                .totalMembers(cellPeriod.totalMembers())
                .attendanceRate(cellPeriod.attendanceRate())
                .build())
            .collect(Collectors.toList());

        OverallAttendanceSummaryDto.TotalSummaryDto overallTotalSummary = null;
        if (cellSummary.totalSummary() != null) {
            CellAttendanceSummaryDto.TotalSummaryDto cellTotal = cellSummary.totalSummary();
            overallTotalSummary = OverallAttendanceSummaryDto.TotalSummaryDto.builder()
                .totalPresent(cellTotal.totalPresent())
                .totalAbsent(cellTotal.totalAbsent())
                .totalMembersInPeriod(cellTotal.totalMembers())
                .totalRecordedDates(cellTotal.totalRecordedDates())
                .attendanceRate(cellTotal.attendanceRate())
                .build();
        }

        return new OverallAttendanceSummaryDto(overallPeriodSummaries, overallTotalSummary);
    }
    
    private String formatDisplayName(Member member) {
        long count = memberRepository.countByName(member.getName());
        if (count > 1 && member.getBirthDate() != null) {
            String year = String.valueOf(member.getBirthDate().getYear()).substring(2);
            return member.getName() + "(" + year + ")";
        }
        return member.getName();
    }

    private List<BirthdayInfo> mapToBirthdayInfo(List<Member> members) {
        return members.stream()
            .map(m -> BirthdayInfo.builder()
                .memberId(m.getId())
                .memberName(formatDisplayName(m)) // Apply formatting
                .birthDate(m.getBirthDate())
                .build())
            .collect(Collectors.toList());
    }

    private List<RecentPrayerInfo> mapToRecentPrayerInfo(List<Prayer> prayers) {
        return prayers.stream()
            .map(p -> RecentPrayerInfo.builder()
                .prayerId(p.getId())
                .memberId(p.getMember().getId())
                .memberName(formatDisplayName(p.getMember())) // Apply formatting
                .content(p.getContent())
                .createdAt(p.getCreatedAt())
                .build())
            .collect(Collectors.toList());
    }

    private List<RecentNoticeInfo> mapToRecentNoticeInfo(List<Notice> notices) {
        return notices.stream()
            .map(n -> RecentNoticeInfo.builder()
                .noticeId(n.getId())
                .title(n.getTitle())
                .createdAt(n.getCreatedAt())
                .pinned(n.isPinned())
                .build())
            .collect(Collectors.toList());
    }

    private AttendanceKeyMetricsDto getAttendanceKeyMetrics(LocalDate startDate, LocalDate endDate, OverallAttendanceSummaryDto periodSummary) {
        if (periodSummary == null) return null;
        
        LocalDate today = LocalDate.now();

        OverallAttendanceSummaryDto weeklySummary = attendanceSummaryService.getOverallAttendanceSummary(today.minusDays(6), today, GroupBy.DAY);
        double thisWeekAttendanceRate = weeklySummary.totalSummary() != null ? weeklySummary.totalSummary().attendanceRate() : 0.0;

        double periodAverageAttendanceRate = periodSummary.totalSummary() != null ? periodSummary.totalSummary().attendanceRate() : 0.0;

        LocalDate lastYearEndDate = endDate.minusYears(1);
        LocalDate lastYearStartDate = startDate.minusYears(1);
        OverallAttendanceSummaryDto lastYearPeriodSummary = attendanceSummaryService.getOverallAttendanceSummary(lastYearStartDate, lastYearEndDate, GroupBy.WEEK);
        double lastYearPeriodAttendanceRate = lastYearPeriodSummary.totalSummary() != null ? lastYearPeriodSummary.totalSummary().attendanceRate() : 0.0;

        return AttendanceKeyMetricsDto.builder()
            .thisWeekAttendanceRate(thisWeekAttendanceRate)
            .periodAverageAttendanceRate(periodAverageAttendanceRate)
            .lastYearPeriodAttendanceRate(lastYearPeriodAttendanceRate)
            .build();
    }
}
