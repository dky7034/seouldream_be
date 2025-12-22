package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.dto.attendance.*;
import com.sdc.seouldreamcellbe.dto.common.PageResponseDto;
import com.sdc.seouldreamcellbe.dto.report.CellReportDto;
import com.sdc.seouldreamcellbe.service.AttendanceService;
import com.sdc.seouldreamcellbe.service.AttendanceSummaryService;
import com.sdc.seouldreamcellbe.service.ReportService;
import com.sdc.seouldreamcellbe.util.DateUtil;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/attendances")
@RequiredArgsConstructor
public class AttendanceController {

    private final AttendanceService attendanceService;
    private final ReportService reportService;
    private final AttendanceSummaryService attendanceSummaryService;

    @GetMapping("/report")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
    public ResponseEntity<CellReportDto> getAttendanceReport(
        @RequestParam Long cellId,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
        return ResponseEntity.ok(reportService.getReportByCellAndDate(cellId, date));
    }

    /**
     * Creates or updates a list of attendance records.
     */
    @PreAuthorize("@customSecurityEvaluator.canProcessAttendanceForMembers(authentication, #requests)")
    @PostMapping("/process")
    public ResponseEntity<List<AttendanceDto>> processAttendances(
            @Valid @RequestBody List<ProcessAttendanceRequest> requests,
            @AuthenticationPrincipal UserDetails userDetails) {
        List<AttendanceDto> result = attendanceService.processAttendances(requests, userDetails.getUsername());
        return ResponseEntity.ok(result);
    }

    /**
     * Gets overall attendance summary for dashboard.
     */
    @PreAuthorize("hasRole('EXECUTIVE')")
    @GetMapping("/summary/overall")
    public ResponseEntity<OverallAttendanceSummaryDto> getOverallAttendanceSummary(
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @RequestParam(required = false, defaultValue = "MONTH") GroupBy groupBy
    ) {
        DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        OverallAttendanceSummaryDto summary = attendanceSummaryService.getOverallAttendanceSummary(effectiveRange.startDate(), effectiveRange.endDate(), groupBy);
        return ResponseEntity.ok(summary);
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @GetMapping("/rate/overall")
    public ResponseEntity<SimpleAttendanceRateDto> getOverallAttendanceRate(
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        DateUtil.DateRange effectiveRange = DateUtil.calculateEffectiveDateRange(startDate, endDate);
        SimpleAttendanceRateDto rateDto = attendanceSummaryService.getOverallAttendanceRate(effectiveRange.startDate(), effectiveRange.endDate());
        return ResponseEntity.ok(rateDto);
    }

    /**
     * Gets individual member attendance summary.
     */
    @PreAuthorize("@customSecurityEvaluator.canViewMemberAttendanceSummary(authentication, #memberId)")
    @GetMapping("/summary/members/{memberId}")
    public ResponseEntity<MemberAttendanceSummaryDto> getMemberAttendanceSummary(
        @PathVariable Long memberId,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @RequestParam(required = false, defaultValue = "MONTH") GroupBy groupBy
    ) {
        DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        MemberAttendanceSummaryDto summary = attendanceSummaryService.getMemberAttendanceSummary(memberId, effectiveRange.startDate(), effectiveRange.endDate(), groupBy);
        return ResponseEntity.ok(summary);
    }

    @GetMapping("/alerts")
    @PreAuthorize("hasAnyRole('EXECUTIVE', 'CELL_LEADER')")
    public ResponseEntity<List<MemberAlertDto>> getAttendanceAlerts(
        @RequestParam(defaultValue = "3") int consecutiveAbsences,
        @AuthenticationPrincipal UserDetails userDetails) {
        List<MemberAlertDto> alerts = attendanceSummaryService.getAttendanceAlerts(consecutiveAbsences, userDetails.getUsername());
        return ResponseEntity.ok(alerts);
    }

    /**
     * Gets a paginated and filtered list of attendance records.
     */
    @GetMapping
    public ResponseEntity<PageResponseDto<AttendanceDto>> getAttendances(
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Long memberId,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) AttendanceStatus status,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @PageableDefault(size = 20, sort = "date", direction = Sort.Direction.DESC) Pageable pageable) {

        DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        Page<AttendanceDto> result = attendanceService.getAttendances(effectiveRange.startDate(), effectiveRange.endDate(), memberId, cellId, status, pageable);
        return ResponseEntity.ok(PageResponseDto.from(result));
    }
    
    @PreAuthorize("@customSecurityEvaluator.canManageAttendance(authentication, #id)")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAttendance(@PathVariable("id") Long id) {
        attendanceService.deleteAttendance(id);
        return ResponseEntity.noContent().build();
    }
}