package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.MemberTeam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MemberTeamRepository extends JpaRepository<MemberTeam, Long> {
    Optional<MemberTeam> findByMember_IdAndTeam_Id(Long memberId, Long teamId);
}
