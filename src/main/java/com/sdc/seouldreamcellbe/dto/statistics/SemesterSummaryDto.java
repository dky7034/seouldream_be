package com.sdc.seouldreamcellbe.dto.statistics;

import lombok.Builder;

@Builder
public record SemesterSummaryDto(
    String semesterName,
    Integer totalCellCount,
    Integer totalMemberCount,
    Integer cellMemberCount,
    Integer unassignedCount,
    Integer executiveCount,
    Integer cellLeaderCount,
    AgeGroupSummaryDto ageGroupSummary
) {}
