package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.dto.auth.TokenRefreshResponse;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import com.sdc.seouldreamcellbe.security.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final JwtTokenProvider tokenProvider;

    @Transactional
    public void saveRefreshToken(String username, String refreshToken) {
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다: " + username));
        user.setRefreshToken(refreshToken);
        userRepository.save(user);
    }

    @Transactional
    public TokenRefreshResponse refreshAccessToken(String refreshToken) {
        if (!tokenProvider.validateToken(refreshToken)) {
            throw new IllegalArgumentException("유효하지 않은 리프레시 토큰입니다.");
        }

        String username = tokenProvider.getUsernameFromToken(refreshToken);
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다: " + username));
        
        if (!refreshToken.equals(user.getRefreshToken())) {
            throw new IllegalArgumentException("리프레시 토큰이 일치하지 않습니다.");
        }

        // Create a new Authentication object to generate a new access token
        org.springframework.security.core.Authentication authentication = 
            new org.springframework.security.authentication.UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());

        String newAccessToken = tokenProvider.generateAccessToken(authentication);
        // Refresh Token Rotation: Always extend session for active users (use long expiration)
        String newRefreshToken = tokenProvider.generateRefreshToken(authentication, true);
        
        user.setRefreshToken(newRefreshToken);

        return new TokenRefreshResponse(newAccessToken, newRefreshToken);
    }

    @Transactional
    public void logout(String username) {
        User user = userRepository.findByUsername(username)
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다: " + username));
        user.setRefreshToken(null);
    }

    @Transactional(readOnly = true)
    public boolean isUsernameAvailable(String username) {
        return !userRepository.existsByUsername(username);
    }
}
