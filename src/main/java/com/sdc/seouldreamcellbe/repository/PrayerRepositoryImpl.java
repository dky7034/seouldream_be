package com.sdc.seouldreamcellbe.repository;

import com.sdc.seouldreamcellbe.dto.prayer.PrayerCellSummaryDto;
import com.sdc.seouldreamcellbe.dto.prayer.PrayerMemberSummaryDto;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class PrayerRepositoryImpl implements PrayerRepositoryCustom {

    private final EntityManager em;

    @Override
    public Page<PrayerMemberSummaryDto> findMemberPrayerSummary(LocalDate startDate, LocalDate endDate, Long cellId, Long memberId, Long createdById, Boolean isDeleted, Pageable pageable) {
        // Base Query
        String baseJpql = "FROM Prayer p JOIN p.member m LEFT JOIN m.cell c ";
        
        // Where Clause
        Map<String, Object> params = new HashMap<>();
        StringBuilder whereClause = new StringBuilder("WHERE (:isDeleted IS NULL OR p.isDeleted = :isDeleted) ");
        params.put("isDeleted", isDeleted);

        if (startDate != null) {
            whereClause.append("AND p.meetingDate >= :startDate ");
            params.put("startDate", startDate);
        }
        if (endDate != null) {
            whereClause.append("AND p.meetingDate < :endDate ");
            params.put("endDate", endDate);
        }
        if (cellId != null) {
            whereClause.append("AND c.id = :cellId ");
            params.put("cellId", cellId);
        }
        if (memberId != null) {
            whereClause.append("AND m.id = :memberId ");
            params.put("memberId", memberId);
        }
        if (createdById != null) {
            whereClause.append("AND p.createdBy.id = :createdById ");
            params.put("createdById", createdById);
        }

        // Main data query
        String dataJpql = "SELECT new com.sdc.seouldreamcellbe.dto.prayer.PrayerMemberSummaryDto(" +
            "m.id, m.name, c.id, c.name, COUNT(p.id), MAX(p.meetingDate)) " +
            baseJpql + whereClause +
            "GROUP BY m.id, m.name, c.id, c.name " +
            buildOrderByClause(pageable.getSort(), "member");

        TypedQuery<PrayerMemberSummaryDto> query = em.createQuery(dataJpql, PrayerMemberSummaryDto.class);
        params.forEach(query::setParameter);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());
        List<PrayerMemberSummaryDto> results = query.getResultList();

        // Count query
        String countJpql = "SELECT COUNT(DISTINCT m.id) " + baseJpql + whereClause;
        TypedQuery<Long> countQuery = em.createQuery(countJpql, Long.class);
        params.forEach(countQuery::setParameter);
        long total = countQuery.getSingleResult();

        return new PageImpl<>(results, pageable, total);
    }

    @Override
    public Page<PrayerCellSummaryDto> findCellPrayerSummary(LocalDate startDate, LocalDate endDate, Long cellId, Long memberId, Long createdById, Boolean isDeleted, Pageable pageable) {
        // Base Query
        String baseJpql = "FROM Prayer p JOIN p.member m JOIN m.cell c ";

        // Where Clause
        Map<String, Object> params = new HashMap<>();
        StringBuilder whereClause = new StringBuilder("WHERE (:isDeleted IS NULL OR p.isDeleted = :isDeleted) ");
        params.put("isDeleted", isDeleted);

        if (startDate != null) {
            whereClause.append("AND p.meetingDate >= :startDate ");
            params.put("startDate", startDate);
        }
        if (endDate != null) {
            whereClause.append("AND p.meetingDate < :endDate ");
            params.put("endDate", endDate);
        }
        if (cellId != null) {
            whereClause.append("AND c.id = :cellId ");
            params.put("cellId", cellId);
        }
        if (memberId != null) {
            whereClause.append("AND m.id = :memberId ");
            params.put("memberId", memberId);
        }
        if (createdById != null) {
            whereClause.append("AND p.createdBy.id = :createdById ");
            params.put("createdById", createdById);
        }

        // Main data query
        String dataJpql = "SELECT new com.sdc.seouldreamcellbe.dto.prayer.PrayerCellSummaryDto(" +
            "c.id, c.name, COUNT(p.id), MAX(p.meetingDate)) " +
            baseJpql + whereClause +
            "GROUP BY c.id, c.name " +
            buildOrderByClause(pageable.getSort(), "cell");
        
        TypedQuery<PrayerCellSummaryDto> query = em.createQuery(dataJpql, PrayerCellSummaryDto.class);
        params.forEach(query::setParameter);
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());
        List<PrayerCellSummaryDto> results = query.getResultList();

        // Count query
        String countJpql = "SELECT COUNT(DISTINCT c.id) " + baseJpql + whereClause;
        TypedQuery<Long> countQuery = em.createQuery(countJpql, Long.class);
        params.forEach(countQuery::setParameter);
        long total = countQuery.getSingleResult();

        return new PageImpl<>(results, pageable, total);
    }
    
    private String buildOrderByClause(Sort sort, String type) {
        if (sort.isUnsorted()) {
            // Default sort if none provided
            return "ORDER BY COUNT(p.id) DESC";
        }

        String orderBy = sort.stream()
            .map(order -> {
                String property = mapSortProperty(order.getProperty(), type);
                return property + " " + order.getDirection();
            })
            .collect(Collectors.joining(", "));

        return "ORDER BY " + orderBy;
    }

    private String mapSortProperty(String property, String type) {
        return switch (property) {
            case "totalCount" -> "COUNT(p.id)";
            case "latestCreatedAt" -> "MAX(p.meetingDate)";
            case "memberName" -> "m.name";
            case "cellName" -> "c.name";
            default -> {
                // For 'member' summary, default sort can be member name
                // For 'cell' summary, default sort can be cell name
                if ("member".equals(type)) yield "m.name";
                if ("cell".equals(type)) yield "c.name";
                // Fallback to a sensible default if property is unknown
                yield "COUNT(p.id)";
            }
        };
    }
}
