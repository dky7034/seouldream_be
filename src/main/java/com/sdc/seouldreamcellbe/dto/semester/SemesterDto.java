package com.sdc.seouldreamcellbe.dto.semester;

import com.sdc.seouldreamcellbe.domain.Semester;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;

import java.time.LocalDate;

@Schema(description = "학기 정보 응답 DTO")
@Builder
public record SemesterDto(
    Long id,
    String name,
    LocalDate startDate,
    LocalDate endDate,
    boolean isActive
) {
    public static SemesterDto from(Semester semester) {
        return SemesterDto.builder()
            .id(semester.getId())
            .name(semester.getName())
            .startDate(semester.getStartDate())
            .endDate(semester.getEndDate())
            .isActive(semester.isActive())
            .build();
    }
}
