package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long>, JpaSpecificationExecutor<Attendance> {

    Optional<Attendance> findByMember_IdAndDate(Long memberId, LocalDate date);

    List<Attendance> findByDate(LocalDate date);

    List<Attendance> findByMember_Id(Long memberId);

    List<Attendance> findByMemberIdOrderByDateDesc(Long memberId);

    List<Attendance> findByDateBetween(LocalDate startDate, LocalDate endDate);

    List<Attendance> findByMember_Cell_IdAndDateBetween(Long cellId, LocalDate startDate, LocalDate endDate);

    List<Attendance> findByMember_IdAndDateBetween(Long memberId, LocalDate startDate, LocalDate endDate);

    // Custom methods for fetching with Member and CreatedBy (User) to prevent LazyInitializationException
    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.createdBy LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.user WHERE a.member.id = :memberId AND a.date = :date")
    Optional<Attendance> findByMember_IdAndDateWithMemberAndCreatedBy(Long memberId, LocalDate date);

    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.createdBy LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.user WHERE a.date = :date")
    List<Attendance> findByDateWithMemberAndCreatedBy(LocalDate date);

    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.createdBy LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.user WHERE a.member.id = :memberId")
    List<Attendance> findByMember_IdWithMemberAndCreatedBy(Long memberId);

    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.createdBy LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.user WHERE a.date BETWEEN :startDate AND :endDate")
    List<Attendance> findByDateBetweenWithMemberAndCreatedBy(LocalDate startDate, LocalDate endDate);

    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.createdBy LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.user WHERE a.member.cell.id = :cellId AND a.date BETWEEN :startDate AND :endDate")
    List<Attendance> findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(Long cellId, LocalDate startDate, LocalDate endDate);

    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.createdBy LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.user WHERE a.member.id = :memberId AND a.date BETWEEN :startDate AND :endDate")
    List<Attendance> findByMember_IdAndDateBetweenWithMemberAndCreatedBy(Long memberId, LocalDate startDate, LocalDate endDate);

    @Query("SELECT a FROM Attendance a LEFT JOIN FETCH a.member m LEFT JOIN FETCH m.cell c WHERE a.id = :id")
    Optional<Attendance> findWithMemberAndCellById(@Param("id") Long id);

    // Interface for projection
    public interface DailyAttendanceStats {
        LocalDate getDate();
        Long getTotalRecords();
        Long getPresentRecords();
    }

    @Query("SELECT a.date AS date, " +
        "COUNT(a.id) AS totalRecords, " +
        "SUM(CASE WHEN a.status = com.sdc.seouldreamcellbe.domain.common.AttendanceStatus.PRESENT THEN 1 ELSE 0 END) AS presentRecords " +
        "FROM Attendance a " +
        "WHERE a.date BETWEEN :startDate AND :endDate " +
        "AND (:cellId IS NULL OR a.member.cell.id = :cellId) " +
        "AND (:memberId IS NULL OR a.member.id = :memberId) " +
        "AND (:status IS NULL OR a.status = :status) " +
        "GROUP BY a.date " +
        "ORDER BY a.date ASC")
    List<DailyAttendanceStats> findAttendanceTrend(
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate,
        @Param("cellId") Long cellId,
        @Param("memberId") Long memberId,
        @Param("status") com.sdc.seouldreamcellbe.domain.common.AttendanceStatus status
    );

    @Query("SELECT DISTINCT YEAR(a.date) FROM Attendance a ORDER BY YEAR(a.date) DESC")
    List<Integer> findDistinctYears();

    @Query("SELECT DISTINCT YEAR(a.date) FROM Attendance a WHERE a.member.cell.id = :cellId ORDER BY YEAR(a.date) DESC")
    List<Integer> findDistinctYearsByCellId(@Param("cellId") Long cellId);

    @Query("SELECT a FROM Attendance a JOIN FETCH a.member WHERE a.member.id IN :memberIds ORDER BY a.date DESC")
    List<Attendance> findByMember_IdInOrderByDateDesc(@Param("memberIds") List<Long> memberIds);

    // --- Statistics Queries ---

    @Query("SELECT AVG(dailyCount) FROM (SELECT COUNT(DISTINCT a.member.id) as dailyCount " +
           "FROM Attendance a " +
           "WHERE a.date BETWEEN :startDate AND :endDate " +
           "AND a.status = com.sdc.seouldreamcellbe.domain.common.AttendanceStatus.PRESENT " +
           "AND (:cellId IS NULL OR a.member.cell.id = :cellId) " +
           "GROUP BY a.date) as subquery")
    Double calculateWeeklyAverageAttendance(
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate,
        @Param("cellId") Long cellId
    );

    @Query("SELECT a.member.cell.id as cellId, " +
           "SUM(CASE WHEN a.status = com.sdc.seouldreamcellbe.domain.common.AttendanceStatus.PRESENT THEN 1 ELSE 0 END) as presentCount, " +
           "COUNT(a) as totalCount " +
           "FROM Attendance a " +
           "WHERE a.member.cell.id IN :cellIds " +
           "AND a.date BETWEEN :startDate AND :endDate " +
           "GROUP BY a.member.cell.id")
    List<CellAttendanceStats> findAttendanceStatsByCellIds(
        @Param("cellIds") List<Long> cellIds,
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate
    );

    interface CellAttendanceStats {
        Long getCellId();
        Long getPresentCount();
        Long getTotalCount();
    }

    @Query("SELECT COUNT(m) FROM Member m " +
           "WHERE m.active = true " +
           "AND (:cellId IS NULL OR m.cell.id = :cellId) " +
           "AND m.createdAt <= :endDate " + // Created before the end of the period
           "AND NOT EXISTS (" +
           "  SELECT 1 FROM Attendance a " +
           "  WHERE a.member = m " +
           "  AND a.date BETWEEN :startDate AND :endDate " +
           "  AND a.status = com.sdc.seouldreamcellbe.domain.common.AttendanceStatus.PRESENT" +
           ")")
    long countMembersWithZeroAttendance(
        @Param("startDate") LocalDate startDate,
        @Param("endDate") LocalDate endDate,
        @Param("cellId") Long cellId
    );
}
