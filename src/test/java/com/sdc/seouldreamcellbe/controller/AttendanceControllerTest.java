package com.sdc.seouldreamcellbe.controller;

import com.sdc.seouldreamcellbe.dto.attendance.SubmittedDatesDto;
import com.sdc.seouldreamcellbe.service.AttendanceService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Arrays;
import java.util.List;

import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class AttendanceControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AttendanceService attendanceService;

    @Test
    @WithMockUser(roles = "EXECUTIVE")
    @DisplayName("GET /api/attendances/submitted-dates/{cellId} - 성공")
    void getSubmittedDates_shouldReturnSubmittedDates() throws Exception {
        // given
        Long cellId = 1L;
        Long semesterId = 1L;
        List<String> dates = Arrays.asList("2025-01-05", "2025-01-12");
        SubmittedDatesDto submittedDatesDto = new SubmittedDatesDto(dates);

        given(attendanceService.getSubmittedDates(cellId, semesterId)).willReturn(submittedDatesDto);

        // when & then
        mockMvc.perform(get("/api/attendances/submitted-dates/{cellId}", cellId)
                        .param("semesterId", semesterId.toString()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.dates[0]").value("2025-01-05"))
                .andExpect(jsonPath("$.dates[1]").value("2025-01-12"));
    }
}
