package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.report.IncompleteCheckReportDto;
import com.sdc.seouldreamcellbe.service.ReportService;
import com.sdc.seouldreamcellbe.util.DateUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@Tag(name = "리포트", description = "각종 리포트 조회 API")
@RestController
@RequestMapping("/api/reports")
@RequiredArgsConstructor
public class ReportController {

    private final ReportService reportService;

    @Operation(summary = "미완료 출석 체크 리포트", description = "지정된 기간 동안, 셀원 전체의 출석체크를 완료하지 않은 셀장과 해당 날짜 목록을 조회합니다.")
    @GetMapping("/incomplete-checks")
    @PreAuthorize("hasRole('ROLE_EXECUTIVE')")
    public ResponseEntity<List<IncompleteCheckReportDto>> getIncompleteChecks(
        @RequestParam(required = false) LocalDate startDate,
        @RequestParam(required = false) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half
    ) {
        DateUtil.DateRange dateRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        List<IncompleteCheckReportDto> report = reportService.getIncompleteChecks(dateRange.startDate(), dateRange.endDate());
        return ResponseEntity.ok(report);
    }

    @Operation(summary = "리포트용 연도 목록 조회", description = "리포트 필터링에 사용할, 출석 데이터가 존재하는 모든 연도 목록을 반환합니다.")
    @GetMapping("/available-years")
    @PreAuthorize("hasRole('ROLE_EXECUTIVE')")
    public ResponseEntity<List<Integer>> getAvailableYears() {
        List<Integer> years = reportService.getAvailableYears();
        return ResponseEntity.ok(years);
    }
}
