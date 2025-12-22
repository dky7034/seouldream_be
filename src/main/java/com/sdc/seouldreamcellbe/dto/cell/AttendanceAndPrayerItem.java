package com.sdc.seouldreamcellbe.dto.cell;

import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record AttendanceAndPrayerItem(
    @NotNull Long memberId,
    @NotNull AttendanceStatus status,
    String memo, // for attendance
    String prayerContent // for prayer
) {
}
