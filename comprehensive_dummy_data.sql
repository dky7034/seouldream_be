-- Comprehensive Dummy Data for Verification (Updated for Current Date: Dec 30, 2025)
-- Scenario: 10 Cells, 6 Members each.
-- Semester: Starts 2025-12-01, Ends 2026-05-31 (Future included to test rate calculation fix).
-- Attendance Data: Provided for Dec 2025 (4 Weeks: Dec 7, 14, 21, 28).
-- Goal: Verify that querying the full semester returns attendance rate based only on dates <= Dec 30, 2025.

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE member_teams;
TRUNCATE TABLE attendances;
TRUNCATE TABLE prayers;
TRUNCATE TABLE notices;
TRUNCATE TABLE cell_reports;
TRUNCATE TABLE users;
TRUNCATE TABLE cells;
TRUNCATE TABLE members;
TRUNCATE TABLE teams;
TRUNCATE TABLE semesters;

SET FOREIGN_KEY_CHECKS = 1;

-- ==========================================
-- 1. Semesters
-- ==========================================
-- Semester adjusted to fit within 2025 to comply with Cell Leader year restriction policy
INSERT INTO semesters (id, name, start_date, end_date, is_active) VALUES
(1, '2025 겨울학기', '2025-12-01', '2025-12-31', true);

-- ==========================================
-- 2. Teams
-- ==========================================
INSERT INTO teams (id, name, code, description, active) VALUES
(1, '찬양팀', 'PRAISE', '주일 예배 찬양 인도', true),
(2, '미디어팀', 'MEDIA', '방송 송출 및 PPT', true),
(3, '새가족팀', 'NEWFAM', '새가족 환영 및 교육', true),
(4, '주차팀', 'PARKING', '차량 안내', true);

-- ==========================================
-- 3. Cells (10 Cells)
-- ==========================================
INSERT INTO cells (id, name, description, active, created_at, updated_at) VALUES 
(1, '사랑셀', '서로 사랑하는 셀 (출석률 100% 목표)', true, NOW(), NOW()),
(2, '기쁨셀', '항상 기뻐하는 셀 (출석률 50%)', true, NOW(), NOW()),
(3, '온유셀', '온유한 마음의 셀 (결석 많음)', true, NOW(), NOW()),
(4, '충성셀', '맡은 자에게 구할 것은 충성 (우수)', true, NOW(), NOW()),
(5, '화평셀', 'Peace Maker (성장형)', true, NOW(), NOW()),
(6, '인내셀', '끝까지 인내하는 셀 (하락세)', true, NOW(), NOW()),
(7, '자비셀', '자비로운 마음 (보통)', true, NOW(), NOW()),
(8, '양선셀', '선한 영향력 (보통)', true, NOW(), NOW()),
(9, '믿음셀', '믿음의 승부사 (들쑥날쑥)', true, NOW(), NOW()),
(10, '소망셀', '하늘 소망 (신설)', true, NOW(), NOW());

-- ==========================================
-- 4. Admin User
-- ==========================================
INSERT INTO members (id, name, gender, birth_date, role, active, created_at) VALUES 
(1, '관리자', 'MALE', '1980-01-01', 'EXECUTIVE', true, '2025-12-01 00:00:00');
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES 
(1, 'admin', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 1, 'EXECUTIVE', 'ACTIVE');


-- ==========================================
-- 5. Cell Leaders & Members (Generation)
-- Key: cell_assignment_date = '2025-12-01'
-- ==========================================

-- Cell 1 (Love)
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(10, '사랑셀장', 'FEMALE', '1990-01-01', 'CELL_LEADER', true, 1, '2025-12-01', '2025-12-01 00:00:00'),
(11, '사랑1', 'MALE', '1995-01-01', 'MEMBER', true, 1, '2025-12-01', '2025-12-01 00:00:00'),
(12, '사랑2', 'FEMALE', '1996-01-01', 'MEMBER', true, 1, '2025-12-01', '2025-12-01 00:00:00'),
(13, '사랑3', 'MALE', '1997-01-01', 'MEMBER', true, 1, '2025-12-01', '2025-12-01 00:00:00'),
(14, '사랑4', 'FEMALE', '1998-01-01', 'MEMBER', true, 1, '2025-12-01', '2025-12-01 00:00:00'),
(15, '사랑5', 'MALE', '1999-01-01', 'MEMBER', true, 1, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 10 WHERE id = 1;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (10, 'leader1', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 10, 'CELL_LEADER', 'ACTIVE');

-- Cell 2 (Joy)
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(20, '기쁨셀장', 'MALE', '1990-02-01', 'CELL_LEADER', true, 2, '2025-12-01', '2025-12-01 00:00:00'),
(21, '기쁨1', 'FEMALE', '1995-02-01', 'MEMBER', true, 2, '2025-12-01', '2025-12-01 00:00:00'),
(22, '기쁨2', 'MALE', '1996-02-01', 'MEMBER', true, 2, '2025-12-01', '2025-12-01 00:00:00'),
(23, '기쁨3', 'FEMALE', '1997-02-01', 'MEMBER', true, 2, '2025-12-01', '2025-12-01 00:00:00'),
(24, '기쁨4', 'MALE', '1998-02-01', 'MEMBER', true, 2, '2025-12-01', '2025-12-01 00:00:00'),
(25, '기쁨5', 'FEMALE', '1999-02-01', 'MEMBER', true, 2, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 20 WHERE id = 2;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (20, 'leader2', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 20, 'CELL_LEADER', 'ACTIVE');

-- Cell 3 (Peace)
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(30, '온유셀장', 'FEMALE', '1990-03-01', 'CELL_LEADER', true, 3, '2025-12-01', '2025-12-01 00:00:00'),
(31, '온유1', 'MALE', '1995-03-01', 'MEMBER', true, 3, '2025-12-01', '2025-12-01 00:00:00'),
(32, '온유2', 'FEMALE', '1996-03-01', 'MEMBER', true, 3, '2025-12-01', '2025-12-01 00:00:00'),
(33, '온유3', 'MALE', '1997-03-01', 'MEMBER', true, 3, '2025-12-01', '2025-12-01 00:00:00'),
(34, '온유4', 'FEMALE', '1998-03-01', 'MEMBER', true, 3, '2025-12-01', '2025-12-01 00:00:00'),
(35, '온유5', 'MALE', '1999-03-01', 'MEMBER', true, 3, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 30 WHERE id = 3;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (30, 'leader3', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 30, 'CELL_LEADER', 'ACTIVE');

-- Cell 4 (Faithfulness)
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(40, '충성셀장', 'MALE', '1990-04-01', 'CELL_LEADER', true, 4, '2025-12-01', '2025-12-01 00:00:00'),
(41, '충성1', 'FEMALE', '1995-04-01', 'MEMBER', true, 4, '2025-12-01', '2025-12-01 00:00:00'),
(42, '충성2', 'MALE', '1996-04-01', 'MEMBER', true, 4, '2025-12-01', '2025-12-01 00:00:00'),
(43, '충성3', 'FEMALE', '1997-04-01', 'MEMBER', true, 4, '2025-12-01', '2025-12-01 00:00:00'),
(44, '충성4', 'MALE', '1998-04-01', 'MEMBER', true, 4, '2025-12-01', '2025-12-01 00:00:00'),
(45, '충성5', 'FEMALE', '1999-04-01', 'MEMBER', true, 4, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 40 WHERE id = 4;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (40, 'leader4', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 40, 'CELL_LEADER', 'ACTIVE');

-- Cell 5 (Peace Maker)
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(50, '화평셀장', 'FEMALE', '1990-05-01', 'CELL_LEADER', true, 5, '2025-12-01', '2025-12-01 00:00:00'),
(51, '화평1', 'MALE', '1995-05-01', 'MEMBER', true, 5, '2025-12-01', '2025-12-01 00:00:00'),
(52, '화평2', 'FEMALE', '1996-05-01', 'MEMBER', true, 5, '2025-12-01', '2025-12-01 00:00:00'),
(53, '화평3', 'MALE', '1997-05-01', 'MEMBER', true, 5, '2025-12-01', '2025-12-01 00:00:00'),
(54, '화평4', 'FEMALE', '1998-05-01', 'MEMBER', true, 5, '2025-12-01', '2025-12-01 00:00:00'),
(55, '화평5', 'MALE', '1999-05-01', 'MEMBER', true, 5, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 50 WHERE id = 5;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (50, 'leader5', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 50, 'CELL_LEADER', 'ACTIVE');

-- Cell 6 (Patience)
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(60, '인내셀장', 'MALE', '1990-06-01', 'CELL_LEADER', true, 6, '2025-12-01', '2025-12-01 00:00:00'),
(61, '인내1', 'FEMALE', '1995-06-01', 'MEMBER', true, 6, '2025-12-01', '2025-12-01 00:00:00'),
(62, '인내2', 'MALE', '1996-06-01', 'MEMBER', true, 6, '2025-12-01', '2025-12-01 00:00:00'),
(63, '인내3', 'FEMALE', '1997-06-01', 'MEMBER', true, 6, '2025-12-01', '2025-12-01 00:00:00'),
(64, '인내4', 'MALE', '1998-06-01', 'MEMBER', true, 6, '2025-12-01', '2025-12-01 00:00:00'),
(65, '인내5', 'FEMALE', '1999-06-01', 'MEMBER', true, 6, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 60 WHERE id = 6;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (60, 'leader6', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 60, 'CELL_LEADER', 'ACTIVE');

-- Cells 7-10
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES (70, '자비셀장', 'FEMALE', '1990-07-01', 'CELL_LEADER', true, 7, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 70 WHERE id = 7;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (70, 'leader7', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 70, 'CELL_LEADER', 'ACTIVE');

INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES (80, '양선셀장', 'MALE', '1990-08-01', 'CELL_LEADER', true, 8, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 80 WHERE id = 8;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (80, 'leader8', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 80, 'CELL_LEADER', 'ACTIVE');

INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES (90, '믿음셀장', 'FEMALE', '1990-09-01', 'CELL_LEADER', true, 9, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 90 WHERE id = 9;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (90, 'leader9', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 90, 'CELL_LEADER', 'ACTIVE');

INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES (100, '소망셀장', 'MALE', '1990-10-01', 'CELL_LEADER', true, 10, '2025-12-01', '2025-12-01 00:00:00');
UPDATE cells SET leader_id = 100 WHERE id = 10;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES (100, 'leader10', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 100, 'CELL_LEADER', 'ACTIVE');


-- ==========================================
-- 6. Attendance & Reports
-- ==========================================
-- Sundays in Dec 2025: Dec 7, 14, 21, 28

-- --- Cell 1 (Love): 100% All Weeks (4 Weeks) ---
-- W1: 2025-12-07
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(1, '2025-12-07', '새학기 첫 모임 은혜로웠습니다.', '없음', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-07', 'PRESENT', 10, 10), ('2025-12-07', 'PRESENT', 11, 10), ('2025-12-07', 'PRESENT', 12, 10), ('2025-12-07', 'PRESENT', 13, 10), ('2025-12-07', 'PRESENT', 14, 10), ('2025-12-07', 'PRESENT', 15, 10);
-- W2: 2025-12-14
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(1, '2025-12-14', '성탄절 준비 나눔.', '없음', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-14', 'PRESENT', 10, 10), ('2025-12-14', 'PRESENT', 11, 10), ('2025-12-14', 'PRESENT', 12, 10), ('2025-12-14', 'PRESENT', 13, 10), ('2025-12-14', 'PRESENT', 14, 10), ('2025-12-14', 'PRESENT', 15, 10);
-- W3: 2025-12-21
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(1, '2025-12-21', '성탄 발표회 연습.', '없음', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-21', 'PRESENT', 10, 10), ('2025-12-21', 'PRESENT', 11, 10), ('2025-12-21', 'PRESENT', 12, 10), ('2025-12-21', 'PRESENT', 13, 10), ('2025-12-21', 'PRESENT', 14, 10), ('2025-12-21', 'PRESENT', 15, 10);
-- W4: 2025-12-28
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(1, '2025-12-28', '송년 주일 나눔.', '없음', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-28', 'PRESENT', 10, 10), ('2025-12-28', 'PRESENT', 11, 10), ('2025-12-28', 'PRESENT', 12, 10), ('2025-12-28', 'PRESENT', 13, 10), ('2025-12-28', 'PRESENT', 14, 10), ('2025-12-28', 'PRESENT', 15, 10);


-- --- Cell 2 (Joy): 50% (W1, W3 Present / W2, W4 Absent) ---
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(2, '2025-12-07', '기쁨셀 첫 모임.', null, '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-07', 'PRESENT', 20, 20), ('2025-12-07', 'PRESENT', 21, 20), ('2025-12-07', 'PRESENT', 22, 20), ('2025-12-07', 'PRESENT', 23, 20), ('2025-12-07', 'PRESENT', 24, 20), ('2025-12-07', 'PRESENT', 25, 20);

INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-14', 'ABSENT', 20, 20), ('2025-12-14', 'ABSENT', 21, 20), ('2025-12-14', 'ABSENT', 22, 20), ('2025-12-14', 'ABSENT', 23, 20), ('2025-12-14', 'ABSENT', 24, 20), ('2025-12-14', 'ABSENT', 25, 20);

INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(2, '2025-12-21', '성탄 전야.', null, '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-21', 'PRESENT', 20, 20), ('2025-12-21', 'PRESENT', 21, 20), ('2025-12-21', 'PRESENT', 22, 20), ('2025-12-21', 'PRESENT', 23, 20), ('2025-12-21', 'PRESENT', 24, 20), ('2025-12-21', 'PRESENT', 25, 20);

INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-28', 'ABSENT', 20, 20), ('2025-12-28', 'ABSENT', 21, 20), ('2025-12-28', 'ABSENT', 22, 20), ('2025-12-28', 'ABSENT', 23, 20), ('2025-12-28', 'ABSENT', 24, 20), ('2025-12-28', 'ABSENT', 25, 20);


-- --- Cell 3 (Peace): All Absent or Low ---
-- W1: All Absent
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-07', 'ABSENT', 30, 30), ('2025-12-07', 'ABSENT', 31, 30), ('2025-12-07', 'ABSENT', 32, 30), ('2025-12-07', 'ABSENT', 33, 30), ('2025-12-07', 'ABSENT', 34, 30), ('2025-12-07', 'ABSENT', 35, 30);


-- --- Cell 4 (Faithfulness): Good, but one absence in W2 ---
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(4, '2025-12-07', '충성된 마음으로 시작!', null, '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-07', 'PRESENT', 40, 40), ('2025-12-07', 'PRESENT', 41, 40), ('2025-12-07', 'PRESENT', 42, 40), ('2025-12-07', 'PRESENT', 43, 40), ('2025-12-07', 'PRESENT', 44, 40), ('2025-12-07', 'PRESENT', 45, 40);

-- W2: Member 45 Absent
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(4, '2025-12-14', '45번 지체 결석', '감기', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-14', 'PRESENT', 40, 40), ('2025-12-14', 'PRESENT', 41, 40), ('2025-12-14', 'PRESENT', 42, 40), ('2025-12-14', 'PRESENT', 43, 40), ('2025-12-14', 'PRESENT', 44, 40), ('2025-12-14', 'ABSENT', 45, 40);

INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-21', 'PRESENT', 40, 40), ('2025-12-21', 'PRESENT', 41, 40), ('2025-12-21', 'PRESENT', 42, 40), ('2025-12-21', 'PRESENT', 43, 40), ('2025-12-21', 'PRESENT', 44, 40), ('2025-12-21', 'PRESENT', 45, 40);
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-28', 'PRESENT', 40, 40), ('2025-12-28', 'PRESENT', 41, 40), ('2025-12-28', 'PRESENT', 42, 40), ('2025-12-28', 'PRESENT', 43, 40), ('2025-12-28', 'PRESENT', 44, 40), ('2025-12-28', 'PRESENT', 45, 40);


-- --- Cell 5 (Peace Maker): Rising (Low to High) ---
-- W1: Only 2 Present
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-07', 'PRESENT', 50, 50), ('2025-12-07', 'PRESENT', 51, 50), ('2025-12-07', 'ABSENT', 52, 50), ('2025-12-07', 'ABSENT', 53, 50), ('2025-12-07', 'ABSENT', 54, 50), ('2025-12-07', 'ABSENT', 55, 50);
-- W4: All Present
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES 
(5, '2025-12-28', '전원 출석 감사', null, '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES 
('2025-12-28', 'PRESENT', 50, 50), ('2025-12-28', 'PRESENT', 51, 50), ('2025-12-28', 'PRESENT', 52, 50), ('2025-12-28', 'PRESENT', 53, 50), ('2025-12-28', 'PRESENT', 54, 50), ('2025-12-28', 'PRESENT', 55, 50);


-- ==========================================
-- 7. Notices & Prayers
-- ==========================================
INSERT INTO notices (title, content, target, target_cell_id, pinned, created_at, updated_at, created_by, is_deleted) VALUES
('겨울학기 개강', '새로운 학기가 시작되었습니다.', 'ALL', null, true, '2025-12-01 10:00:00', '2025-12-01 10:00:00', 1, false),
('성탄절 안내', '25일 예배 안내입니다.', 'ALL', null, true, '2025-12-20 10:00:00', '2025-12-20 10:00:00', 1, false),
('송구영신예배', '31일 밤 11시 본당.', 'ALL', null, false, '2025-12-25 10:00:00', '2025-12-25 10:00:00', 1, false);

INSERT INTO prayers (content, visibility, member_id, meeting_date, created_at, updated_at, is_deleted) VALUES
('건강: 감기가 빨리 낫게 해주세요.', 'CELL', 11, '2025-12-07', '2025-12-07 10:00:00', '2025-12-07 10:00:00', false),
('취업: 좋은 직장 주세요.', 'CELL', 12, '2025-12-07', '2025-12-07 10:00:00', '2025-12-07 10:00:00', false),
('셀 부흥: 화평셀 전원 출석하게 해주세요.', 'CELL', 50, '2025-12-07', '2025-12-07 10:00:00', '2025-12-07 10:00:00', false),
('가족 구원: 부모님 교회 나오시길.', 'CELL', 61, '2025-12-21', '2025-12-21 10:00:00', '2025-12-21 10:00:00', false);
