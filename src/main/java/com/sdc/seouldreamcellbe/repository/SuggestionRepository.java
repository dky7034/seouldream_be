package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.domain.Suggestion;
import com.sdc.seouldreamcellbe.domain.common.SuggestionStatus; // Moved import
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface SuggestionRepository extends JpaRepository<Suggestion, Long> {
    long countByStatus(SuggestionStatus status);
    long countByCell_IdAndStatus(Long cellId, SuggestionStatus status);
}
