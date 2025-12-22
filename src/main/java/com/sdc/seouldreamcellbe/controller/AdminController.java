package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.AdminDto;
import com.sdc.seouldreamcellbe.dto.prayer.PrayerCellSummaryDto;
import com.sdc.seouldreamcellbe.dto.prayer.PrayerMemberSummaryDto;
import com.sdc.seouldreamcellbe.service.MemberService;
import com.sdc.seouldreamcellbe.service.PrayerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Tag(name = "어드민", description = "어드민 관련 API")
@RestController
@RequestMapping("/api/admin")
@RequiredArgsConstructor
public class AdminController {

    private final MemberService memberService;
    private final PrayerService prayerService;

    @PostMapping("/members/{memberId}/reset-password")
    @PreAuthorize("hasRole('EXECUTIVE')")
    @Operation(summary = "사용자 비밀번호 재설정", description = "관리자가 특정 사용자의 비밀번호를 임시 비밀번호로 재설정합니다.")
    public ResponseEntity<AdminDto.PasswordResetResponse> resetPassword(@PathVariable Long memberId) {
        String temporaryPassword = memberService.resetPassword(memberId);
        AdminDto.PasswordResetResponse response = new AdminDto.PasswordResetResponse(temporaryPassword);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/prayers/summary/members")
    @PreAuthorize("hasAnyRole('EXECUTIVE', 'CELL_LEADER')")
    @Operation(summary = "멤버별 기도제목 요약 조회", description = "멤버별로 그룹화된 기도제목 요약 정보를 조회합니다. 셀리더는 자기 셀만 조회 가능합니다.")
    public ResponseEntity<Page<PrayerMemberSummaryDto>> getMemberPrayerSummaries(
        @RequestParam(required = false) Long memberId,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) Long createdById,
        @RequestParam(required = false) Boolean isDeleted,
        @RequestParam(required = false) Long semesterId,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @PageableDefault(size = 10, sort = "latestCreatedAt", direction = Sort.Direction.DESC) Pageable pageable) {

        Page<PrayerMemberSummaryDto> summary = prayerService.getMemberPrayerSummary(
            startDate, endDate, year, month, quarter, half, semesterId,
            cellId, memberId, createdById, isDeleted, pageable);
        return ResponseEntity.ok(summary);
    }

    @GetMapping("/prayers/summary/cells")
    @PreAuthorize("hasAnyRole('EXECUTIVE', 'CELL_LEADER')")
    @Operation(summary = "셀별 기도제목 요약 조회", description = "셀별로 그룹화된 기도제목 요약 정보를 조회합니다. 셀리더는 자기 셀만 조회 가능합니다.")
    public ResponseEntity<Page<PrayerCellSummaryDto>> getCellPrayerSummaries(
        @RequestParam(required = false) Long memberId,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) Long createdById,
        @RequestParam(required = false) Boolean isDeleted,
        @RequestParam(required = false) Long semesterId,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @PageableDefault(size = 10, sort = "latestCreatedAt", direction = Sort.Direction.DESC) Pageable pageable) {

        Page<PrayerCellSummaryDto> summary = prayerService.getCellPrayerSummary(
            startDate, endDate, year, month, quarter, half, semesterId,
            cellId, memberId, createdById, isDeleted, pageable);
        return ResponseEntity.ok(summary);
    }
}
