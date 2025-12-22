package com.sdc.seouldreamcellbe.repository.specification;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import jakarta.persistence.criteria.JoinType;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;

public class AttendanceSpecification {

    public static Specification<Attendance> hasMemberId(Long memberId) {
        return (root, query, criteriaBuilder) -> {
            if (memberId == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("member").get("id"), memberId);
        };
    }

    public static Specification<Attendance> hasCellId(Long cellId) {
        return (root, query, criteriaBuilder) -> {
            if (cellId == null) {
                return criteriaBuilder.conjunction();
            }
            // To join Member and then Cell
            return criteriaBuilder.equal(root.get("member").get("cell").get("id"), cellId);
        };
    }

    public static Specification<Attendance> hasStatus(AttendanceStatus status) {
        return (root, query, criteriaBuilder) -> {
            if (status == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("status"), status);
        };
    }

    public static Specification<Attendance> hasDateBetween(LocalDate startDate, LocalDate endDate) {
        return (root, query, criteriaBuilder) -> {
            if (startDate != null && endDate != null) {
                return criteriaBuilder.between(root.get("date"), startDate, endDate);
            }
            if (startDate != null) {
                return criteriaBuilder.greaterThanOrEqualTo(root.get("date"), startDate);
            }
            if (endDate != null) {
                return criteriaBuilder.lessThanOrEqualTo(root.get("date"), endDate);
            }
            return criteriaBuilder.conjunction();
        };
    }

    public static Specification<Attendance> fetchRelated() {
        return (root, query, criteriaBuilder) -> {
            // Prevent fetching for count queries
            if (query.getResultType() != Long.class && query.getResultType() != long.class) {
                query.distinct(true);
                // Fetch member and then nested cell
                root.fetch("member", JoinType.LEFT).fetch("cell", JoinType.LEFT);
                root.fetch("createdBy", JoinType.LEFT);
            }
            return criteriaBuilder.conjunction();
        };
    }
}
