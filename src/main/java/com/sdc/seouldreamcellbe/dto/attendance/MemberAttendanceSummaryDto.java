package com.sdc.seouldreamcellbe.dto.attendance;

import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import lombok.Builder;

import java.util.List;

@Builder
public record MemberAttendanceSummaryDto(
    Long memberId,
    String memberName,
    List<MemberPeriodSummaryDto> periodSummaries,
    TotalSummaryDto totalSummary
) {
    @Builder
    public record MemberPeriodSummaryDto(
        String dateGroup, // e.g., "2024-01-01", "2024-W1", "2024-01"
        AttendanceStatus status, // Only for DAY grouping
        String memo,             // Only for DAY grouping
        long presentCount,       // For WEEK, MONTH grouping
        long absentCount        // For WEEK, MONTH grouping
    ) {}

    @Builder
    public record TotalSummaryDto(
        long totalPresent,
        long totalAbsent,
        long totalRecordedDates, // 출석이 기록된 총 날짜 수
        long totalPossibleAttendances, // 해당 멤버에게 가능한 출석 기회 수 (totalRecordedDates와 동일)
        double attendanceRate // 전체 기간 출석률
    ) {}
}

