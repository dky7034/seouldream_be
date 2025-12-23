package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.dto.prayer.PrayerCellSummaryDto;
import com.sdc.seouldreamcellbe.dto.prayer.PrayerMemberSummaryDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;

public interface PrayerRepositoryCustom {

    Page<PrayerMemberSummaryDto> findMemberPrayerSummary(
        LocalDate startDate, LocalDate endDate,
        Long cellId, Long memberId,
        Long createdById, Boolean isDeleted, Pageable pageable);

    Page<PrayerCellSummaryDto> findCellPrayerSummary(
        LocalDate startDate, LocalDate endDate,
        Long cellId, Long memberId,
        Long createdById, Boolean isDeleted, Pageable pageable);
}
