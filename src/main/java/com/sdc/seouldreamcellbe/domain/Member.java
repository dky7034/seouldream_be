package com.sdc.seouldreamcellbe.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "members")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Setter
    @Column(length = 100, nullable = false)
    private String name;

    @Setter
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Gender gender;

    @Setter
    @Column(nullable = false)
    private LocalDate birthDate;

//    @Generated(GenerationTime.ALWAYS)
//    @Column(insertable = false, updatable = false)
//    private Integer age;

    // 나이 계산
    @Transient
    public Integer getAge() {
        if (birthDate == null) return null;
        return java.time.Period.between(birthDate, LocalDate.now()).getYears();
    }

    @Setter
    @Column(length = 20)
    private String phone;

    @Setter
    @Column(length = 100, nullable = true)
    private String email;

    @Setter
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cell_id")
    @JsonBackReference
    private Cell cell;

    @Setter
    private LocalDate cellAssignmentDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    private Role role = Role.MEMBER;

    @Setter
    private Integer joinYear;

    @Setter
    @Column(nullable = false)
    @Builder.Default
    private Boolean active = true;

    @Setter
    @Lob
    @Column(columnDefinition = "TEXT")
    private String address;

    @Setter
    @Lob
    @Column(columnDefinition = "TEXT")
    private String note;

    @Setter
    @OneToOne(mappedBy = "member", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private User user;

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    @Builder.Default
    private List<MemberTeam> memberTeams = new ArrayList<>();

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    @Builder.Default
    private List<Attendance> attendances = new ArrayList<>();

    @OneToMany(mappedBy = "member", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    @Builder.Default
    private List<Prayer> prayers = new ArrayList<>();

    // Custom setter to synchronize role with User entity
    public void setRole(Role role) {
        this.role = role;
        if (this.user != null) {
            this.user.setRole(role);
        }
    }
}
