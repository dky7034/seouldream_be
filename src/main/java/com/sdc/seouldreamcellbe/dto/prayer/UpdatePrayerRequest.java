package com.sdc.seouldreamcellbe.dto.prayer;

import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record UpdatePrayerRequest(
    LocalDate meetingDate,
    String content,
    Integer weekOfMonth,
    PrayerVisibility visibility
) {
}
