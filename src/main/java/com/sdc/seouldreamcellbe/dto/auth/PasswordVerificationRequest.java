package com.sdc.seouldreamcellbe.dto.auth;

import jakarta.validation.constraints.NotBlank;

public record PasswordVerificationRequest(
    @NotBlank
    String password
) {}
