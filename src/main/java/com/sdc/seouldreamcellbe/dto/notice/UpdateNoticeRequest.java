package com.sdc.seouldreamcellbe.dto.notice;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record UpdateNoticeRequest(
    String title,
    String content,
    NoticeTarget target,
    Long targetCellId,
    Boolean pinned,
    LocalDateTime publishAt,
    LocalDateTime expireAt
) {
}
