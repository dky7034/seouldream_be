package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface PrayerRepository extends JpaRepository<Prayer, Long>, JpaSpecificationExecutor<Prayer>, PrayerRepositoryCustom {
    List<Prayer> findByMember_Id(Long memberId);
    List<Prayer> findByCreatedBy_Id(Long createdById);
    List<Prayer> findByMember_Cell_Id(Long cellId);

    List<Prayer> findByMember_IdInAndMeetingDateBetween(List<Long> memberIds, LocalDate start, LocalDate end);

    Optional<Prayer> findByMember_IdAndMeetingDate(Long memberId, LocalDate meetingDate);

    // For EXECUTIVE dashboard
    @Query("SELECT p FROM Prayer p WHERE p.meetingDate >= :yearStartDate ORDER BY p.meetingDate DESC")
    List<Prayer> findTop5RecentForExecutive(@Param("yearStartDate") LocalDate yearStartDate, Pageable pageable);


    // For CELL_LEADER dashboard
    @Query("SELECT p FROM Prayer p " +
           "WHERE p.meetingDate >= :yearStartDate AND ( " +
           "   p.visibility = com.sdc.seouldreamcellbe.domain.common.PrayerVisibility.ALL " +
           "   OR (p.member.cell.id = :cellId AND p.visibility = com.sdc.seouldreamcellbe.domain.common.PrayerVisibility.CELL) " +
           ") ORDER BY p.meetingDate DESC")
    List<Prayer> findTop5RecentForCellLeader(@Param("cellId") Long cellId, @Param("yearStartDate") LocalDate yearStartDate, Pageable pageable);

    @Query("SELECT DISTINCT YEAR(p.meetingDate) FROM Prayer p ORDER BY YEAR(p.meetingDate) DESC")
    List<Integer> findDistinctYearsForExecutive();

    @Query("SELECT DISTINCT YEAR(p.meetingDate) FROM Prayer p " +
           "WHERE p.visibility = :vis_all " +
           "   OR (p.member.cell.id = :cellId AND p.visibility = :vis_cell) " +
           "ORDER BY YEAR(p.meetingDate) DESC")
    List<Integer> findDistinctYearsForCellLeader(@Param("cellId") Long cellId, @Param("vis_all") PrayerVisibility vis_all, @Param("vis_cell") PrayerVisibility vis_cell);

    @Query("SELECT DISTINCT YEAR(p.meetingDate) FROM Prayer p " +
           "WHERE p.visibility = :vis_all " +
           "   OR (p.member.cell.id = :cellId AND p.visibility = :vis_cell) " +
           "   OR (p.createdBy.id = :userId AND p.visibility = :vis_me) " +
           "ORDER BY YEAR(p.meetingDate) DESC")
    List<Integer> findDistinctYearsForMember(@Param("cellId") Long cellId, @Param("userId") Long userId, @Param("vis_all") PrayerVisibility vis_all, @Param("vis_cell") PrayerVisibility vis_cell, @Param("vis_me") PrayerVisibility vis_me);

    Long countByMeetingDateBetween(LocalDate start, LocalDate end);

    @Query("SELECT count(p) FROM Prayer p " +
        "WHERE p.meetingDate >= :start AND p.meetingDate <= :end AND ( " +
        "   p.visibility = com.sdc.seouldreamcellbe.domain.common.PrayerVisibility.ALL " +
        "   OR (p.member.cell.id = :cellId AND p.visibility = com.sdc.seouldreamcellbe.domain.common.PrayerVisibility.CELL) " +
        ")")
    Long countForCellLeaderByMeetingDateBetween(@Param("cellId") Long cellId, @Param("start") LocalDate start, @Param("end") LocalDate end);
}
