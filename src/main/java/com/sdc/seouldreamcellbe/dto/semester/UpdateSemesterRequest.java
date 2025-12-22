package com.sdc.seouldreamcellbe.dto.semester;

import java.time.LocalDate;

public record UpdateSemesterRequest(
    String name,
    LocalDate startDate,
    LocalDate endDate,
    Boolean isActive
) {
}
