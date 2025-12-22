package com.sdc.seouldreamcellbe.security;

import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.dto.attendance.ProcessAttendanceRequest;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import com.sdc.seouldreamcellbe.repository.PrayerRepository;
import com.sdc.seouldreamcellbe.repository.SuggestionRepository; // NEW
import com.sdc.seouldreamcellbe.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("customSecurityEvaluator") // Bean name for SpEL
@RequiredArgsConstructor
public class CustomSecurityEvaluator {

    private static final Logger logger = LoggerFactory.getLogger(CustomSecurityEvaluator.class);

    private final UserRepository userRepository;
    private final MemberRepository memberRepository;
    private final CellRepository cellRepository;
    private final PrayerRepository prayerRepository;
    private final AttendanceRepository attendanceRepository;
    private final SuggestionRepository suggestionRepository; // NEW

    public boolean isExecutive(Authentication authentication) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        User user = (User) authentication.getPrincipal();
        return user.getRole() == Role.EXECUTIVE;
    }

    public boolean isCellLeader(Authentication authentication) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        User user = (User) authentication.getPrincipal();
        return user.getRole() == Role.CELL_LEADER;
    }

    public boolean isMember(Authentication authentication) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        User user = (User) authentication.getPrincipal();
        return user.getRole() == Role.MEMBER;
    }

    // Checks if the authenticated user is the target member
    public boolean isTargetMember(Authentication authentication, Long targetMemberId) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        User authenticatedUser = (User) authentication.getPrincipal();
        return authenticatedUser.getMember() != null && authenticatedUser.getMember().getId().equals(targetMemberId);
    }

    // Checks if the authenticated user (as CELL_LEADER) leads the cell that targetMemberId belongs to
    public boolean isCellLeaderOfTargetMember(Authentication authentication, Long targetMemberId) {
        if (!isCellLeader(authentication)) {
            return false;
        }
        User leaderUser = (User) authentication.getPrincipal();
        if (leaderUser.getMember() == null || leaderUser.getMember().getCell() == null) {
            return false; // Leader must belong to a cell
        }
        Long leaderCellId = leaderUser.getMember().getCell().getId();

        return memberRepository.findById(targetMemberId)
                .map(member -> member.getCell() != null && member.getCell().getId().equals(leaderCellId))
                .orElse(false);
    }

    // Checks if the authenticated user is the target member or a cell leader of the target member
    public boolean isTargetMemberOwnerOrCellLeader(Authentication authentication, Long targetMemberId) {
        return isTargetMember(authentication, targetMemberId) || isCellLeaderOfTargetMember(authentication, targetMemberId);
    }

    // Can create prayer for targetMemberId
    public boolean canCreatePrayer(Authentication authentication, Long targetMemberId) {
        return isExecutive(authentication) || isTargetMemberOwnerOrCellLeader(authentication, targetMemberId);
    }

    // Can manage (update/delete) prayer with prayerId
    public boolean canManagePrayer(Authentication authentication, Long prayerId) {
        return prayerRepository.findById(prayerId)
                .map(prayer -> {
                    Long prayerForMemberId = prayer.getMember().getId();
                    return isExecutive(authentication) || isTargetMemberOwnerOrCellLeader(authentication, prayerForMemberId);
                })
                .orElse(false);
    }

    // Can process attendance for a list of requests
    public boolean canProcessAttendanceForMembers(Authentication authentication, List<ProcessAttendanceRequest> requests) {
        if (isExecutive(authentication)) {
            return true;
        }

        if (isCellLeader(authentication)) {
            User leaderUser = (User) authentication.getPrincipal();
            if (leaderUser.getMember() == null || leaderUser.getMember().getCell() == null) {
                logger.warn("SecurityCheck: Cell leader '{}' has no associated member or cell.", leaderUser.getUsername());
                return false; // Leader must belong to a cell
            }
            Long leaderCellId = leaderUser.getMember().getCell().getId();

            for (ProcessAttendanceRequest request : requests) {
                boolean isMemberInCell = memberRepository.findWithCellById(request.memberId())
                        .map(member -> {
                            if (member.getCell() != null && member.getCell().getId().equals(leaderCellId)) {
                                return true;
                            } else {
                                logger.warn("SecurityCheck FAIL: Cell leader '{}' (Cell ID: {}) attempted to process attendance for member '{}' who belongs to a different cell (Cell ID: {}).",
                                        leaderUser.getUsername(),
                                        leaderCellId,
                                        request.memberId(),
                                        member.getCell() != null ? member.getCell().getId() : "null");
                                return false;
                            }
                        })
                        .orElseGet(() -> {
                            logger.warn("SecurityCheck FAIL: Cell leader '{}' (Cell ID: {}) attempted to process attendance for a non-existent member (Member ID: {}).",
                                    leaderUser.getUsername(), leaderCellId, request.memberId());
                            return false;
                        });

                if (!isMemberInCell) {
                    return false; // If any member is not in the cell, deny permission.
                }
            }
            return true;
        }

        return false;
    }

    // Can manage (delete) attendance for a specific attendanceId
    public boolean canManageAttendance(Authentication authentication, Long attendanceId) {
        if (isExecutive(authentication)) {
            return true;
        }

        if (isCellLeader(authentication)) {
            User leaderUser = (User) authentication.getPrincipal();
            if (leaderUser.getMember() == null || leaderUser.getMember().getCell() == null) {
                return false; // Leader must belong to a cell
            }
            Long leaderCellId = leaderUser.getMember().getCell().getId();

            // Use findWithMemberAndCellById to prevent LazyInitializationException
            return attendanceRepository.findWithMemberAndCellById(attendanceId)
                    .map(attendance -> attendance.getMember() != null && attendance.getMember().getCell() != null && attendance.getMember().getCell().getId().equals(leaderCellId))
                    .orElse(false);
        }

        return false;
    }

    // NEW METHODS FOR SUGGESTIONS

    // Checks if the authenticated user can create a suggestion for the given cellId
    public boolean canCreateSuggestion(Authentication authentication, Long requestCellId) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        if (isExecutive(authentication)) {
            return true; // Executive can create for any cell
        }

        if (isCellLeader(authentication) || isMember(authentication)) {
            User authenticatedUser = (User) authentication.getPrincipal();
            // User must have a member associated, and that member must have a cell
            if (authenticatedUser.getMember() == null || authenticatedUser.getMember().getCell() == null) {
                return false;
            }
            // User can only create for their own cell
            return authenticatedUser.getMember().getCell().getId().equals(requestCellId);
        }

        return false; // Only EXECUTIVE, CELL_LEADER, MEMBER can create (with checks)
    }

    // Checks if the authenticated user can update a suggestion
    public boolean canUpdateSuggestion(Authentication authentication, Long suggestionId) {
        if (isExecutive(authentication)) {
            return true; // Executive can update any suggestion
        }

        if (isCellLeader(authentication)) {
            User leaderUser = (User) authentication.getPrincipal();
            if (leaderUser.getMember() == null || leaderUser.getMember().getCell() == null) {
                return false; // Leader must belong to a cell
            }
            Long leaderCellId = leaderUser.getMember().getCell().getId();

            // Check if the suggestion belongs to the leader's cell
            return suggestionRepository.findById(suggestionId)
                    .map(suggestion -> suggestion.getCell() != null && suggestion.getCell().getId().equals(leaderCellId))
                    .orElse(false);
        }

        return false; // Only EXECUTIVE or CELL_LEADER can update suggestions
    }

    // Checks if the authenticated user is the creator of the suggestion
    public boolean isSuggestionCreator(Authentication authentication, Long suggestionId) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        User authenticatedUser = (User) authentication.getPrincipal();
        return suggestionRepository.findById(suggestionId)
                .map(suggestion -> suggestion.getCreatedBy() != null && authenticatedUser.getId().equals(suggestion.getCreatedBy().getId()))
                .orElse(false);
    }

    // Checks if the authenticated user can delete a suggestion
    public boolean canDeleteSuggestion(Authentication authentication, Long suggestionId) {
        return isExecutive(authentication) || isSuggestionCreator(authentication, suggestionId);
    }

    // NEW
    // Checks if the authenticated user can read a specific suggestion
    public boolean canReadSuggestion(Authentication authentication, Long suggestionId) {
        return isExecutive(authentication) || isSuggestionCreator(authentication, suggestionId);
    }

    // NEW
    // Checks if the authenticated user is a CELL_LEADER and leads the given cellId
    public boolean isCellLeaderOfCell(Authentication authentication, Long cellId) {
        if (!isCellLeader(authentication)) {
            return false;
        }
        User leaderUser = (User) authentication.getPrincipal();
        // Leader must belong to a cell and that cell's ID must match the given cellId
        return leaderUser.getMember() != null && leaderUser.getMember().getCell() != null && leaderUser.getMember().getCell().getId().equals(cellId);
    }

    // NEW
    // Checks if the authenticated user can view the attendance summary of a specific member
    public boolean canViewMemberAttendanceSummary(Authentication authentication, Long targetMemberId) {
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            return false;
        }
        User authenticatedUser = (User) authentication.getPrincipal();

        // Executives can view any member's attendance
        if (authenticatedUser.getRole() == Role.EXECUTIVE) {
            return true;
        }

        // Cell Leaders can view members in their own cell
        if (authenticatedUser.getRole() == Role.CELL_LEADER) {
            return isCellLeaderOfTargetMember(authentication, targetMemberId);
        }

        // Members can view only their own attendance
        if (authenticatedUser.getRole() == Role.MEMBER) {
            return isTargetMember(authentication, targetMemberId);
        }

        return false;
    }
}
