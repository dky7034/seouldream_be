-- Dummy Data for seouldreamcell-be
-- This script clears existing data and inserts fresh dummy data.
-- All user passwords are 'password' (hash: $2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2)

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE member_teams;
TRUNCATE TABLE attendances;
TRUNCATE TABLE prayers;
TRUNCATE TABLE notices;
TRUNCATE TABLE users;
TRUNCATE TABLE cells;
TRUNCATE TABLE members;
TRUNCATE TABLE teams;
TRUNCATE TABLE semesters;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. Insert Semesters
INSERT INTO semesters (id, name, start_date, end_date, is_active) VALUES
(1, '2024-1학기', '2024-01-01', '2024-06-30', false),
(2, '2024-2학기', '2024-07-01', '2024-12-31', true);

-- 2. Insert Teams
INSERT INTO teams (id, name, code, description, active, created_at, updated_at) VALUES
(1, '찬양팀', 'PRAISE', '주일 예배 찬양 인도', true, NOW(), NOW()),
(2, '새가족팀', 'NEWFAM', '새가족 등록 및 관리', true, NOW(), NOW()),
(3, '미디어팀', 'MEDIA', '예배 영상 및 음향 송출', true, NOW(), NOW());

-- 3. Insert Cells (initially without leaders to avoid FK issues if circular)
INSERT INTO cells (id, name, description, active, created_at, updated_at) VALUES
(1, '이건희셀', '이건희 셀입니다.', true, NOW(), NOW()),
(2, '김도연셀', '김도연 셀입니다.', true, NOW(), NOW());

-- 4. Insert Members and Users

-- 4.1 Executive (임원단)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at)
VALUES (1, '박주석', 'MALE', '1990-01-01', '010-1111-1111', 'executive@sdc.com', 'EXECUTIVE', 2015, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (1, 'executive', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 1, 'EXECUTIVE', 'ACTIVE', NOW(), NOW());

-- 4.2 Cell Leader for Cell 1
INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, cell_assignment_date, role, join_year, active, created_at, updated_at)
VALUES (2, '이건희', 'MALE', '1992-02-02', '010-2222-2222', 'leader1@sdc.com', 1, '2024-01-01', 'CELL_LEADER', 2016, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (2, 'leader1', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 2, 'CELL_LEADER', 'ACTIVE', NOW(), NOW());

-- 4.3 Vice Cell Leader for Cell 1
INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, cell_assignment_date, role, join_year, active, created_at, updated_at)
VALUES (3, '김영희', 'FEMALE', '1993-03-03', '010-3333-3333', 'vleader1@sdc.com', 1, '2024-01-01', 'MEMBER', 2017, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (3, 'vleader1', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 3, 'MEMBER', 'ACTIVE', NOW(), NOW());

-- 4.4 Cell Leader for Cell 2
INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, cell_assignment_date, role, join_year, active, created_at, updated_at)
VALUES (4, '김도연', 'FEMALE', '1994-04-04', '010-4444-4444', 'leader2@sdc.com', 2, '2024-01-01', 'CELL_LEADER', 2018, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (4, 'leader2', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 4, 'CELL_LEADER', 'ACTIVE', NOW(), NOW());

-- 4.5 Vice Cell Leader for Cell 2
INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, cell_assignment_date, role, join_year, active, created_at, updated_at)
VALUES (5, '최철수', 'MALE', '1995-05-05', '010-5555-5555', 'vleader2@sdc.com', 2, '2024-01-01', 'MEMBER', 2019, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (5, 'vleader2', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 5, 'MEMBER', 'ACTIVE', NOW(), NOW());

-- 4.6 Regular Members for Cell 1
INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, cell_assignment_date, role, join_year, active, created_at, updated_at) VALUES
(6, '김민준', 'MALE', '1998-01-10', '010-6666-0001', 'member1@sdc.com', 1, '2024-01-01', 'MEMBER', 2020, true, NOW(), NOW()),
(7, '이서연', 'FEMALE', '1999-02-15', '010-6666-0002', 'member2@sdc.com', 1, '2024-01-01', 'MEMBER', 2021, true, NOW(), NOW()),
(8, '박현우', 'MALE', '2000-03-20', '010-6666-0003', 'member3@sdc.com', 1, '2024-01-01', 'MEMBER', 2022, true, NOW(), NOW()),
(9, '최지아', 'FEMALE', '2001-04-25', '010-6666-0004', 'member4@sdc.com', 1, '2024-01-01', 'MEMBER', 2023, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at) VALUES
(6, 'member1', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 6, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(7, 'member2', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 7, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(8, 'member3', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 8, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(9, 'member4', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 9, 'MEMBER', 'ACTIVE', NOW(), NOW());

-- 4.7 Regular Members for Cell 2
INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, cell_assignment_date, role, join_year, active, created_at, updated_at) VALUES
(10, '정수빈', 'MALE', '1998-05-30', '010-6666-0005', 'member5@sdc.com', 2, '2024-01-01', 'MEMBER', 2020, true, NOW(), NOW()),
(11, '강예진', 'FEMALE', '1999-06-05', '010-6666-0006', 'member6@sdc.com', 2, '2024-01-01', 'MEMBER', 2021, true, NOW(), NOW()),
(12, '조민서', 'MALE', '2000-07-10', '010-6666-0007', 'member7@sdc.com', 2, '2024-01-01', 'MEMBER', 2022, true, NOW(), NOW()),
(13, '윤지후', 'FEMALE', '2001-08-15', '010-6666-0008', 'member8@sdc.com', 2, '2024-01-01', 'MEMBER', 2023, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at) VALUES
(10, 'member5', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 10, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(11, 'member6', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 11, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(12, 'member7', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 12, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(13, 'member8', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 13, 'MEMBER', 'ACTIVE', NOW(), NOW());

-- 5. Update Cells with Leaders
UPDATE cells SET leader_id = 2, vice_leader_id = 3 WHERE id = 1;
UPDATE cells SET leader_id = 4, vice_leader_id = 5 WHERE id = 2;

-- 6. Insert Member Teams
-- 이건희 (셀장) -> 찬양팀, 미디어팀
INSERT INTO member_teams (member_id, team_id, joined_at, created_at) VALUES
(2, 1, '2023-01-01', NOW()),
(2, 3, '2023-01-01', NOW());
-- 김도연 (셀장) -> 새가족팀
INSERT INTO member_teams (member_id, team_id, joined_at, created_at) VALUES
(4, 2, '2023-01-01', NOW());
-- 김민준 (셀원) -> 찬양팀
INSERT INTO member_teams (member_id, team_id, joined_at, created_at) VALUES
(6, 1, '2023-01-01', NOW());
-- 이서연 (셀원) -> 미디어팀
INSERT INTO member_teams (member_id, team_id, joined_at, created_at) VALUES
(7, 3, '2023-01-01', NOW());

-- 7. Insert Notices
INSERT INTO notices (title, content, target, target_cell_id, pinned, publish_at, expire_at, is_deleted, created_by, created_at, updated_at) VALUES
('전체 공지사항 테스트', '전체 공지사항 내용입니다.', 'ALL', NULL, true, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), false, 1, NOW(), NOW()),
('셀리더 공지사항', '셀리더 필독 바랍니다.', 'CELL_LEADER', NULL, false, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), false, 1, NOW(), NOW()),
('이건희셀 공지', '이번주 셀모임 장소 변경입니다.', 'CELL', 1, false, NOW(), DATE_ADD(NOW(), INTERVAL 3 DAY), false, 2, NOW(), NOW());

-- 8. Insert Prayers
-- Member prayers
INSERT INTO prayers (member_id, meeting_date, content, week_of_month, visibility, is_deleted, created_by, created_at, updated_at) VALUES
(6, '2024-03-03', '가족 건강을 위해 기도해주세요.', 1, 'CELL', false, 6, NOW(), NOW()),
(7, '2024-03-03', '진로 문제로 고민이 많습니다.', 1, 'CELL', false, 7, NOW(), NOW()),
(2, '2024-03-03', '셀원들이 하나되길 기도합니다.', 1, 'ALL', false, 2, NOW(), NOW());

-- 9. Insert Attendances (Sample for one Sunday)
-- Assuming a recent Sunday
INSERT INTO attendances (member_id, date, status, memo, created_by, created_at, updated_at) VALUES
(2, DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY), 'PRESENT', NULL, 2, NOW(), NOW()), -- Leader
(3, DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY), 'PRESENT', NULL, 2, NOW(), NOW()), -- Vice
(6, DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY), 'PRESENT', NULL, 2, NOW(), NOW()),
(7, DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY), 'ABSENT', '개인 사정', 2, NOW(), NOW()),
(8, DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) + 1 DAY), 'PRESENT', NULL, 2, NOW(), NOW());

-- Reset autoincrement (MySQL specific, adjusted for safety)
ALTER TABLE teams AUTO_INCREMENT = 100;
ALTER TABLE cells AUTO_INCREMENT = 100;
ALTER TABLE members AUTO_INCREMENT = 100;
ALTER TABLE users AUTO_INCREMENT = 100;
ALTER TABLE member_teams AUTO_INCREMENT = 100;
ALTER TABLE notices AUTO_INCREMENT = 100;
ALTER TABLE prayers AUTO_INCREMENT = 100;
ALTER TABLE attendances AUTO_INCREMENT = 100;