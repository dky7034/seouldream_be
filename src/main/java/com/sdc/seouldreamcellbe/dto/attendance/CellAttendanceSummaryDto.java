package com.sdc.seouldreamcellbe.dto.attendance;

import lombok.Builder;

import java.util.List;

@Builder
public record CellAttendanceSummaryDto(
    Long cellId,
    String cellName,
    List<OverallAttendanceSummaryDto.PeriodSummaryDto> periodSummaries, // Reuse PeriodSummaryDto
    TotalSummaryDto totalSummary
) {

    @Builder
    public record TotalSummaryDto(
        long totalPresent,
        long totalAbsent,
        long totalMembers, // 전체 멤버 수
        long totalRecordedDates, // 출석이 기록된 총 날짜 수
        double attendanceRate // 전체 기간 출석률
    ) {}
}

