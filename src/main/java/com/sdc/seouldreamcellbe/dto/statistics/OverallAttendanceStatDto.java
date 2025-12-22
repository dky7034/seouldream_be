package com.sdc.seouldreamcellbe.dto.statistics;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "필터링된 조건에 따른 전체 출석 통계 응답 DTO")
public record OverallAttendanceStatDto(
    @Schema(description = "주어진 필터 조건에 해당하는 전체 출석 기록 수", example = "150")
    long totalRecords,

    @Schema(description = "주어진 필터 조건에 해당하는 출석률 (%)", example = "88.5")
    double attendanceRate
) {
}
