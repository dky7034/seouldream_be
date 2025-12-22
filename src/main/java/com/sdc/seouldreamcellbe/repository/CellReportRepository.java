package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.CellReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface CellReportRepository extends JpaRepository<CellReport, Long> {
    Optional<CellReport> findByCell_IdAndMeetingDate(Long cellId, LocalDate meetingDate);
}
