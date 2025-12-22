package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.*;
import com.sdc.seouldreamcellbe.dto.suggestion.CreateSuggestionRequest;
import com.sdc.seouldreamcellbe.dto.suggestion.SuggestionDto;
import com.sdc.seouldreamcellbe.dto.suggestion.UpdateSuggestionRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.SuggestionRepository;
import com.sdc.seouldreamcellbe.repository.SuggestionStatusHistoryRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SuggestionService {

    private final SuggestionRepository suggestionRepository;
    private final CellRepository cellRepository;
    private final UserRepository userRepository;
    private final SuggestionStatusHistoryRepository historyRepository;

    @Transactional
    public SuggestionDto createSuggestion(CreateSuggestionRequest request) {
        Cell cell = cellRepository.findById(request.cellId())
            .orElseThrow(() -> new NotFoundException("셀을 찾을 수 없습니다. ID: " + request.cellId()));
        User createdBy = userRepository.findById(request.createdById())
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. ID: " + request.createdById()));

        Suggestion newSuggestion = Suggestion.builder()
            .cell(cell)
            .type(request.type())
            .content(request.content())
            .createdBy(createdBy)
            .status(com.sdc.seouldreamcellbe.domain.common.SuggestionStatus.PENDING)
            .build();

        Suggestion savedSuggestion = suggestionRepository.save(newSuggestion);
        return SuggestionDto.from(savedSuggestion);
    }

    public SuggestionDto getSuggestionById(Long suggestionId) {
        Suggestion suggestion = suggestionRepository.findById(suggestionId)
            .orElseThrow(() -> new NotFoundException("건의사항을 찾을 수 없습니다. ID: " + suggestionId));
        return SuggestionDto.from(suggestion);
    }

    public List<SuggestionDto> getAllSuggestions() {
        return suggestionRepository.findAll().stream()
            .map(SuggestionDto::from)
            .collect(Collectors.toList());
    }

    @Transactional
    public SuggestionDto updateSuggestion(Long suggestionId, UpdateSuggestionRequest request) {
        Suggestion suggestion = suggestionRepository.findById(suggestionId)
            .orElseThrow(() -> new NotFoundException("건의사항을 찾을 수 없습니다. ID: " + suggestionId));

        // Find the user who is making the change
        User handler = null;
        if (request.handledById() != null) {
            handler = userRepository.findById(request.handledById())
                .orElseThrow(() -> new NotFoundException("처리 담당자를 찾을 수 없습니다. ID: " + request.handledById()));
            suggestion.setHandledBy(handler);
        }

        if (request.response() != null) {
            suggestion.setResponse(request.response());
        }

        // If status is changing, create a history record
        if (request.status() != null && !request.status().equals(suggestion.getStatus())) {
            SuggestionStatusHistory history = SuggestionStatusHistory.builder()
                .suggestion(suggestion)
                .fromStatus(suggestion.getStatus())
                .toStatus(request.status())
                .changedBy(handler) // Assume the handler is the one changing the status
                .note(request.historyNote())
                .build();
            historyRepository.save(history);
            suggestion.setStatus(request.status());
        }

        return SuggestionDto.from(suggestion);
    }

    @Transactional
    public void deleteSuggestion(Long suggestionId) {
        Suggestion suggestion = suggestionRepository.findById(suggestionId)
            .orElseThrow(() -> new NotFoundException("건의사항을 찾을 수 없습니다. ID: " + suggestionId));
        
        // This will trigger the @SQLDelete annotation on the entity
        suggestionRepository.delete(suggestion);
    }
}
