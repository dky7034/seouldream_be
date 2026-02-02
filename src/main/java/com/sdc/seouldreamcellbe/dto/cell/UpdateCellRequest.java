package com.sdc.seouldreamcellbe.dto.cell;

import lombok.Builder;
import java.util.List;

@Builder
public record UpdateCellRequest(
    String name,
    Long leaderId,
    Long viceLeaderId,
    String description,
    Boolean active,
    List<Long> memberIds
) {
}
