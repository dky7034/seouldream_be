package com.sdc.seouldreamcellbe.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.sdc.seouldreamcellbe.domain.common.SuggestionStatus;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Table(name = "suggestion_status_history")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class SuggestionStatusHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "suggestion_id", nullable = false)
    @JsonBackReference
    private Suggestion suggestion;

    @Enumerated(EnumType.STRING)
    private SuggestionStatus fromStatus;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private SuggestionStatus toStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "changed_by", nullable = false)
    @JsonBackReference
    private User changedBy;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime changedAt;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String note;
}
