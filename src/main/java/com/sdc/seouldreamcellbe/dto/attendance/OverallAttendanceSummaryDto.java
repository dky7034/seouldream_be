package com.sdc.seouldreamcellbe.dto.attendance;

import lombok.Builder;

import java.time.LocalDate;
import java.util.List;

@Builder
public record OverallAttendanceSummaryDto(
    List<PeriodSummaryDto> periodSummaries,
    TotalSummaryDto totalSummary
) {
    @Builder
    public record PeriodSummaryDto(
        String dateGroup, // e.g., "2024-01-01", "2024-W1", "2024-01"
        long totalPresent,
        long totalAbsent,
        long totalPossible, // NEW: 분모 (전체 대상 인원 * 모임 횟수)
        long totalMembers,
        double attendanceRate // totalPresent / totalPossible
    ) {}

    @Builder
    public record TotalSummaryDto(
        long totalPresent,
        long totalAbsent,
        long totalPossible, // NEW: 분모 (전체 대상 인원 * 모임 횟수)
        long totalMembersInPeriod, // 기간 내 전체 활성 멤버 수
        long totalRecordedDates, // 출석이 기록된 총 날짜 수
        double attendanceRate // 전체 기간 출석률
    ) {}
}

