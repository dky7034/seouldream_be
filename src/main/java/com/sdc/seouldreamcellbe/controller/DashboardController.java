package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.dashboard.DashboardDto;
import com.sdc.seouldreamcellbe.service.DashboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/dashboard")
@RequiredArgsConstructor
public class DashboardController {

    private final DashboardService dashboardService;

    @GetMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<DashboardDto> getDashboard(
        @AuthenticationPrincipal UserDetails userDetails,
        @RequestParam(required = false, defaultValue = "3m") String period) {
        DashboardDto dashboardDto = dashboardService.getDashboard(userDetails.getUsername(), period);
        return ResponseEntity.ok(dashboardDto);
    }
}
