package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.attendance.*;
import com.sdc.seouldreamcellbe.dto.attendance.MemberAttendanceSummaryDto.MemberPeriodSummaryDto;
import com.sdc.seouldreamcellbe.dto.attendance.OverallAttendanceSummaryDto.PeriodSummaryDto;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeParseException;
import java.time.temporal.IsoFields;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AttendanceSummaryService {

    private final AttendanceRepository attendanceRepository;
    private final MemberRepository memberRepository;
    private final CellRepository cellRepository;
    private final UserRepository userRepository;
    private final ActiveSemesterService activeSemesterService;


    public List<MemberAlertDto> getAttendanceAlerts(int consecutiveAbsences, String username, LocalDate startDate, LocalDate endDate) {
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다: " + username));

        List<Member> membersToCheck;
        if (user.getRole() == Role.EXECUTIVE) {
            membersToCheck = memberRepository.findByActive(true);
        } else if (user.getRole() == Role.CELL_LEADER && user.getMember() != null && user.getMember().getCell() != null) {
            membersToCheck = memberRepository.findByCell_IdAndActive(user.getMember().getCell().getId(), true);
        } else {
            return Collections.emptyList(); // Or throw an unauthorized exception
        }

        List<MemberAlertDto> alerts = new ArrayList<>();
        LocalDate effectiveEndDate = (endDate != null) ? endDate : LocalDate.now();

        for (Member member : membersToCheck) {
            List<Attendance> attendances = attendanceRepository.findByMemberIdAndDateLessThanEqualOrderByDateDesc(member.getId(), effectiveEndDate);

            if (attendances.isEmpty()) {
                continue;
            }

            int currentConsecutiveAbsences = 0;
            for (Attendance attendance : attendances) {
                if (startDate != null && attendance.getDate().isBefore(startDate)) {
                    break;
                }

                if (attendance.getStatus() == AttendanceStatus.ABSENT) {
                    currentConsecutiveAbsences++;
                } else {
                    // Stop counting as soon as a non-absent record is found
                    break;
                }
            }

            if (currentConsecutiveAbsences >= consecutiveAbsences) {
                LocalDate lastAttendanceDate = attendances.stream()
                    .filter(a -> a.getStatus() != AttendanceStatus.ABSENT)
                    .map(Attendance::getDate)
                    .findFirst()
                    .orElse(null); // If all are absences, there is no last attendance date

                alerts.add(MemberAlertDto.builder()
                    .memberId(member.getId())
                    .memberName(member.getName())
                    .cellName(member.getCell() != null ? member.getCell().getName() : "N/A")
                    .lastAttendanceDate(lastAttendanceDate)
                    .consecutiveAbsences(currentConsecutiveAbsences)
                    .build());
            }
        }
        return alerts;
    }




    public OverallAttendanceSummaryDto getOverallAttendanceSummary(LocalDate startDate, LocalDate endDate, GroupBy groupBy) {
        List<Attendance> attendances = attendanceRepository.findByDateBetweenWithMemberAndCreatedBy(startDate, endDate);
        // Filter out executives and unassigned members for accurate statistics
        List<Member> allActiveMembers = memberRepository.findByCellIsNotNullAndRoleInAndActive(List.of(Role.MEMBER, Role.CELL_LEADER), true);

        Map<String, List<Attendance>> groupedAttendances;

        switch (groupBy) {
            case DAY:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ISO_LOCAL_DATE)));
                break;
            case WEEK:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().get(IsoFields.WEEK_BASED_YEAR);
                    int week = att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);
                    return String.format("%d-W%02d", year, week);
                }));
                break;
            case MONTH:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM"))));
                break;
            case QUARTER:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int quarter = att.getDate().get(IsoFields.QUARTER_OF_YEAR);
                    return String.format("%d-Q%d", year, quarter);
                }));
                break;
            case HALF_YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int half = (att.getDate().getMonthValue() - 1) / 6 + 1;
                    return String.format("%d-H%d", year, half);
                }));
                break;
            case YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> String.valueOf(att.getDate().getYear())));
                break;
            default:
                throw new IllegalArgumentException("Unsupported group by type: " + groupBy);
        }

        List<PeriodSummaryDto> periodSummaries = groupedAttendances.entrySet().stream()
            .map(entry -> {
                String dateGroup = entry.getKey();
                List<Attendance> groupAttendances = entry.getValue();

                long presentCount = groupAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
                    .map(att -> att.getMember().getId() + "_" + att.getDate())
                    .distinct()
                    .count();
                long absentCount = groupAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
                    .map(att -> att.getMember().getId() + "_" + att.getDate())
                    .distinct()
                    .count();
                
                // NEW: Calculate accurate denominator based on ALL Sundays in the period, not just reported ones
                LocalDate periodStartDate = getPeriodStartDate(dateGroup, groupBy);
                LocalDate periodEndDate = getPeriodEndDate(dateGroup, groupBy);
                List<LocalDate> allSundaysInPeriod = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(periodStartDate, periodEndDate);
                
                long totalPossible = calculatePossibleAttendance(allSundaysInPeriod, allActiveMembers);

                double attendanceRate = (totalPossible > 0) ? ((double) presentCount / totalPossible) * 100.0 : 0.0;
                attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;
                
                if (attendanceRate > 100.0) {
                    attendanceRate = 100.0;
                }

                // For display, calculate members who were active by the end of the period
                long activeMembersInPeriod = allActiveMembers.stream()
                    .filter(member -> member.getCreatedAt() != null && !member.getCreatedAt().toLocalDate().isAfter(periodEndDate))
                    .count();

                return PeriodSummaryDto.builder()
                    .dateGroup(dateGroup)
                    .totalPresent(presentCount)
                    .totalAbsent(absentCount)
                    .totalPossible(totalPossible) // Set totalPossible
                    .totalMembers(activeMembersInPeriod) // Display the count of members at the end of the period
                    .attendanceRate(attendanceRate) // Use the accurately calculated rate
                    .build();
            })
            .sorted(Comparator.comparing(PeriodSummaryDto::dateGroup))
            .collect(Collectors.toList());

        // 전체 기간에 대한 총 요약 (TotalSummaryDto) 계산
        long totalPresentAll = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
            .map(att -> att.getMember().getId() + "_" + att.getDate())
            .distinct()
            .count();
        long totalAbsentAll = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
            .map(att -> att.getMember().getId() + "_" + att.getDate())
            .distinct()
            .count();
        
        // NEW: Calculate accurate denominator for total summary based on ALL Sundays in the range
        List<LocalDate> allSundaysInPeriodAll = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, endDate);
        long totalPossibleAll = calculatePossibleAttendance(allSundaysInPeriodAll, allActiveMembers);
        
        double overallAttendanceRate = (totalPossibleAll > 0) ? ((double) totalPresentAll / totalPossibleAll) * 100.0 : 0.0;
        overallAttendanceRate = Math.round(overallAttendanceRate * 100.0) / 100.0;

        if (overallAttendanceRate > 100.0) {
            overallAttendanceRate = 100.0;
        }

        // For display, count members active at the end of the period
        long totalMembersInPeriod = allActiveMembers.stream()
            .filter(member -> member.getCreatedAt() != null && !member.getCreatedAt().toLocalDate().isAfter(endDate))
            .count();

        OverallAttendanceSummaryDto.TotalSummaryDto totalSummary = OverallAttendanceSummaryDto.TotalSummaryDto.builder()
            .totalPresent(totalPresentAll)
            .totalAbsent(totalAbsentAll)
            .totalPossible(totalPossibleAll) // Set totalPossible
            .totalMembersInPeriod(totalMembersInPeriod) // Use member count at end of period
            .totalRecordedDates(allSundaysInPeriodAll.size()) // Total unique dates in period
            .attendanceRate(overallAttendanceRate)
            .build();

        return OverallAttendanceSummaryDto.builder()
            .periodSummaries(periodSummaries)
            .totalSummary(totalSummary) // totalSummary 추가
            .build();
    }

    public CellAttendanceSummaryDto getCellAttendanceSummary(Long cellId, LocalDate startDate, LocalDate endDate, GroupBy groupBy) {
        // Validate cell existence
        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));

        List<Attendance> attendances = attendanceRepository.findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, startDate, endDate);
        // Filter out executives from cell statistics for accuracy
        List<Member> activeMembersInCell = memberRepository.findByCell_IdAndRoleInAndActive(cellId, List.of(Role.MEMBER, Role.CELL_LEADER), true);

        Map<String, List<Attendance>> groupedAttendances;

        switch (groupBy) {
            case DAY:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ISO_LOCAL_DATE)));
                break;
            case WEEK:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().get(IsoFields.WEEK_BASED_YEAR);
                    int week = att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);
                    return String.format("%d-W%02d", year, week);
                }));
                break;
            case MONTH:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM"))));
                break;
            case QUARTER:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int quarter = att.getDate().get(IsoFields.QUARTER_OF_YEAR);
                    return String.format("%d-Q%d", year, quarter);
                }));
                break;
            case HALF_YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int half = (att.getDate().getMonthValue() - 1) / 6 + 1;
                    return String.format("%d-H%d", year, half);
                }));
                break;
            case YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> String.valueOf(att.getDate().getYear())));
                break;
            default:
                throw new IllegalArgumentException("Unsupported group by type: " + groupBy);
        }

        List<PeriodSummaryDto> periodSummaries = groupedAttendances.entrySet().stream()
            .map(entry -> {
                String dateGroup = entry.getKey();
                List<Attendance> groupAttendances = entry.getValue();

                long presentCount = groupAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
                    .map(att -> att.getMember().getId() + "_" + att.getDate())
                    .distinct()
                    .count();
                long absentCount = groupAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
                    .map(att -> att.getMember().getId() + "_" + att.getDate())
                    .distinct()
                    .count();
                
                // NEW: Calculate accurate denominator based on ALL Sundays in the period
                LocalDate periodStartDate = getPeriodStartDate(dateGroup, groupBy);
                LocalDate periodEndDate = getPeriodEndDate(dateGroup, groupBy);
                List<LocalDate> allSundaysInPeriod = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(periodStartDate, periodEndDate);
                
                long totalPossible = calculatePossibleAttendance(allSundaysInPeriod, activeMembersInCell);

                double attendanceRate = (totalPossible > 0) ? ((double) presentCount / totalPossible) * 100.0 : 0.0;
                attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;
                
                if (attendanceRate > 100.0) {
                    attendanceRate = 100.0;
                }
                
                // For display, calculate members who were active by the end of the period
                long activeMembersInPeriod = activeMembersInCell.stream()
                    .filter(member -> member.getCreatedAt() != null && !member.getCreatedAt().toLocalDate().isAfter(periodEndDate))
                    .count();

                return PeriodSummaryDto.builder()
                    .dateGroup(dateGroup)
                    .totalPresent(presentCount)
                    .totalAbsent(absentCount)
                    .totalPossible(totalPossible) // Set totalPossible
                    .totalMembers(activeMembersInPeriod) // Display the count of members at the end of the period
                    .attendanceRate(attendanceRate) // Use the accurately calculated rate
                    .build();
            })
            .sorted(Comparator.comparing(PeriodSummaryDto::dateGroup))
            .collect(Collectors.toList());

        // 전체 기간에 대한 총 요약 (TotalSummaryDto) 계산
        long totalPresentAll = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
            .map(att -> att.getMember().getId() + "_" + att.getDate())
            .distinct()
            .count();
        long totalAbsentAll = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
            .map(att -> att.getMember().getId() + "_" + att.getDate())
            .distinct()
            .count();
        
        // NEW: Calculate accurate denominator for total summary based on ALL Sundays
        List<LocalDate> allSundaysInPeriodAll = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, endDate);
        long totalPossibleAll = calculatePossibleAttendance(allSundaysInPeriodAll, activeMembersInCell);

        double overallAttendanceRate = (totalPossibleAll > 0) ? ((double) totalPresentAll / totalPossibleAll) * 100.0 : 0.0;
        overallAttendanceRate = Math.round(overallAttendanceRate * 100.0) / 100.0;
        
        if (overallAttendanceRate > 100.0) {
            overallAttendanceRate = 100.0;
        }

        CellAttendanceSummaryDto.TotalSummaryDto totalSummary = CellAttendanceSummaryDto.TotalSummaryDto.builder()
            .totalPresent(totalPresentAll)
            .totalAbsent(totalAbsentAll)
            .totalPossible(totalPossibleAll) // Set totalPossible
            .totalMembers(activeMembersInCell.size()) // Total members in the cell at present
            .totalRecordedDates(allSundaysInPeriodAll.size()) // Total Sundays in range
            .attendanceRate(overallAttendanceRate)
            .build();

        return CellAttendanceSummaryDto.builder()
            .cellId(cell.getId())
            .cellName(cell.getName())
            .periodSummaries(periodSummaries)
            .totalSummary(totalSummary) // totalSummary 추가
            .build();
    }

    public MemberAttendanceSummaryDto getMemberAttendanceSummary(Long memberId, LocalDate startDate, LocalDate endDate, GroupBy groupBy) {
        // Validate member existence
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));

        List<Attendance> attendances = attendanceRepository.findByMember_IdAndDateBetweenWithMemberAndCreatedBy(memberId, startDate, endDate);

        Map<String, List<Attendance>> groupedAttendances;

        switch (groupBy) {
            case DAY:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ISO_LOCAL_DATE)));
                break;
            case WEEK:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().get(IsoFields.WEEK_BASED_YEAR);
                    int week = att.getDate().get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);
                    return String.format("%d-W%02d", year, week);
                }));
                break;
            case MONTH:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> att.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM"))));
                break;
            case QUARTER:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int quarter = att.getDate().get(IsoFields.QUARTER_OF_YEAR);
                    return String.format("%d-Q%d", year, quarter);
                }));
                break;
            case HALF_YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> {
                    int year = att.getDate().getYear();
                    int half = (att.getDate().getMonthValue() - 1) / 6 + 1;
                    return String.format("%d-H%d", year, half);
                }));
                break;
            case YEAR:
                groupedAttendances = attendances.stream().collect(Collectors.groupingBy(att -> String.valueOf(att.getDate().getYear())));
                break;
            default:
                throw new IllegalArgumentException("Unsupported group by type: " + groupBy);
        }

        List<MemberPeriodSummaryDto> periodSummaries = groupedAttendances.entrySet().stream()
            .map(entry -> {
                String dateGroup = entry.getKey();
                List<Attendance> groupAttendances = entry.getValue(); // Should contain only one attendance for a member per day

                if (groupBy == GroupBy.DAY) {
                    // For DAY, return actual status and memo for that day
                    Attendance dailyAttendance = groupAttendances.isEmpty() ? null : groupAttendances.get(0); // Assuming one attendance per member per day
                    return MemberPeriodSummaryDto.builder()
                        .dateGroup(dateGroup)
                        .status(dailyAttendance != null ? dailyAttendance.getStatus() : null)
                        .memo(dailyAttendance != null ? dailyAttendance.getMemo() : null)
                        .presentCount(dailyAttendance != null && dailyAttendance.getStatus() == AttendanceStatus.PRESENT ? 1L : 0L)
                        .absentCount(dailyAttendance != null && dailyAttendance.getStatus() == AttendanceStatus.ABSENT ? 1L : 0L)
                        .build();
                } else {
                    // For WEEK/MONTH, return counts
                    long presentCount = groupAttendances.stream().filter(att -> att.getStatus() == AttendanceStatus.PRESENT).count();
                    long absentCount = groupAttendances.stream().filter(att -> att.getStatus() == AttendanceStatus.ABSENT).count();
                    return MemberPeriodSummaryDto.builder()
                        .dateGroup(dateGroup)
                        .status(null)
                        .memo(null)
                        .presentCount(presentCount)
                        .absentCount(absentCount)
                        .build();
                }
            })
            .sorted(Comparator.comparing(MemberPeriodSummaryDto::dateGroup))
            .collect(Collectors.toList());

        // 전체 기간에 대한 총 요약 (TotalSummaryDto) 계산
        // 중복 출석 제거 (distinct date)
        long totalPresentAll = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
            .map(Attendance::getDate)
            .distinct()
            .count();
            
        long totalAbsentAll = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
            .map(Attendance::getDate)
            .distinct()
            .count();
        
        long totalRecordedAttendancesAll = totalPresentAll + totalAbsentAll; // 출석 또는 결석 기록이 있는 총 횟수 (Unique dates)

        // 분모: 기간 내 전체 주일(일요일) 수 계산 (가입일/배정일 고려)
        List<LocalDate> allSundaysInPeriodAll = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, endDate);
        long totalPossible = calculatePossibleAttendance(allSundaysInPeriodAll, List.of(member));

        double overallAttendanceRate = (totalPossible > 0) ? ((double) totalPresentAll / totalPossible) * 100.0 : 0.0;
        overallAttendanceRate = Math.round(overallAttendanceRate * 100.0) / 100.0;
        
        // Safe Guard: 100% 초과 시 100%로 제한
        if (overallAttendanceRate > 100.0) {
            overallAttendanceRate = 100.0;
        }

        MemberAttendanceSummaryDto.TotalSummaryDto totalSummary = MemberAttendanceSummaryDto.TotalSummaryDto.builder()
            .totalPresent(totalPresentAll)
            .totalAbsent(totalAbsentAll)
            .totalRecordedDates(totalRecordedAttendancesAll)
            .totalPossibleAttendances(totalPossible) // 전체 가능 주차 수
            .attendanceRate(overallAttendanceRate)
            .build();

        return MemberAttendanceSummaryDto.builder()
            .memberId(member.getId())
            .memberName(member.getName())
            .periodSummaries(periodSummaries)
            .totalSummary(totalSummary) // totalSummary 추가
            .build();
    }

    private LocalDate getPeriodStartDate(String dateGroup, GroupBy groupBy) {
        try {
            switch (groupBy) {
                case DAY:
                    return LocalDate.parse(dateGroup, DateTimeFormatter.ISO_LOCAL_DATE);
                case WEEK:
                    DateTimeFormatter weekFormatter = new DateTimeFormatterBuilder()
                        .appendPattern("YYYY-'W'ww")
                        .parseDefaulting(WeekFields.ISO.dayOfWeek(), 1) // Monday
                        .toFormatter(Locale.ENGLISH);
                    return LocalDate.parse(dateGroup, weekFormatter);
                case MONTH:
                    return YearMonth.parse(dateGroup, DateTimeFormatter.ofPattern("yyyy-MM")).atDay(1);
                case QUARTER:
                    String[] quarterParts = dateGroup.split("-Q");
                    int year = Integer.parseInt(quarterParts[0]);
                    int quarter = Integer.parseInt(quarterParts[1]);
                    return LocalDate.of(year, (quarter - 1) * 3 + 1, 1);
                case HALF_YEAR:
                    String[] halfParts = dateGroup.split("-H");
                    int halfYear = Integer.parseInt(halfParts[0]);
                    int half = Integer.parseInt(halfParts[1]);
                    return half == 1 ? LocalDate.of(halfYear, 1, 1) : LocalDate.of(halfYear, 7, 1);
                case YEAR:
                    return LocalDate.of(Integer.parseInt(dateGroup), 1, 1);
                default:
                    return LocalDate.now();
            }
        } catch (DateTimeParseException | NumberFormatException e) {
            return LocalDate.now();
        }
    }

    private LocalDate getPeriodEndDate(String dateGroup, GroupBy groupBy) {
        try {
            switch (groupBy) {
                case DAY:
                    return LocalDate.parse(dateGroup, DateTimeFormatter.ISO_LOCAL_DATE);
                case WEEK:
                    // Assuming format "YYYY-Www" e.g., "2023-W05"
                    DateTimeFormatter weekFormatter = new DateTimeFormatterBuilder()
                        .appendPattern("YYYY-'W'ww")
                        .parseDefaulting(WeekFields.ISO.dayOfWeek(), 7) // Sunday
                        .toFormatter(Locale.ENGLISH);
                    return LocalDate.parse(dateGroup, weekFormatter);
                case MONTH:
                    return YearMonth.parse(dateGroup, DateTimeFormatter.ofPattern("yyyy-MM")).atEndOfMonth();
                case QUARTER:
                    String[] quarterParts = dateGroup.split("-Q");
                    int year = Integer.parseInt(quarterParts[0]);
                    int quarter = Integer.parseInt(quarterParts[1]);
                    return LocalDate.of(year, quarter * 3, 1).with(TemporalAdjusters.lastDayOfMonth());
                case HALF_YEAR:
                    String[] halfParts = dateGroup.split("-H");
                    int halfYear = Integer.parseInt(halfParts[0]);
                    int half = Integer.parseInt(halfParts[1]);
                    return half == 1 ? LocalDate.of(halfYear, 6, 30) : LocalDate.of(halfYear, 12, 31);
                case YEAR:
                    return LocalDate.of(Integer.parseInt(dateGroup), 12, 31);
                default:
                    return LocalDate.now(); // Should not happen
            }
        } catch (DateTimeParseException | NumberFormatException e) {
            // Fallback or logging
            return LocalDate.now();
        }
    }

    public SimpleAttendanceRateDto getMemberAttendanceRate(Long memberId, LocalDate startDate, LocalDate endDate) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));

        // Determine the effective start date for calculation, considering member's join date
        LocalDate effectiveStartDate = startDate;
        if (member.getCreatedAt() != null && member.getCreatedAt().toLocalDate().isAfter(startDate)) {
            effectiveStartDate = member.getCreatedAt().toLocalDate();
        }

        List<Attendance> attendances = attendanceRepository.findByMember_IdAndDateBetweenWithMemberAndCreatedBy(memberId, effectiveStartDate, endDate);

        long presentCount = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
            .map(Attendance::getDate)
            .distinct()
            .count();
        long absentCount = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
            .map(Attendance::getDate)
            .distinct()
            .count();

        // Calculate total possible Sundays in the requested range
        List<LocalDate> allSundays = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, endDate);
        long totalPossible = calculatePossibleAttendance(allSundays, List.of(member));

        // Use totalPossible as denominator
        long totalDays = totalPossible;

        double attendanceRate = (totalDays > 0) ? ((double) presentCount / totalDays) * 100.0 : 0.0;
        attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;
        
        if (attendanceRate > 100.0) {
            attendanceRate = 100.0;
        }

        return SimpleAttendanceRateDto.builder()
            .targetId(memberId)
            .targetName(member.getName())
            .attendanceRate(attendanceRate)
            .presentCount(presentCount)
            .absentCount(absentCount)
            .totalDays(totalDays)
            .startDate(effectiveStartDate)
            .endDate(endDate)
            .build();
    }

    public SimpleAttendanceRateDto getCellAttendanceRate(Long cellId, LocalDate startDate, LocalDate endDate) {
        // If no date range is specified, default to the active semester
        if (startDate == null && endDate == null) {
            com.sdc.seouldreamcellbe.domain.Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }
        final LocalDate finalStartDate = startDate;
        final LocalDate finalEndDate = endDate;

        Cell cell = cellRepository.findById(cellId)
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId));

        List<Attendance> attendances = attendanceRepository.findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, finalStartDate, finalEndDate);
        
        // Filter out executives
        List<Member> activeMembersInCell = memberRepository.findByCell_IdAndRoleInAndActive(cellId, List.of(Role.MEMBER, Role.CELL_LEADER), true);
        
        List<LocalDate> meetingDates = attendances.stream().map(Attendance::getDate).distinct().toList();
        long totalPossible = calculatePossibleAttendance(meetingDates, activeMembersInCell);

        long presentCount = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
            .count();
        long absentCount = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
            .count();
        
        // Use totalPossible as the denominator
        long totalDays = totalPossible;

        double attendanceRate = (totalDays > 0) ? ((double) presentCount / totalDays) * 100.0 : 0.0;
        attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;

        return SimpleAttendanceRateDto.builder()
            .targetId(cellId)
            .targetName(cell.getName())
            .attendanceRate(attendanceRate)
            .presentCount(presentCount)
            .absentCount(absentCount)
            .totalDays(totalDays)
            .startDate(finalStartDate)
            .endDate(finalEndDate)
            .build();
    }

    public List<SimpleAttendanceRateDto> getCellMembersAttendanceRates(Long cellId, LocalDate startDate, LocalDate endDate) {
        // If no date range is specified, default to the active semester
        if (startDate == null && endDate == null) {
            com.sdc.seouldreamcellbe.domain.Semester activeSemester = activeSemesterService.getActiveSemester();
            startDate = activeSemester.getStartDate();
            endDate = activeSemester.getEndDate();
        }
        final LocalDate finalStartDate = startDate;
        final LocalDate finalEndDate = endDate;

        if (!cellRepository.existsById(cellId)) {
            throw new NotFoundException("셀을 찾을 수 없습니다. ID: " + cellId);
        }

        List<Member> activeMembers = memberRepository.findByCell_IdAndActive(cellId, true);
        if (activeMembers.isEmpty()) {
            return Collections.emptyList();
        }

        List<Attendance> attendances = attendanceRepository.findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, finalStartDate, finalEndDate);

        Map<Long, List<Attendance>> attendancesByMember = attendances.stream()
            .collect(Collectors.groupingBy(att -> att.getMember().getId()));

        List<LocalDate> allSundays = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(finalStartDate, finalEndDate);

        return activeMembers.stream()
            .map(member -> {
                List<Attendance> memberAttendances = attendancesByMember.getOrDefault(member.getId(), Collections.emptyList());

                long presentCount = memberAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
                    .map(Attendance::getDate)
                    .distinct()
                    .count();
                long absentCount = memberAttendances.stream()
                    .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
                    .map(Attendance::getDate)
                    .distinct()
                    .count();
                
                long totalDays = calculatePossibleAttendance(allSundays, List.of(member));

                double attendanceRate = (totalDays > 0) ? ((double) presentCount / totalDays) * 100.0 : 0.0;
                // Round to two decimal places
                attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;
                
                if (attendanceRate > 100.0) {
                    attendanceRate = 100.0;
                }

                return SimpleAttendanceRateDto.builder()
                    .targetId(member.getId())
                    .targetName(member.getName())
                    .attendanceRate(attendanceRate)
                    .presentCount(presentCount)
                    .absentCount(absentCount)
                    .totalDays(totalDays)
                    .startDate(finalStartDate)
                    .endDate(finalEndDate)
                    .build();
            })
            .sorted(Comparator.comparing(SimpleAttendanceRateDto::targetName))
            .collect(Collectors.toList());
    }

    public SimpleAttendanceRateDto getOverallAttendanceRate(LocalDate startDate, LocalDate endDate) {

        List<Attendance> attendances = attendanceRepository.findByDateBetweenWithMemberAndCreatedBy(startDate, endDate);

        long presentCount = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.PRESENT)
            .count();
        long absentCount = attendances.stream()
            .filter(att -> att.getStatus() == AttendanceStatus.ABSENT)
            .count();

        long totalDays = presentCount + absentCount;

        double attendanceRate = (totalDays > 0) ? ((double) presentCount / totalDays) * 100.0 : 0.0;
        attendanceRate = Math.round(attendanceRate * 100.0) / 100.0;

        return SimpleAttendanceRateDto.builder()
            .targetId(null) // Represents "Overall"
            .targetName("전체")
            .attendanceRate(attendanceRate)
            .presentCount(presentCount)
            .absentCount(absentCount)
            .totalDays(totalDays)
            .startDate(startDate)
            .endDate(endDate)
            .build();
    }

    private long calculatePossibleAttendance(List<LocalDate> meetingDates, List<Member> members) {
        long count = 0;
        for (LocalDate date : meetingDates) {
            for (Member member : members) {
                LocalDate memberStartDate = member.getCellAssignmentDate();
                if (memberStartDate == null) {
                    memberStartDate = (member.getCreatedAt() != null) ? member.getCreatedAt().toLocalDate() : LocalDate.MIN;
                }
                if (!memberStartDate.isAfter(date)) {
                    count++;
                }
            }
        }
        return count;
    }
}