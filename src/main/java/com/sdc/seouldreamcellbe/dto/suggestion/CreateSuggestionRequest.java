package com.sdc.seouldreamcellbe.dto.suggestion;

import com.sdc.seouldreamcellbe.domain.common.SuggestionType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

@Builder
public record CreateSuggestionRequest(
    @NotNull Long cellId,
    @NotNull SuggestionType type,
    @NotBlank String content,
    @NotNull Long createdById // Will be replaced by authenticated user later
) {
}
