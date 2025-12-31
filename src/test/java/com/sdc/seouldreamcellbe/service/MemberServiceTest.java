package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.member.MemberDto;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.MemberTeamRepository;
import com.sdc.seouldreamcellbe.repository.TeamRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import com.sdc.seouldreamcellbe.security.CurrentUserFinder;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class MemberServiceTest {

    @Mock private MemberRepository memberRepository;
    @Mock private UserRepository userRepository;
    @Mock private CellRepository cellRepository;
    @Mock private TeamRepository teamRepository;
    @Mock private MemberTeamRepository memberTeamRepository;
    @Mock private PasswordEncoder passwordEncoder;
    @Mock private ActiveSemesterService activeSemesterService;
    @Mock private AttendanceSummaryService attendanceSummaryService;
    @Mock private CurrentUserFinder currentUserFinder;

    @InjectMocks
    private MemberService memberService;

    @Test
    @DisplayName("getAllMembers should use statYear when provided")
    void getAllMembers_shouldUseStatYear() {
        // Given
        int statYear = 2025;
        User executive = User.builder().role(Role.EXECUTIVE).build();
        when(currentUserFinder.getCurrentUser()).thenReturn(executive);

        Member member = Member.builder().id(1L).name("Test Member").build();
        Page<Member> memberPage = new PageImpl<>(List.of(member));
        
        when(memberRepository.findAll(any(Specification.class), any(Pageable.class)))
            .thenReturn(memberPage);
            
        when(attendanceSummaryService.getAttendanceRates(any(), any(), any()))
            .thenReturn(Map.of(1L, 85.0));

        Pageable pageable = PageRequest.of(0, 10);

        // When
        Page<MemberDto> result = memberService.getAllMembers(
            null, null, null, null, null, null, null, statYear, null, pageable
        );

        // Then
        verify(attendanceSummaryService).getAttendanceRates(
            eq(List.of(member)),
            eq(LocalDate.of(2025, 1, 1)),
            eq(LocalDate.of(2025, 12, 31))
        );
        
        assertThat(result.getContent()).hasSize(1);
        assertThat(result.getContent().get(0).attendanceRate()).isEqualTo(85.0);
    }

    @Test
    @DisplayName("getAllMembers should use current year when statYear is null")
    void getAllMembers_shouldUseCurrentYearWhenStatYearIsNull() {
        // Given
        User executive = User.builder().role(Role.EXECUTIVE).build();
        when(currentUserFinder.getCurrentUser()).thenReturn(executive);

        Member member = Member.builder().id(1L).name("Test Member").build();
        Page<Member> memberPage = new PageImpl<>(List.of(member));
        
        when(memberRepository.findAll(any(Specification.class), any(Pageable.class)))
            .thenReturn(memberPage);

        when(attendanceSummaryService.getAttendanceRates(any(), any(), any()))
            .thenReturn(Map.of(1L, 90.0));

        Pageable pageable = PageRequest.of(0, 10);
        int currentYear = LocalDate.now().getYear();

        // When
        Page<MemberDto> result = memberService.getAllMembers(
            null, null, null, null, null, null, null, null, null, pageable
        );

        // Then
        verify(attendanceSummaryService).getAttendanceRates(
            eq(List.of(member)),
            eq(LocalDate.of(currentYear, 1, 1)),
            eq(LocalDate.of(currentYear, 12, 31))
        );
        
        assertThat(result.getContent()).hasSize(1);
        assertThat(result.getContent().get(0).attendanceRate()).isEqualTo(90.0);
    }
}
