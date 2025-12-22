package com.sdc.seouldreamcellbe.dto.cell;

import lombok.Builder;

import java.time.LocalDate;

@Builder
public record CellMemberAttendanceSummaryDto(
    Long memberId,
    String memberName,
    String gender, // "MALE" / "FEMALE"
    LocalDate birthDate,
    Integer joinYear,
    boolean active,
    LocalDate lastAttendanceDate,   // 최근 출석일
    int consecutiveAbsences,        // 연속 결석 주수
    LocalDate cellAssignmentDate    // 셀 배정일
) {
}
