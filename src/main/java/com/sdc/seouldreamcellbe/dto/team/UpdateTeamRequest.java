package com.sdc.seouldreamcellbe.dto.team;

import lombok.Builder;

@Builder
public record UpdateTeamRequest(
    String name,
    String code,
    String description,
    Boolean active
) {
}
