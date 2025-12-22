package com.sdc.seouldreamcellbe.dto.attendance;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import lombok.Builder;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Builder
public record AttendanceDto(
    Long id,
    MemberInfo member,
    CellInfo cell,
    LocalDate date,
    AttendanceStatus status,
    String memo,
    String prayerContent, // ADDED
    UserInfo createdBy,
    LocalDateTime createdAt
) {
    @Builder
    public record MemberInfo(Long id, String name) {
        public static MemberInfo from(Member member) {
            return (member != null) ? new MemberInfo(member.getId(), member.getName()) : null;
        }
    }

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

    public static AttendanceDto from(Attendance entity) {
        return from(entity, null); // Delegate to the new method with null prayerContent
    }

    public static AttendanceDto from(Attendance entity, String prayerContent) {
        return AttendanceDto.builder()
            .id(entity.getId())
            .member(MemberInfo.from(entity.getMember()))
            .cell(entity.getMember() != null ? CellInfo.from(entity.getMember().getCell()) : null)
            .date(entity.getDate())
            .status(entity.getStatus())
            .memo(entity.getMemo())
            .prayerContent(prayerContent) // ADDED
            .createdBy(UserInfo.from(entity.getCreatedBy()))
            .createdAt(entity.getCreatedAt())
            .build();
    }
}
