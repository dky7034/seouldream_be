package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.CellReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query; // Added import
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List; // Added import
import java.util.Optional;

@Repository
public interface CellReportRepository extends JpaRepository<CellReport, Long> {
    Optional<CellReport> findByCell_IdAndMeetingDate(Long cellId, LocalDate meetingDate);

    @Query("SELECT DISTINCT cr.meetingDate FROM CellReport cr WHERE cr.cell.id = :cellId " +
            "AND (:year IS NULL OR YEAR(cr.meetingDate) = :year) " +
            "AND (:month IS NULL OR MONTH(cr.meetingDate) = :month)")
    List<LocalDate> findDistinctMeetingDatesByCellIdAndOptionalYearMonth(
            Long cellId,
            Integer year,
            Integer month
    );
}
