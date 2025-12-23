-- Migration Script for Prayer meeting_date

-- [주의] 이미 컬럼이 존재한다는 에러(1060)가 발생하면 1번은 건너뛰고 2번부터 실행하세요.

-- 1. meeting_date 컬럼 추가 (이미 있다면 이 줄만 제외하고 실행)
-- ALTER TABLE prayers ADD COLUMN meeting_date DATE;

-- 2. 안전 모드 해제 및 기존 데이터 업데이트
SET SQL_SAFE_UPDATES = 0;

UPDATE prayers 
SET meeting_date = DATE(created_at) 
WHERE meeting_date IS NULL;

-- 3. NULL 값 금지 설정 (데이터 정합성 보장)
ALTER TABLE prayers MODIFY COLUMN meeting_date DATE NOT NULL;

-- 4. 안전 모드 다시 켜기
SET SQL_SAFE_UPDATES = 1;