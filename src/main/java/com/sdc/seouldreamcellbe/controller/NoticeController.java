package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import com.sdc.seouldreamcellbe.dto.notice.CreateNoticeRequest;
import com.sdc.seouldreamcellbe.dto.notice.NoticeDto;
import com.sdc.seouldreamcellbe.dto.notice.UpdateNoticeRequest;
import com.sdc.seouldreamcellbe.service.NoticeService;
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
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/notices")
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PostMapping
    public ResponseEntity<NoticeDto> createNotice(@Valid @RequestBody CreateNoticeRequest request) {
        NoticeDto createdNotice = noticeService.createNotice(request);
        return new ResponseEntity<>(createdNotice, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<NoticeDto> getNoticeById(@PathVariable("id") Long id) {
        NoticeDto notice = noticeService.getNoticeById(id);
        return ResponseEntity.ok(notice);
    }

    @GetMapping
    public ResponseEntity<Page<NoticeDto>> getAllNotices(
        @RequestParam(required = false) String title,
        @RequestParam(required = false) NoticeTarget target,
        @RequestParam(required = false) Boolean pinned,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false) Integer year,
        @RequestParam(required = false) Integer month,
        @RequestParam(required = false) Integer quarter,
        @RequestParam(required = false) Integer half,
        @PageableDefault(size = 10, sort = "createdAt", direction = Sort.Direction.DESC) Pageable pageable) {

        DateUtil.DateRange effectiveRange = DateUtil.calculateDateRangeFromParams(startDate, endDate, year, month, quarter, half);
        Page<NoticeDto> notices = noticeService.getAllNotices(title, target, pinned, effectiveRange.startDate(), effectiveRange.endDate(), pageable);
        return ResponseEntity.ok(notices);
    }

    @GetMapping("/available-years")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<Integer>> getAvailableYears() {
        List<Integer> years = noticeService.getAvailableYears();
        return ResponseEntity.ok(years);
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PatchMapping("/{id}")
    public ResponseEntity<NoticeDto> updateNotice(@PathVariable("id") Long id, @Valid @RequestBody UpdateNoticeRequest request) {
        NoticeDto updatedNotice = noticeService.updateNotice(id, request);
        return ResponseEntity.ok(updatedNotice);
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteNotice(@PathVariable("id") Long id) {
        noticeService.deleteNotice(id);
        return ResponseEntity.noContent().build();
    }
}
