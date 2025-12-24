package com.sdc.seouldreamcellbe.dto.prayer;

import java.time.LocalDate;

public record PrayerMemberSummaryDto(
    Long memberId,
    String memberName,
    Long cellId,
    String cellName,
    Long totalCount,
    LocalDate latestCreatedAt
) {
}
