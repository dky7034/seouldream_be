package com.sdc.seouldreamcellbe.dto.dashboard;

import com.sdc.seouldreamcellbe.dto.attendance.AttendanceKeyMetricsDto;
import com.sdc.seouldreamcellbe.dto.attendance.CellAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.attendance.OverallAttendanceSummaryDto;
import lombok.Builder;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

@Builder
public record DashboardDto(
    List<BirthdayInfo> todayBirthdays,
    Integer totalTodayBirthdays,
    List<BirthdayInfo> weeklyBirthdays,
    Integer totalWeeklyBirthdays,
    List<BirthdayInfo> monthlyBirthdays,
    Integer totalMonthlyBirthdays,
    List<RecentPrayerInfo> recentPrayers,
    Integer weeklyPrayerCount,
    List<RecentNoticeInfo> recentNotices,
    Integer weeklyNoticeCount,
    OverallAttendanceSummaryDto overallAttendanceSummary, // 전체 출석 요약
    List<CellAttendanceSummaryDto> cellAttendanceSummaries, // 각 셀별 출석 요약
    AttendanceKeyMetricsDto attendanceKeyMetrics // 핵심 출석 지표
) {

    public static DashboardDto empty() {
        return new DashboardDto(
            Collections.emptyList(), null, // todayBirthdays, totalTodayBirthdays
            Collections.emptyList(), null, // weeklyBirthdays, totalWeeklyBirthdays
            Collections.emptyList(), null, // monthlyBirthdays, totalMonthlyBirthdays
            Collections.emptyList(),
            null,
            Collections.emptyList(),
            null,
            null,
            Collections.emptyList(),
            null
        );
    }

    @Builder
    public record BirthdayInfo(
        Long memberId,
        String memberName,
        LocalDate birthDate
    ) {}

    @Builder
    public record RecentPrayerInfo(
        Long prayerId,
        Long memberId,
        String memberName,
        String content,
        LocalDateTime createdAt
    ) {}

    @Builder
    public record RecentNoticeInfo(
        Long noticeId,
        String title,
        LocalDateTime createdAt,
        boolean pinned
    ) {}
}

