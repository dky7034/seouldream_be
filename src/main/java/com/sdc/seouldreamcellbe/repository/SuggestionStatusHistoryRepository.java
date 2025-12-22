package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.SuggestionStatusHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SuggestionStatusHistoryRepository extends JpaRepository<SuggestionStatusHistory, Long> {
}
