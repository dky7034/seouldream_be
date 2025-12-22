package com.sdc.seouldreamcellbe.dto.cell;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;

@Schema(description = "셀장 대시보드 요약 정보 DTO")
@Builder
public record CellLeaderDashboardDto(
    @Schema(description = "기간 내 총 출석 인원 (연인원)", example = "85")
    long presentRecords,
    @Schema(description = "현재 셀의 총 멤버 수", example = "12")
    long totalMembers,
    @Schema(description = "기간 내 출석률 (%)", example = "90.5")
    double attendanceRate,
    @Schema(description = "기간 내 출석 체크 미실시(미완료) 주수", example = "2")
    int incompleteCheckCount
) {
}
