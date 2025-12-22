package com.sdc.seouldreamcellbe.dto.prayer;

import java.time.LocalDateTime;

public record PrayerMemberSummaryDto(
    Long memberId,
    String memberName,
    Long cellId,
    String cellName,
    Long totalCount,
    LocalDateTime latestCreatedAt
) {
}
