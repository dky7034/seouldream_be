package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.suggestion.CreateSuggestionRequest;
import com.sdc.seouldreamcellbe.dto.suggestion.SuggestionDto;
import com.sdc.seouldreamcellbe.dto.suggestion.UpdateSuggestionRequest;
import com.sdc.seouldreamcellbe.service.SuggestionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize; // NEW
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/suggestions")
@RequiredArgsConstructor
public class SuggestionController {

    private final SuggestionService suggestionService;

    @PreAuthorize("@customSecurityEvaluator.canCreateSuggestion(authentication, #request.cellId)")
    @PostMapping
    public ResponseEntity<SuggestionDto> createSuggestion(@Valid @RequestBody CreateSuggestionRequest request) {
        SuggestionDto createdSuggestion = suggestionService.createSuggestion(request);
        return new ResponseEntity<>(createdSuggestion, HttpStatus.CREATED);
    }

    @PreAuthorize("@customSecurityEvaluator.canReadSuggestion(authentication, #id)")
    @GetMapping("/{id}")
    public ResponseEntity<SuggestionDto> getSuggestionById(@PathVariable("id") Long id) {
        SuggestionDto suggestion = suggestionService.getSuggestionById(id);
        return ResponseEntity.ok(suggestion);
    }

    @PreAuthorize("hasRole('EXECUTIVE')") // Only Executive can view all suggestions
    @GetMapping
    public ResponseEntity<List<SuggestionDto>> getAllSuggestions() {
        List<SuggestionDto> suggestions = suggestionService.getAllSuggestions();
        return ResponseEntity.ok(suggestions);
    }

    @PreAuthorize("@customSecurityEvaluator.canUpdateSuggestion(authentication, #id)")
    @PatchMapping("/{id}")
    public ResponseEntity<SuggestionDto> updateSuggestion(@PathVariable("id") Long id, @Valid @RequestBody UpdateSuggestionRequest request) {
        SuggestionDto updatedSuggestion = suggestionService.updateSuggestion(id, request);
        return ResponseEntity.ok(updatedSuggestion);
    }

    @PreAuthorize("@customSecurityEvaluator.canDeleteSuggestion(authentication, #id)")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSuggestion(@PathVariable("id") Long id) {
        suggestionService.deleteSuggestion(id);
        return ResponseEntity.noContent().build();
    }
}
