package com.sdc.seouldreamcellbe.dto.cell;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.common.Gender;
import lombok.Builder;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Builder
public record CellDto(
    Long id,
    String name,
    MemberInfo leader,
    MemberInfo viceLeader,
    String description,
    boolean active,
    Integer memberCount, // Total active members
    Integer maleCount,
    Integer femaleCount,
    List<MemberInfo> members,
    Double attendanceRate, // Added field
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    @Builder
    public record MemberInfo(
        Long id,
        String name,
        Gender gender,
        LocalDate birthDate
    ) {
        public static MemberInfo from(Member member) {
            if (member == null) return null;
            return new MemberInfo(member.getId(), member.getName(), member.getGender(), member.getBirthDate());
        }
    }

    public static CellDto from(Cell entity) {
        return from(entity, null);
    }

    public static CellDto from(Cell entity, Double attendanceRate) {
        if (entity == null) return null;

        List<Member> activeMembers = entity.getMembers().stream()
            .filter(member -> member.getActive() != null && member.getActive())
            .collect(Collectors.toList());
        
        long maleCount = activeMembers.stream()
            .filter(member -> member.getGender() == Gender.MALE)
            .count();

        long femaleCount = activeMembers.stream()
            .filter(member -> member.getGender() == Gender.FEMALE)
            .count();

        return CellDto.builder()
            .id(entity.getId())
            .name(entity.getName())
            .leader(MemberInfo.from(entity.getLeader()))
            .viceLeader(MemberInfo.from(entity.getViceLeader()))
            .description(entity.getDescription())
            .active(entity.getActive())
            .memberCount(entity.getMemberCount()) // Use the @Formula field
            .maleCount((int) maleCount)
            .femaleCount((int) femaleCount)
            .members(activeMembers.stream().map(MemberInfo::from).collect(Collectors.toList()))
            .attendanceRate(attendanceRate)
            .createdAt(entity.getCreatedAt())
            .updatedAt(entity.getUpdatedAt())
            .build();
    }
}
