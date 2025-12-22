package com.sdc.seouldreamcellbe.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Table(name = "audit_logs")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EntityListeners(AuditingEntityListener.class)
public class AuditLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 100, nullable = false)
    private String eventType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "actor_id")
    @JsonBackReference
    private User actor;

    private Long targetId;

    @Column(length = 50)
    private String targetType;

    @Column(length = 45)
    private String ipAddress;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String userAgent;

    @Column(columnDefinition = "json")
    private String metadata;

    @CreatedDate
    @Column(updatable = false)
    private LocalDateTime createdAt;
}
