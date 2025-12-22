package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.common.PageResponseDto;
import com.sdc.seouldreamcellbe.dto.prayer.CreatePrayerRequest;
import com.sdc.seouldreamcellbe.dto.prayer.PrayerDto;
import com.sdc.seouldreamcellbe.dto.prayer.UpdatePrayerRequest;
import com.sdc.seouldreamcellbe.service.PrayerService;
import com.sdc.seouldreamcellbe.util.DateUtil;
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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/prayers")
@RequiredArgsConstructor
public class PrayerController {

    private final PrayerService prayerService;

    @PreAuthorize("@customSecurityEvaluator.canCreatePrayer(authentication, #request.memberId)")
    @PostMapping
    public ResponseEntity<PrayerDto> createPrayer(@Valid @RequestBody CreatePrayerRequest request) {
        PrayerDto createdPrayer = prayerService.createPrayer(request);
        return new ResponseEntity<>(createdPrayer, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<PrayerDto> getPrayerById(@PathVariable("id") Long id) {
        PrayerDto prayer = prayerService.getPrayerById(id);
        return ResponseEntity.ok(prayer);
    }

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<PageResponseDto<PrayerDto>> getPrayers(
        @AuthenticationPrincipal UserDetails userDetails,
        @RequestParam(required = false) Long memberId,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) Long createdById,
        @RequestParam(required = false) Boolean isDeleted,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable) {

        DateUtil.DateRange effectiveRange;
        if (startDate == null && endDate == null && year == null && month == null && quarter == null && half == null) {
            effectiveRange = new DateUtil.DateRange(null, null);
        } else {
            effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        }
        
        Page<PrayerDto> prayers = prayerService.getPrayers(userDetails, memberId, cellId, createdById, isDeleted, effectiveRange.startDate(), effectiveRange.endDate(), pageable);
        return ResponseEntity.ok(PageResponseDto.from(prayers));
    }

    @GetMapping("/available-years")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<Integer>> getAvailableYears() {
        List<Integer> years = prayerService.getAvailableYears();
        return ResponseEntity.ok(years);
    }

    @PreAuthorize("@customSecurityEvaluator.canManagePrayer(authentication, #id)")
    @PatchMapping("/{id}")
    public ResponseEntity<PrayerDto> updatePrayer(@PathVariable("id") Long id, @Valid @RequestBody UpdatePrayerRequest request) {
        PrayerDto updatedPrayer = prayerService.updatePrayer(id, request);
        return ResponseEntity.ok(updatedPrayer);
    }

    @PreAuthorize("@customSecurityEvaluator.canManagePrayer(authentication, #id)")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePrayer(@PathVariable("id") Long id) {
        prayerService.deletePrayer(id); // Soft delete
        return ResponseEntity.noContent().build();
    }
}