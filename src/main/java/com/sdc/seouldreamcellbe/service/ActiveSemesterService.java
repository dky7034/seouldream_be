package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Semester;
import com.sdc.seouldreamcellbe.dto.semester.SemesterDto;
import com.sdc.seouldreamcellbe.exception.BusinessException;
import com.sdc.seouldreamcellbe.exception.ErrorCode;
import com.sdc.seouldreamcellbe.repository.SemesterRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ActiveSemesterService {

    private final SemesterRepository semesterRepository;

    /**
     * 현재 활성화된 학기 엔티티를 조회합니다.
     *
     * @return 활성 학기 Semester 엔티티
     * @throws BusinessException 활성 학기가 없거나 2개 이상일 경우
     */
    public Semester getActiveSemester() {
        List<Semester> activeSemesters = semesterRepository.findByIsActive(true);

        if (activeSemesters.isEmpty()) {
            throw new BusinessException(ErrorCode.NO_ACTIVE_SEMESTER);
        }

        // If multiple are active, pick the one with the most recent start date
        return activeSemesters.stream()
            .max((s1, s2) -> s1.getStartDate().compareTo(s2.getStartDate()))
            .get(); // .get() is safe here due to the isEmpty() check above
    }

    /**
     * 현재 활성화된 학기 정보를 DTO로 조회합니다.
     *
     * @return 활성 학기 SemesterDto
     */
    public SemesterDto getActiveSemesterDto() {
        Semester activeSemester = getActiveSemester();
        return SemesterDto.from(activeSemester);
    }

    /**
     * 요청한 날짜 범위가 활성화된 학기 기간에 포함되는지 확인합니다.
     *
     * @param startDate 조회 시작일
     * @param endDate 조회 종료일
     * @return 포함 여부
     */
    public boolean isDateRangeInActiveSemester(java.time.LocalDate startDate, java.time.LocalDate endDate) {
        if (startDate == null || endDate == null) return false;
        
        List<Semester> activeSemesters = semesterRepository.findByIsActive(true);
        if (activeSemesters.isEmpty()) return false;
        
        // Check if the requested range overlaps with ANY active semester
        for (Semester semester : activeSemesters) {
             // Logic: Requested Start <= Semester End AND Requested End >= Semester Start
             if (!startDate.isAfter(semester.getEndDate()) && !endDate.isBefore(semester.getStartDate())) {
                 return true;
             }
        }
        return false;
    }
}
