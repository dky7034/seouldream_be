package com.sdc.seouldreamcellbe.dto.team;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

@Data
public class AddMembersToTeamRequest {

    @NotEmpty(message = "멤버 ID 목록은 비어 있을 수 없습니다.")
    private List<Long> memberIds;
}
