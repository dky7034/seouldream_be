package com.sdc.seouldreamcellbe.dto.statistics;

import io.swagger.v3.oas.annotations.media.Schema;
import java.time.LocalDate;

@Schema(description = "일별 출석 통계 추이 데이터 DTO")
public record AttendanceTrendDto(
    @Schema(description = "날짜")
    LocalDate date,
    @Schema(description = "총 기록 수 (출석 + 결석)")
    Long totalRecords,
    @Schema(description = "출석 수")
    Long presentRecords
) {
}
