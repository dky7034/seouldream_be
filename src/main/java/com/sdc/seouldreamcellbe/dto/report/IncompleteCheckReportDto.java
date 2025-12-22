package com.sdc.seouldreamcellbe.dto.report;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;

import java.time.LocalDate;
import java.util.List;

@Schema(description = "미완료 출석 체크 리포트 응답 DTO")
@Builder
public record IncompleteCheckReportDto(
    @Schema(description = "리더의 멤버 ID")
    Long leaderId,
    @Schema(description = "리더 이름")
    String leaderName,
    @Schema(description = "셀 ID")
    Long cellId,
    @Schema(description = "셀 이름")
    String cellName,
    @Schema(description = "미완료된 출석 체크 횟수")
    int missedDatesCount,
    @Schema(description = "미완료된 출석 체크 날짜 목록")
    List<LocalDate> missedDates
) {
}
