package com.sdc.seouldreamcellbe.repository.specification;

import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import org.springframework.data.jpa.domain.Specification;

public class MemberSpecification {

    public static Specification<Member> hasName(String name) {
        return (root, query, criteriaBuilder) ->
            name == null ? criteriaBuilder.conjunction() :
                criteriaBuilder.like(root.get("name"), "%" + name + "%");
    }

    public static Specification<Member> hasJoinYear(Integer joinYear) {
        return (root, query, criteriaBuilder) ->
            joinYear == null ? criteriaBuilder.conjunction() :
                criteriaBuilder.equal(root.get("joinYear"), joinYear);
    }

    public static Specification<Member> hasGender(Gender gender) {
        return (root, query, criteriaBuilder) ->
            gender == null ? criteriaBuilder.conjunction() :
                criteriaBuilder.equal(root.get("gender"), gender);
    }

    public static Specification<Member> hasRole(Role role) {
        return (root, query, criteriaBuilder) ->
            role == null ? criteriaBuilder.conjunction() :
                criteriaBuilder.equal(root.get("role"), role);
    }

    public static Specification<Member> isUnassigned(Boolean unassigned) {
        if (unassigned == null) {
            return (root, query, criteriaBuilder) -> criteriaBuilder.conjunction();
        }
        return (root, query, criteriaBuilder) ->
            unassigned ? criteriaBuilder.isNull(root.get("cell")) :
                criteriaBuilder.isNotNull(root.get("cell"));
    }

    public static Specification<Member> hasCellId(Long cellId) {
        return (root, query, criteriaBuilder) ->
            cellId == null ? criteriaBuilder.conjunction() :
                criteriaBuilder.equal(root.get("cell").get("id"), cellId);
    }

    public static Specification<Member> hasBirthMonth(Integer month) {
        return (root, query, criteriaBuilder) -> {
            if (month == null) {
                return criteriaBuilder.conjunction();
            }
            // Use FUNCTION to call the database's MONTH function
            return criteriaBuilder.equal(
                criteriaBuilder.function("MONTH", Integer.class, root.get("birthDate")),
                month
            );
        };
    }
}