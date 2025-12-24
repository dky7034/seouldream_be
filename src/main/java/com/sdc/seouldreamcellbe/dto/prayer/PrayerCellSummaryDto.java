package com.sdc.seouldreamcellbe.dto.prayer;

import java.time.LocalDate;

public record PrayerCellSummaryDto(
    Long cellId,
    String cellName,
    Long totalCount,
    LocalDate latestCreatedAt
) {
}
