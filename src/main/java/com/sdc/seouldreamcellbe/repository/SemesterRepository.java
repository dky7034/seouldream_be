package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Semester;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SemesterRepository extends JpaRepository<Semester, Long> {
    List<Semester> findByIsActive(boolean isActive);
}
