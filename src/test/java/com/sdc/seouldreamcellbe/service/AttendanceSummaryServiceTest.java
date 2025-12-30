package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.attendance.OverallAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyBoolean;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class AttendanceSummaryServiceTest {

    @Mock
    private AttendanceRepository attendanceRepository;
    @Mock
    private MemberRepository memberRepository;
    @Mock
    private CellRepository cellRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private ActiveSemesterService activeSemesterService;

    @InjectMocks
    private AttendanceSummaryService attendanceSummaryService;

    @Test
    @DisplayName("getCellAttendanceSummary should calculate weighted average, not sum of individual rates")
    void getCellAttendanceSummary_shouldCalculateWeightedAverage() {
        // Given
        LocalDate sunday1 = LocalDate.of(2023, 10, 1);
        LocalDate sunday2 = LocalDate.of(2023, 10, 8);
        LocalDate startDate = sunday1;
        LocalDate endDate = sunday2;
        Long cellId = 1L;

        Cell cell = Cell.builder().id(cellId).name("Test Cell").build();

        Member member1 = Member.builder().id(1L).name("M1").cell(cell).role(Role.MEMBER).active(true).build();
        ReflectionTestUtils.setField(member1, "createdAt", sunday1.minusDays(10).atStartOfDay());
        
        Member member2 = Member.builder().id(2L).name("M2").cell(cell).role(Role.MEMBER).active(true).build();
        ReflectionTestUtils.setField(member2, "createdAt", sunday1.minusDays(10).atStartOfDay());
        
        Member member3 = Member.builder().id(3L).name("M3").cell(cell).role(Role.MEMBER).active(true).build();
        ReflectionTestUtils.setField(member3, "createdAt", sunday1.minusDays(10).atStartOfDay());

        // Attendance records
        // M1: Present, Present (2/2)
        Attendance att1_1 = Attendance.builder().member(member1).date(sunday1).status(AttendanceStatus.PRESENT).build();
        Attendance att1_2 = Attendance.builder().member(member1).date(sunday2).status(AttendanceStatus.PRESENT).build();
        
        // M2: Absent, Absent (0/2)
        Attendance att2_1 = Attendance.builder().member(member2).date(sunday1).status(AttendanceStatus.ABSENT).build();
        Attendance att2_2 = Attendance.builder().member(member2).date(sunday2).status(AttendanceStatus.ABSENT).build();

        // M3: Present, Absent (1/2)
        Attendance att3_1 = Attendance.builder().member(member3).date(sunday1).status(AttendanceStatus.PRESENT).build();
        Attendance att3_2 = Attendance.builder().member(member3).date(sunday2).status(AttendanceStatus.ABSENT).build();

        List<Attendance> attendances = Arrays.asList(att1_1, att1_2, att2_1, att2_2, att3_1, att3_2);

        when(cellRepository.findById(cellId)).thenReturn(java.util.Optional.of(cell));
        when(attendanceRepository.findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, startDate, endDate))
                .thenReturn(attendances);
        when(memberRepository.findByCell_IdAndRoleInAndActive(any(), any(), anyBoolean()))
                .thenReturn(Arrays.asList(member1, member2, member3));

        // When
        com.sdc.seouldreamcellbe.dto.attendance.CellAttendanceSummaryDto result = attendanceSummaryService.getCellAttendanceSummary(cellId, startDate, endDate, GroupBy.WEEK);

        // Then
        // Total Possible: 3 members * 2 weeks = 6
        // Total Present: M1(2) + M2(0) + M3(1) = 3
        // Expected Rate: 3/6 * 100 = 50.0%

        assertThat(result.totalSummary().totalPossible()).isEqualTo(6);
        assertThat(result.totalSummary().totalPresent()).isEqualTo(3);
        assertThat(result.totalSummary().attendanceRate()).isEqualTo(50.0);
    }

    @Test
    @DisplayName("getCellAttendanceSummary should exclude future dates from totalPossible calculation")
    void getCellAttendanceSummary_shouldExcludeFutureDates() {
        // Given
        LocalDate today = LocalDate.now();
        // Start date 2 weeks ago
        LocalDate startDate = today.minusWeeks(2);
        // End date 4 weeks in future
        LocalDate endDate = today.plusWeeks(4);
        Long cellId = 1L;

        Cell cell = Cell.builder().id(cellId).name("Test Cell").build();
        Member member1 = Member.builder().id(1L).name("M1").cell(cell).role(Role.MEMBER).active(true).build();
        ReflectionTestUtils.setField(member1, "createdAt", startDate.minusDays(10).atStartOfDay());

        when(cellRepository.findById(cellId)).thenReturn(java.util.Optional.of(cell));
        when(memberRepository.findByCell_IdAndRoleInAndActive(any(), any(), anyBoolean()))
                .thenReturn(Arrays.asList(member1));
        when(attendanceRepository.findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, startDate, endDate))
                .thenReturn(Collections.emptyList());

        // When
        com.sdc.seouldreamcellbe.dto.attendance.CellAttendanceSummaryDto result = attendanceSummaryService.getCellAttendanceSummary(cellId, startDate, endDate, GroupBy.WEEK);

        // Then
        // Calculate expected Sundays manually (up to today)
        List<LocalDate> expectedSundays = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, today);
        long expectedPossible = expectedSundays.size();

        assertThat(result.totalSummary().totalPossible()).isEqualTo(expectedPossible);
        
        // Verify that if we included future dates, it would be more
        List<LocalDate> allSundays = com.sdc.seouldreamcellbe.util.DateUtil.getSundaysInRange(startDate, endDate);
        if (allSundays.size() > expectedSundays.size()) {
             assertThat(result.totalSummary().totalPossible()).isLessThan(allSundays.size());
        }
    }

    @Test
    @DisplayName("getAttendanceRates should calculate rates correctly for multiple members")
    void getAttendanceRates_shouldCalculateCorrectly() {
        // Given
        LocalDate sunday1 = LocalDate.of(2023, 10, 1);
        LocalDate sunday2 = LocalDate.of(2023, 10, 8);
        LocalDate startDate = sunday1;
        LocalDate endDate = sunday2;

        Member member1 = Member.builder().id(1L).name("M1").active(true).build();
        ReflectionTestUtils.setField(member1, "createdAt", sunday1.minusDays(10).atStartOfDay());
        
        Member member2 = Member.builder().id(2L).name("M2").active(true).build();
        ReflectionTestUtils.setField(member2, "createdAt", sunday1.minusDays(10).atStartOfDay());

        // M1: 2/2 Present
        Attendance att1_1 = Attendance.builder().member(member1).date(sunday1).status(AttendanceStatus.PRESENT).build();
        Attendance att1_2 = Attendance.builder().member(member1).date(sunday2).status(AttendanceStatus.PRESENT).build();

        // M2: 1/2 Present
        Attendance att2_1 = Attendance.builder().member(member2).date(sunday1).status(AttendanceStatus.PRESENT).build();
        Attendance att2_2 = Attendance.builder().member(member2).date(sunday2).status(AttendanceStatus.ABSENT).build();

        when(attendanceRepository.findByMember_IdInAndDateBetween(anyList(), any(), any()))
            .thenReturn(Arrays.asList(att1_1, att1_2, att2_1, att2_2));

        // When
        java.util.Map<Long, Double> rates = attendanceSummaryService.getAttendanceRates(Arrays.asList(member1, member2), startDate, endDate);

        // Then
        assertThat(rates).containsEntry(1L, 100.0);
        assertThat(rates).containsEntry(2L, 50.0);
    }
}
