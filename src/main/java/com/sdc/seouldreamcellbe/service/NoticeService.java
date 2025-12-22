package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Cell;
import com.sdc.seouldreamcellbe.domain.Notice;
import com.sdc.seouldreamcellbe.domain.User;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import com.sdc.seouldreamcellbe.dto.notice.CreateNoticeRequest;
import com.sdc.seouldreamcellbe.dto.notice.NoticeDto;
import com.sdc.seouldreamcellbe.dto.notice.UpdateNoticeRequest;
import com.sdc.seouldreamcellbe.exception.NotFoundException;
import com.sdc.seouldreamcellbe.repository.CellRepository;
import com.sdc.seouldreamcellbe.repository.NoticeRepository;
import com.sdc.seouldreamcellbe.repository.UserRepository;
import com.sdc.seouldreamcellbe.repository.specification.NoticeSpecification;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.ArrayList; // Added import
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class NoticeService {

    private final NoticeRepository noticeRepository;
    private final UserRepository userRepository;
    private final CellRepository cellRepository;

    public List<Integer> getAvailableYears() {
        return noticeRepository.findDistinctYears();
    }

    @Transactional
    public NoticeDto createNotice(CreateNoticeRequest request) {
        User createdBy = userRepository.findById(request.createdById())
            .orElseThrow(() -> new NotFoundException("사용자를 찾을 수 없습니다. ID: " + request.createdById()));

        Cell targetCell = null;
        if (request.targetCellId() != null) {
            targetCell = cellRepository.findById(request.targetCellId())
                .orElseThrow(() -> new NotFoundException("타겟 셀을 찾을 수 없습니다. ID: " + request.targetCellId()));
        }

        Notice newNotice = Notice.builder()
            .title(request.title())
            .content(request.content())
            .target(request.target())
            .targetCell(targetCell)
            .pinned(request.pinned() != null && request.pinned())
            .publishAt(request.publishAt() != null ? request.publishAt() : LocalDateTime.now())
            .expireAt(request.expireAt())
            .createdBy(createdBy)
            .build();

        Notice savedNotice = noticeRepository.save(newNotice);
        return NoticeDto.from(savedNotice);
    }

    public NoticeDto getNoticeById(Long noticeId) {
        Notice notice = noticeRepository.findById(noticeId)
            .orElseThrow(() -> new NotFoundException("공지사항을 찾을 수 없습니다. ID: " + noticeId));
        return NoticeDto.from(notice);
    }


//...

    public Page<NoticeDto> getAllNotices(String title, NoticeTarget target, Boolean pinned, LocalDate startDate, LocalDate endDate, Pageable pageable) {
        // Find the user's requested sort order for 'createdAt', defaulting to descending.
        Sort.Order createdAtOrder = pageable.getSort().stream()
            .filter(order -> "createdAt".equalsIgnoreCase(order.getProperty()))
            .findFirst()
            .orElse(Sort.Order.desc("createdAt"));

        // Create the final sort, always prioritizing 'pinned' status.
        Sort finalSort = Sort.by(Sort.Order.desc("pinned"), createdAtOrder);
        Pageable sortedPageable = PageRequest.of(pageable.getPageNumber(), pageable.getPageSize(), finalSort);

        // Initialize an empty list of specifications
        List<Specification<Notice>> specifications = new ArrayList<>();

        // Add date specification
        specifications.add(NoticeSpecification.hasDateBetween(startDate, endDate));

        if (title != null && !title.isBlank()) {
            specifications.add(NoticeSpecification.hasTitle(title));
        }
        if (target != null) {
            specifications.add(NoticeSpecification.hasTarget(target));
        }
        if (pinned != null) {
            specifications.add(NoticeSpecification.isPinned(pinned));
        }

        // Combine all specifications with 'and'. If the list is empty, allOf returns a true predicate.
        Specification<Notice> spec = Specification.allOf(specifications);

        // TODO: Implement filtering logic based on user role and publication status
        Page<Notice> noticePage = noticeRepository.findAll(spec, sortedPageable);
        return noticePage.map(NoticeDto::from);
    }

    @Transactional
    public NoticeDto updateNotice(Long noticeId, UpdateNoticeRequest request) {
        Notice notice = noticeRepository.findById(noticeId)
            .orElseThrow(() -> new NotFoundException("공지사항을 찾을 수 없습니다. ID: " + noticeId));

        if (request.title() != null) notice.setTitle(request.title());
        if (request.content() != null) notice.setContent(request.content());
        if (request.target() != null) notice.setTarget(request.target());
        if (request.pinned() != null) notice.setPinned(request.pinned());
        if (request.publishAt() != null) notice.setPublishAt(request.publishAt());
        if (request.expireAt() != null) notice.setExpireAt(request.expireAt());

        if (request.targetCellId() != null) {
            Cell targetCell = cellRepository.findById(request.targetCellId())
                .orElseThrow(() -> new NotFoundException("타겟 셀을 찾을 수 없습니다. ID: " + request.targetCellId()));
            notice.setTargetCell(targetCell);
        }

        return NoticeDto.from(notice);
    }

    @Transactional
    public void deleteNotice(Long noticeId) {
        Notice notice = noticeRepository.findById(noticeId)
            .orElseThrow(() -> new NotFoundException("공지사항을 찾을 수 없습니다. ID: " + noticeId));
        
        // Soft delete is handled by @SQLDelete annotation on the entity
        noticeRepository.delete(notice);
    }
}
