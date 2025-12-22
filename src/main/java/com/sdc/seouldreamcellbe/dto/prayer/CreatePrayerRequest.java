package com.sdc.seouldreamcellbe.dto.prayer;

import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record CreatePrayerRequest(
    @NotNull Long memberId,
    @NotNull LocalDate meetingDate,
    @NotBlank String content,
    Integer weekOfMonth,
    @NotNull PrayerVisibility visibility,
    @NotNull Long createdById // Will be replaced by authenticated user later
) {
}
