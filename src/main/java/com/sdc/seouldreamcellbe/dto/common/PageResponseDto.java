package com.sdc.seouldreamcellbe.dto.common;

import lombok.Builder;
import lombok.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import java.util.List;

@Value
@Builder
public class PageResponseDto<T> {

    List<T> content;

    PageableDto pageable;

    int totalPages;
    long totalElements;

    boolean last;
    int size;
    int number;

    SortDto sort;

    int numberOfElements;
    boolean first;
    boolean empty;

    public static <T> PageResponseDto<T> from(Page<T> page) {
        return PageResponseDto.<T>builder()
                .content(page.getContent())
                .pageable(PageableDto.from(page.getPageable()))
                .totalPages(page.getTotalPages())
                .totalElements(page.getTotalElements())
                .last(page.isLast())
                .size(page.getSize())
                .number(page.getNumber())
                .sort(SortDto.from(page.getSort()))
                .numberOfElements(page.getNumberOfElements())
                .first(page.isFirst())
                .empty(page.isEmpty())
                .build();
    }

    @Value
    @Builder
    public static class PageableDto {
        int pageNumber;
        int pageSize;

        SortDto sort;

        long offset;
        boolean paged;
        boolean unpaged;

        public static PageableDto from(Pageable pageable) {
            return PageableDto.builder()
                    .pageNumber(pageable.getPageNumber())
                    .pageSize(pageable.getPageSize())
                    .sort(SortDto.from(pageable.getSort()))
                    .offset(pageable.getOffset())
                    .paged(pageable.isPaged())
                    .unpaged(pageable.isUnpaged())
                    .build();
        }
    }

    @Value
    @Builder
    public static class SortDto {
        boolean sorted;
        boolean unsorted;
        boolean empty;

        public static SortDto from(Sort sort) {
            return SortDto.builder()
                    .sorted(sort.isSorted())
                    .unsorted(sort.isUnsorted())
                    .empty(sort.isEmpty())
                    .build();
        }
    }
}