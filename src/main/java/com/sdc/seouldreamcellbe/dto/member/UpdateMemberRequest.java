package com.sdc.seouldreamcellbe.dto.member;

import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import jakarta.validation.constraints.Email;
import lombok.Builder;

import java.time.LocalDate;

@Builder
public record UpdateMemberRequest(
    String name,
    Gender gender,
    LocalDate birthDate,
    String phone,
    @Email String email,
    Long cellId,
    Role role,
    Integer joinYear,
    Boolean active,
    String address,
    String note
) {
}
