-- Dummy Data for seouldreamcell-be
-- All user passwords are 'password'

-- 1. Insert Teams
INSERT INTO teams (id, name, code, description, active, created_at, updated_at) VALUES
(1, '찬양팀', 'PRAISE', '주일 예배 찬양 인도', true, NOW(), NOW()),
(2, '새가족팀', 'NEWFAM', '새가족 등록 및 관리', true, NOW(), NOW()),
(3, '미디어팀', 'MEDIA', '예배 영상 및 음향 송출', true, NOW(), NOW());

-- 2. Insert Cells (without leaders for now)
INSERT INTO cells (id, name, description, active, created_at, updated_at) VALUES
(1, '이건희셀', '이건희 셀입니다.', true, NOW(), NOW()),
(2, '김도연셀', '김도연 셀입니다.', true, NOW(), NOW());

-- 3. Insert Members and Users
-- Password hash for 'password' is '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2'
-- For simplicity, members are not assigned to cells yet. This will be done in a later step.

-- Member 1: Executive (임원단)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at)
VALUES (1, '박주석', 'MALE', '1990-01-01', '010-1111-1111', 'executive@sdc.com', 'EXECUTIVE', 2015, true, NOW(), NOW());
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (1, 'executive', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 1, 'EXECUTIVE', 'ACTIVE', NOW(), NOW());

-- Member 2: Cell Leader for Cell 1 (이건희셀)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at)
VALUES (2, '이건희', 'MALE', '1992-02-02', '010-2222-2222', 'leader1@sdc.com', 'CELL_LEADER', 2016, true, NOW(), NOW());
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (2, 'leader1', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 2, 'CELL_LEADER', 'ACTIVE', NOW(), NOW());

-- Member 3: Vice Cell Leader for Cell 1 (이건희셀)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at)
VALUES (3, '김영희', 'FEMALE', '1993-03-03', '010-3333-3333', 'vleader1@sdc.com', 'VICE_CELL_LEADER', 2017, true, NOW(), NOW());
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (3, 'vleader1', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 3, 'VICE_CELL_LEADER', 'ACTIVE', NOW(), NOW());

-- Member 4: Cell Leader for Cell 2 (김도연셀)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at)
VALUES (4, '김도연', 'FEMALE', '1994-04-04', '010-4444-4444', 'leader2@sdc.com', 'CELL_LEADER', 2018, true, NOW(), NOW());
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (4, 'leader2', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 4, 'CELL_LEADER', 'ACTIVE', NOW(), NOW());

-- Member 5: Vice Cell Leader for Cell 2 (김도연셀)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at)
VALUES (5, '최철수', 'MALE', '1995-05-05', '010-5555-5555', 'vleader2@sdc.com', 'VICE_CELL_LEADER', 2019, true, NOW(), NOW());
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (5, 'vleader2', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 5, 'VICE_CELL_LEADER', 'ACTIVE', NOW(), NOW());

-- Regular Members (셀원)
INSERT INTO members (id, name, gender, birth_date, phone, email, role, join_year, active, created_at, updated_at) VALUES
(6, '김민준', 'MALE', '1998-01-10', '010-6666-0001', 'member1@sdc.com', 'MEMBER', 2020, true, NOW(), NOW()),
(7, '이서연', 'FEMALE', '1999-02-15', '010-6666-0002', 'member2@sdc.com', 'MEMBER', 2021, true, NOW(), NOW()),
(8, '박현우', 'MALE', '2000-03-20', '010-6666-0003', 'member3@sdc.com', 'MEMBER', 2022, true, NOW(), NOW()),
(9, '최지아', 'FEMALE', '2001-04-25', '010-6666-0004', 'member4@sdc.com', 'MEMBER', 2023, true, NOW(), NOW()),
(10, '정수빈', 'MALE', '1998-05-30', '010-6666-0005', 'member5@sdc.com', 'MEMBER', 2020, true, NOW(), NOW()),
(11, '강예진', 'FEMALE', '1999-06-05', '010-6666-0006', 'member6@sdc.com', 'MEMBER', 2021, true, NOW(), NOW()),
(12, '조민서', 'MALE', '2000-07-10', '010-6666-0007', 'member7@sdc.com', 'MEMBER', 2022, true, NOW(), NOW()),
(13, '윤지후', 'FEMALE', '2001-08-15', '010-6666-0008', 'member8@sdc.com', 'MEMBER', 2023, true, NOW(), NOW()),
(14, '임도윤', 'MALE', '1998-09-20', '010-6666-0009', 'member9@sdc.com', 'MEMBER', 2020, true, NOW(), NOW()),
(15, '황하은', 'FEMALE', '1999-10-25', '010-6666-0010', 'member10@sdc.com', 'MEMBER', 2021, true, NOW(), NOW());

INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at) VALUES
(6, 'member1', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 6, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(7, 'member2', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 7, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(8, 'member3', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 8, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(9, 'member4', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 9, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(10, 'member5', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 10, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(11, 'member6', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 11, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(12, 'member7', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 12, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(13, 'member8', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 13, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(14, 'member9', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 14, 'MEMBER', 'ACTIVE', NOW(), NOW()),
(15, 'member10', '$2a$10$f/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 15, 'MEMBER', 'ACTIVE', NOW(), NOW());

-- 4. Update Cells with Leaders
UPDATE cells SET leader_id = 2, vice_leader_id = 3 WHERE id = 1;
UPDATE cells SET leader_id = 4, vice_leader_id = 5 WHERE id = 2;

-- 5. Update Members with Cell assignments
-- Assign members to Cell 1 (이건희셀)
UPDATE members SET cell_id = 1 WHERE id IN (2, 3, 6, 7, 8, 9);
-- Assign members to Cell 2 (김도연셀)
UPDATE members SET cell_id = 2 WHERE id IN (4, 5, 10, 11, 12, 13, 14, 15);

-- 6. Insert into member_team (Assign members to teams)
-- 이건희 (셀장) -> 찬양팀, 미디어팀
INSERT INTO member_team (member_id, team_id, joined_at, created_at, updated_at) VALUES
(2, 1, '2023-01-01', NOW(), NOW()),
(2, 3, '2023-01-01', NOW(), NOW());
-- 김도연 (셀장) -> 새가족팀
INSERT INTO member_team (member_id, team_id, joined_at, created_at, updated_at) VALUES
(4, 2, '2023-01-01', NOW(), NOW());
-- 김민준 (셀원) -> 찬양팀
INSERT INTO member_team (member_id, team_id, joined_at, created_at, updated_at) VALUES
(6, 1, '2023-01-01', NOW(), NOW());
-- 이서연 (셀원) -> 미디어팀
INSERT INTO member_team (member_id, team_id, joined_at, created_at, updated_at) VALUES
(7, 3, '2023-01-01', NOW(), NOW());

-- Reset autoincrement values to prevent conflicts with manually inserted IDs
-- Note: This syntax is for MySQL.
ALTER TABLE teams AUTO_INCREMENT = 4;
ALTER TABLE cells AUTO_INCREMENT = 3;
ALTER TABLE members AUTO_INCREMENT = 16;
ALTER TABLE users AUTO_INCREMENT = 16;
ALTER TABLE member_team AUTO_INCREMENT = 5;

-- End of script
