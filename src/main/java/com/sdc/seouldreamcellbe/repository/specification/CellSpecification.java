package com.sdc.seouldreamcellbe.repository.specification;

import com.sdc.seouldreamcellbe.domain.Cell;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;

public class CellSpecification {

    public static Specification<Cell> hasName(String name) {
        return (root, query, criteriaBuilder) -> {
            if (name == null || name.isBlank()) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.like(root.get("name"), "%" + name + "%");
        };
    }

    public static Specification<Cell> hasDateBetween(LocalDate startDate, LocalDate endDate) {
        return (root, query, builder) -> {
            if (startDate == null || endDate == null) {
                return builder.conjunction();
            }
            return builder.between(root.get("createdAt").as(LocalDate.class), startDate, endDate);
        };
    }

    public static Specification<Cell> isActive(Boolean active) {
        return (root, query, criteriaBuilder) -> {
            if (active == null) {
                return criteriaBuilder.conjunction();
            }
            return criteriaBuilder.equal(root.get("active"), active);
        };
    }
}
