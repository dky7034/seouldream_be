package com.sdc.seouldreamcellbe.dto.statistics;

import lombok.Builder;

@Builder
public record NewcomerTrendDto(
    String label,
    Long count,
    Double growthRate
) {}
