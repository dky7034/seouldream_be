package com.sdc.seouldreamcellbe.dto.attendance;

import lombok.Builder;

import java.time.LocalDate;

@Builder
public record MemberAlertDto(
    Long memberId,
    String memberName,
    String cellName,
    LocalDate lastAttendanceDate,
    int consecutiveAbsences
) {
}
