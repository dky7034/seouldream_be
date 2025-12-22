package com.sdc.seouldreamcellbe.dto.cell;

import jakarta.validation.constraints.NotBlank;
import lombok.Builder;

import java.util.List;

@Builder
public record CreateCellRequest(
    @NotBlank String name,
    Long leaderId,
    Long viceLeaderId,
    String description,
    List<Long> memberIds
) {
}
