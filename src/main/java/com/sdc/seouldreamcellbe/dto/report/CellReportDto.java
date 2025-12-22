package com.sdc.seouldreamcellbe.dto.report;

import com.sdc.seouldreamcellbe.domain.CellReport;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record CellReportDto(
    LocalDate meetingDate,
    String cellShare,
    String specialNotes
) {
    public static CellReportDto from(CellReport entity) {
        if (entity == null) {
            return null;
        }
        return CellReportDto.builder()
            .meetingDate(entity.getMeetingDate())
            .cellShare(entity.getCellShare())
            .specialNotes(entity.getSpecialNotes())
            .build();
    }
}
