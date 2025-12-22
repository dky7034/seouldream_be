package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.GroupBy;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.attendance.MemberAttendanceSummaryDto;
import com.sdc.seouldreamcellbe.dto.attendance.SimpleAttendanceRateDto;
import com.sdc.seouldreamcellbe.dto.member.CreateMemberRequest;
import com.sdc.seouldreamcellbe.dto.member.MemberDto;
import com.sdc.seouldreamcellbe.dto.member.UpdateMemberRequest;
import com.sdc.seouldreamcellbe.dto.team.TeamDto;
import com.sdc.seouldreamcellbe.service.AttendanceSummaryService;
import com.sdc.seouldreamcellbe.service.MemberService;
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
@RequestMapping("/api/members")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;
    private final AttendanceSummaryService attendanceSummaryService;

    @PostMapping
    public ResponseEntity<MemberDto> createMember(@Valid @RequestBody CreateMemberRequest request) {
        MemberDto createdMember = memberService.createMember(request);
        return new ResponseEntity<>(createdMember, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<MemberDto> getMemberById(@PathVariable("id") Long id) {
        MemberDto member = memberService.getMemberById(id);
        return ResponseEntity.ok(member);
    }

    @GetMapping("/{id}/attendance-rate")
    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isTargetMemberOwnerOrCellLeader(authentication, #id)")
    public ResponseEntity<SimpleAttendanceRateDto> getMemberAttendanceRate(
        @PathVariable("id") Long id,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        SimpleAttendanceRateDto rateDto = attendanceSummaryService.getMemberAttendanceRate(id, startDate, endDate);
        return ResponseEntity.ok(rateDto);
    }

    @PreAuthorize("hasRole('EXECUTIVE') or @customSecurityEvaluator.isTargetMemberOwnerOrCellLeader(authentication, #memberId)")
    @GetMapping("/{memberId}/attendances/summary")
    public ResponseEntity<MemberAttendanceSummaryDto> getMemberAttendanceSummary(
        @PathVariable Long memberId,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
        @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
        @RequestParam(required = false, defaultValue = "MONTH") GroupBy groupBy
    ) {
        MemberAttendanceSummaryDto summary = attendanceSummaryService.getMemberAttendanceSummary(memberId, startDate, endDate, groupBy);
        return ResponseEntity.ok(summary);
    }

    @GetMapping
    public ResponseEntity<Page<MemberDto>> getAllMembers(
        @RequestParam(required = false) String name,
        @RequestParam(required = false) Integer joinYear,
        @RequestParam(required = false) Gender gender,
        @RequestParam(required = false) Role role,
        @RequestParam(required = false) Boolean unassigned,
        @RequestParam(required = false) Long cellId,
        @RequestParam(required = false) Integer month,
        @PageableDefault(size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<MemberDto> members = memberService.getAllMembers(name, joinYear, gender, role, unassigned, cellId, month, pageable);
        return ResponseEntity.ok(members);
    }

    @GetMapping("/available-join-years")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<List<Integer>> getAvailableJoinYears() {
        List<Integer> years = memberService.getAvailableJoinYears();
        return ResponseEntity.ok(years);
    }

    @PatchMapping("/{id}")
    @PreAuthorize("hasRole('EXECUTIVE') or (#id == authentication.principal.id) or @customSecurityEvaluator.isCellLeaderOfTargetMember(authentication, #id)")
    public ResponseEntity<MemberDto> updateMember(@PathVariable("id") Long id, @Valid @RequestBody UpdateMemberRequest request) {
        MemberDto updatedMember = memberService.updateMember(id, request);
        return ResponseEntity.ok(updatedMember);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<Void> deleteMember(@PathVariable("id") Long id) {
        memberService.deleteMember(id);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/{memberId}/cell")
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<Void> unassignMemberFromCell(@PathVariable Long memberId) {
        memberService.unassignCell(memberId);
        return ResponseEntity.noContent().build();
    }

    // --- Member-Team Relationship Endpoints ---

    @PostMapping("/{memberId}/teams/{teamId}")
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<Void> addMemberToTeam(@PathVariable Long memberId, @PathVariable Long teamId) {
        memberService.addMemberToTeam(memberId, teamId);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @DeleteMapping("/{memberId}/teams/{teamId}")
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<Void> removeMemberFromTeam(@PathVariable Long memberId, @PathVariable Long teamId) {
        memberService.removeMemberFromTeam(memberId, teamId);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{memberId}/teams")
    public ResponseEntity<List<TeamDto>> getTeamsForMember(@PathVariable Long memberId) {
        List<TeamDto> teams = memberService.getTeamsForMember(memberId);
        return ResponseEntity.ok(teams);
    }
}