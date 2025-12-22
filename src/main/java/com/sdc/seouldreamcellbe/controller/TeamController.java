package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.common.PageResponseDto;
import com.sdc.seouldreamcellbe.dto.member.MemberDto;
import com.sdc.seouldreamcellbe.dto.team.AddMembersToTeamRequest;
import com.sdc.seouldreamcellbe.dto.team.CreateTeamRequest;
import com.sdc.seouldreamcellbe.dto.team.TeamDto;
import com.sdc.seouldreamcellbe.dto.team.UpdateTeamRequest;
import com.sdc.seouldreamcellbe.service.TeamService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/teams")
@RequiredArgsConstructor
public class TeamController {

    private final TeamService teamService;

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PostMapping
    public ResponseEntity<TeamDto> createTeam(@Valid @RequestBody CreateTeamRequest request) {
        TeamDto createdTeam = teamService.createTeam(request);
        return new ResponseEntity<>(createdTeam, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TeamDto> getTeamById(@PathVariable("id") Long id) {
        TeamDto team = teamService.getTeamById(id);
        return ResponseEntity.ok(team);
    }

    @GetMapping
    public ResponseEntity<PageResponseDto<TeamDto>> getAllTeams(
        @RequestParam(required = false) String name,
        @RequestParam(required = false) String code,
        @RequestParam(required = false) Boolean active,
        @PageableDefault(size = 10, sort = "name", direction = Sort.Direction.ASC) Pageable pageable) {
        Page<TeamDto> teams = teamService.getAllTeams(name, code, active, pageable);
        return ResponseEntity.ok(PageResponseDto.from(teams));
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PatchMapping("/{id}")
    public ResponseEntity<TeamDto> updateTeam(@PathVariable("id") Long id, @RequestBody UpdateTeamRequest request) {
        TeamDto updatedTeam = teamService.updateTeam(id, request);
        return ResponseEntity.ok(updatedTeam);
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTeam(@PathVariable("id") Long id) {
        teamService.deleteTeam(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{teamId}/members")
    public ResponseEntity<List<MemberDto>> getMembersForTeam(@PathVariable Long teamId) {
        List<MemberDto> members = teamService.getMembersForTeam(teamId);
        return ResponseEntity.ok(members);
    }

    @PreAuthorize("hasRole('EXECUTIVE')")
    @PostMapping("/{teamId}/members")
    public ResponseEntity<Void> addMembersToTeam(@PathVariable Long teamId, @Valid @RequestBody @NotEmpty List<Long> memberIds) {
        teamService.addMembersToTeam(teamId, memberIds);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
