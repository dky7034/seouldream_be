package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.auth.ChangePasswordRequest;
import com.sdc.seouldreamcellbe.dto.auth.PasswordVerificationRequest;
import com.sdc.seouldreamcellbe.dto.member.MemberDto;
import com.sdc.seouldreamcellbe.dto.member.UpdateMyProfileRequest;
import com.sdc.seouldreamcellbe.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/me")
@RequiredArgsConstructor
public class ProfileController {

    private final MemberService memberService;

    @GetMapping("/profile")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<MemberDto> getMyProfile(@AuthenticationPrincipal UserDetails userDetails) {
        MemberDto memberDto = memberService.getMemberByUsername(userDetails.getUsername());
        return ResponseEntity.ok(memberDto);
    }

    @PutMapping("/profile")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<MemberDto> updateMyProfile(
        @AuthenticationPrincipal UserDetails userDetails,
        @Valid @RequestBody UpdateMyProfileRequest request) {
        MemberDto updatedMember = memberService.updateMyProfile(userDetails.getUsername(), request);
        return ResponseEntity.ok(updatedMember);
    }

    @PutMapping("/password")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> changeMyPassword(
        @AuthenticationPrincipal UserDetails userDetails,
        @Valid @RequestBody ChangePasswordRequest request) {
        memberService.changePassword(userDetails.getUsername(), request);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/verify-password")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Map<String, Boolean>> verifyCurrentPassword(
        @AuthenticationPrincipal UserDetails userDetails,
        @Valid @RequestBody PasswordVerificationRequest request) {
        boolean isValid = memberService.verifyPassword(userDetails.getUsername(), request.password());
        return ResponseEntity.ok(Map.of("isValid", isValid));
    }
}
