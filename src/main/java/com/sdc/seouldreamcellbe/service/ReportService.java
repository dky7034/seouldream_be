package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.CellReport;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Semester;
import com.sdc.seouldreamcellbe.dto.report.CellReportDto;
import com.sdc.seouldreamcellbe.dto.report.IncompleteCheckReportDto;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.CellReportRepository;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ReportService {

    private final CellRepository cellRepository;
    private final CellReportRepository cellReportRepository; // ADDED
    private final AttendanceRepository attendanceRepository;
    private final ActiveSemesterService activeSemesterService;

    public CellReportDto getReportByCellAndDate(Long cellId, LocalDate date) {
        Optional<CellReport> reportOptional = cellReportRepository.findByCell_IdAndMeetingDate(cellId, date);
        return reportOptional.map(CellReportDto::from).orElse(null);
    }

    public List<Integer> getAvailableYears() {
        return attendanceRepository.findDistinctYears();
    }


    public List<IncompleteCheckReportDto> getIncompleteChecks(LocalDate startDate, LocalDate endDate) {
        // If no date range is specified, default to the active semester
        if (startDate == null && endDate == null) {
            Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }
        
        // Prevent checking future dates for incomplete checks
        if (endDate != null && endDate.isAfter(LocalDate.now())) {
            endDate = LocalDate.now();
        }

        // 1. Find all Sundays in the given period
        List<LocalDate> sundays = startDate.datesUntil(endDate.plusDays(1))
            .filter(date -> date.getDayOfWeek() == DayOfWeek.SUNDAY)
            .collect(Collectors.toList());

        if (sundays.isEmpty()) {
            return Collections.emptyList();
        }

        // 2. For each Sunday, find cells with incomplete checks and aggregate the results.
        Map<Member, List<LocalDate>> missesByLeader = new java.util.HashMap<>();
        for (LocalDate sunday : sundays) {
            List<Cell> incompleteCells = cellRepository.findIncompleteCellsForDate(sunday);
            for (Cell cell : incompleteCells) {
                // The leader is already fetched thanks to JOIN FETCH
                missesByLeader.computeIfAbsent(cell.getLeader(), k -> new ArrayList<>()).add(sunday);
            }
        }

        // 3. Format the result
        return missesByLeader.entrySet().stream()
            .map(entry -> {
                Member leader = entry.getKey();
                List<LocalDate> missedDates = entry.getValue();
                // Leader's cell can be null if they are an executive without a cell.
                // In the context of this report, leader should have a cell.
                if (leader.getCell() == null) return null;

                List<LocalDate> distinctMissedDates = missedDates.stream()
                    .distinct()
                    .sorted()
                    .collect(Collectors.toList());

                return IncompleteCheckReportDto.builder()
                    .leaderId(leader.getId())
                    .leaderName(leader.getName())
                    .cellId(leader.getCell().getId())
                    .cellName(leader.getCell().getName())
                    .missedDatesCount(distinctMissedDates.size())
                    .missedDates(distinctMissedDates)
                    .build();
            })
            .filter(java.util.Objects::nonNull)
            .sorted(Comparator.comparing(IncompleteCheckReportDto::leaderName))
            .collect(Collectors.toList());
    }
}
