package com.sdc.seouldreamcellbe.dto.auth;

import jakarta.validation.constraints.NotBlank;

public record TokenRefreshRequest(
    @NotBlank String refreshToken
) {
}
