package com.sdc.seouldreamcellbe.dto.auth;

public record JwtAuthenticationResponse(
    String accessToken,
    String refreshToken,
    String tokenType,
    Long userId,
    String role,
    String name,
    Long cellId,
    String cellName, // Added cellName
    Long memberId
) {
    public JwtAuthenticationResponse(String accessToken, String refreshToken) {
        this(accessToken, refreshToken, "Bearer", null, null, null, null, null, null);
    }

    public JwtAuthenticationResponse(String accessToken, String refreshToken, Long userId, String role, String name, Long cellId, String cellName, Long memberId) {
        this(accessToken, refreshToken, "Bearer", userId, role, name, cellId, cellName, memberId);
    }
}
