package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.dto.statistics.AggregatedTrendDto;
import com.sdc.seouldreamcellbe.dto.statistics.OverallAttendanceStatDto;
import com.sdc.seouldreamcellbe.service.StatisticsService;
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

@Tag(name = "통계", description = "각종 통계 데이터 조회 API")
@RestController
@RequestMapping("/api/statistics")
@RequiredArgsConstructor
public class StatisticsController {

    private final StatisticsService statisticsService;

    @Operation(summary = "전체 출석 통계 조회", description = "다양한 필터 조건에 따른 전체 출석 기록 수와 출석률을 조회합니다.")
    @GetMapping("/overall-attendance")
    @PreAuthorize("hasRole('ROLE_EXECUTIVE')")
    public ResponseEntity<OverallAttendanceStatDto> getOverallAttendanceStats(
        @RequestParam(required = false) LocalDate startDate,
        @RequestParam(required = false) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) Long memberId,
        @RequestParam(required = false) AttendanceStatus status
    ) {
        DateUtil.DateRange dateRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);

        OverallAttendanceStatDto stats = statisticsService.getOverallAttendanceStats(
            dateRange.startDate(),
            dateRange.endDate(),
            cellId,
            memberId,
            status
        );
        return ResponseEntity.ok(stats);
    }

    @Operation(summary = "그룹화된 출석 통계 추이 조회", description = "필터 조건에 따라 그룹화된 출석 통계 추이를 조회합니다.")
    @GetMapping("/attendance-trend")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<AggregatedTrendDto>> getAttendanceTrend(
        @RequestParam(required = false) LocalDate startDate,
        @RequestParam(required = false) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) Long memberId,
        @RequestParam(required = false) AttendanceStatus status,
        @RequestParam(required = false, defaultValue = "DAY") GroupBy groupBy
    ) {
        DateUtil.DateRange dateRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        List<AggregatedTrendDto> trend = statisticsService.getAttendanceTrend(
            dateRange.startDate(),
            dateRange.endDate(),
            cellId,
            memberId,
            status,
            groupBy
        );
        return ResponseEntity.ok(trend);
    }

    @Operation(summary = "출석 데이터가 있는 연도 목록 조회", description = "출석 데이터가 한 건이라도 존재하는 모든 연도를 중복 없이, 내림차순으로 정렬하여 반환합니다.")
    @GetMapping("/available-years")
    @PreAuthorize("hasAnyRole('ROLE_EXECUTIVE', 'ROLE_CELL_LEADER')")
    public ResponseEntity<List<Integer>> getAvailableYears(
        @RequestParam(required = false) Long cellId
    ) {
        List<Integer> years = statisticsService.getAvailableYears(cellId);
        return ResponseEntity.ok(years);
    }

    @Operation(summary = "기간별 새가족 등록 추이", description = "기간 내 새가족 등록 수와 전 분기 대비 증감률을 조회합니다.")
    @GetMapping("/newcomers")
    @PreAuthorize("hasAnyRole('ROLE_EXECUTIVE')")
    public ResponseEntity<List<com.sdc.seouldreamcellbe.dto.statistics.NewcomerTrendDto>> getNewcomerTrend(
        @RequestParam(required = false) @org.springframework.format.annotation.DateTimeFormat(iso = org.springframework.format.annotation.DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @org.springframework.format.annotation.DateTimeFormat(iso = org.springframework.format.annotation.DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(defaultValue = "MONTH") String groupBy
    ) {
        if (startDate == null) startDate = LocalDate.now().minusMonths(6).withDayOfMonth(1);
        if (endDate == null) endDate = LocalDate.now();
        
        return ResponseEntity.ok(statisticsService.getNewcomerTrend(startDate, endDate, groupBy));
    }

    @Operation(summary = "학기별 핵심 요약 및 인구 통계", description = "특정 학기(또는 현재) 기준 전체 인원 현황과 연령대별 분포를 조회합니다.")
    @GetMapping("/semester-summary")
    @PreAuthorize("hasAnyRole('ROLE_EXECUTIVE')")
    public ResponseEntity<com.sdc.seouldreamcellbe.dto.statistics.SemesterSummaryDto> getSemesterSummary(
        @RequestParam(required = false) Long semesterId
    ) {
        return ResponseEntity.ok(statisticsService.getSemesterSummary(semesterId));
    }
}