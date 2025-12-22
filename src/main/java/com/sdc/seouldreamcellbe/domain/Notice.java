package com.sdc.seouldreamcellbe.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import java.time.LocalDateTime;

@Entity
@Table(name = "notices")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SQLDelete(sql = "UPDATE notices SET is_deleted = true, deleted_at = CURRENT_TIMESTAMP WHERE id = ?")
@Where(clause = "is_deleted = false")
public class Notice extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 200, nullable = false)
    private String title;

    @Lob
    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private NoticeTarget target;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_cell_id")
    private Cell targetCell;

    @Column(nullable = false)
    @Builder.Default
    private boolean pinned = false;

    private LocalDateTime publishAt;

    private LocalDateTime expireAt;

    @Column(nullable = false)
    @Builder.Default
    private boolean isDeleted = false;

    private LocalDateTime deletedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by", nullable = false)
    @JsonBackReference
    private User createdBy;
}
