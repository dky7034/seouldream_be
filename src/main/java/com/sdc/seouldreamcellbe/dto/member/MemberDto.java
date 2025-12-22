package com.sdc.seouldreamcellbe.dto.member;

import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import lombok.Builder;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Builder
public record MemberDto(
    Long id,
    String name,
    Gender gender,
    LocalDate birthDate,
    Integer age,
    String phone,
    String email,
    CellInfo cell,
    LocalDate cellAssignmentDate, // ADDED
    Role role,
    Integer joinYear,
    boolean active,
    String address,
    String note,
    String username, // NEW
    LocalDate registeredDate, // Added for frontend convenience (mapped from createdAt)
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    @Builder
    public record CellInfo(
        Long id,
        String name
    ) {}

    public static MemberDto from(Member entity) {
        CellInfo cellInfo = (entity.getCell() != null)
            ? new CellInfo(entity.getCell().getId(), entity.getCell().getName())
            : null;

        String username = (entity.getUser() != null) ? entity.getUser().getUsername() : null; // NEW

        return MemberDto.builder()
            .id(entity.getId())
            .name(entity.getName())
            .gender(entity.getGender())
            .birthDate(entity.getBirthDate())
            .age(entity.getAge())
            .phone(entity.getPhone())
            .email(entity.getEmail())
            .cell(cellInfo)
            .cellAssignmentDate(entity.getCellAssignmentDate()) // ADDED
            .role(entity.getRole())
            .joinYear(entity.getJoinYear())
            .active(entity.getActive())
            .address(entity.getAddress())
            .note(entity.getNote())
            .username(username) // NEW
            .registeredDate(entity.getCreatedAt() != null ? entity.getCreatedAt().toLocalDate() : null)
            .createdAt(entity.getCreatedAt())
            .updatedAt(entity.getUpdatedAt())
            .build();
    }
}
