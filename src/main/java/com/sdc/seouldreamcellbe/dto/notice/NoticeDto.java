package com.sdc.seouldreamcellbe.dto.notice;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Notice;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record NoticeDto(
    Long id,
    String title,
    String content,
    NoticeTarget target,
    CellInfo targetCell,
    boolean pinned,
    LocalDateTime publishAt,
    LocalDateTime expireAt,
    boolean isDeleted,
    UserInfo createdBy,
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
    public record UserInfo(Long id, String username, String name) {
        public static UserInfo from(User user) {
            if (user == null) return null;
            String memberName = (user.getMember() != null) ? user.getMember().getName() : null;
            return new UserInfo(user.getId(), user.getUsername(), memberName);
        }
    }

    public static NoticeDto from(Notice entity) {
        return NoticeDto.builder()
            .id(entity.getId())
            .title(entity.getTitle())
            .content(entity.getContent())
            .target(entity.getTarget())
            .targetCell(CellInfo.from(entity.getTargetCell()))
            .pinned(entity.isPinned())
            .publishAt(entity.getPublishAt())
            .expireAt(entity.getExpireAt())
            .isDeleted(entity.isDeleted())
            .createdBy(UserInfo.from(entity.getCreatedBy()))
            .createdAt(entity.getCreatedAt())
            .updatedAt(entity.getUpdatedAt())
            .build();
    }
}
