package com.sdc.seouldreamcellbe.dto.team;

import com.sdc.seouldreamcellbe.domain.Team;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record TeamDto(
    Long id,
    String name,
    String code,
    String description,
    boolean active,
    Integer memberCount,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public static TeamDto from(Team entity) {
        return TeamDto.builder()
            .id(entity.getId())
            .name(entity.getName())
            .code(entity.getCode())
            .description(entity.getDescription())
            .active(entity.getActive())
            .memberCount(entity.getMemberCount())
            .createdAt(entity.getCreatedAt())
            .updatedAt(entity.getUpdatedAt())
            .build();
    }
}
