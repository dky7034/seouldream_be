package com.sdc.seouldreamcellbe.dto.member;

import jakarta.validation.constraints.Email;
import lombok.Builder;

@Builder
public record UpdateMyProfileRequest(
    String phone,
    @Email String email,
    String address,
    String note
) {
}
