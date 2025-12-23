package com.sdc.seouldreamcellbe.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "prayers")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SQLDelete(sql = "UPDATE prayers SET is_deleted = true, deleted_at = CURRENT_TIMESTAMP WHERE id = ?")
@Where(clause = "is_deleted = false")
public class Prayer extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    @JsonBackReference
    private Member member;

    @Column(nullable = false)
    private LocalDate meetingDate;

    @Lob
    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    private Integer weekOfMonth;


    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    private PrayerVisibility visibility = PrayerVisibility.CELL;

    @Column(nullable = false)
    @Builder.Default
    private boolean isDeleted = false;

    private LocalDateTime deletedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by")
    @JsonBackReference
    private User createdBy;
}
