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
    @DisplayName("getOverallAttendanceSummary should exclude inactive members from attendance count")
    void getOverallAttendanceSummary_shouldExcludeInactiveMembers() {
        // Given
        LocalDate sunday = LocalDate.of(2023, 10, 1); // A Sunday
        LocalDate startDate = sunday;
        LocalDate endDate = sunday;

        Cell cell = Cell.builder().id(1L).name("Test Cell").build();

        Member memberA = Member.builder().id(1L).name("Member A").cell(cell).role(Role.MEMBER).active(true).build();
        ReflectionTestUtils.setField(memberA, "createdAt", sunday.minusDays(10).atStartOfDay());
        
        Member memberB = Member.builder().id(2L).name("Member B").cell(cell).role(Role.MEMBER).active(true).build();
        ReflectionTestUtils.setField(memberB, "createdAt", sunday.minusDays(10).atStartOfDay());
        
        Member memberC = Member.builder().id(3L).name("Member C (Inactive)").cell(cell).role(Role.MEMBER).active(false).build();
        ReflectionTestUtils.setField(memberC, "createdAt", sunday.minusDays(10).atStartOfDay());

        // Attendance records
        Attendance attA = Attendance.builder().member(memberA).date(sunday).status(AttendanceStatus.PRESENT).build();
        Attendance attB = Attendance.builder().member(memberB).date(sunday).status(AttendanceStatus.ABSENT).build();
        Attendance attC = Attendance.builder().member(memberC).date(sunday).status(AttendanceStatus.PRESENT).build(); // Inactive member present

        // Mock repository responses
        when(attendanceRepository.findByDateBetweenWithMemberAndCreatedBy(startDate, endDate))
                .thenReturn(Arrays.asList(attA, attB, attC));

        // activeMembers only returns A and B
        when(memberRepository.findByCellIsNotNullAndRoleInAndActive(anyList(), anyBoolean()))
                .thenReturn(Arrays.asList(memberA, memberB));

        // When
        OverallAttendanceSummaryDto result = attendanceSummaryService.getOverallAttendanceSummary(startDate, endDate, GroupBy.WEEK);

        // Then
        // Total Possible: Member A and Member B for 1 Sunday = 2
        // Total Present: Member A only (Member C is excluded) = 1
        // Expected Rate: 1/2 * 100 = 50.0%

        assertThat(result.totalSummary().totalPossible()).isEqualTo(2);
        assertThat(result.totalSummary().totalPresent()).isEqualTo(1);
        assertThat(result.totalSummary().attendanceRate()).isEqualTo(50.0);
    }
}