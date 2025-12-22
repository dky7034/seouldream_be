package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.service.ExcelExportService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;

@RestController
@RequestMapping("/api/export")
@RequiredArgsConstructor
public class ExportController {

    private final ExcelExportService excelExportService;

    @GetMapping(value = "/cells/{cellId}/members.xlsx", produces = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
    public ResponseEntity<byte[]> exportCellMembersXlsx(@PathVariable Long cellId) {
        try {
            byte[] xlsxContent = excelExportService.exportCellMembers(cellId);
            String filename = "cell-" + cellId + "-members.xlsx";

            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"");

            return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .headers(headers)
                .body(xlsxContent);

        } catch (IOException e) {
            // Log the exception, and return an internal server error
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping(value = "/cells/{cellId}/attendances.xlsx", produces = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
    public ResponseEntity<byte[]> exportCellAttendancesXlsx(
        @PathVariable Long cellId,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        try {
            byte[] xlsxContent = excelExportService.exportCellAttendances(cellId, startDate, endDate);
            String filename = "cell-" + cellId + "-attendances-" + startDate + "-to-" + endDate + ".xlsx";

            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filename + "\"");

            return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .headers(headers)
                .body(xlsxContent);

        } catch (IOException e) {
            // Log the exception, and return an internal server error
            return ResponseEntity.status(500).build();
        }
    }
}
