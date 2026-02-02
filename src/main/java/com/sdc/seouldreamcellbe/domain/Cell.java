package com.sdc.seouldreamcellbe.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Formula;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cells")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cell extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 100, nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "leader_id")
    private Member leader;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vice_leader_id")
    private Member viceLeader;

    @Lob
    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    @Builder.Default
    private Boolean active = true;

    @Formula("(SELECT count(*) FROM members m WHERE m.cell_id = id AND m.active = true)")
    private int memberCount;

    @Formula("(SELECT count(*) FROM members m WHERE m.cell_id = id AND m.gender = 'MALE' AND m.active = true)")
    private int maleCount;

    @Formula("(SELECT count(*) FROM members m WHERE m.cell_id = id AND m.gender = 'FEMALE' AND m.active = true)")
    private int femaleCount;

    @OneToMany(mappedBy = "cell", cascade = CascadeType.ALL)
    @JsonManagedReference
    @Builder.Default
    private List<Member> members = new ArrayList<>();
}
