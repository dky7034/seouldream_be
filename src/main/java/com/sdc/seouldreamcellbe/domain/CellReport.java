package com.sdc.seouldreamcellbe.domain;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "cell_reports", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"cell_id", "meeting_date"})
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CellReport extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cell_id", nullable = false)
    private Cell cell;

    @Column(name = "meeting_date", nullable = false)
    private LocalDate meetingDate;

    @Lob
    @Column(name = "cell_share", nullable = false, columnDefinition = "TEXT")
    private String cellShare;

    @Lob
    @Column(name = "special_notes", columnDefinition = "TEXT")
    private String specialNotes; // '메모'를 제외하고 필수라고 했으므로, 특이사항은 nullable로 둡니다.

}
