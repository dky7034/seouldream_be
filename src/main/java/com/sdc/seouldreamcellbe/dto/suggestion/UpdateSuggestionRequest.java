package com.sdc.seouldreamcellbe.dto.suggestion;

import com.sdc.seouldreamcellbe.domain.common.SuggestionStatus;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

@Builder
public record UpdateSuggestionRequest(
    @NotNull SuggestionStatus status,
    String response,
    Long handledById, // The user who is handling this
    String historyNote // A note for the status change history
) {
}
