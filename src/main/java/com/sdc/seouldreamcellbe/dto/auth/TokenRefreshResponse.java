package com.sdc.seouldreamcellbe.dto.auth;

public record TokenRefreshResponse(
    String accessToken,
    String refreshToken,
    String tokenType
) {
    public TokenRefreshResponse(String accessToken, String refreshToken) {
        this(accessToken, refreshToken, "Bearer");
    }
}
