package com.sdc.seouldreamcellbe.dto.auth;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record ChangePasswordRequest(
    @NotBlank
    String oldPassword,

    @NotBlank
    @Size(min = 6, max = 100, message = "새 비밀번호는 6자 이상 100자 이하이어야 합니다.")
    String newPassword
) {
}
