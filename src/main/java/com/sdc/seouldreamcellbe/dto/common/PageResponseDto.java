package com.sdc.seouldreamcellbe.dto.common;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public record PageResponseDto<T>(
        List<T> content,
        PageableDto pageable,
        int totalPages,
        long totalElements,
        boolean last,
        int size,
        int number,
        SortDto sort,
        int numberOfElements,
        boolean first,
        boolean empty
) {
    public static <T> PageResponseDto<T> of(Page<T> page) {
        return new PageResponseDto<>(
                page.getContent(),
                PageableDto.of(page.getPageable()),
                page.getTotalPages(),
                page.getTotalElements(),
                page.isLast(),
                page.getSize(),
                page.getNumber(),
                SortDto.of(page.getSort()),
                page.getNumberOfElements(),
                page.isFirst(),
                page.isEmpty()
        );
    }

    public record PageableDto(
            int pageNumber,
            int pageSize,
            SortDto sort,
            long offset,
            boolean paged,
            boolean unpaged
    ) {
        public static PageableDto of(Pageable pageable) {
            return new PageableDto(
                    pageable.getPageNumber(),
                    pageable.getPageSize(),
                    SortDto.of(pageable.getSort()),
                    pageable.getOffset(),
                    pageable.isPaged(),
                    pageable.isUnpaged()
            );
        }
    }

    public record SortDto(
            boolean sorted,
            boolean unsorted,
            boolean empty
    ) {
        public static SortDto of(Sort sort) {
            return new SortDto(sort.isSorted(), sort.isUnsorted(), sort.isEmpty());
        }
    }
}