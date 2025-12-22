package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.MemberTeam;
import com.sdc.seouldreamcellbe.domain.Team;
import com.sdc.seouldreamcellbe.dto.member.MemberDto;
import com.sdc.seouldreamcellbe.dto.team.CreateTeamRequest;
import com.sdc.seouldreamcellbe.dto.team.TeamDto;
import com.sdc.seouldreamcellbe.dto.team.UpdateTeamRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.MemberTeamRepository;
import com.sdc.seouldreamcellbe.repository.TeamRepository;
import com.sdc.seouldreamcellbe.repository.specification.TeamSpecification;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class TeamService {

    private final TeamRepository teamRepository;
    private final MemberRepository memberRepository;
    private final MemberTeamRepository memberTeamRepository;

    @Transactional
    public TeamDto createTeam(CreateTeamRequest request) {
        Team newTeam = request.toEntity(); // Use the DTO's toEntity method
        newTeam.setCode(UUID.randomUUID().toString()); // Set the generated code
        Team savedTeam = teamRepository.save(newTeam);

        // --- Bulk assign members to the new team ---
        if (request.memberIds() != null && !request.memberIds().isEmpty()) {
            List<Member> membersToAssign = memberRepository.findAllById(request.memberIds());

            // Optional: Check if all requested members were found
            if (membersToAssign.size() != request.memberIds().size()) {
                 // You might want to throw an exception here, or log a warning,
                 // depending on how strict you want to be.
                 // For now, we'll proceed with the members that were found.
                 Set<Long> foundIds = membersToAssign.stream().map(Member::getId).collect(Collectors.toSet());
                 List<Long> notFoundIds = request.memberIds().stream().filter(id -> !foundIds.contains(id)).collect(Collectors.toList());
                 // Simple logging, could be more sophisticated
                 System.out.println("Warning: Could not find members with IDs: " + notFoundIds);
            }

            List<MemberTeam> newMemberTeams = membersToAssign.stream()
                .map(member -> MemberTeam.builder().member(member).team(savedTeam).build())
                .collect(Collectors.toList());
            memberTeamRepository.saveAll(newMemberTeams);
        }

        return TeamDto.from(savedTeam);
    }

    public TeamDto getTeamById(Long teamId) {
        Team team = teamRepository.findById(teamId)
            .orElseThrow(() -> new NotFoundException("팀을 찾을 수 없습니다. ID: " + teamId));
        return TeamDto.from(team);
    }

    public Page<TeamDto> getAllTeams(String name, String code, Boolean active, Pageable pageable) {
        List<Specification<Team>> specs = new java.util.ArrayList<>();

        if (name != null && !name.isBlank()) {
            specs.add(TeamSpecification.hasName(name));
        }
        if (code != null && !code.isBlank()) {
            specs.add(TeamSpecification.hasCode(code));
        }
        if (active != null) {
            specs.add(TeamSpecification.isActive(active));
        }
        
        Specification<Team> finalSpec = Specification.allOf(specs);
        Page<Team> teamPage = teamRepository.findAll(finalSpec, pageable);
        return teamPage.map(TeamDto::from);
    }

    @Transactional
    public TeamDto updateTeam(Long teamId, UpdateTeamRequest request) {
        Team team = teamRepository.findById(teamId)
            .orElseThrow(() -> new NotFoundException("팀을 찾을 수 없습니다. ID: " + teamId));

        if (request.name() != null) {
            team.setName(request.name());
        }
        if (request.code() != null) {
            team.setCode(request.code());
        }
        if (request.description() != null) {
            team.setDescription(request.description());
        }
        if (request.active() != null) {
            team.setActive(request.active());
        }

        return TeamDto.from(team);
    }

    @Transactional
    public void deleteTeam(Long teamId) {
        Team team = teamRepository.findById(teamId)
            .orElseThrow(() -> new NotFoundException("팀을 찾을 수 없습니다. ID: " + teamId));

        if (!team.getMemberTeams().isEmpty()) {
            throw new IllegalStateException("팀에 소속된 멤버가 있어 삭제할 수 없습니다.");
        }
        
        teamRepository.delete(team);
    }

    public List<MemberDto> getMembersForTeam(Long teamId) {
        Team team = teamRepository.findById(teamId)
            .orElseThrow(() -> new NotFoundException("팀을 찾을 수 없습니다. ID: " + teamId));
        
        return team.getMemberTeams().stream()
            .map(MemberTeam::getMember)
            .map(MemberDto::from)
            .collect(Collectors.toList());
    }

    @Transactional
    public void addMembersToTeam(Long teamId, List<Long> memberIds) {
        Team team = teamRepository.findById(teamId)
            .orElseThrow(() -> new NotFoundException("팀을 찾을 수 없습니다. ID: " + teamId));

        List<Member> members = memberRepository.findAllById(memberIds);
        if (members.size() != memberIds.size()) {
            throw new NotFoundException("일부 멤버를 찾을 수 없습니다.");
        }

        Set<Long> existingMemberIds = team.getMemberTeams().stream()
            .map(memberTeam -> memberTeam.getMember().getId())
            .collect(Collectors.toSet());

        List<MemberTeam> newMemberTeams = members.stream()
            .filter(member -> !existingMemberIds.contains(member.getId()))
            .map(member -> MemberTeam.builder().member(member).team(team).build())
            .collect(Collectors.toList());

        if (!newMemberTeams.isEmpty()) {
            memberTeamRepository.saveAll(newMemberTeams);
        }
    }
}
