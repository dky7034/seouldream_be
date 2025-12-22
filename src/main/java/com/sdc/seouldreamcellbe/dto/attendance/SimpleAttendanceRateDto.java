package com.sdc.seouldreamcellbe.dto.attendance;

import lombok.Builder;

import java.time.LocalDate;

@Builder
public record SimpleAttendanceRateDto(
    Long targetId,
    String targetName,
    double attendanceRate,
    long presentCount,
    long absentCount,
    long totalDays,
    LocalDate startDate,
    LocalDate endDate
) {
}
