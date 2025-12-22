package com.sdc.seouldreamcellbe.repository.specification;

import com.sdc.seouldreamcellbe.domain.Notice;
import com.sdc.seouldreamcellbe.domain.common.NoticeTarget;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;

public class NoticeSpecification {

    public static Specification<Notice> hasTitle(String title) {
        return (root, query, criteriaBuilder) -> {
            if (title == null || title.isBlank()) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.like(root.get("title"), "%" + title + "%");
        };
    }

    public static Specification<Notice> hasTarget(NoticeTarget target) {
        return (root, query, criteriaBuilder) -> {
            if (target == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("target"), target);
        };
    }

    public static Specification<Notice> isPinned(Boolean pinned) {
        return (root, query, criteriaBuilder) -> {
            if (pinned == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("pinned"), pinned);
        };
    }

    public static Specification<Notice> hasDateBetween(LocalDate startDate, LocalDate endDate) {
        return (root, query, builder) -> {
            if (startDate == null || endDate == null) {
                return builder.conjunction();
            }
            return builder.between(root.get("createdAt").as(LocalDate.class), startDate, endDate);
        };
    }
}