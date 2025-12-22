package com.sdc.seouldreamcellbe.dto.notice;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record CreateNoticeRequest(
    @NotBlank String title,
    @NotBlank String content,
    @NotNull NoticeTarget target,
    Long targetCellId,
    Boolean pinned,
    LocalDateTime publishAt,
    LocalDateTime expireAt,
    @NotNull Long createdById // Will be replaced by authenticated user later
) {
}
