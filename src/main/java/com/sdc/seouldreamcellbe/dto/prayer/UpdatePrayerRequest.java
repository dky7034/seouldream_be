package com.sdc.seouldreamcellbe.dto.prayer;

import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import lombok.Builder;

@Builder
public record UpdatePrayerRequest(
    String content,
    Integer weekOfMonth,
    PrayerVisibility visibility
) {
}
