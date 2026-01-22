package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.dto.cell.CellDto;
import com.sdc.seouldreamcellbe.dto.cell.CellLeaderDashboardDto;
import com.sdc.seouldreamcellbe.dto.cell.CellMemberAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.cell.CreateCellRequest;
import com.sdc.seouldreamcellbe.dto.cell.UpdateCellRequest;
import com.sdc.seouldreamcellbe.dto.cell.ProcessAttendanceWithPrayersRequest; // Added import
import com.sdc.seouldreamcellbe.dto.attendance.CellAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.attendance.SimpleAttendanceRateDto;
import com.sdc.seouldreamcellbe.dto.common.PageResponseDto;
import com.sdc.seouldreamcellbe.service.CellService;
import com.sdc.seouldreamcellbe.service.AttendanceSummaryService;
import com.sdc.seouldreamcellbe.service.CellUseCaseService; // Added import
import com.sdc.seouldreamcellbe.util.DateUtil;

import com.sdc.seouldreamcellbe.dto.report.CellReportDto;
import com.sdc.seouldreamcellbe.service.ReportService;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/cells")
@RequiredArgsConstructor
public class CellController {

    private final CellService cellService;
    private final ReportService reportService; // ADDED
    private final AttendanceSummaryService attendanceSummaryService;
    private final CellUseCaseService cellUseCaseService; // Added injection

    @Operation(summary = "[신규] 특정 날짜의 셀 보고서 조회", description = "특정 셀의 지정된 날짜에 저장된 셀 나눔(보고서)과 특이사항을 조회합니다.")
    @GetMapping("/{cellId}/attendance-report")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
    public ResponseEntity<CellReportDto> getAttendanceReport(
        @PathVariable Long cellId,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
        CellReportDto report = reportService.getReportByCellAndDate(cellId, date);
        return ResponseEntity.ok(report); // Returns null (200 OK) if not found
    }

    @Operation(summary = "[신규] 셀 모임 보고서 제출일 목록 조회", description = "특정 셀이 보고서를 제출한 날짜 목록을 조회합니다. 달력 UI에 표시하기 위해 사용됩니다.")
    @GetMapping("/{cellId}/submitted-dates")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
    public ResponseEntity<List<String>> getSubmittedCellReportDates(
            @PathVariable Long cellId,
            @RequestParam(required = false) Integer year,
            @RequestParam(required = false) Integer month
    ) {
        List<String> submittedDates = cellService.getSubmittedCellReportDates(cellId, year, month);
        return ResponseEntity.ok(submittedDates);
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PostMapping
    public ResponseEntity<CellDto> createCell(@Valid @RequestBody CreateCellRequest request) {
        CellDto createdCell = cellService.createCell(request);
        return new ResponseEntity<>(createdCell, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CellDto> getCellById(@PathVariable("id") Long id) {
        CellDto cell = cellService.getCellById(id);
        return ResponseEntity.ok(cell);
    }

    // New API for integrated attendance and prayer saving
    @PostMapping("/{cellId}/attendance-with-prayers")
    @PreAuthorize("hasAnyRole('EXECUTIVE', 'CELL_LEADER')")
    public ResponseEntity<Void> processAttendanceAndPrayers(
        @PathVariable Long cellId,
        @Valid @RequestBody ProcessAttendanceWithPrayersRequest request
    ) {
        cellUseCaseService.processAttendanceAndPrayers(cellId, request);
        return ResponseEntity.noContent().build();
    }


    @GetMapping("/{id}/attendance-rate")
        @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #id)")
        public ResponseEntity<SimpleAttendanceRateDto> getCellAttendanceRate(
            @PathVariable("id") Long id,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam(required = false) Integer year,
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer quarter,
            @RequestParam(required = false) Integer half) {
            DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
            SimpleAttendanceRateDto rateDto = attendanceSummaryService.getCellAttendanceRate(id, effectiveRange.startDate(), effectiveRange.endDate());
            return ResponseEntity.ok(rateDto);
        }
    
            @GetMapping("/{cellId}/members/attendance-rate")
            @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
            public ResponseEntity<List<SimpleAttendanceRateDto>> getCellMembersAttendanceRates(
                @PathVariable("cellId") Long cellId,
                @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
                @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
                @RequestParam(required = false) Integer year,
                @RequestParam(required = false) Integer month,
                @RequestParam(required = false) Integer quarter,
                @RequestParam(required = false) Integer half) {
                DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
                List<SimpleAttendanceRateDto> rates = attendanceSummaryService.getCellMembersAttendanceRates(cellId, effectiveRange.startDate(), effectiveRange.endDate());
                return ResponseEntity.ok(rates);
            }
        
            @GetMapping("/available-years")
            public ResponseEntity<List<Integer>> getAllAvailableYears() {
                List<Integer> years = cellService.getAllAvailableYears();
                return ResponseEntity.ok(years);
            }
        
            @GetMapping("/{cellId}/available-years")        @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
        public ResponseEntity<List<Integer>> getAvailableYears(@PathVariable Long cellId) {
            List<Integer> years = cellService.getAvailableYears(cellId);
            return ResponseEntity.ok(years);
        }
    
        @Operation(summary = "셀장 대시보드 요약 정보 조회", description = "셀장 대시보드에 필요한 핵심 지표들을 한 번에 조회합니다.")
        @GetMapping("/{cellId}/dashboard-summary")
        @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
        public ResponseEntity<CellLeaderDashboardDto> getCellLeaderDashboardSummary(
            @PathVariable Long cellId,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam(required = false) Integer year,
            @RequestParam(required = false) Integer month,
            @RequestParam(required = false) Integer quarter,
            @RequestParam(required =false) Integer half
        ) {
            DateUtil.DateRange dateRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
            CellLeaderDashboardDto summary = cellService.getCellLeaderDashboardSummary(cellId, dateRange.startDate(), dateRange.endDate());
            return ResponseEntity.ok(summary);
        }

    @Operation(summary = "셀 멤버별 출석 요약 조회", description = "특정 셀에 속한 모든 멤버의 최근 출석일과 연속 결석 횟수 등의 출석 요약 정보를 조회합니다.")
    @GetMapping("/{cellId}/members/attendance-summary")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
    public ResponseEntity<List<CellMemberAttendanceSummaryDto>> getCellMembersAttendanceSummary(@PathVariable Long cellId) {
        List<CellMemberAttendanceSummaryDto> summary = cellService.getCellMembersAttendanceSummary(cellId);
        return ResponseEntity.ok(summary);
    }
        
        @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isCellLeaderOfCell(authentication, #cellId)")
        @GetMapping("/{cellId}/attendances/summary")
        public ResponseEntity<CellAttendanceSummaryDto> getCellAttendanceSummary(
            @PathVariable Long cellId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam(required = false, defaultValue = "MONTH") GroupBy groupBy
        ) {
        DateUtil.DateRange effectiveRange = DateUtil.calculateEffectiveDateRange(startDate, endDate);
        CellAttendanceSummaryDto summary = attendanceSummaryService.getCellAttendanceSummary(cellId, effectiveRange.startDate(), effectiveRange.endDate(), groupBy);
        return ResponseEntity.ok(summary);
    }

    @GetMapping
    public ResponseEntity<PageResponseDto<CellDto>> getAllCells(
        @RequestParam(required = false) String name,
        @RequestParam(required = false) Boolean active,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @PageableDefault(size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        
        DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        Page<CellDto> cells = cellService.getAllCells(name, active, effectiveRange.startDate(), effectiveRange.endDate(), pageable);
        return ResponseEntity.ok(PageResponseDto.from(cells));
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PatchMapping("/{id}")
    public ResponseEntity<CellDto> updateCell(@PathVariable("id") Long id, @Valid @RequestBody UpdateCellRequest request) {
        CellDto updatedCell = cellService.updateCell(id, request);
        return ResponseEntity.ok(updatedCell);
    }



    @PreAuthorize("hasRole('EXECUTIVE')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCell(@PathVariable("id") Long id) {
        cellService.deleteCell(id);
        return ResponseEntity.noContent().build();
    }
}