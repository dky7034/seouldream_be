package com.sdc.seouldreamcellbe.dto.statistics;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;

@Schema(description = "그룹화된 출석 통계 추이 데이터 DTO")
@Builder
public record AggregatedTrendDto(
    @Schema(description = "날짜 그룹 (예: '2025-12-15', '2025-W50', '2025-12')", example = "2025-12")
    String dateGroup,
    @Schema(description = "총 기록 수 (출석 + 결석)")
    Long totalRecords,
    @Schema(description = "출석 수")
    Long presentRecords,
    @Schema(description = "출석률 (%)", example = "88.5")
    double attendanceRate
) {
}
