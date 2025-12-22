package com.sdc.seouldreamcellbe.dto.statistics;

import lombok.Builder;

@Builder
public record AgeGroupSummaryDto(
    Integer under20s,
    Integer twenties,
    Integer thirties,
    Integer over40s
) {}
