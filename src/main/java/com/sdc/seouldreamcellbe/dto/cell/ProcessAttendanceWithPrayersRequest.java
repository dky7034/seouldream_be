package com.sdc.seouldreamcellbe.dto.cell;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;
import java.util.List;

public record ProcessAttendanceWithPrayersRequest(
    @NotNull
    LocalDate meetingDate,

    @NotBlank
    String cellShare,

    String specialNotes,

    @NotNull
    @Valid
    List<AttendanceAndPrayerItem> items
) {}