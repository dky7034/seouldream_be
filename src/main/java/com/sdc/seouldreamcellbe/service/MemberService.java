package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.*;
import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.auth.ChangePasswordRequest;
import com.sdc.seouldreamcellbe.dto.member.CreateMemberRequest;
import com.sdc.seouldreamcellbe.dto.member.MemberDto;
import com.sdc.seouldreamcellbe.dto.member.UpdateMemberRequest;
import com.sdc.seouldreamcellbe.dto.member.UpdateMyProfileRequest;
import com.sdc.seouldreamcellbe.dto.team.TeamDto;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.*;
import com.sdc.seouldreamcellbe.repository.specification.MemberSpecification;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class MemberService {

    private final MemberRepository memberRepository;
    private final UserRepository userRepository;
    private final CellRepository cellRepository;
    private final TeamRepository teamRepository;
    private final MemberTeamRepository memberTeamRepository;
    private final PasswordEncoder passwordEncoder;

    public List<Integer> getAvailableJoinYears() {
        return memberRepository.findDistinctJoinYears();
    }

    @Transactional
    public MemberDto createMember(CreateMemberRequest request) {
        // Check for duplicate username
        if (userRepository.findByUsername(request.username()).isPresent()) {
            throw new IllegalArgumentException("이미 사용 중인 아이디입니다.");
        }
        // Check for duplicate email
        if (request.email() != null && memberRepository.findByEmail(request.email()).isPresent()) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }

        // Validation for CELL_LEADER role
        // if (request.role() == Role.CELL_LEADER && request.cellId() == null) {
        //     throw new IllegalArgumentException("셀 리더(CELL_LEADER)는 반드시 셀에 소속되어야 합니다.");
        // }

        Cell cell = null;
        LocalDate cellAssignmentDate = null;
        if (request.cellId() != null && request.cellId() != 0L) {
            cell = cellRepository.findById(request.cellId())
                .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + request.cellId()));
            cellAssignmentDate = LocalDate.now();
        }

        Member newMember = Member.builder()
            .name(request.name())
            .gender(request.gender())
            .birthDate(request.birthDate())
            .phone(request.phone())
            .email(request.email())
            .cell(cell)
            .cellAssignmentDate(cellAssignmentDate)
            .role(request.role())
            .joinYear(request.joinYear())
            .address(request.address())
            .note(request.note())
            .active(true)
            .build();

        User newUser = User.builder()
            .username(request.username())
            .password(passwordEncoder.encode(request.password()))
            .member(newMember)
            .role(request.role())
            .build();

        newMember.setUser(newUser);

        Member savedMember = memberRepository.save(newMember);
        // User is saved by cascade from Member

        return MemberDto.from(savedMember);
    }

    public MemberDto getMemberById(Long memberId) {
        Member member = memberRepository.findByIdWithUser(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));
        return MemberDto.from(member);
    }

    public Page<MemberDto> getAllMembers(String name, Integer joinYear, Gender gender, Role role, Boolean unassigned, Long cellId, Integer month, Pageable pageable) {

        Pageable finalPageable = pageable;
        // If filtering by month and no specific sort is provided, default sort by birthDate
        if (month != null && !pageable.getSort().isSorted()) {
            finalPageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), Sort.by("birthDate").ascending());
        }

        Specification<Member> spec = MemberSpecification.hasName(name)
            .and(MemberSpecification.hasJoinYear(joinYear))
            .and(MemberSpecification.hasGender(gender))
            .and(MemberSpecification.hasRole(role))
            .and(MemberSpecification.isUnassigned(unassigned))
            .and(MemberSpecification.hasCellId(cellId))
            .and(MemberSpecification.hasBirthMonth(month));

        Page<Member> memberPage = memberRepository.findAll(spec, finalPageable);
        return memberPage.map(MemberDto::from);
    }

    @Transactional
    public MemberDto updateMember(Long memberId, UpdateMemberRequest request) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));

        if (request.name() != null) member.setName(request.name());
        if (request.gender() != null) member.setGender(request.gender());
        if (request.birthDate() != null) member.setBirthDate(request.birthDate());
        if (request.phone() != null) member.setPhone(request.phone());
        if (request.email() != null) member.setEmail(request.email());
        if (request.role() != null) member.setRole(request.role());
        if (request.joinYear() != null) member.setJoinYear(request.joinYear());
        if (request.active() != null) member.setActive(request.active());
        if (request.address() != null) member.setAddress(request.address());
        if (request.note() != null) member.setNote(request.note());

        // Handle Cell assignment
        if (request.cellId() != null) {
            // Un-assignment
            if (request.cellId() == 0L) {
                if (member.getRole() == Role.CELL_LEADER) {
                    throw new IllegalArgumentException("셀 리더는 셀에서 제외시킬 수 없습니다. 먼저 다른 멤버에게 리더를 위임하거나, 역할을 변경해주세요.");
                }
                if (member.getCell() != null) {
                    member.setCell(null);
                    member.setCellAssignmentDate(null);
                }
            }
            // Assignment or Change
            else {
                Cell newCell = cellRepository.findById(request.cellId())
                    .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + request.cellId()));

                // Only update if the cell is actually changing
                if (member.getCell() == null || !member.getCell().getId().equals(newCell.getId())) {
                    member.setCell(newCell);
                    member.setCellAssignmentDate(LocalDate.now());
                }
            }
        }

        // Validation for CELL_LEADER role
        // if (member.getRole() == Role.CELL_LEADER && member.getCell() == null) {
        //     throw new IllegalArgumentException("셀 리더(CELL_LEADER)는 반드시 셀에 소속되어야 합니다.");
        // }

        return MemberDto.from(member);
    }

    @Transactional
    public void deleteMember(Long memberId) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));
        
        memberRepository.delete(member);
    }

    @Transactional
    public void unassignCell(Long memberId) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));

        if (member.getRole() == Role.CELL_LEADER) {
            throw new IllegalArgumentException("셀 리더는 셀에서 제외시킬 수 없습니다. 먼저 다른 멤버에게 리더를 위임하거나, 역할을 변경해주세요.");
        }

        member.setCell(null);
    }

    @Transactional
    public void addMemberToTeam(Long memberId, Long teamId) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));
        Team team = teamRepository.findById(teamId)
            .orElseThrow(() -> new NotFoundException("팀을 찾을 수 없습니다. ID: " + teamId));

        memberTeamRepository.findByMember_IdAndTeam_Id(memberId, teamId).ifPresent(mt -> {
            throw new IllegalStateException("멤버가 이미 해당 팀에 소속되어 있습니다.");
        });

        MemberTeam memberTeam = MemberTeam.builder()
            .member(member)
            .team(team)
            .joinedAt(LocalDate.now())
            .build();
        
        memberTeamRepository.save(memberTeam);
    }

    @Transactional
    public void removeMemberFromTeam(Long memberId, Long teamId) {
        MemberTeam memberTeam = memberTeamRepository.findByMember_IdAndTeam_Id(memberId, teamId)
            .orElseThrow(() -> new NotFoundException("멤버-팀 관계를 찾을 수 없습니다."));
        
        memberTeamRepository.delete(memberTeam);
    }

    public List<TeamDto> getTeamsForMember(Long memberId) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));
        
        return member.getMemberTeams().stream()
            .map(MemberTeam::getTeam)
            .map(TeamDto::from)
            .collect(Collectors.toList());
    }

    public MemberDto getMemberByUsername(String username) {
        User user = userRepository.findWithMemberAndCellByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. username: " + username));
        if (user.getMember() == null) {
            throw new NotFoundException("사용자에게 연결된 멤버 정보가 없습니다. username: " + username);
        }
        return MemberDto.from(user.getMember());
    }

    @Transactional
    public MemberDto updateMyProfile(String username, UpdateMyProfileRequest request) {
        User user = userRepository.findWithMemberAndCellByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. username: " + username));
        Member member = user.getMember();
        if (member == null) {
            throw new NotFoundException("사용자에게 연결된 멤버 정보가 없습니다. username: " + username);
        }

        if (request.phone() != null) member.setPhone(request.phone());
        if (request.email() != null) member.setEmail(request.email());
        if (request.address() != null) member.setAddress(request.address());
        if (request.note() != null) member.setNote(request.note());

        return MemberDto.from(member);
    }

    @Transactional
    public void changePassword(String username, ChangePasswordRequest request) {
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. username: " + username));

        if (!passwordEncoder.matches(request.oldPassword(), user.getPassword())) {
            throw new IllegalArgumentException("기존 비밀번호가 일치하지 않습니다.");
        }

        user.setPassword(passwordEncoder.encode(request.newPassword()));
    }

    public boolean verifyPassword(String username, String rawPassword) {
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. username: " + username));

        return passwordEncoder.matches(rawPassword, user.getPassword());
    }

    @Transactional
    public String resetPassword(Long memberId) {
        Member member = memberRepository.findById(memberId)
            .orElseThrow(() -> new NotFoundException("멤버를 찾을 수 없습니다. ID: " + memberId));

        User user = member.getUser();
        if (user == null) {
            throw new IllegalStateException("해당 멤버에 연결된 사용자 계정이 없습니다. ID: " + memberId);
        }

        String temporaryPassword = generateTemporaryPassword();
        user.setPassword(passwordEncoder.encode(temporaryPassword));

        // The user entity is managed, so changes will be flushed automatically
        // by the @Transactional annotation at the end of the method.

        return temporaryPassword;
    }

    private String generateTemporaryPassword() {
        // Generate a random 6-digit number
        int number = (int) (Math.random() * 900000) + 100000;
        return "sdc!" + number;
    }
}
