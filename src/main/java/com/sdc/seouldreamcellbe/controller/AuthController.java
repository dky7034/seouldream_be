package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.domain.User; // NEW
import com.sdc.seouldreamcellbe.dto.auth.JwtAuthenticationResponse;
import com.sdc.seouldreamcellbe.dto.auth.LoginRequest;
import com.sdc.seouldreamcellbe.dto.auth.TokenRefreshRequest;
import com.sdc.seouldreamcellbe.dto.auth.TokenRefreshResponse;
import com.sdc.seouldreamcellbe.security.JwtTokenProvider;
import com.sdc.seouldreamcellbe.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider tokenProvider;
    private final AuthService authService;

    @GetMapping("/check-username")
    public ResponseEntity<Map<String, Boolean>> checkUsername(@RequestParam("username") String username) {
        boolean isAvailable = authService.isUsernameAvailable(username);
        return ResponseEntity.ok(Map.of("isAvailable", isAvailable));
    }

    @PostMapping("/login")
    public ResponseEntity<JwtAuthenticationResponse> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                loginRequest.username(),
                loginRequest.password()
            )
        );

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String accessToken = tokenProvider.generateAccessToken(authentication);
        boolean rememberMe = Boolean.TRUE.equals(loginRequest.rememberMe());
        String refreshToken = tokenProvider.generateRefreshToken(authentication, rememberMe);

        authService.saveRefreshToken(authentication.getName(), refreshToken);

        // Get the User principal to extract userId, role, and other details
        User userPrincipal = (User) authentication.getPrincipal();

        // Safely get member name, cell ID, cell name, and member ID
        String memberName = null;
        Long cellId = null;
        String cellName = null;
        Long memberId = null;
        if (userPrincipal.getMember() != null) {
            memberName = userPrincipal.getMember().getName();
            memberId = userPrincipal.getMember().getId();
            if (userPrincipal.getMember().getCell() != null) {
                cellId = userPrincipal.getMember().getCell().getId();
                cellName = userPrincipal.getMember().getCell().getName();
            }
        }

        return ResponseEntity.ok(new JwtAuthenticationResponse(
            accessToken,
            refreshToken,
            userPrincipal.getId(),
            userPrincipal.getRole().name(),
            memberName,
            cellId,
            cellName,
            memberId
        ));
    }

    @PostMapping("/refresh")
    public ResponseEntity<TokenRefreshResponse> refreshAccessToken(@Valid @RequestBody TokenRefreshRequest request) {
        TokenRefreshResponse response = authService.refreshAccessToken(request.refreshToken());
        return ResponseEntity.ok(response);
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(Authentication authentication) {
        authService.logout(authentication.getName());
        return ResponseEntity.ok("로그아웃 처리되었습니다.");
    }
}
