package com.sdc.seouldreamcellbe.dto.statistics;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;

@Builder
@Schema(description = "필터링된 조건에 따른 전체 출석 통계 응답 DTO")
public record OverallAttendanceStatDto(
    @Schema(description = "주어진 필터 조건에 해당하는 전체 출석 기록 수", example = "150")
    long totalRecords,

    @Schema(description = "전체 대상 인원 x 모임 횟수 (분모)", example = "515")
    long totalPossible, // NEW

    @Schema(description = "주어진 필터 조건에 해당하는 출석률 (%)", example = "88.5")
    double attendanceRate,

    @Schema(description = "주간 평균 출석 인원", example = "45.2")
    double weeklyAverage,

    @Schema(description = "기간 내 출석 기록이 0회인 인원 수 (장기 결석)", example = "5")
    long zeroAttendanceCount,

    @Schema(description = "지난 기간 대비 증감률 (%) (선택)", example = "5.0")
    Double attendanceTrend
) {
}
