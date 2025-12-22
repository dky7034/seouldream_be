package com.sdc.seouldreamcellbe.dto.semester;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record CreateSemesterRequest(
    @NotBlank
    String name,
    @NotNull
    LocalDate startDate,
    @NotNull
    LocalDate endDate
) {
}
