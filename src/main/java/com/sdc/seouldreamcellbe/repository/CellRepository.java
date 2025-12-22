package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Cell;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface CellRepository extends JpaRepository<Cell, Long>, JpaSpecificationExecutor<Cell> {
    List<Cell> findByActive(boolean active);

    @Query("SELECT c FROM Cell c LEFT JOIN FETCH c.leader LEFT JOIN FETCH c.members WHERE c.active = true")
    List<Cell> findAllActiveWithLeaderAndMembers();

    @Query("SELECT c FROM Cell c JOIN FETCH c.leader WHERE c.active = true AND c.leader IS NOT NULL AND " +
           "(SELECT COUNT(m) FROM Member m WHERE m.cell = c AND m.active = true " +
           " AND (m.cellAssignmentDate IS NULL OR m.cellAssignmentDate <= :date)) > " + // Modified
           "(SELECT COUNT(a) FROM Attendance a WHERE a.member.cell = c AND a.date = :date)")
    List<Cell> findIncompleteCellsForDate(@Param("date") LocalDate date);
}
