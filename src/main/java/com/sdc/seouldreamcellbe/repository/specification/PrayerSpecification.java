package com.sdc.seouldreamcellbe.repository.specification;

import com.sdc.seouldreamcellbe.domain.Prayer;
import com.sdc.seouldreamcellbe.domain.common.PrayerVisibility;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PrayerSpecification {

    public static Specification<Prayer> hasDateBetween(LocalDate startDate, LocalDate endDate) {
        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (startDate != null) {
                predicates.add(criteriaBuilder.greaterThanOrEqualTo(root.get("meetingDate"), startDate));
            }
            if (endDate != null) {
                predicates.add(criteriaBuilder.lessThanOrEqualTo(root.get("meetingDate"), endDate));
            }
            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }

    public static Specification<Prayer> hasMemberId(Long memberId) {
        return (root, query, criteriaBuilder) -> {
            if (memberId == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("member").get("id"), memberId);
        };
    }

    public static Specification<Prayer> hasCellId(Long cellId) {
        return (root, query, criteriaBuilder) -> {
            if (cellId == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("member").get("cell").get("id"), cellId);
        };
    }

    public static Specification<Prayer> hasVisibility(PrayerVisibility visibility) {
        return (root, query, criteriaBuilder) -> {
            if (visibility == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("visibility"), visibility);
        };
    }

    public static Specification<Prayer> wasCreatedBy(Long createdById) {
        return (root, query, criteriaBuilder) -> {
            if (createdById == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("createdBy").get("id"), createdById);
        };
    }

    public static Specification<Prayer> isDeleted(Boolean isDeleted) {
        return (root, query, criteriaBuilder) -> {
            if (isDeleted == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("isDeleted"), isDeleted);
        };
    }
}
