package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);

    @EntityGraph(attributePaths = {"member", "member.cell"})
    Optional<User> findWithMemberAndCellByUsername(String username);

    boolean existsByUsername(String username);
}
