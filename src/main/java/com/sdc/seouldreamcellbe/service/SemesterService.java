package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Semester;
import com.sdc.seouldreamcellbe.dto.semester.CreateSemesterRequest;
import com.sdc.seouldreamcellbe.dto.semester.SemesterDto;
import com.sdc.seouldreamcellbe.dto.semester.UpdateSemesterRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.SemesterRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SemesterService {

    private final SemesterRepository semesterRepository;

    @Transactional
    public SemesterDto createSemester(CreateSemesterRequest request) {
        Semester semester = Semester.builder()
            .name(request.name())
            .startDate(request.startDate())
            .endDate(request.endDate())
            .build();
        Semester savedSemester = semesterRepository.save(semester);
        return SemesterDto.from(savedSemester);
    }

    public SemesterDto getSemesterById(Long id) {
        Semester semester = semesterRepository.findById(id)
            .orElseThrow(() -> new NotFoundException("학기를 찾을 수 없습니다. ID: " + id));
        return SemesterDto.from(semester);
    }

    public List<SemesterDto> getAllSemesters(Boolean isActive) {
        List<Semester> semesters;
        if (isActive == null) {
            semesters = semesterRepository.findAll();
        } else {
            semesters = semesterRepository.findByIsActive(isActive);
        }
        return semesters.stream()
            .map(SemesterDto::from)
            .collect(Collectors.toList());
    }

    @Transactional
    public SemesterDto updateSemester(Long id, UpdateSemesterRequest request) {
        Semester semester = semesterRepository.findById(id)
            .orElseThrow(() -> new NotFoundException("학기를 찾을 수 없습니다. ID: " + id));

        if (request.name() != null) {
            semester.setName(request.name());
        }
        if (request.startDate() != null) {
            semester.setStartDate(request.startDate());
        }
        if (request.endDate() != null) {
            semester.setEndDate(request.endDate());
        }
        if (request.isActive() != null) {
            semester.setActive(request.isActive());
        }
        return SemesterDto.from(semester);
    }

    @Transactional
    public void deleteSemester(Long id) {
        if (!semesterRepository.existsById(id)) {
            throw new NotFoundException("학기를 찾을 수 없습니다. ID: " + id);
        }
        semesterRepository.deleteById(id);
    }
}
