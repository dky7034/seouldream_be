package com.sdc.seouldreamcellbe.dto.prayer;

import java.time.LocalDateTime;

public record PrayerCellSummaryDto(
    Long cellId,
    String cellName,
    Long totalCount,
    LocalDateTime latestCreatedAt
) {
}
