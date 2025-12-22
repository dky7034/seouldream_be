package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.semester.CreateSemesterRequest;
import com.sdc.seouldreamcellbe.dto.semester.SemesterDto;
import com.sdc.seouldreamcellbe.dto.semester.UpdateSemesterRequest;
import com.sdc.seouldreamcellbe.service.SemesterService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/semesters")
@RequiredArgsConstructor
public class SemesterController {

    private final SemesterService semesterService;

    @PostMapping
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<SemesterDto> createSemester(@Valid @RequestBody CreateSemesterRequest request) {
        SemesterDto createdSemester = semesterService.createSemester(request);
        return new ResponseEntity<>(createdSemester, HttpStatus.CREATED);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('EXECUTIVE', 'CELL_LEADER')")
    public ResponseEntity<SemesterDto> getSemesterById(@PathVariable Long id) {
        SemesterDto semester = semesterService.getSemesterById(id);
        return ResponseEntity.ok(semester);
    }

    @GetMapping
    @PreAuthorize("hasAnyRole('EXECUTIVE', 'CELL_LEADER')")
    public ResponseEntity<List<SemesterDto>> getAllSemesters(@RequestParam(required = false) Boolean isActive) {
        List<SemesterDto> semesters = semesterService.getAllSemesters(isActive);
        return ResponseEntity.ok(semesters);
    }

    @PatchMapping("/{id}")
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<SemesterDto> updateSemester(@PathVariable Long id, @Valid @RequestBody UpdateSemesterRequest request) {
        SemesterDto updatedSemester = semesterService.updateSemester(id, request);
        return ResponseEntity.ok(updatedSemester);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('EXECUTIVE')")
    public ResponseEntity<Void> deleteSemester(@PathVariable Long id) {
        semesterService.deleteSemester(id);
        return ResponseEntity.noContent().build();
    }
}
