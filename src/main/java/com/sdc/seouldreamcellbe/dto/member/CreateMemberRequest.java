package com.sdc.seouldreamcellbe.dto.member;

import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record CreateMemberRequest(
    // Member fields
    @NotBlank String name,
    @NotNull Gender gender,
    @NotNull LocalDate birthDate,
    @NotBlank String phone,
    @Email String email,
    Long cellId, // ID for the cell to associate with
    @NotNull Role role,
    @NotNull Integer joinYear,
    String address,
    String note,

    // User fields
    @NotBlank @Size(min = 1, max = 50) String username,
    @NotBlank @Size(min = 6, max = 100) String password
) {
}
