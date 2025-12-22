package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Notice;
import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import com.sdc.seouldreamcellbe.domain.common.Role;
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
    private final AttendanceSummaryService attendanceSummaryService;
    private final CellRepository cellRepository;

    public DashboardDto getDashboard(String username, String period) {
        User user = userRepository.findWithMemberAndCellByUsername(username)
            .orElseThrow(() -> new NotFoundException("User not found: " + username));

        // 1. Calculate requested date range from 'period'
        LocalDate requestedEndDate = LocalDate.now();
        LocalDate requestedStartDate = switch (period) {
            case "1m" -> requestedEndDate.minusMonths(1);
            case "6m" -> requestedEndDate.minusMonths(6);
            case "12m" -> requestedEndDate.minusMonths(12);
            default -> requestedEndDate.minusMonths(3); // Default to 3m
        };

        // 2. Determine current activity year's boundaries
        int currentYear = LocalDate.now().getYear();
        LocalDate yearStartDate = LocalDate.of(currentYear, 1, 1);
        LocalDate yearEndDate = LocalDate.of(currentYear, 12, 31);
        LocalDateTime yearStartDateTime = yearStartDate.atStartOfDay();

        // 3. Calculate effective date range (intersection of requested and activity year)
        LocalDate effectiveStartDate = requestedStartDate.isBefore(yearStartDate) ? yearStartDate : requestedStartDate;
        LocalDate effectiveEndDate = requestedEndDate.isAfter(yearEndDate) ? yearEndDate : requestedEndDate;

        // 4. Branch logic based on user role
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

        // --- Attendance Stats (All, within effective date range) ---
        OverallAttendanceSummaryDto overallAttendanceSummary = null;
        AttendanceKeyMetricsDto attendanceKeyMetrics = null;
        List<CellAttendanceSummaryDto> cellAttendanceSummaries = Collections.emptyList();

        if (startDate.isBefore(endDate.plusDays(1))) { // Only calculate if the date range is valid
            overallAttendanceSummary = attendanceSummaryService.getOverallAttendanceSummary(startDate, endDate, GroupBy.WEEK);

            cellAttendanceSummaries = cellRepository.findByActive(true).stream()
                .map(cell -> attendanceSummaryService.getCellAttendanceSummary(cell.getId(), startDate, endDate, GroupBy.MONTH))
                .collect(Collectors.toList());

            attendanceKeyMetrics = getAttendanceKeyMetrics(startDate, endDate, overallAttendanceSummary);
        }

        return buildDashboardDto(
            todayBirthdayMembers, todayBirthdayMembers.size(),
            weeklyBirthdayMembers, weeklyBirthdayMembers.size(),
            monthlyBirthdayMembers, monthlyBirthdayMembers.size(),
            recentPrayers,
            weeklyPrayerCount,
            recentNotices,
            weeklyNoticeCount,
            overallAttendanceSummary,
            cellAttendanceSummaries,
            attendanceKeyMetrics
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

        // --- Attendance Stats (Cell Members Only, within effective date range) ---
        OverallAttendanceSummaryDto overallAttendanceSummary = null;
        if (startDate.isBefore(endDate.plusDays(1))) {
            CellAttendanceSummaryDto cellSummary = attendanceSummaryService.getCellAttendanceSummary(cellId, startDate, endDate, GroupBy.WEEK);
            overallAttendanceSummary = mapCellSummaryToOverall(cellSummary);
        }

        // Per request, these are empty/null for cell leaders
        List<CellAttendanceSummaryDto> cellAttendanceSummaries = Collections.emptyList();
        AttendanceKeyMetricsDto attendanceKeyMetrics = null;

        return buildDashboardDto(
            todayBirthdayMembers, todayBirthdayMembers.size(),
            weeklyBirthdayMembers, weeklyBirthdayMembers.size(),
            monthlyBirthdayMembers, monthlyBirthdayMembers.size(),
            recentPrayers,
            weeklyPrayerCount,
            recentNotices,
            weeklyNoticeCount,
            overallAttendanceSummary,
            cellAttendanceSummaries,
            attendanceKeyMetrics
        );
    }

    private DashboardDto buildDashboardDto(List<Member> today, Integer totalToday, List<Member> weekly, Integer totalWeekly, List<Member> monthly, Integer totalMonthly, List<Prayer> prayers, Integer weeklyPrayerCount, List<Notice> notices, Integer weeklyNoticeCount, OverallAttendanceSummaryDto overallSummary, List<CellAttendanceSummaryDto> cellSummaries, AttendanceKeyMetricsDto metrics) {
        return DashboardDto.builder()
            .todayBirthdays(mapToBirthdayInfo(today))
            .totalTodayBirthdays(totalToday)
            .weeklyBirthdays(mapToBirthdayInfo(weekly))
            .totalWeeklyBirthdays(totalWeekly)
            .monthlyBirthdays(mapToBirthdayInfo(monthly))
            .totalMonthlyBirthdays(totalMonthly)
            .recentPrayers(mapToRecentPrayerInfo(prayers))
            .weeklyPrayerCount(weeklyPrayerCount)
            .recentNotices(mapToRecentNoticeInfo(notices))
            .weeklyNoticeCount(weeklyNoticeCount)
            .overallAttendanceSummary(overallSummary)
            .cellAttendanceSummaries(cellSummaries)
            .attendanceKeyMetrics(metrics)
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
    
    private List<BirthdayInfo> mapToBirthdayInfo(List<Member> members) {
        return members.stream()
            .map(m -> BirthdayInfo.builder()
                .memberId(m.getId())
                .memberName(m.getName())
                .birthDate(m.getBirthDate())
                .build())
            .collect(Collectors.toList());
    }

    private List<RecentPrayerInfo> mapToRecentPrayerInfo(List<Prayer> prayers) {
        return prayers.stream()
            .map(p -> RecentPrayerInfo.builder()
                .prayerId(p.getId())
                .memberId(p.getMember().getId())
                .memberName(p.getMember().getName())
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
