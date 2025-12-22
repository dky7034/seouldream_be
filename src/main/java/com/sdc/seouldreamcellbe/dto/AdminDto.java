package com.sdc.seouldreamcellbe.dto;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

public class AdminDto {

    @Getter
    @RequiredArgsConstructor
    public static class PasswordResetResponse {
        private final String temporaryPassword;
    }
}
