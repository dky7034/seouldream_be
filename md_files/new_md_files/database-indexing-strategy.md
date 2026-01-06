# 데이터베이스 인덱싱 전략 (Database Indexing Strategy)

이 문서는 `seouldreamcell-be` 프로젝트의 데이터베이스 성능 최적화를 위한 인덱싱 전략을 정의합니다. 현재 트래픽(약 70명)에서는 필수적이지 않으나, 향후 데이터 증가(5년~10년 후)를 대비하여 **언제, 어디에, 왜** 인덱스를 적용해야 하는지 가이드합니다.

## 1. 인덱싱 적용 시기 (When)

*   **현재 (Early Stage):** 기능 구현 및 비즈니스 로직 안정화에 집중합니다. 현재 데이터 규모에서는 인덱스 유무가 성능에 미치는 영향이 미미합니다.
*   **중기 (Growth Stage):** 사용자가 늘어나고 특정 조회 화면(예: 출석부 로딩, 통계 페이지)에서 딜레이가 느껴질 때 적용합니다.
*   **장기 (Scale-up Stage):** `Attendance`(출석) 데이터가 수만~수십만 건 이상 쌓였을 때 필수적으로 적용해야 합니다.

## 2. 테이블별 추천 인덱스 (Where & Why)

### 2.1. Member (멤버)
멤버 테이블은 가장 빈번하게 조회되는 테이블입니다. 특히 생일 조회와 셀별 조회가 잦습니다.

| 우선순위 | 인덱스 컬럼 (Index Columns) | 설명 및 근거 (Reasoning) |
| :--- | :--- | :--- |
| **High** | `birth_date` | `findByBirthMonthAndDay`, `findByBirthdayInWrappingMonth` 등 복잡한 날짜 연산 쿼리 최적화. |
| **High** | `cell_id` | `findByCell_IdAnd...` 쿼리가 다수 존재. 특정 셀의 멤버를 빠르게 필터링하기 위해 필수. (보통 FK는 자동 인덱싱되나 확인 필요) |
| **Medium** | `name` | 동명이인 검색 및 관리자 페이지에서 이름 검색 시 Full Scan 방지. |
| **Low** | `email` | 로그인 시 `findByEmail` 사용. `unique=true` 제약조건으로 인해 보통 자동 생성됨. |

### 2.2. Attendance (출석)
데이터가 가장 빠르게, 많이 쌓이는 테이블입니다. 통계 쿼리의 성능을 좌우합니다.

| 우선순위 | 인덱스 컬럼 (Index Columns) | 설명 및 근거 (Reasoning) |
| :--- | :--- | :--- |
| **Critical** | `cell_id`, `date` (복합) | `findByCell_IdAndDateBetween` 등 셀 리더가 특정 기간의 출석을 조회할 때 가장 많이 사용됨. `cell_id`로 먼저 좁히고 `date`로 범위 검색. |
| **High** | `date` | `findAttendanceTrend`, `calculateWeeklyAverageAttendance` 등 전체 통계 및 날짜별 집계 쿼리 최적화. |
| **Info** | `member_id`, `date` | 이미 `@UniqueConstraint`가 걸려 있어 유니크 인덱스가 생성되어 있음. (`findByMember_IdAndDate` 성능 보장됨) |

### 2.3. Notice (공지사항)
공지사항은 최신순 정렬과 타겟팅(전체/셀) 조회가 주를 이룹니다.

| 우선순위 | 인덱스 컬럼 (Index Columns) | 설명 및 근거 (Reasoning) |
| :--- | :--- | :--- |
| **Medium** | `target`, `pinned`, `created_at` (복합) | `findAllByTargetOrderByPinnedDescCreatedAtDesc` 쿼리 최적화. 타겟으로 거르고, 상단 고정 확인 후, 최신순 정렬을 인덱스로 해결. |

---

## 3. 적용 방법 (How to Apply)

JPA 엔티티 클래스에 `@Index` 어노테이션을 추가하여 적용합니다.

### 3.1. Member 엔티티 예시

```java
// src/main/java/com/sdc/seouldreamcellbe/domain/Member.java

@Entity
@Table(name = "members", indexes = {
    @Index(name = "idx_member_birth_date", columnList = "birthDate"),
    @Index(name = "idx_member_cell_id", columnList = "cell_id"), // FK가 자동 인덱싱 안 될 경우
    @Index(name = "idx_member_name", columnList = "name")
})
public class Member extends BaseTimeEntity { ... }
```

### 3.2. Attendance 엔티티 예시

```java
// src/main/java/com/sdc/seouldreamcellbe/domain/Attendance.java

@Entity
@Table(name = "attendances", 
    uniqueConstraints = {
        @UniqueConstraint(columnNames = {"member_id", "date"}) // 기존 유니크 제약
    },
    indexes = {
        @Index(name = "idx_attendance_cell_date", columnList = "cell_id, date"), // 복합 인덱스
        @Index(name = "idx_attendance_date", columnList = "date")
    }
)
public class Attendance extends BaseTimeEntity { ... }
```

### 3.3. Notice 엔티티 예시

```java
// src/main/java/com/sdc/seouldreamcellbe/domain/Notice.java

@Entity
@Table(name = "notices", indexes = {
    @Index(name = "idx_notice_target_pinned_created", columnList = "target, pinned, createdAt")
})
public class Notice extends BaseTimeEntity { ... }
```

## 4. 운영 및 모니터링 팁

*   **Slow Query Log:** 운영 DB(MySQL 등)의 Slow Query Log 기능을 활성화하여, 실행 시간이 1초 이상 걸리는 쿼리를 주기적으로 확인합니다.
*   **Explain:** 느린 쿼리가 발견되면 SQL 클라이언트에서 `EXPLAIN SELECT ...` 명령어를 실행하여 인덱스를 잘 타고 있는지(Type이 `ALL`이 아닌지) 확인합니다.
*   **JPA ddl-auto:** 운영 환경(`prod`)에서는 `spring.jpa.hibernate.ddl-auto`를 `validate`나 `none`으로 설정하고, 인덱스 추가는 직접 DB 쿼리(`CREATE INDEX ...`)로 실행하는 것이 안전합니다.
