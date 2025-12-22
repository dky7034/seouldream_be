package com.sdc.seouldreamcellbe.dto.attendance;

import lombok.Builder;

@Builder
public record AttendanceKeyMetricsDto(
    double thisWeekAttendanceRate,
    double periodAverageAttendanceRate,
    double lastYearPeriodAttendanceRate
) {
}
