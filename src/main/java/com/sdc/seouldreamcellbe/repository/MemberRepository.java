package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param; // Add this import
import org.springframework.stereotype.Repository;

import java.util.List; // NEW
import java.util.Optional; // NEW

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>, JpaSpecificationExecutor<Member> {

    @Query("SELECT m FROM Member m LEFT JOIN FETCH m.user")
    List<Member> findAllWithUser();

    @Query("SELECT m FROM Member m LEFT JOIN FETCH m.user WHERE m.id = :id")
    Optional<Member> findByIdWithUser(Long id);

    @Query("SELECT m FROM Member m LEFT JOIN FETCH m.cell WHERE m.id = :id")
    Optional<Member> findWithCellById(@Param("id") Long id);

    @Query("SELECT m FROM Member m WHERE FUNCTION('MONTH', m.birthDate) = :month AND FUNCTION('DAY', m.birthDate) = :day AND m.active = true")
    List<Member> findByBirthMonthAndDay(@Param("month") int month, @Param("day") int day);

    @Query("SELECT m FROM Member m WHERE m.active = true AND FUNCTION('MONTH', m.birthDate) = :month")
    List<Member> findByBirthdayInMonth(@Param("month") int month);

    @Query("SELECT m FROM Member m WHERE m.active = true AND FUNCTION('MONTH', m.birthDate) = :month AND FUNCTION('DAY', m.birthDate) BETWEEN :startDay AND :endDay")
    List<Member> findByBirthdayInSameMonth(@Param("month") int month, @Param("startDay") int startDay, @Param("endDay") int endDay);

    @Query("SELECT m FROM Member m WHERE m.active = true AND " +
        "( (FUNCTION('MONTH', m.birthDate) = :startMonth AND FUNCTION('DAY', m.birthDate) >= :startDay) OR " +
        "  (FUNCTION('MONTH', m.birthDate) = :endMonth AND FUNCTION('DAY', m.birthDate) <= :endDay) )")
    List<Member> findByBirthdayInWrappingMonth(@Param("startMonth") int startMonth, @Param("startDay") int startDay, @Param("endMonth") int endMonth, @Param("endDay") int endDay);


    // --- Cell-specific birthday queries ---

    @Query("SELECT m FROM Member m WHERE m.cell.id = :cellId AND FUNCTION('MONTH', m.birthDate) = :month AND FUNCTION('DAY', m.birthDate) = :day AND m.active = true")
    List<Member> findByCell_IdAndBirthMonthAndDay(@Param("cellId") Long cellId, @Param("month") int month, @Param("day") int day);

    @Query("SELECT m FROM Member m WHERE m.cell.id = :cellId AND m.active = true AND FUNCTION('MONTH', m.birthDate) = :month")
    List<Member> findByCell_IdAndBirthdayInMonth(@Param("cellId") Long cellId, @Param("month") int month);

    @Query("SELECT m FROM Member m WHERE m.cell.id = :cellId AND m.active = true AND FUNCTION('MONTH', m.birthDate) = :month AND FUNCTION('DAY', m.birthDate) BETWEEN :startDay AND :endDay")
    List<Member> findByCell_IdAndBirthdayInSameMonth(@Param("cellId") Long cellId, @Param("month") int month, @Param("startDay") int startDay, @Param("endDay") int endDay);

    @Query("SELECT m FROM Member m WHERE m.cell.id = :cellId AND m.active = true AND " +
        "( (FUNCTION('MONTH', m.birthDate) = :startMonth AND FUNCTION('DAY', m.birthDate) >= :startDay) OR " +
        "  (FUNCTION('MONTH', m.birthDate) = :endMonth AND FUNCTION('DAY', m.birthDate) <= :endDay) )")
    List<Member> findByCell_IdAndBirthdayInWrappingMonth(@Param("cellId") Long cellId, @Param("startMonth") int startMonth, @Param("startDay") int startDay, @Param("endMonth") int endMonth, @Param("endDay") int endDay);


    long countByCell_IdAndActive(Long cellId, boolean active);

    List<Member> findByCell_IdAndActive(Long cellId, boolean active);

    @Query("SELECT COUNT(m) FROM Member m WHERE m.active = :active")
    long countByActive(@Param("active") Boolean active);

    List<Member> findByActive(boolean active);

    List<Member> findAllByRoleAndActive(com.sdc.seouldreamcellbe.domain.common.Role role, boolean active);

    long countByRoleAndActive(com.sdc.seouldreamcellbe.domain.common.Role role, boolean active);

    @Query("SELECT DISTINCT m.joinYear FROM Member m WHERE m.joinYear IS NOT NULL ORDER BY m.joinYear DESC")
    List<Integer> findDistinctJoinYears();

    Optional<Member> findByEmail(String email);

    long countByName(String name);

    long countByCreatedAtBetween(java.time.LocalDateTime start, java.time.LocalDateTime end);

    @Query("SELECT COUNT(m) FROM Member m WHERE m.cell IS NULL AND m.active = true AND m.role != com.sdc.seouldreamcellbe.domain.common.Role.EXECUTIVE")
    long countByCellIsNullAndActiveTrue();

    long countByCellIsNotNullAndActive(boolean active);

    long countByBirthDateBetweenAndActive(java.time.LocalDate start, java.time.LocalDate end, boolean active);

    @Query("SELECT FUNCTION('YEAR', m.birthDate) as year, m.gender, COUNT(m) " +
           "FROM Member m " +
           "WHERE m.active = true AND m.birthDate IS NOT NULL " +
           "GROUP BY FUNCTION('YEAR', m.birthDate), m.gender " +
           "ORDER BY year ASC")
    List<Object[]> findBirthYearDistribution();
}
