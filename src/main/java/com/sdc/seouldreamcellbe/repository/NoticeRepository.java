package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Notice;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long>, JpaSpecificationExecutor<Notice> {

    List<Notice> findAllByTargetOrderByPinnedDescCreatedAtDesc(NoticeTarget target, Pageable pageable);

    @Query("SELECT DISTINCT YEAR(n.createdAt) FROM Notice n ORDER BY YEAR(n.createdAt) DESC")
    List<Integer> findDistinctYears();

    Long countByCreatedAtBetween(LocalDateTime start, LocalDateTime end);
}
