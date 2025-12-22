package com.sdc.seouldreamcellbe.dto.attendance;

import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record ProcessAttendanceRequest(
    @NotNull Long memberId,
    @NotNull LocalDate date,
    @NotNull AttendanceStatus status,
    String memo
) {
}
