package com.sdc.seouldreamcellbe.dto.prayer;

import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import lombok.Builder;

import java.time.LocalDateTime;

@Builder
public record PrayerDto(
    Long id,
    MemberInfo member,
    String content,
    Integer weekOfMonth,
    PrayerVisibility visibility,
    boolean isDeleted,
    LocalDateTime deletedAt,
    UserInfo createdBy,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    @Builder
    public record MemberInfo(Long id, String name) {
        public static MemberInfo from(Member member) {
            return (member != null) ? new MemberInfo(member.getId(), member.getName()) : null;
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

    public static PrayerDto from(Prayer entity) {
        return PrayerDto.builder()
            .id(entity.getId())
            .member(MemberInfo.from(entity.getMember()))
            .content(entity.getContent())
            .weekOfMonth(entity.getWeekOfMonth())
            .visibility(entity.getVisibility())
            .isDeleted(entity.isDeleted())
            .deletedAt(entity.getDeletedAt())
            .createdBy(UserInfo.from(entity.getCreatedBy()))
            .createdAt(entity.getCreatedAt())
            .updatedAt(entity.getUpdatedAt())
            .build();
    }
}
