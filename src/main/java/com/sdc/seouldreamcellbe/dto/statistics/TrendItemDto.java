package com.sdc.seouldreamcellbe.dto.statistics;

import java.time.LocalDate;

public record TrendItemDto(
    LocalDate date,
    long totalRecords,
    long presentRecords,
    double attendanceRate
) {
}
