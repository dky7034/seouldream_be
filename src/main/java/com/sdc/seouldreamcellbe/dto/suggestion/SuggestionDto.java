package com.sdc.seouldreamcellbe.dto.suggestion;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Suggestion;
import com.sdc.seouldreamcellbe.domain.SuggestionStatusHistory;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.SuggestionStatus;
import com.sdc.seouldreamcellbe.domain.common.SuggestionType;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Builder
public record SuggestionDto(
    Long id,
    CellInfo cell,
    SuggestionType type,
    String content,
    SuggestionStatus status,
    String response,
    UserInfo handledBy,
    UserInfo createdBy,
    List<StatusHistoryDto> statusHistories,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    @Builder
    public record CellInfo(Long id, String name) {
        public static CellInfo from(Cell cell) {
            return (cell != null) ? new CellInfo(cell.getId(), cell.getName()) : null;
        }
    }

    @Builder
    public record UserInfo(Long id, String username) {
        public static UserInfo from(User user) {
            return (user != null) ? new UserInfo(user.getId(), user.getUsername()) : null;
        }
    }

    @Builder
    public record StatusHistoryDto(
        Long id,
        SuggestionStatus fromStatus,
        SuggestionStatus toStatus,
        UserInfo changedBy,
        LocalDateTime changedAt,
        String note
    ) {
        public static StatusHistoryDto from(SuggestionStatusHistory entity) {
            return StatusHistoryDto.builder()
                .id(entity.getId())
                .fromStatus(entity.getFromStatus())
                .toStatus(entity.getToStatus())
                .changedBy(UserInfo.from(entity.getChangedBy()))
                .changedAt(entity.getChangedAt())
                .note(entity.getNote())
                .build();
        }
    }

    public static SuggestionDto from(Suggestion entity) {
        return SuggestionDto.builder()
            .id(entity.getId())
            .cell(CellInfo.from(entity.getCell()))
            .type(entity.getType())
            .content(entity.getContent())
            .status(entity.getStatus())
            .response(entity.getResponse())
            .handledBy(UserInfo.from(entity.getHandledBy()))
            .createdBy(UserInfo.from(entity.getCreatedBy()))
            .statusHistories(entity.getStatusHistories().stream().map(StatusHistoryDto::from).collect(Collectors.toList()))
            .createdAt(entity.getCreatedAt())
            .updatedAt(entity.getUpdatedAt())
            .build();
    }
}
