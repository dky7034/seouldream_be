package com.sdc.seouldreamcellbe.dto.cell;

import lombok.Builder;

@Builder
public record UpdateCellRequest(
    String name,
    Long leaderId,
    Long viceLeaderId,
    String description,
    Boolean active
) {
}
