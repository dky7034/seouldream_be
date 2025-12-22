package com.sdc.seouldreamcellbe.dto.team;

import com.sdc.seouldreamcellbe.domain.Team;
import jakarta.validation.constraints.NotBlank;
import lombok.Builder;

import java.util.List;

@Builder
public record CreateTeamRequest(
    @NotBlank(message = "팀 이름은 필수입니다.")
    String name,

    String description,

    Boolean active,

    List<Long> memberIds
) {
    public Team toEntity() {
        return Team.builder()
            .name(name)
            .description(description)
            .active(active != null ? active : true) // Use active field, default to true if null
            .build();
    }
}
