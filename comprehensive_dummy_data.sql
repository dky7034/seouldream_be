-- Comprehensive Dummy Data for 2025 (Generated)
-- Scenario: 100 Members, 10 Cells, 2 Semesters
-- Generated on: 2025-12-30

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

-- 1. Semesters
INSERT INTO semesters (id, name, start_date, end_date, is_active) VALUES
(1, '2025 상반기', '2025-01-01', '2025-06-30', false),
(2, '2025 하반기', '2025-07-01', '2025-12-31', true);

-- 2. Teams
INSERT INTO teams (id, name, code, description, active) VALUES
(1, '찬양팀', 'PRAISE', '주일 예배 찬양 인도', true),
(2, '미디어팀', 'MEDIA', '방송 송출 및 PPT', true),
(3, '새가족팀', 'NEWFAM', '새가족 환영 및 교육', true),
(4, '주차팀', 'PARKING', '차량 안내', true),
(5, '식당봉사팀', 'KITCHEN', '주일 점심 식사 준비', true);

-- 3. Cells
INSERT INTO cells (id, name, description, active, created_at, updated_at) VALUES
(1, '사랑셀', '사랑의 열매를 맺는 공동체', true, NOW(), NOW()),
(2, '희락셀', '희락의 열매를 맺는 공동체', true, NOW(), NOW()),
(3, '화평셀', '화평의 열매를 맺는 공동체', true, NOW(), NOW()),
(4, '오래참음셀', '오래참음의 열매를 맺는 공동체', true, NOW(), NOW()),
(5, '자비셀', '자비의 열매를 맺는 공동체', true, NOW(), NOW()),
(6, '양선셀', '양선의 열매를 맺는 공동체', true, NOW(), NOW()),
(7, '충성셀', '충성의 열매를 맺는 공동체', true, NOW(), NOW()),
(8, '온유셀', '온유의 열매를 맺는 공동체', true, NOW(), NOW()),
(9, '절제셀', '절제의 열매를 맺는 공동체', true, NOW(), NOW()),
(10, '소망셀', '소망의 열매를 맺는 공동체', true, NOW(), NOW());

-- 4. Members & Users
INSERT INTO members (id, name, gender, birth_date, role, active, created_at) VALUES
(1, '관리자', 'MALE', '1980-01-01', 'EXECUTIVE', true, '2025-01-01 00:00:00');
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(1, 'admin', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 1, 'EXECUTIVE', 'ACTIVE');

-- Cell 1 (사랑) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(10, '사랑셀장', 'MALE', '1986-01-01', 'CELL_LEADER', true, 1, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 10 WHERE id = 1;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(10, 'leader1', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 10, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(11, '사랑1', 'MALE', '1991-01-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(12, '사랑2', 'FEMALE', '1992-02-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(13, '사랑3', 'MALE', '1993-03-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(14, '사랑4', 'FEMALE', '1994-04-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(15, '사랑5', 'MALE', '1995-05-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(16, '사랑6', 'FEMALE', '1996-06-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(17, '사랑7', 'MALE', '1997-07-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(18, '사랑8', 'FEMALE', '1998-08-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00'),
(19, '사랑9', 'MALE', '1999-09-01', 'MEMBER', true, 1, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 2 (희락) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(20, '희락셀장', 'FEMALE', '1987-01-01', 'CELL_LEADER', true, 2, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 20 WHERE id = 2;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(20, 'leader2', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 20, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(21, '희락1', 'MALE', '1991-01-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(22, '희락2', 'FEMALE', '1992-02-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(23, '희락3', 'MALE', '1993-03-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(24, '희락4', 'FEMALE', '1994-04-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(25, '희락5', 'MALE', '1995-05-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(26, '희락6', 'FEMALE', '1996-06-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(27, '희락7', 'MALE', '1997-07-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(28, '희락8', 'FEMALE', '1998-08-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00'),
(29, '희락9', 'MALE', '1999-09-01', 'MEMBER', true, 2, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 3 (화평) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(30, '화평셀장', 'MALE', '1988-01-01', 'CELL_LEADER', true, 3, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 30 WHERE id = 3;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(30, 'leader3', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 30, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(31, '화평1', 'MALE', '1991-01-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(32, '화평2', 'FEMALE', '1992-02-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(33, '화평3', 'MALE', '1993-03-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(34, '화평4', 'FEMALE', '1994-04-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(35, '화평5', 'MALE', '1995-05-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(36, '화평6', 'FEMALE', '1996-06-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(37, '화평7', 'MALE', '1997-07-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(38, '화평8', 'FEMALE', '1998-08-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00'),
(39, '화평9', 'MALE', '1999-09-01', 'MEMBER', true, 3, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 4 (오래참음) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(40, '오래참음셀장', 'FEMALE', '1989-01-01', 'CELL_LEADER', true, 4, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 40 WHERE id = 4;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(40, 'leader4', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 40, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(41, '오래참음1', 'MALE', '1991-01-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(42, '오래참음2', 'FEMALE', '1992-02-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(43, '오래참음3', 'MALE', '1993-03-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(44, '오래참음4', 'FEMALE', '1994-04-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(45, '오래참음5', 'MALE', '1995-05-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(46, '오래참음6', 'FEMALE', '1996-06-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(47, '오래참음7', 'MALE', '1997-07-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(48, '오래참음8', 'FEMALE', '1998-08-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00'),
(49, '오래참음9', 'MALE', '1999-09-01', 'MEMBER', true, 4, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 5 (자비) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(50, '자비셀장', 'MALE', '1990-01-01', 'CELL_LEADER', true, 5, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 50 WHERE id = 5;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(50, 'leader5', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 50, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(51, '자비1', 'MALE', '1991-01-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(52, '자비2', 'FEMALE', '1992-02-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(53, '자비3', 'MALE', '1993-03-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(54, '자비4', 'FEMALE', '1994-04-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(55, '자비5', 'MALE', '1995-05-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(56, '자비6', 'FEMALE', '1996-06-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(57, '자비7', 'MALE', '1997-07-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(58, '자비8', 'FEMALE', '1998-08-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00'),
(59, '자비9', 'MALE', '1999-09-01', 'MEMBER', true, 5, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 6 (양선) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(60, '양선셀장', 'FEMALE', '1991-01-01', 'CELL_LEADER', true, 6, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 60 WHERE id = 6;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(60, 'leader6', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 60, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(61, '양선1', 'MALE', '1991-01-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(62, '양선2', 'FEMALE', '1992-02-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(63, '양선3', 'MALE', '1993-03-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(64, '양선4', 'FEMALE', '1994-04-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(65, '양선5', 'MALE', '1995-05-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(66, '양선6', 'FEMALE', '1996-06-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(67, '양선7', 'MALE', '1997-07-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(68, '양선8', 'FEMALE', '1998-08-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00'),
(69, '양선9', 'MALE', '1999-09-01', 'MEMBER', true, 6, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 7 (충성) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(70, '충성셀장', 'MALE', '1992-01-01', 'CELL_LEADER', true, 7, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 70 WHERE id = 7;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(70, 'leader7', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 70, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(71, '충성1', 'MALE', '1991-01-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(72, '충성2', 'FEMALE', '1992-02-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(73, '충성3', 'MALE', '1993-03-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(74, '충성4', 'FEMALE', '1994-04-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(75, '충성5', 'MALE', '1995-05-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(76, '충성6', 'FEMALE', '1996-06-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(77, '충성7', 'MALE', '1997-07-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(78, '충성8', 'FEMALE', '1998-08-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00'),
(79, '충성9', 'MALE', '1999-09-01', 'MEMBER', true, 7, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 8 (온유) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(80, '온유셀장', 'FEMALE', '1993-01-01', 'CELL_LEADER', true, 8, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 80 WHERE id = 8;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(80, 'leader8', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 80, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(81, '온유1', 'MALE', '1991-01-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(82, '온유2', 'FEMALE', '1992-02-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(83, '온유3', 'MALE', '1993-03-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(84, '온유4', 'FEMALE', '1994-04-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(85, '온유5', 'MALE', '1995-05-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(86, '온유6', 'FEMALE', '1996-06-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(87, '온유7', 'MALE', '1997-07-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(88, '온유8', 'FEMALE', '1998-08-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00'),
(89, '온유9', 'MALE', '1999-09-01', 'MEMBER', true, 8, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 9 (절제) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(90, '절제셀장', 'MALE', '1994-01-01', 'CELL_LEADER', true, 9, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 90 WHERE id = 9;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(90, 'leader9', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 90, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(91, '절제1', 'MALE', '1991-01-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(92, '절제2', 'FEMALE', '1992-02-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(93, '절제3', 'MALE', '1993-03-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(94, '절제4', 'FEMALE', '1994-04-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(95, '절제5', 'MALE', '1995-05-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(96, '절제6', 'FEMALE', '1996-06-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(97, '절제7', 'MALE', '1997-07-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(98, '절제8', 'FEMALE', '1998-08-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00'),
(99, '절제9', 'MALE', '1999-09-01', 'MEMBER', true, 9, '2025-01-01', '2025-01-01 00:00:00');

-- Cell 10 (소망) Leader & Members
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(100, '소망셀장', 'FEMALE', '1985-01-01', 'CELL_LEADER', true, 10, '2025-01-01', '2025-01-01 00:00:00');
UPDATE cells SET leader_id = 100 WHERE id = 10;
INSERT INTO users (id, username, password_hash, member_id, role, status) VALUES
(100, 'leader10', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 100, 'CELL_LEADER', 'ACTIVE');
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at) VALUES
(101, '소망1', 'MALE', '1991-01-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(102, '소망2', 'FEMALE', '1992-02-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(103, '소망3', 'MALE', '1993-03-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(104, '소망4', 'FEMALE', '1994-04-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(105, '소망5', 'MALE', '1995-05-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(106, '소망6', 'FEMALE', '1996-06-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(107, '소망7', 'MALE', '1997-07-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(108, '소망8', 'FEMALE', '1998-08-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00'),
(109, '소망9', 'MALE', '1999-09-01', 'MEMBER', true, 10, '2025-01-01', '2025-01-01 00:00:00');

-- 5. Attendances & Cell Reports (Weekly)
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'PRESENT', 10, 10), ('2025-01-05', 'ABSENT', 11, 10), ('2025-01-05', 'ABSENT', 12, 10), ('2025-01-05', 'PRESENT', 13, 10), ('2025-01-05', 'ABSENT', 14, 10), ('2025-01-05', 'ABSENT', 15, 10), ('2025-01-05', 'PRESENT', 16, 10), ('2025-01-05', 'ABSENT', 17, 10), ('2025-01-05', 'PRESENT', 18, 10), ('2025-01-05', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'ABSENT', 20, 20), ('2025-01-05', 'PRESENT', 21, 20), ('2025-01-05', 'PRESENT', 22, 20), ('2025-01-05', 'PRESENT', 23, 20), ('2025-01-05', 'PRESENT', 24, 20), ('2025-01-05', 'PRESENT', 25, 20), ('2025-01-05', 'PRESENT', 26, 20), ('2025-01-05', 'ABSENT', 27, 20), ('2025-01-05', 'PRESENT', 28, 20), ('2025-01-05', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'ABSENT', 30, 30), ('2025-01-05', 'PRESENT', 31, 30), ('2025-01-05', 'ABSENT', 32, 30), ('2025-01-05', 'ABSENT', 33, 30), ('2025-01-05', 'PRESENT', 34, 30), ('2025-01-05', 'ABSENT', 35, 30), ('2025-01-05', 'PRESENT', 36, 30), ('2025-01-05', 'PRESENT', 37, 30), ('2025-01-05', 'PRESENT', 38, 30), ('2025-01-05', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'ABSENT', 40, 40), ('2025-01-05', 'PRESENT', 41, 40), ('2025-01-05', 'PRESENT', 42, 40), ('2025-01-05', 'PRESENT', 43, 40), ('2025-01-05', 'PRESENT', 44, 40), ('2025-01-05', 'PRESENT', 45, 40), ('2025-01-05', 'PRESENT', 46, 40), ('2025-01-05', 'PRESENT', 47, 40), ('2025-01-05', 'PRESENT', 48, 40), ('2025-01-05', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'ABSENT', 50, 50), ('2025-01-05', 'PRESENT', 51, 50), ('2025-01-05', 'PRESENT', 52, 50), ('2025-01-05', 'PRESENT', 53, 50), ('2025-01-05', 'ABSENT', 54, 50), ('2025-01-05', 'PRESENT', 55, 50), ('2025-01-05', 'PRESENT', 56, 50), ('2025-01-05', 'PRESENT', 57, 50), ('2025-01-05', 'PRESENT', 58, 50), ('2025-01-05', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'PRESENT', 60, 60), ('2025-01-05', 'PRESENT', 61, 60), ('2025-01-05', 'PRESENT', 62, 60), ('2025-01-05', 'ABSENT', 63, 60), ('2025-01-05', 'ABSENT', 64, 60), ('2025-01-05', 'ABSENT', 65, 60), ('2025-01-05', 'ABSENT', 66, 60), ('2025-01-05', 'PRESENT', 67, 60), ('2025-01-05', 'ABSENT', 68, 60), ('2025-01-05', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'ABSENT', 70, 70), ('2025-01-05', 'PRESENT', 71, 70), ('2025-01-05', 'PRESENT', 72, 70), ('2025-01-05', 'PRESENT', 73, 70), ('2025-01-05', 'PRESENT', 74, 70), ('2025-01-05', 'ABSENT', 75, 70), ('2025-01-05', 'PRESENT', 76, 70), ('2025-01-05', 'PRESENT', 77, 70), ('2025-01-05', 'PRESENT', 78, 70), ('2025-01-05', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'PRESENT', 80, 80), ('2025-01-05', 'PRESENT', 81, 80), ('2025-01-05', 'ABSENT', 82, 80), ('2025-01-05', 'ABSENT', 83, 80), ('2025-01-05', 'PRESENT', 84, 80), ('2025-01-05', 'PRESENT', 85, 80), ('2025-01-05', 'PRESENT', 86, 80), ('2025-01-05', 'PRESENT', 87, 80), ('2025-01-05', 'PRESENT', 88, 80), ('2025-01-05', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'PRESENT', 90, 90), ('2025-01-05', 'PRESENT', 91, 90), ('2025-01-05', 'ABSENT', 92, 90), ('2025-01-05', 'PRESENT', 93, 90), ('2025-01-05', 'PRESENT', 94, 90), ('2025-01-05', 'ABSENT', 95, 90), ('2025-01-05', 'PRESENT', 96, 90), ('2025-01-05', 'PRESENT', 97, 90), ('2025-01-05', 'ABSENT', 98, 90), ('2025-01-05', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-01-05', '2025-01-05 주일 나눔입니다.', '', '2025-01-05 16:00:00', '2025-01-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-05', 'PRESENT', 100, 100), ('2025-01-05', 'ABSENT', 101, 100), ('2025-01-05', 'PRESENT', 102, 100), ('2025-01-05', 'PRESENT', 103, 100), ('2025-01-05', 'PRESENT', 104, 100), ('2025-01-05', 'PRESENT', 105, 100), ('2025-01-05', 'PRESENT', 106, 100), ('2025-01-05', 'PRESENT', 107, 100), ('2025-01-05', 'ABSENT', 108, 100), ('2025-01-05', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 10, 10), ('2025-01-12', 'PRESENT', 11, 10), ('2025-01-12', 'PRESENT', 12, 10), ('2025-01-12', 'PRESENT', 13, 10), ('2025-01-12', 'PRESENT', 14, 10), ('2025-01-12', 'ABSENT', 15, 10), ('2025-01-12', 'PRESENT', 16, 10), ('2025-01-12', 'PRESENT', 17, 10), ('2025-01-12', 'PRESENT', 18, 10), ('2025-01-12', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 20, 20), ('2025-01-12', 'PRESENT', 21, 20), ('2025-01-12', 'PRESENT', 22, 20), ('2025-01-12', 'PRESENT', 23, 20), ('2025-01-12', 'PRESENT', 24, 20), ('2025-01-12', 'PRESENT', 25, 20), ('2025-01-12', 'PRESENT', 26, 20), ('2025-01-12', 'PRESENT', 27, 20), ('2025-01-12', 'PRESENT', 28, 20), ('2025-01-12', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 30, 30), ('2025-01-12', 'PRESENT', 31, 30), ('2025-01-12', 'PRESENT', 32, 30), ('2025-01-12', 'PRESENT', 33, 30), ('2025-01-12', 'PRESENT', 34, 30), ('2025-01-12', 'PRESENT', 35, 30), ('2025-01-12', 'PRESENT', 36, 30), ('2025-01-12', 'PRESENT', 37, 30), ('2025-01-12', 'PRESENT', 38, 30), ('2025-01-12', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 40, 40), ('2025-01-12', 'PRESENT', 41, 40), ('2025-01-12', 'PRESENT', 42, 40), ('2025-01-12', 'PRESENT', 43, 40), ('2025-01-12', 'PRESENT', 44, 40), ('2025-01-12', 'ABSENT', 45, 40), ('2025-01-12', 'PRESENT', 46, 40), ('2025-01-12', 'PRESENT', 47, 40), ('2025-01-12', 'PRESENT', 48, 40), ('2025-01-12', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'ABSENT', 50, 50), ('2025-01-12', 'PRESENT', 51, 50), ('2025-01-12', 'PRESENT', 52, 50), ('2025-01-12', 'PRESENT', 53, 50), ('2025-01-12', 'PRESENT', 54, 50), ('2025-01-12', 'PRESENT', 55, 50), ('2025-01-12', 'PRESENT', 56, 50), ('2025-01-12', 'PRESENT', 57, 50), ('2025-01-12', 'PRESENT', 58, 50), ('2025-01-12', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'ABSENT', 60, 60), ('2025-01-12', 'ABSENT', 61, 60), ('2025-01-12', 'ABSENT', 62, 60), ('2025-01-12', 'PRESENT', 63, 60), ('2025-01-12', 'PRESENT', 64, 60), ('2025-01-12', 'PRESENT', 65, 60), ('2025-01-12', 'PRESENT', 66, 60), ('2025-01-12', 'PRESENT', 67, 60), ('2025-01-12', 'PRESENT', 68, 60), ('2025-01-12', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 70, 70), ('2025-01-12', 'PRESENT', 71, 70), ('2025-01-12', 'ABSENT', 72, 70), ('2025-01-12', 'PRESENT', 73, 70), ('2025-01-12', 'PRESENT', 74, 70), ('2025-01-12', 'PRESENT', 75, 70), ('2025-01-12', 'PRESENT', 76, 70), ('2025-01-12', 'PRESENT', 77, 70), ('2025-01-12', 'PRESENT', 78, 70), ('2025-01-12', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'ABSENT', 80, 80), ('2025-01-12', 'PRESENT', 81, 80), ('2025-01-12', 'PRESENT', 82, 80), ('2025-01-12', 'PRESENT', 83, 80), ('2025-01-12', 'PRESENT', 84, 80), ('2025-01-12', 'ABSENT', 85, 80), ('2025-01-12', 'PRESENT', 86, 80), ('2025-01-12', 'PRESENT', 87, 80), ('2025-01-12', 'PRESENT', 88, 80), ('2025-01-12', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 90, 90), ('2025-01-12', 'PRESENT', 91, 90), ('2025-01-12', 'PRESENT', 92, 90), ('2025-01-12', 'PRESENT', 93, 90), ('2025-01-12', 'PRESENT', 94, 90), ('2025-01-12', 'ABSENT', 95, 90), ('2025-01-12', 'PRESENT', 96, 90), ('2025-01-12', 'PRESENT', 97, 90), ('2025-01-12', 'PRESENT', 98, 90), ('2025-01-12', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-01-12', '2025-01-12 주일 나눔입니다.', '', '2025-01-12 16:00:00', '2025-01-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-12', 'PRESENT', 100, 100), ('2025-01-12', 'PRESENT', 101, 100), ('2025-01-12', 'PRESENT', 102, 100), ('2025-01-12', 'PRESENT', 103, 100), ('2025-01-12', 'ABSENT', 104, 100), ('2025-01-12', 'ABSENT', 105, 100), ('2025-01-12', 'PRESENT', 106, 100), ('2025-01-12', 'PRESENT', 107, 100), ('2025-01-12', 'PRESENT', 108, 100), ('2025-01-12', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'ABSENT', 10, 10), ('2025-01-19', 'ABSENT', 11, 10), ('2025-01-19', 'PRESENT', 12, 10), ('2025-01-19', 'PRESENT', 13, 10), ('2025-01-19', 'ABSENT', 14, 10), ('2025-01-19', 'ABSENT', 15, 10), ('2025-01-19', 'PRESENT', 16, 10), ('2025-01-19', 'PRESENT', 17, 10), ('2025-01-19', 'PRESENT', 18, 10), ('2025-01-19', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'ABSENT', 20, 20), ('2025-01-19', 'ABSENT', 21, 20), ('2025-01-19', 'PRESENT', 22, 20), ('2025-01-19', 'PRESENT', 23, 20), ('2025-01-19', 'PRESENT', 24, 20), ('2025-01-19', 'PRESENT', 25, 20), ('2025-01-19', 'PRESENT', 26, 20), ('2025-01-19', 'PRESENT', 27, 20), ('2025-01-19', 'PRESENT', 28, 20), ('2025-01-19', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'PRESENT', 30, 30), ('2025-01-19', 'PRESENT', 31, 30), ('2025-01-19', 'PRESENT', 32, 30), ('2025-01-19', 'PRESENT', 33, 30), ('2025-01-19', 'PRESENT', 34, 30), ('2025-01-19', 'ABSENT', 35, 30), ('2025-01-19', 'ABSENT', 36, 30), ('2025-01-19', 'PRESENT', 37, 30), ('2025-01-19', 'PRESENT', 38, 30), ('2025-01-19', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'ABSENT', 40, 40), ('2025-01-19', 'PRESENT', 41, 40), ('2025-01-19', 'PRESENT', 42, 40), ('2025-01-19', 'PRESENT', 43, 40), ('2025-01-19', 'PRESENT', 44, 40), ('2025-01-19', 'PRESENT', 45, 40), ('2025-01-19', 'PRESENT', 46, 40), ('2025-01-19', 'PRESENT', 47, 40), ('2025-01-19', 'ABSENT', 48, 40), ('2025-01-19', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'ABSENT', 50, 50), ('2025-01-19', 'PRESENT', 51, 50), ('2025-01-19', 'PRESENT', 52, 50), ('2025-01-19', 'PRESENT', 53, 50), ('2025-01-19', 'PRESENT', 54, 50), ('2025-01-19', 'PRESENT', 55, 50), ('2025-01-19', 'PRESENT', 56, 50), ('2025-01-19', 'PRESENT', 57, 50), ('2025-01-19', 'PRESENT', 58, 50), ('2025-01-19', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'PRESENT', 60, 60), ('2025-01-19', 'PRESENT', 61, 60), ('2025-01-19', 'PRESENT', 62, 60), ('2025-01-19', 'PRESENT', 63, 60), ('2025-01-19', 'PRESENT', 64, 60), ('2025-01-19', 'ABSENT', 65, 60), ('2025-01-19', 'PRESENT', 66, 60), ('2025-01-19', 'ABSENT', 67, 60), ('2025-01-19', 'PRESENT', 68, 60), ('2025-01-19', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'PRESENT', 70, 70), ('2025-01-19', 'PRESENT', 71, 70), ('2025-01-19', 'ABSENT', 72, 70), ('2025-01-19', 'PRESENT', 73, 70), ('2025-01-19', 'ABSENT', 74, 70), ('2025-01-19', 'ABSENT', 75, 70), ('2025-01-19', 'PRESENT', 76, 70), ('2025-01-19', 'PRESENT', 77, 70), ('2025-01-19', 'ABSENT', 78, 70), ('2025-01-19', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'ABSENT', 80, 80), ('2025-01-19', 'PRESENT', 81, 80), ('2025-01-19', 'ABSENT', 82, 80), ('2025-01-19', 'PRESENT', 83, 80), ('2025-01-19', 'PRESENT', 84, 80), ('2025-01-19', 'PRESENT', 85, 80), ('2025-01-19', 'ABSENT', 86, 80), ('2025-01-19', 'PRESENT', 87, 80), ('2025-01-19', 'ABSENT', 88, 80), ('2025-01-19', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'ABSENT', 90, 90), ('2025-01-19', 'PRESENT', 91, 90), ('2025-01-19', 'ABSENT', 92, 90), ('2025-01-19', 'PRESENT', 93, 90), ('2025-01-19', 'PRESENT', 94, 90), ('2025-01-19', 'PRESENT', 95, 90), ('2025-01-19', 'PRESENT', 96, 90), ('2025-01-19', 'PRESENT', 97, 90), ('2025-01-19', 'PRESENT', 98, 90), ('2025-01-19', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-01-19', '2025-01-19 주일 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-19', 'PRESENT', 100, 100), ('2025-01-19', 'ABSENT', 101, 100), ('2025-01-19', 'PRESENT', 102, 100), ('2025-01-19', 'PRESENT', 103, 100), ('2025-01-19', 'ABSENT', 104, 100), ('2025-01-19', 'ABSENT', 105, 100), ('2025-01-19', 'PRESENT', 106, 100), ('2025-01-19', 'ABSENT', 107, 100), ('2025-01-19', 'ABSENT', 108, 100), ('2025-01-19', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'ABSENT', 10, 10), ('2025-01-26', 'PRESENT', 11, 10), ('2025-01-26', 'PRESENT', 12, 10), ('2025-01-26', 'PRESENT', 13, 10), ('2025-01-26', 'ABSENT', 14, 10), ('2025-01-26', 'PRESENT', 15, 10), ('2025-01-26', 'PRESENT', 16, 10), ('2025-01-26', 'PRESENT', 17, 10), ('2025-01-26', 'ABSENT', 18, 10), ('2025-01-26', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'ABSENT', 20, 20), ('2025-01-26', 'PRESENT', 21, 20), ('2025-01-26', 'ABSENT', 22, 20), ('2025-01-26', 'PRESENT', 23, 20), ('2025-01-26', 'PRESENT', 24, 20), ('2025-01-26', 'ABSENT', 25, 20), ('2025-01-26', 'PRESENT', 26, 20), ('2025-01-26', 'PRESENT', 27, 20), ('2025-01-26', 'ABSENT', 28, 20), ('2025-01-26', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'PRESENT', 30, 30), ('2025-01-26', 'PRESENT', 31, 30), ('2025-01-26', 'ABSENT', 32, 30), ('2025-01-26', 'PRESENT', 33, 30), ('2025-01-26', 'PRESENT', 34, 30), ('2025-01-26', 'ABSENT', 35, 30), ('2025-01-26', 'PRESENT', 36, 30), ('2025-01-26', 'ABSENT', 37, 30), ('2025-01-26', 'PRESENT', 38, 30), ('2025-01-26', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'ABSENT', 40, 40), ('2025-01-26', 'PRESENT', 41, 40), ('2025-01-26', 'PRESENT', 42, 40), ('2025-01-26', 'PRESENT', 43, 40), ('2025-01-26', 'PRESENT', 44, 40), ('2025-01-26', 'ABSENT', 45, 40), ('2025-01-26', 'PRESENT', 46, 40), ('2025-01-26', 'PRESENT', 47, 40), ('2025-01-26', 'ABSENT', 48, 40), ('2025-01-26', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'PRESENT', 50, 50), ('2025-01-26', 'PRESENT', 51, 50), ('2025-01-26', 'ABSENT', 52, 50), ('2025-01-26', 'PRESENT', 53, 50), ('2025-01-26', 'PRESENT', 54, 50), ('2025-01-26', 'ABSENT', 55, 50), ('2025-01-26', 'ABSENT', 56, 50), ('2025-01-26', 'PRESENT', 57, 50), ('2025-01-26', 'PRESENT', 58, 50), ('2025-01-26', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'ABSENT', 60, 60), ('2025-01-26', 'ABSENT', 61, 60), ('2025-01-26', 'PRESENT', 62, 60), ('2025-01-26', 'PRESENT', 63, 60), ('2025-01-26', 'PRESENT', 64, 60), ('2025-01-26', 'PRESENT', 65, 60), ('2025-01-26', 'PRESENT', 66, 60), ('2025-01-26', 'PRESENT', 67, 60), ('2025-01-26', 'PRESENT', 68, 60), ('2025-01-26', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'ABSENT', 70, 70), ('2025-01-26', 'PRESENT', 71, 70), ('2025-01-26', 'PRESENT', 72, 70), ('2025-01-26', 'PRESENT', 73, 70), ('2025-01-26', 'PRESENT', 74, 70), ('2025-01-26', 'ABSENT', 75, 70), ('2025-01-26', 'PRESENT', 76, 70), ('2025-01-26', 'ABSENT', 77, 70), ('2025-01-26', 'PRESENT', 78, 70), ('2025-01-26', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'ABSENT', 80, 80), ('2025-01-26', 'PRESENT', 81, 80), ('2025-01-26', 'PRESENT', 82, 80), ('2025-01-26', 'PRESENT', 83, 80), ('2025-01-26', 'PRESENT', 84, 80), ('2025-01-26', 'PRESENT', 85, 80), ('2025-01-26', 'PRESENT', 86, 80), ('2025-01-26', 'PRESENT', 87, 80), ('2025-01-26', 'PRESENT', 88, 80), ('2025-01-26', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'PRESENT', 90, 90), ('2025-01-26', 'PRESENT', 91, 90), ('2025-01-26', 'PRESENT', 92, 90), ('2025-01-26', 'ABSENT', 93, 90), ('2025-01-26', 'PRESENT', 94, 90), ('2025-01-26', 'ABSENT', 95, 90), ('2025-01-26', 'ABSENT', 96, 90), ('2025-01-26', 'PRESENT', 97, 90), ('2025-01-26', 'PRESENT', 98, 90), ('2025-01-26', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-01-26', '2025-01-26 주일 나눔입니다.', '', '2025-01-26 16:00:00', '2025-01-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-01-26', 'PRESENT', 100, 100), ('2025-01-26', 'PRESENT', 101, 100), ('2025-01-26', 'PRESENT', 102, 100), ('2025-01-26', 'PRESENT', 103, 100), ('2025-01-26', 'PRESENT', 104, 100), ('2025-01-26', 'PRESENT', 105, 100), ('2025-01-26', 'PRESENT', 106, 100), ('2025-01-26', 'PRESENT', 107, 100), ('2025-01-26', 'PRESENT', 108, 100), ('2025-01-26', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 10, 10), ('2025-02-02', 'PRESENT', 11, 10), ('2025-02-02', 'PRESENT', 12, 10), ('2025-02-02', 'ABSENT', 13, 10), ('2025-02-02', 'PRESENT', 14, 10), ('2025-02-02', 'PRESENT', 15, 10), ('2025-02-02', 'ABSENT', 16, 10), ('2025-02-02', 'PRESENT', 17, 10), ('2025-02-02', 'PRESENT', 18, 10), ('2025-02-02', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 20, 20), ('2025-02-02', 'PRESENT', 21, 20), ('2025-02-02', 'PRESENT', 22, 20), ('2025-02-02', 'PRESENT', 23, 20), ('2025-02-02', 'PRESENT', 24, 20), ('2025-02-02', 'ABSENT', 25, 20), ('2025-02-02', 'PRESENT', 26, 20), ('2025-02-02', 'PRESENT', 27, 20), ('2025-02-02', 'PRESENT', 28, 20), ('2025-02-02', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 30, 30), ('2025-02-02', 'PRESENT', 31, 30), ('2025-02-02', 'PRESENT', 32, 30), ('2025-02-02', 'PRESENT', 33, 30), ('2025-02-02', 'PRESENT', 34, 30), ('2025-02-02', 'PRESENT', 35, 30), ('2025-02-02', 'PRESENT', 36, 30), ('2025-02-02', 'PRESENT', 37, 30), ('2025-02-02', 'PRESENT', 38, 30), ('2025-02-02', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'PRESENT', 40, 40), ('2025-02-02', 'PRESENT', 41, 40), ('2025-02-02', 'PRESENT', 42, 40), ('2025-02-02', 'PRESENT', 43, 40), ('2025-02-02', 'PRESENT', 44, 40), ('2025-02-02', 'ABSENT', 45, 40), ('2025-02-02', 'PRESENT', 46, 40), ('2025-02-02', 'ABSENT', 47, 40), ('2025-02-02', 'PRESENT', 48, 40), ('2025-02-02', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 50, 50), ('2025-02-02', 'PRESENT', 51, 50), ('2025-02-02', 'PRESENT', 52, 50), ('2025-02-02', 'ABSENT', 53, 50), ('2025-02-02', 'PRESENT', 54, 50), ('2025-02-02', 'PRESENT', 55, 50), ('2025-02-02', 'PRESENT', 56, 50), ('2025-02-02', 'PRESENT', 57, 50), ('2025-02-02', 'PRESENT', 58, 50), ('2025-02-02', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 60, 60), ('2025-02-02', 'PRESENT', 61, 60), ('2025-02-02', 'ABSENT', 62, 60), ('2025-02-02', 'PRESENT', 63, 60), ('2025-02-02', 'PRESENT', 64, 60), ('2025-02-02', 'PRESENT', 65, 60), ('2025-02-02', 'PRESENT', 66, 60), ('2025-02-02', 'ABSENT', 67, 60), ('2025-02-02', 'ABSENT', 68, 60), ('2025-02-02', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'PRESENT', 70, 70), ('2025-02-02', 'PRESENT', 71, 70), ('2025-02-02', 'PRESENT', 72, 70), ('2025-02-02', 'PRESENT', 73, 70), ('2025-02-02', 'PRESENT', 74, 70), ('2025-02-02', 'PRESENT', 75, 70), ('2025-02-02', 'PRESENT', 76, 70), ('2025-02-02', 'PRESENT', 77, 70), ('2025-02-02', 'ABSENT', 78, 70), ('2025-02-02', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 80, 80), ('2025-02-02', 'ABSENT', 81, 80), ('2025-02-02', 'PRESENT', 82, 80), ('2025-02-02', 'PRESENT', 83, 80), ('2025-02-02', 'ABSENT', 84, 80), ('2025-02-02', 'ABSENT', 85, 80), ('2025-02-02', 'PRESENT', 86, 80), ('2025-02-02', 'PRESENT', 87, 80), ('2025-02-02', 'PRESENT', 88, 80), ('2025-02-02', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 90, 90), ('2025-02-02', 'PRESENT', 91, 90), ('2025-02-02', 'PRESENT', 92, 90), ('2025-02-02', 'PRESENT', 93, 90), ('2025-02-02', 'ABSENT', 94, 90), ('2025-02-02', 'ABSENT', 95, 90), ('2025-02-02', 'ABSENT', 96, 90), ('2025-02-02', 'ABSENT', 97, 90), ('2025-02-02', 'PRESENT', 98, 90), ('2025-02-02', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-02-02', '2025-02-02 주일 나눔입니다.', '', '2025-02-02 16:00:00', '2025-02-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-02', 'ABSENT', 100, 100), ('2025-02-02', 'PRESENT', 101, 100), ('2025-02-02', 'PRESENT', 102, 100), ('2025-02-02', 'PRESENT', 103, 100), ('2025-02-02', 'PRESENT', 104, 100), ('2025-02-02', 'PRESENT', 105, 100), ('2025-02-02', 'PRESENT', 106, 100), ('2025-02-02', 'PRESENT', 107, 100), ('2025-02-02', 'PRESENT', 108, 100), ('2025-02-02', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'PRESENT', 10, 10), ('2025-02-09', 'PRESENT', 11, 10), ('2025-02-09', 'PRESENT', 12, 10), ('2025-02-09', 'PRESENT', 13, 10), ('2025-02-09', 'ABSENT', 14, 10), ('2025-02-09', 'ABSENT', 15, 10), ('2025-02-09', 'PRESENT', 16, 10), ('2025-02-09', 'ABSENT', 17, 10), ('2025-02-09', 'PRESENT', 18, 10), ('2025-02-09', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 20, 20), ('2025-02-09', 'PRESENT', 21, 20), ('2025-02-09', 'PRESENT', 22, 20), ('2025-02-09', 'PRESENT', 23, 20), ('2025-02-09', 'PRESENT', 24, 20), ('2025-02-09', 'PRESENT', 25, 20), ('2025-02-09', 'ABSENT', 26, 20), ('2025-02-09', 'PRESENT', 27, 20), ('2025-02-09', 'ABSENT', 28, 20), ('2025-02-09', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 30, 30), ('2025-02-09', 'PRESENT', 31, 30), ('2025-02-09', 'PRESENT', 32, 30), ('2025-02-09', 'PRESENT', 33, 30), ('2025-02-09', 'PRESENT', 34, 30), ('2025-02-09', 'ABSENT', 35, 30), ('2025-02-09', 'PRESENT', 36, 30), ('2025-02-09', 'ABSENT', 37, 30), ('2025-02-09', 'PRESENT', 38, 30), ('2025-02-09', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 40, 40), ('2025-02-09', 'PRESENT', 41, 40), ('2025-02-09', 'PRESENT', 42, 40), ('2025-02-09', 'PRESENT', 43, 40), ('2025-02-09', 'PRESENT', 44, 40), ('2025-02-09', 'PRESENT', 45, 40), ('2025-02-09', 'PRESENT', 46, 40), ('2025-02-09', 'PRESENT', 47, 40), ('2025-02-09', 'ABSENT', 48, 40), ('2025-02-09', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 50, 50), ('2025-02-09', 'PRESENT', 51, 50), ('2025-02-09', 'PRESENT', 52, 50), ('2025-02-09', 'PRESENT', 53, 50), ('2025-02-09', 'PRESENT', 54, 50), ('2025-02-09', 'ABSENT', 55, 50), ('2025-02-09', 'PRESENT', 56, 50), ('2025-02-09', 'ABSENT', 57, 50), ('2025-02-09', 'PRESENT', 58, 50), ('2025-02-09', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 60, 60), ('2025-02-09', 'PRESENT', 61, 60), ('2025-02-09', 'PRESENT', 62, 60), ('2025-02-09', 'PRESENT', 63, 60), ('2025-02-09', 'ABSENT', 64, 60), ('2025-02-09', 'PRESENT', 65, 60), ('2025-02-09', 'PRESENT', 66, 60), ('2025-02-09', 'PRESENT', 67, 60), ('2025-02-09', 'PRESENT', 68, 60), ('2025-02-09', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 70, 70), ('2025-02-09', 'PRESENT', 71, 70), ('2025-02-09', 'PRESENT', 72, 70), ('2025-02-09', 'ABSENT', 73, 70), ('2025-02-09', 'PRESENT', 74, 70), ('2025-02-09', 'ABSENT', 75, 70), ('2025-02-09', 'ABSENT', 76, 70), ('2025-02-09', 'PRESENT', 77, 70), ('2025-02-09', 'PRESENT', 78, 70), ('2025-02-09', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'PRESENT', 80, 80), ('2025-02-09', 'PRESENT', 81, 80), ('2025-02-09', 'ABSENT', 82, 80), ('2025-02-09', 'PRESENT', 83, 80), ('2025-02-09', 'PRESENT', 84, 80), ('2025-02-09', 'PRESENT', 85, 80), ('2025-02-09', 'PRESENT', 86, 80), ('2025-02-09', 'PRESENT', 87, 80), ('2025-02-09', 'PRESENT', 88, 80), ('2025-02-09', 'ABSENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'ABSENT', 90, 90), ('2025-02-09', 'PRESENT', 91, 90), ('2025-02-09', 'PRESENT', 92, 90), ('2025-02-09', 'PRESENT', 93, 90), ('2025-02-09', 'ABSENT', 94, 90), ('2025-02-09', 'PRESENT', 95, 90), ('2025-02-09', 'PRESENT', 96, 90), ('2025-02-09', 'PRESENT', 97, 90), ('2025-02-09', 'PRESENT', 98, 90), ('2025-02-09', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-02-09', '2025-02-09 주일 나눔입니다.', '', '2025-02-09 16:00:00', '2025-02-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-09', 'PRESENT', 100, 100), ('2025-02-09', 'PRESENT', 101, 100), ('2025-02-09', 'PRESENT', 102, 100), ('2025-02-09', 'PRESENT', 103, 100), ('2025-02-09', 'PRESENT', 104, 100), ('2025-02-09', 'ABSENT', 105, 100), ('2025-02-09', 'PRESENT', 106, 100), ('2025-02-09', 'PRESENT', 107, 100), ('2025-02-09', 'PRESENT', 108, 100), ('2025-02-09', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 10, 10), ('2025-02-16', 'PRESENT', 11, 10), ('2025-02-16', 'PRESENT', 12, 10), ('2025-02-16', 'PRESENT', 13, 10), ('2025-02-16', 'PRESENT', 14, 10), ('2025-02-16', 'PRESENT', 15, 10), ('2025-02-16', 'PRESENT', 16, 10), ('2025-02-16', 'ABSENT', 17, 10), ('2025-02-16', 'ABSENT', 18, 10), ('2025-02-16', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'PRESENT', 20, 20), ('2025-02-16', 'PRESENT', 21, 20), ('2025-02-16', 'PRESENT', 22, 20), ('2025-02-16', 'PRESENT', 23, 20), ('2025-02-16', 'PRESENT', 24, 20), ('2025-02-16', 'PRESENT', 25, 20), ('2025-02-16', 'PRESENT', 26, 20), ('2025-02-16', 'PRESENT', 27, 20), ('2025-02-16', 'PRESENT', 28, 20), ('2025-02-16', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 30, 30), ('2025-02-16', 'PRESENT', 31, 30), ('2025-02-16', 'PRESENT', 32, 30), ('2025-02-16', 'PRESENT', 33, 30), ('2025-02-16', 'ABSENT', 34, 30), ('2025-02-16', 'ABSENT', 35, 30), ('2025-02-16', 'PRESENT', 36, 30), ('2025-02-16', 'PRESENT', 37, 30), ('2025-02-16', 'PRESENT', 38, 30), ('2025-02-16', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'PRESENT', 40, 40), ('2025-02-16', 'PRESENT', 41, 40), ('2025-02-16', 'PRESENT', 42, 40), ('2025-02-16', 'PRESENT', 43, 40), ('2025-02-16', 'PRESENT', 44, 40), ('2025-02-16', 'ABSENT', 45, 40), ('2025-02-16', 'ABSENT', 46, 40), ('2025-02-16', 'PRESENT', 47, 40), ('2025-02-16', 'PRESENT', 48, 40), ('2025-02-16', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 50, 50), ('2025-02-16', 'PRESENT', 51, 50), ('2025-02-16', 'PRESENT', 52, 50), ('2025-02-16', 'ABSENT', 53, 50), ('2025-02-16', 'PRESENT', 54, 50), ('2025-02-16', 'PRESENT', 55, 50), ('2025-02-16', 'ABSENT', 56, 50), ('2025-02-16', 'ABSENT', 57, 50), ('2025-02-16', 'ABSENT', 58, 50), ('2025-02-16', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 60, 60), ('2025-02-16', 'PRESENT', 61, 60), ('2025-02-16', 'PRESENT', 62, 60), ('2025-02-16', 'PRESENT', 63, 60), ('2025-02-16', 'PRESENT', 64, 60), ('2025-02-16', 'ABSENT', 65, 60), ('2025-02-16', 'PRESENT', 66, 60), ('2025-02-16', 'PRESENT', 67, 60), ('2025-02-16', 'PRESENT', 68, 60), ('2025-02-16', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 70, 70), ('2025-02-16', 'PRESENT', 71, 70), ('2025-02-16', 'PRESENT', 72, 70), ('2025-02-16', 'PRESENT', 73, 70), ('2025-02-16', 'PRESENT', 74, 70), ('2025-02-16', 'PRESENT', 75, 70), ('2025-02-16', 'PRESENT', 76, 70), ('2025-02-16', 'PRESENT', 77, 70), ('2025-02-16', 'PRESENT', 78, 70), ('2025-02-16', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 80, 80), ('2025-02-16', 'ABSENT', 81, 80), ('2025-02-16', 'PRESENT', 82, 80), ('2025-02-16', 'ABSENT', 83, 80), ('2025-02-16', 'PRESENT', 84, 80), ('2025-02-16', 'ABSENT', 85, 80), ('2025-02-16', 'PRESENT', 86, 80), ('2025-02-16', 'PRESENT', 87, 80), ('2025-02-16', 'PRESENT', 88, 80), ('2025-02-16', 'ABSENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'PRESENT', 90, 90), ('2025-02-16', 'ABSENT', 91, 90), ('2025-02-16', 'PRESENT', 92, 90), ('2025-02-16', 'PRESENT', 93, 90), ('2025-02-16', 'PRESENT', 94, 90), ('2025-02-16', 'ABSENT', 95, 90), ('2025-02-16', 'PRESENT', 96, 90), ('2025-02-16', 'PRESENT', 97, 90), ('2025-02-16', 'ABSENT', 98, 90), ('2025-02-16', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-02-16', '2025-02-16 주일 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-16', 'ABSENT', 100, 100), ('2025-02-16', 'PRESENT', 101, 100), ('2025-02-16', 'ABSENT', 102, 100), ('2025-02-16', 'ABSENT', 103, 100), ('2025-02-16', 'ABSENT', 104, 100), ('2025-02-16', 'ABSENT', 105, 100), ('2025-02-16', 'ABSENT', 106, 100), ('2025-02-16', 'PRESENT', 107, 100), ('2025-02-16', 'PRESENT', 108, 100), ('2025-02-16', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'ABSENT', 10, 10), ('2025-02-23', 'PRESENT', 11, 10), ('2025-02-23', 'PRESENT', 12, 10), ('2025-02-23', 'PRESENT', 13, 10), ('2025-02-23', 'PRESENT', 14, 10), ('2025-02-23', 'ABSENT', 15, 10), ('2025-02-23', 'ABSENT', 16, 10), ('2025-02-23', 'PRESENT', 17, 10), ('2025-02-23', 'PRESENT', 18, 10), ('2025-02-23', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'ABSENT', 20, 20), ('2025-02-23', 'PRESENT', 21, 20), ('2025-02-23', 'ABSENT', 22, 20), ('2025-02-23', 'PRESENT', 23, 20), ('2025-02-23', 'PRESENT', 24, 20), ('2025-02-23', 'ABSENT', 25, 20), ('2025-02-23', 'ABSENT', 26, 20), ('2025-02-23', 'PRESENT', 27, 20), ('2025-02-23', 'PRESENT', 28, 20), ('2025-02-23', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'PRESENT', 30, 30), ('2025-02-23', 'PRESENT', 31, 30), ('2025-02-23', 'PRESENT', 32, 30), ('2025-02-23', 'PRESENT', 33, 30), ('2025-02-23', 'PRESENT', 34, 30), ('2025-02-23', 'ABSENT', 35, 30), ('2025-02-23', 'PRESENT', 36, 30), ('2025-02-23', 'PRESENT', 37, 30), ('2025-02-23', 'PRESENT', 38, 30), ('2025-02-23', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'ABSENT', 40, 40), ('2025-02-23', 'PRESENT', 41, 40), ('2025-02-23', 'PRESENT', 42, 40), ('2025-02-23', 'PRESENT', 43, 40), ('2025-02-23', 'PRESENT', 44, 40), ('2025-02-23', 'PRESENT', 45, 40), ('2025-02-23', 'PRESENT', 46, 40), ('2025-02-23', 'PRESENT', 47, 40), ('2025-02-23', 'ABSENT', 48, 40), ('2025-02-23', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'PRESENT', 50, 50), ('2025-02-23', 'PRESENT', 51, 50), ('2025-02-23', 'PRESENT', 52, 50), ('2025-02-23', 'PRESENT', 53, 50), ('2025-02-23', 'PRESENT', 54, 50), ('2025-02-23', 'ABSENT', 55, 50), ('2025-02-23', 'PRESENT', 56, 50), ('2025-02-23', 'PRESENT', 57, 50), ('2025-02-23', 'PRESENT', 58, 50), ('2025-02-23', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'PRESENT', 60, 60), ('2025-02-23', 'PRESENT', 61, 60), ('2025-02-23', 'PRESENT', 62, 60), ('2025-02-23', 'PRESENT', 63, 60), ('2025-02-23', 'PRESENT', 64, 60), ('2025-02-23', 'ABSENT', 65, 60), ('2025-02-23', 'ABSENT', 66, 60), ('2025-02-23', 'PRESENT', 67, 60), ('2025-02-23', 'PRESENT', 68, 60), ('2025-02-23', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'ABSENT', 70, 70), ('2025-02-23', 'PRESENT', 71, 70), ('2025-02-23', 'PRESENT', 72, 70), ('2025-02-23', 'PRESENT', 73, 70), ('2025-02-23', 'PRESENT', 74, 70), ('2025-02-23', 'PRESENT', 75, 70), ('2025-02-23', 'ABSENT', 76, 70), ('2025-02-23', 'PRESENT', 77, 70), ('2025-02-23', 'PRESENT', 78, 70), ('2025-02-23', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'PRESENT', 80, 80), ('2025-02-23', 'PRESENT', 81, 80), ('2025-02-23', 'PRESENT', 82, 80), ('2025-02-23', 'PRESENT', 83, 80), ('2025-02-23', 'PRESENT', 84, 80), ('2025-02-23', 'ABSENT', 85, 80), ('2025-02-23', 'PRESENT', 86, 80), ('2025-02-23', 'ABSENT', 87, 80), ('2025-02-23', 'PRESENT', 88, 80), ('2025-02-23', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'ABSENT', 90, 90), ('2025-02-23', 'PRESENT', 91, 90), ('2025-02-23', 'PRESENT', 92, 90), ('2025-02-23', 'PRESENT', 93, 90), ('2025-02-23', 'PRESENT', 94, 90), ('2025-02-23', 'PRESENT', 95, 90), ('2025-02-23', 'PRESENT', 96, 90), ('2025-02-23', 'PRESENT', 97, 90), ('2025-02-23', 'ABSENT', 98, 90), ('2025-02-23', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-02-23', '2025-02-23 주일 나눔입니다.', '', '2025-02-23 16:00:00', '2025-02-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-02-23', 'ABSENT', 100, 100), ('2025-02-23', 'PRESENT', 101, 100), ('2025-02-23', 'PRESENT', 102, 100), ('2025-02-23', 'ABSENT', 103, 100), ('2025-02-23', 'PRESENT', 104, 100), ('2025-02-23', 'ABSENT', 105, 100), ('2025-02-23', 'PRESENT', 106, 100), ('2025-02-23', 'PRESENT', 107, 100), ('2025-02-23', 'ABSENT', 108, 100), ('2025-02-23', 'ABSENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 10, 10), ('2025-03-02', 'PRESENT', 11, 10), ('2025-03-02', 'PRESENT', 12, 10), ('2025-03-02', 'PRESENT', 13, 10), ('2025-03-02', 'PRESENT', 14, 10), ('2025-03-02', 'ABSENT', 15, 10), ('2025-03-02', 'ABSENT', 16, 10), ('2025-03-02', 'PRESENT', 17, 10), ('2025-03-02', 'PRESENT', 18, 10), ('2025-03-02', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 20, 20), ('2025-03-02', 'PRESENT', 21, 20), ('2025-03-02', 'PRESENT', 22, 20), ('2025-03-02', 'PRESENT', 23, 20), ('2025-03-02', 'PRESENT', 24, 20), ('2025-03-02', 'ABSENT', 25, 20), ('2025-03-02', 'PRESENT', 26, 20), ('2025-03-02', 'PRESENT', 27, 20), ('2025-03-02', 'PRESENT', 28, 20), ('2025-03-02', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 30, 30), ('2025-03-02', 'PRESENT', 31, 30), ('2025-03-02', 'PRESENT', 32, 30), ('2025-03-02', 'PRESENT', 33, 30), ('2025-03-02', 'PRESENT', 34, 30), ('2025-03-02', 'ABSENT', 35, 30), ('2025-03-02', 'PRESENT', 36, 30), ('2025-03-02', 'PRESENT', 37, 30), ('2025-03-02', 'PRESENT', 38, 30), ('2025-03-02', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 40, 40), ('2025-03-02', 'PRESENT', 41, 40), ('2025-03-02', 'ABSENT', 42, 40), ('2025-03-02', 'PRESENT', 43, 40), ('2025-03-02', 'PRESENT', 44, 40), ('2025-03-02', 'ABSENT', 45, 40), ('2025-03-02', 'PRESENT', 46, 40), ('2025-03-02', 'PRESENT', 47, 40), ('2025-03-02', 'PRESENT', 48, 40), ('2025-03-02', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'PRESENT', 50, 50), ('2025-03-02', 'PRESENT', 51, 50), ('2025-03-02', 'PRESENT', 52, 50), ('2025-03-02', 'PRESENT', 53, 50), ('2025-03-02', 'PRESENT', 54, 50), ('2025-03-02', 'PRESENT', 55, 50), ('2025-03-02', 'ABSENT', 56, 50), ('2025-03-02', 'ABSENT', 57, 50), ('2025-03-02', 'PRESENT', 58, 50), ('2025-03-02', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 60, 60), ('2025-03-02', 'ABSENT', 61, 60), ('2025-03-02', 'PRESENT', 62, 60), ('2025-03-02', 'PRESENT', 63, 60), ('2025-03-02', 'ABSENT', 64, 60), ('2025-03-02', 'PRESENT', 65, 60), ('2025-03-02', 'PRESENT', 66, 60), ('2025-03-02', 'PRESENT', 67, 60), ('2025-03-02', 'PRESENT', 68, 60), ('2025-03-02', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 70, 70), ('2025-03-02', 'PRESENT', 71, 70), ('2025-03-02', 'PRESENT', 72, 70), ('2025-03-02', 'PRESENT', 73, 70), ('2025-03-02', 'PRESENT', 74, 70), ('2025-03-02', 'PRESENT', 75, 70), ('2025-03-02', 'PRESENT', 76, 70), ('2025-03-02', 'PRESENT', 77, 70), ('2025-03-02', 'PRESENT', 78, 70), ('2025-03-02', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'PRESENT', 80, 80), ('2025-03-02', 'PRESENT', 81, 80), ('2025-03-02', 'PRESENT', 82, 80), ('2025-03-02', 'PRESENT', 83, 80), ('2025-03-02', 'PRESENT', 84, 80), ('2025-03-02', 'ABSENT', 85, 80), ('2025-03-02', 'PRESENT', 86, 80), ('2025-03-02', 'PRESENT', 87, 80), ('2025-03-02', 'PRESENT', 88, 80), ('2025-03-02', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'ABSENT', 90, 90), ('2025-03-02', 'PRESENT', 91, 90), ('2025-03-02', 'PRESENT', 92, 90), ('2025-03-02', 'ABSENT', 93, 90), ('2025-03-02', 'PRESENT', 94, 90), ('2025-03-02', 'PRESENT', 95, 90), ('2025-03-02', 'PRESENT', 96, 90), ('2025-03-02', 'PRESENT', 97, 90), ('2025-03-02', 'PRESENT', 98, 90), ('2025-03-02', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-03-02', '2025-03-02 주일 나눔입니다.', '', '2025-03-02 16:00:00', '2025-03-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-02', 'PRESENT', 100, 100), ('2025-03-02', 'PRESENT', 101, 100), ('2025-03-02', 'PRESENT', 102, 100), ('2025-03-02', 'PRESENT', 103, 100), ('2025-03-02', 'PRESENT', 104, 100), ('2025-03-02', 'ABSENT', 105, 100), ('2025-03-02', 'ABSENT', 106, 100), ('2025-03-02', 'PRESENT', 107, 100), ('2025-03-02', 'PRESENT', 108, 100), ('2025-03-02', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'PRESENT', 10, 10), ('2025-03-09', 'PRESENT', 11, 10), ('2025-03-09', 'PRESENT', 12, 10), ('2025-03-09', 'PRESENT', 13, 10), ('2025-03-09', 'PRESENT', 14, 10), ('2025-03-09', 'PRESENT', 15, 10), ('2025-03-09', 'ABSENT', 16, 10), ('2025-03-09', 'PRESENT', 17, 10), ('2025-03-09', 'ABSENT', 18, 10), ('2025-03-09', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'ABSENT', 20, 20), ('2025-03-09', 'PRESENT', 21, 20), ('2025-03-09', 'PRESENT', 22, 20), ('2025-03-09', 'PRESENT', 23, 20), ('2025-03-09', 'PRESENT', 24, 20), ('2025-03-09', 'ABSENT', 25, 20), ('2025-03-09', 'PRESENT', 26, 20), ('2025-03-09', 'PRESENT', 27, 20), ('2025-03-09', 'PRESENT', 28, 20), ('2025-03-09', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'PRESENT', 30, 30), ('2025-03-09', 'PRESENT', 31, 30), ('2025-03-09', 'PRESENT', 32, 30), ('2025-03-09', 'PRESENT', 33, 30), ('2025-03-09', 'PRESENT', 34, 30), ('2025-03-09', 'ABSENT', 35, 30), ('2025-03-09', 'PRESENT', 36, 30), ('2025-03-09', 'PRESENT', 37, 30), ('2025-03-09', 'ABSENT', 38, 30), ('2025-03-09', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'PRESENT', 40, 40), ('2025-03-09', 'ABSENT', 41, 40), ('2025-03-09', 'PRESENT', 42, 40), ('2025-03-09', 'ABSENT', 43, 40), ('2025-03-09', 'PRESENT', 44, 40), ('2025-03-09', 'PRESENT', 45, 40), ('2025-03-09', 'PRESENT', 46, 40), ('2025-03-09', 'PRESENT', 47, 40), ('2025-03-09', 'PRESENT', 48, 40), ('2025-03-09', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'ABSENT', 50, 50), ('2025-03-09', 'PRESENT', 51, 50), ('2025-03-09', 'PRESENT', 52, 50), ('2025-03-09', 'ABSENT', 53, 50), ('2025-03-09', 'PRESENT', 54, 50), ('2025-03-09', 'PRESENT', 55, 50), ('2025-03-09', 'PRESENT', 56, 50), ('2025-03-09', 'PRESENT', 57, 50), ('2025-03-09', 'PRESENT', 58, 50), ('2025-03-09', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'ABSENT', 60, 60), ('2025-03-09', 'PRESENT', 61, 60), ('2025-03-09', 'PRESENT', 62, 60), ('2025-03-09', 'PRESENT', 63, 60), ('2025-03-09', 'PRESENT', 64, 60), ('2025-03-09', 'PRESENT', 65, 60), ('2025-03-09', 'PRESENT', 66, 60), ('2025-03-09', 'PRESENT', 67, 60), ('2025-03-09', 'PRESENT', 68, 60), ('2025-03-09', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'PRESENT', 70, 70), ('2025-03-09', 'PRESENT', 71, 70), ('2025-03-09', 'PRESENT', 72, 70), ('2025-03-09', 'PRESENT', 73, 70), ('2025-03-09', 'PRESENT', 74, 70), ('2025-03-09', 'ABSENT', 75, 70), ('2025-03-09', 'ABSENT', 76, 70), ('2025-03-09', 'PRESENT', 77, 70), ('2025-03-09', 'PRESENT', 78, 70), ('2025-03-09', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'PRESENT', 80, 80), ('2025-03-09', 'PRESENT', 81, 80), ('2025-03-09', 'PRESENT', 82, 80), ('2025-03-09', 'PRESENT', 83, 80), ('2025-03-09', 'PRESENT', 84, 80), ('2025-03-09', 'ABSENT', 85, 80), ('2025-03-09', 'PRESENT', 86, 80), ('2025-03-09', 'PRESENT', 87, 80), ('2025-03-09', 'PRESENT', 88, 80), ('2025-03-09', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'PRESENT', 90, 90), ('2025-03-09', 'ABSENT', 91, 90), ('2025-03-09', 'ABSENT', 92, 90), ('2025-03-09', 'PRESENT', 93, 90), ('2025-03-09', 'PRESENT', 94, 90), ('2025-03-09', 'PRESENT', 95, 90), ('2025-03-09', 'PRESENT', 96, 90), ('2025-03-09', 'PRESENT', 97, 90), ('2025-03-09', 'PRESENT', 98, 90), ('2025-03-09', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-03-09', '2025-03-09 주일 나눔입니다.', '', '2025-03-09 16:00:00', '2025-03-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-09', 'ABSENT', 100, 100), ('2025-03-09', 'PRESENT', 101, 100), ('2025-03-09', 'PRESENT', 102, 100), ('2025-03-09', 'PRESENT', 103, 100), ('2025-03-09', 'PRESENT', 104, 100), ('2025-03-09', 'PRESENT', 105, 100), ('2025-03-09', 'PRESENT', 106, 100), ('2025-03-09', 'PRESENT', 107, 100), ('2025-03-09', 'PRESENT', 108, 100), ('2025-03-09', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 10, 10), ('2025-03-16', 'ABSENT', 11, 10), ('2025-03-16', 'PRESENT', 12, 10), ('2025-03-16', 'PRESENT', 13, 10), ('2025-03-16', 'PRESENT', 14, 10), ('2025-03-16', 'ABSENT', 15, 10), ('2025-03-16', 'ABSENT', 16, 10), ('2025-03-16', 'PRESENT', 17, 10), ('2025-03-16', 'PRESENT', 18, 10), ('2025-03-16', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 20, 20), ('2025-03-16', 'PRESENT', 21, 20), ('2025-03-16', 'PRESENT', 22, 20), ('2025-03-16', 'PRESENT', 23, 20), ('2025-03-16', 'PRESENT', 24, 20), ('2025-03-16', 'ABSENT', 25, 20), ('2025-03-16', 'PRESENT', 26, 20), ('2025-03-16', 'PRESENT', 27, 20), ('2025-03-16', 'ABSENT', 28, 20), ('2025-03-16', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 30, 30), ('2025-03-16', 'PRESENT', 31, 30), ('2025-03-16', 'PRESENT', 32, 30), ('2025-03-16', 'PRESENT', 33, 30), ('2025-03-16', 'PRESENT', 34, 30), ('2025-03-16', 'ABSENT', 35, 30), ('2025-03-16', 'PRESENT', 36, 30), ('2025-03-16', 'PRESENT', 37, 30), ('2025-03-16', 'PRESENT', 38, 30), ('2025-03-16', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 40, 40), ('2025-03-16', 'PRESENT', 41, 40), ('2025-03-16', 'PRESENT', 42, 40), ('2025-03-16', 'PRESENT', 43, 40), ('2025-03-16', 'PRESENT', 44, 40), ('2025-03-16', 'PRESENT', 45, 40), ('2025-03-16', 'ABSENT', 46, 40), ('2025-03-16', 'PRESENT', 47, 40), ('2025-03-16', 'PRESENT', 48, 40), ('2025-03-16', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 50, 50), ('2025-03-16', 'PRESENT', 51, 50), ('2025-03-16', 'PRESENT', 52, 50), ('2025-03-16', 'PRESENT', 53, 50), ('2025-03-16', 'ABSENT', 54, 50), ('2025-03-16', 'PRESENT', 55, 50), ('2025-03-16', 'PRESENT', 56, 50), ('2025-03-16', 'PRESENT', 57, 50), ('2025-03-16', 'PRESENT', 58, 50), ('2025-03-16', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 60, 60), ('2025-03-16', 'PRESENT', 61, 60), ('2025-03-16', 'PRESENT', 62, 60), ('2025-03-16', 'PRESENT', 63, 60), ('2025-03-16', 'ABSENT', 64, 60), ('2025-03-16', 'ABSENT', 65, 60), ('2025-03-16', 'PRESENT', 66, 60), ('2025-03-16', 'PRESENT', 67, 60), ('2025-03-16', 'PRESENT', 68, 60), ('2025-03-16', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 70, 70), ('2025-03-16', 'PRESENT', 71, 70), ('2025-03-16', 'PRESENT', 72, 70), ('2025-03-16', 'PRESENT', 73, 70), ('2025-03-16', 'PRESENT', 74, 70), ('2025-03-16', 'ABSENT', 75, 70), ('2025-03-16', 'ABSENT', 76, 70), ('2025-03-16', 'PRESENT', 77, 70), ('2025-03-16', 'PRESENT', 78, 70), ('2025-03-16', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'PRESENT', 80, 80), ('2025-03-16', 'PRESENT', 81, 80), ('2025-03-16', 'PRESENT', 82, 80), ('2025-03-16', 'PRESENT', 83, 80), ('2025-03-16', 'PRESENT', 84, 80), ('2025-03-16', 'ABSENT', 85, 80), ('2025-03-16', 'PRESENT', 86, 80), ('2025-03-16', 'ABSENT', 87, 80), ('2025-03-16', 'PRESENT', 88, 80), ('2025-03-16', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'ABSENT', 90, 90), ('2025-03-16', 'PRESENT', 91, 90), ('2025-03-16', 'PRESENT', 92, 90), ('2025-03-16', 'ABSENT', 93, 90), ('2025-03-16', 'ABSENT', 94, 90), ('2025-03-16', 'PRESENT', 95, 90), ('2025-03-16', 'ABSENT', 96, 90), ('2025-03-16', 'ABSENT', 97, 90), ('2025-03-16', 'PRESENT', 98, 90), ('2025-03-16', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-03-16', '2025-03-16 주일 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-16', 'PRESENT', 100, 100), ('2025-03-16', 'PRESENT', 101, 100), ('2025-03-16', 'PRESENT', 102, 100), ('2025-03-16', 'ABSENT', 103, 100), ('2025-03-16', 'PRESENT', 104, 100), ('2025-03-16', 'PRESENT', 105, 100), ('2025-03-16', 'PRESENT', 106, 100), ('2025-03-16', 'PRESENT', 107, 100), ('2025-03-16', 'PRESENT', 108, 100), ('2025-03-16', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 10, 10), ('2025-03-23', 'PRESENT', 11, 10), ('2025-03-23', 'PRESENT', 12, 10), ('2025-03-23', 'PRESENT', 13, 10), ('2025-03-23', 'PRESENT', 14, 10), ('2025-03-23', 'ABSENT', 15, 10), ('2025-03-23', 'PRESENT', 16, 10), ('2025-03-23', 'PRESENT', 17, 10), ('2025-03-23', 'PRESENT', 18, 10), ('2025-03-23', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'PRESENT', 20, 20), ('2025-03-23', 'PRESENT', 21, 20), ('2025-03-23', 'PRESENT', 22, 20), ('2025-03-23', 'PRESENT', 23, 20), ('2025-03-23', 'PRESENT', 24, 20), ('2025-03-23', 'ABSENT', 25, 20), ('2025-03-23', 'PRESENT', 26, 20), ('2025-03-23', 'PRESENT', 27, 20), ('2025-03-23', 'ABSENT', 28, 20), ('2025-03-23', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 30, 30), ('2025-03-23', 'PRESENT', 31, 30), ('2025-03-23', 'PRESENT', 32, 30), ('2025-03-23', 'PRESENT', 33, 30), ('2025-03-23', 'PRESENT', 34, 30), ('2025-03-23', 'PRESENT', 35, 30), ('2025-03-23', 'PRESENT', 36, 30), ('2025-03-23', 'PRESENT', 37, 30), ('2025-03-23', 'PRESENT', 38, 30), ('2025-03-23', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 40, 40), ('2025-03-23', 'PRESENT', 41, 40), ('2025-03-23', 'ABSENT', 42, 40), ('2025-03-23', 'ABSENT', 43, 40), ('2025-03-23', 'PRESENT', 44, 40), ('2025-03-23', 'ABSENT', 45, 40), ('2025-03-23', 'PRESENT', 46, 40), ('2025-03-23', 'ABSENT', 47, 40), ('2025-03-23', 'PRESENT', 48, 40), ('2025-03-23', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 50, 50), ('2025-03-23', 'PRESENT', 51, 50), ('2025-03-23', 'PRESENT', 52, 50), ('2025-03-23', 'ABSENT', 53, 50), ('2025-03-23', 'ABSENT', 54, 50), ('2025-03-23', 'ABSENT', 55, 50), ('2025-03-23', 'PRESENT', 56, 50), ('2025-03-23', 'PRESENT', 57, 50), ('2025-03-23', 'PRESENT', 58, 50), ('2025-03-23', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 60, 60), ('2025-03-23', 'PRESENT', 61, 60), ('2025-03-23', 'PRESENT', 62, 60), ('2025-03-23', 'PRESENT', 63, 60), ('2025-03-23', 'PRESENT', 64, 60), ('2025-03-23', 'ABSENT', 65, 60), ('2025-03-23', 'PRESENT', 66, 60), ('2025-03-23', 'PRESENT', 67, 60), ('2025-03-23', 'PRESENT', 68, 60), ('2025-03-23', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 70, 70), ('2025-03-23', 'PRESENT', 71, 70), ('2025-03-23', 'PRESENT', 72, 70), ('2025-03-23', 'PRESENT', 73, 70), ('2025-03-23', 'PRESENT', 74, 70), ('2025-03-23', 'ABSENT', 75, 70), ('2025-03-23', 'PRESENT', 76, 70), ('2025-03-23', 'PRESENT', 77, 70), ('2025-03-23', 'PRESENT', 78, 70), ('2025-03-23', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 80, 80), ('2025-03-23', 'ABSENT', 81, 80), ('2025-03-23', 'ABSENT', 82, 80), ('2025-03-23', 'PRESENT', 83, 80), ('2025-03-23', 'PRESENT', 84, 80), ('2025-03-23', 'ABSENT', 85, 80), ('2025-03-23', 'PRESENT', 86, 80), ('2025-03-23', 'PRESENT', 87, 80), ('2025-03-23', 'PRESENT', 88, 80), ('2025-03-23', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 90, 90), ('2025-03-23', 'ABSENT', 91, 90), ('2025-03-23', 'ABSENT', 92, 90), ('2025-03-23', 'PRESENT', 93, 90), ('2025-03-23', 'PRESENT', 94, 90), ('2025-03-23', 'PRESENT', 95, 90), ('2025-03-23', 'PRESENT', 96, 90), ('2025-03-23', 'ABSENT', 97, 90), ('2025-03-23', 'ABSENT', 98, 90), ('2025-03-23', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-03-23', '2025-03-23 주일 나눔입니다.', '', '2025-03-23 16:00:00', '2025-03-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-23', 'ABSENT', 100, 100), ('2025-03-23', 'ABSENT', 101, 100), ('2025-03-23', 'PRESENT', 102, 100), ('2025-03-23', 'PRESENT', 103, 100), ('2025-03-23', 'PRESENT', 104, 100), ('2025-03-23', 'PRESENT', 105, 100), ('2025-03-23', 'PRESENT', 106, 100), ('2025-03-23', 'ABSENT', 107, 100), ('2025-03-23', 'ABSENT', 108, 100), ('2025-03-23', 'ABSENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 10, 10), ('2025-03-30', 'PRESENT', 11, 10), ('2025-03-30', 'ABSENT', 12, 10), ('2025-03-30', 'PRESENT', 13, 10), ('2025-03-30', 'PRESENT', 14, 10), ('2025-03-30', 'PRESENT', 15, 10), ('2025-03-30', 'PRESENT', 16, 10), ('2025-03-30', 'PRESENT', 17, 10), ('2025-03-30', 'PRESENT', 18, 10), ('2025-03-30', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 20, 20), ('2025-03-30', 'PRESENT', 21, 20), ('2025-03-30', 'ABSENT', 22, 20), ('2025-03-30', 'PRESENT', 23, 20), ('2025-03-30', 'PRESENT', 24, 20), ('2025-03-30', 'ABSENT', 25, 20), ('2025-03-30', 'PRESENT', 26, 20), ('2025-03-30', 'PRESENT', 27, 20), ('2025-03-30', 'PRESENT', 28, 20), ('2025-03-30', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'PRESENT', 30, 30), ('2025-03-30', 'PRESENT', 31, 30), ('2025-03-30', 'PRESENT', 32, 30), ('2025-03-30', 'PRESENT', 33, 30), ('2025-03-30', 'PRESENT', 34, 30), ('2025-03-30', 'ABSENT', 35, 30), ('2025-03-30', 'PRESENT', 36, 30), ('2025-03-30', 'PRESENT', 37, 30), ('2025-03-30', 'PRESENT', 38, 30), ('2025-03-30', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 40, 40), ('2025-03-30', 'PRESENT', 41, 40), ('2025-03-30', 'PRESENT', 42, 40), ('2025-03-30', 'ABSENT', 43, 40), ('2025-03-30', 'PRESENT', 44, 40), ('2025-03-30', 'PRESENT', 45, 40), ('2025-03-30', 'PRESENT', 46, 40), ('2025-03-30', 'PRESENT', 47, 40), ('2025-03-30', 'PRESENT', 48, 40), ('2025-03-30', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 50, 50), ('2025-03-30', 'PRESENT', 51, 50), ('2025-03-30', 'PRESENT', 52, 50), ('2025-03-30', 'PRESENT', 53, 50), ('2025-03-30', 'PRESENT', 54, 50), ('2025-03-30', 'ABSENT', 55, 50), ('2025-03-30', 'PRESENT', 56, 50), ('2025-03-30', 'PRESENT', 57, 50), ('2025-03-30', 'PRESENT', 58, 50), ('2025-03-30', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 60, 60), ('2025-03-30', 'PRESENT', 61, 60), ('2025-03-30', 'PRESENT', 62, 60), ('2025-03-30', 'PRESENT', 63, 60), ('2025-03-30', 'PRESENT', 64, 60), ('2025-03-30', 'PRESENT', 65, 60), ('2025-03-30', 'PRESENT', 66, 60), ('2025-03-30', 'PRESENT', 67, 60), ('2025-03-30', 'PRESENT', 68, 60), ('2025-03-30', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'PRESENT', 70, 70), ('2025-03-30', 'PRESENT', 71, 70), ('2025-03-30', 'PRESENT', 72, 70), ('2025-03-30', 'PRESENT', 73, 70), ('2025-03-30', 'PRESENT', 74, 70), ('2025-03-30', 'ABSENT', 75, 70), ('2025-03-30', 'PRESENT', 76, 70), ('2025-03-30', 'PRESENT', 77, 70), ('2025-03-30', 'ABSENT', 78, 70), ('2025-03-30', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'PRESENT', 80, 80), ('2025-03-30', 'ABSENT', 81, 80), ('2025-03-30', 'PRESENT', 82, 80), ('2025-03-30', 'PRESENT', 83, 80), ('2025-03-30', 'PRESENT', 84, 80), ('2025-03-30', 'ABSENT', 85, 80), ('2025-03-30', 'PRESENT', 86, 80), ('2025-03-30', 'ABSENT', 87, 80), ('2025-03-30', 'PRESENT', 88, 80), ('2025-03-30', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 90, 90), ('2025-03-30', 'PRESENT', 91, 90), ('2025-03-30', 'ABSENT', 92, 90), ('2025-03-30', 'PRESENT', 93, 90), ('2025-03-30', 'PRESENT', 94, 90), ('2025-03-30', 'PRESENT', 95, 90), ('2025-03-30', 'PRESENT', 96, 90), ('2025-03-30', 'PRESENT', 97, 90), ('2025-03-30', 'PRESENT', 98, 90), ('2025-03-30', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-03-30', '2025-03-30 주일 나눔입니다.', '', '2025-03-30 16:00:00', '2025-03-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-03-30', 'ABSENT', 100, 100), ('2025-03-30', 'ABSENT', 101, 100), ('2025-03-30', 'PRESENT', 102, 100), ('2025-03-30', 'PRESENT', 103, 100), ('2025-03-30', 'PRESENT', 104, 100), ('2025-03-30', 'PRESENT', 105, 100), ('2025-03-30', 'PRESENT', 106, 100), ('2025-03-30', 'PRESENT', 107, 100), ('2025-03-30', 'PRESENT', 108, 100), ('2025-03-30', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 10, 10), ('2025-04-06', 'PRESENT', 11, 10), ('2025-04-06', 'PRESENT', 12, 10), ('2025-04-06', 'PRESENT', 13, 10), ('2025-04-06', 'PRESENT', 14, 10), ('2025-04-06', 'ABSENT', 15, 10), ('2025-04-06', 'PRESENT', 16, 10), ('2025-04-06', 'PRESENT', 17, 10), ('2025-04-06', 'ABSENT', 18, 10), ('2025-04-06', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'PRESENT', 20, 20), ('2025-04-06', 'PRESENT', 21, 20), ('2025-04-06', 'PRESENT', 22, 20), ('2025-04-06', 'ABSENT', 23, 20), ('2025-04-06', 'PRESENT', 24, 20), ('2025-04-06', 'ABSENT', 25, 20), ('2025-04-06', 'PRESENT', 26, 20), ('2025-04-06', 'PRESENT', 27, 20), ('2025-04-06', 'PRESENT', 28, 20), ('2025-04-06', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'PRESENT', 30, 30), ('2025-04-06', 'PRESENT', 31, 30), ('2025-04-06', 'ABSENT', 32, 30), ('2025-04-06', 'PRESENT', 33, 30), ('2025-04-06', 'PRESENT', 34, 30), ('2025-04-06', 'ABSENT', 35, 30), ('2025-04-06', 'PRESENT', 36, 30), ('2025-04-06', 'PRESENT', 37, 30), ('2025-04-06', 'PRESENT', 38, 30), ('2025-04-06', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 40, 40), ('2025-04-06', 'PRESENT', 41, 40), ('2025-04-06', 'PRESENT', 42, 40), ('2025-04-06', 'PRESENT', 43, 40), ('2025-04-06', 'PRESENT', 44, 40), ('2025-04-06', 'ABSENT', 45, 40), ('2025-04-06', 'ABSENT', 46, 40), ('2025-04-06', 'PRESENT', 47, 40), ('2025-04-06', 'PRESENT', 48, 40), ('2025-04-06', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 50, 50), ('2025-04-06', 'PRESENT', 51, 50), ('2025-04-06', 'ABSENT', 52, 50), ('2025-04-06', 'PRESENT', 53, 50), ('2025-04-06', 'ABSENT', 54, 50), ('2025-04-06', 'PRESENT', 55, 50), ('2025-04-06', 'ABSENT', 56, 50), ('2025-04-06', 'PRESENT', 57, 50), ('2025-04-06', 'PRESENT', 58, 50), ('2025-04-06', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 60, 60), ('2025-04-06', 'ABSENT', 61, 60), ('2025-04-06', 'PRESENT', 62, 60), ('2025-04-06', 'PRESENT', 63, 60), ('2025-04-06', 'PRESENT', 64, 60), ('2025-04-06', 'ABSENT', 65, 60), ('2025-04-06', 'PRESENT', 66, 60), ('2025-04-06', 'ABSENT', 67, 60), ('2025-04-06', 'PRESENT', 68, 60), ('2025-04-06', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'PRESENT', 70, 70), ('2025-04-06', 'PRESENT', 71, 70), ('2025-04-06', 'ABSENT', 72, 70), ('2025-04-06', 'PRESENT', 73, 70), ('2025-04-06', 'PRESENT', 74, 70), ('2025-04-06', 'PRESENT', 75, 70), ('2025-04-06', 'ABSENT', 76, 70), ('2025-04-06', 'PRESENT', 77, 70), ('2025-04-06', 'PRESENT', 78, 70), ('2025-04-06', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 80, 80), ('2025-04-06', 'PRESENT', 81, 80), ('2025-04-06', 'PRESENT', 82, 80), ('2025-04-06', 'ABSENT', 83, 80), ('2025-04-06', 'PRESENT', 84, 80), ('2025-04-06', 'ABSENT', 85, 80), ('2025-04-06', 'PRESENT', 86, 80), ('2025-04-06', 'PRESENT', 87, 80), ('2025-04-06', 'PRESENT', 88, 80), ('2025-04-06', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 90, 90), ('2025-04-06', 'PRESENT', 91, 90), ('2025-04-06', 'PRESENT', 92, 90), ('2025-04-06', 'ABSENT', 93, 90), ('2025-04-06', 'ABSENT', 94, 90), ('2025-04-06', 'PRESENT', 95, 90), ('2025-04-06', 'PRESENT', 96, 90), ('2025-04-06', 'PRESENT', 97, 90), ('2025-04-06', 'ABSENT', 98, 90), ('2025-04-06', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-04-06', '2025-04-06 주일 나눔입니다.', '', '2025-04-06 16:00:00', '2025-04-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-06', 'ABSENT', 100, 100), ('2025-04-06', 'PRESENT', 101, 100), ('2025-04-06', 'PRESENT', 102, 100), ('2025-04-06', 'PRESENT', 103, 100), ('2025-04-06', 'PRESENT', 104, 100), ('2025-04-06', 'ABSENT', 105, 100), ('2025-04-06', 'ABSENT', 106, 100), ('2025-04-06', 'PRESENT', 107, 100), ('2025-04-06', 'PRESENT', 108, 100), ('2025-04-06', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'ABSENT', 10, 10), ('2025-04-13', 'PRESENT', 11, 10), ('2025-04-13', 'PRESENT', 12, 10), ('2025-04-13', 'PRESENT', 13, 10), ('2025-04-13', 'PRESENT', 14, 10), ('2025-04-13', 'PRESENT', 15, 10), ('2025-04-13', 'PRESENT', 16, 10), ('2025-04-13', 'ABSENT', 17, 10), ('2025-04-13', 'PRESENT', 18, 10), ('2025-04-13', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'ABSENT', 20, 20), ('2025-04-13', 'ABSENT', 21, 20), ('2025-04-13', 'PRESENT', 22, 20), ('2025-04-13', 'PRESENT', 23, 20), ('2025-04-13', 'PRESENT', 24, 20), ('2025-04-13', 'ABSENT', 25, 20), ('2025-04-13', 'PRESENT', 26, 20), ('2025-04-13', 'PRESENT', 27, 20), ('2025-04-13', 'PRESENT', 28, 20), ('2025-04-13', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'PRESENT', 30, 30), ('2025-04-13', 'PRESENT', 31, 30), ('2025-04-13', 'PRESENT', 32, 30), ('2025-04-13', 'PRESENT', 33, 30), ('2025-04-13', 'PRESENT', 34, 30), ('2025-04-13', 'ABSENT', 35, 30), ('2025-04-13', 'PRESENT', 36, 30), ('2025-04-13', 'PRESENT', 37, 30), ('2025-04-13', 'PRESENT', 38, 30), ('2025-04-13', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'PRESENT', 40, 40), ('2025-04-13', 'ABSENT', 41, 40), ('2025-04-13', 'PRESENT', 42, 40), ('2025-04-13', 'ABSENT', 43, 40), ('2025-04-13', 'PRESENT', 44, 40), ('2025-04-13', 'ABSENT', 45, 40), ('2025-04-13', 'PRESENT', 46, 40), ('2025-04-13', 'ABSENT', 47, 40), ('2025-04-13', 'ABSENT', 48, 40), ('2025-04-13', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'ABSENT', 50, 50), ('2025-04-13', 'PRESENT', 51, 50), ('2025-04-13', 'PRESENT', 52, 50), ('2025-04-13', 'PRESENT', 53, 50), ('2025-04-13', 'PRESENT', 54, 50), ('2025-04-13', 'PRESENT', 55, 50), ('2025-04-13', 'PRESENT', 56, 50), ('2025-04-13', 'PRESENT', 57, 50), ('2025-04-13', 'PRESENT', 58, 50), ('2025-04-13', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'PRESENT', 60, 60), ('2025-04-13', 'PRESENT', 61, 60), ('2025-04-13', 'PRESENT', 62, 60), ('2025-04-13', 'PRESENT', 63, 60), ('2025-04-13', 'PRESENT', 64, 60), ('2025-04-13', 'ABSENT', 65, 60), ('2025-04-13', 'PRESENT', 66, 60), ('2025-04-13', 'PRESENT', 67, 60), ('2025-04-13', 'PRESENT', 68, 60), ('2025-04-13', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'ABSENT', 70, 70), ('2025-04-13', 'PRESENT', 71, 70), ('2025-04-13', 'ABSENT', 72, 70), ('2025-04-13', 'PRESENT', 73, 70), ('2025-04-13', 'PRESENT', 74, 70), ('2025-04-13', 'ABSENT', 75, 70), ('2025-04-13', 'ABSENT', 76, 70), ('2025-04-13', 'PRESENT', 77, 70), ('2025-04-13', 'PRESENT', 78, 70), ('2025-04-13', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'PRESENT', 80, 80), ('2025-04-13', 'PRESENT', 81, 80), ('2025-04-13', 'PRESENT', 82, 80), ('2025-04-13', 'PRESENT', 83, 80), ('2025-04-13', 'PRESENT', 84, 80), ('2025-04-13', 'ABSENT', 85, 80), ('2025-04-13', 'PRESENT', 86, 80), ('2025-04-13', 'PRESENT', 87, 80), ('2025-04-13', 'PRESENT', 88, 80), ('2025-04-13', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'ABSENT', 90, 90), ('2025-04-13', 'PRESENT', 91, 90), ('2025-04-13', 'PRESENT', 92, 90), ('2025-04-13', 'PRESENT', 93, 90), ('2025-04-13', 'PRESENT', 94, 90), ('2025-04-13', 'PRESENT', 95, 90), ('2025-04-13', 'PRESENT', 96, 90), ('2025-04-13', 'PRESENT', 97, 90), ('2025-04-13', 'PRESENT', 98, 90), ('2025-04-13', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-04-13', '2025-04-13 주일 나눔입니다.', '', '2025-04-13 16:00:00', '2025-04-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-13', 'ABSENT', 100, 100), ('2025-04-13', 'PRESENT', 101, 100), ('2025-04-13', 'PRESENT', 102, 100), ('2025-04-13', 'PRESENT', 103, 100), ('2025-04-13', 'PRESENT', 104, 100), ('2025-04-13', 'PRESENT', 105, 100), ('2025-04-13', 'ABSENT', 106, 100), ('2025-04-13', 'PRESENT', 107, 100), ('2025-04-13', 'PRESENT', 108, 100), ('2025-04-13', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 10, 10), ('2025-04-20', 'PRESENT', 11, 10), ('2025-04-20', 'PRESENT', 12, 10), ('2025-04-20', 'PRESENT', 13, 10), ('2025-04-20', 'PRESENT', 14, 10), ('2025-04-20', 'PRESENT', 15, 10), ('2025-04-20', 'ABSENT', 16, 10), ('2025-04-20', 'PRESENT', 17, 10), ('2025-04-20', 'ABSENT', 18, 10), ('2025-04-20', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'PRESENT', 20, 20), ('2025-04-20', 'PRESENT', 21, 20), ('2025-04-20', 'PRESENT', 22, 20), ('2025-04-20', 'PRESENT', 23, 20), ('2025-04-20', 'PRESENT', 24, 20), ('2025-04-20', 'ABSENT', 25, 20), ('2025-04-20', 'PRESENT', 26, 20), ('2025-04-20', 'PRESENT', 27, 20), ('2025-04-20', 'PRESENT', 28, 20), ('2025-04-20', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 30, 30), ('2025-04-20', 'PRESENT', 31, 30), ('2025-04-20', 'ABSENT', 32, 30), ('2025-04-20', 'ABSENT', 33, 30), ('2025-04-20', 'PRESENT', 34, 30), ('2025-04-20', 'ABSENT', 35, 30), ('2025-04-20', 'PRESENT', 36, 30), ('2025-04-20', 'PRESENT', 37, 30), ('2025-04-20', 'PRESENT', 38, 30), ('2025-04-20', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 40, 40), ('2025-04-20', 'ABSENT', 41, 40), ('2025-04-20', 'PRESENT', 42, 40), ('2025-04-20', 'PRESENT', 43, 40), ('2025-04-20', 'PRESENT', 44, 40), ('2025-04-20', 'PRESENT', 45, 40), ('2025-04-20', 'PRESENT', 46, 40), ('2025-04-20', 'PRESENT', 47, 40), ('2025-04-20', 'ABSENT', 48, 40), ('2025-04-20', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 50, 50), ('2025-04-20', 'PRESENT', 51, 50), ('2025-04-20', 'PRESENT', 52, 50), ('2025-04-20', 'ABSENT', 53, 50), ('2025-04-20', 'PRESENT', 54, 50), ('2025-04-20', 'PRESENT', 55, 50), ('2025-04-20', 'PRESENT', 56, 50), ('2025-04-20', 'ABSENT', 57, 50), ('2025-04-20', 'ABSENT', 58, 50), ('2025-04-20', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 60, 60), ('2025-04-20', 'PRESENT', 61, 60), ('2025-04-20', 'PRESENT', 62, 60), ('2025-04-20', 'PRESENT', 63, 60), ('2025-04-20', 'PRESENT', 64, 60), ('2025-04-20', 'ABSENT', 65, 60), ('2025-04-20', 'PRESENT', 66, 60), ('2025-04-20', 'PRESENT', 67, 60), ('2025-04-20', 'PRESENT', 68, 60), ('2025-04-20', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 70, 70), ('2025-04-20', 'PRESENT', 71, 70), ('2025-04-20', 'PRESENT', 72, 70), ('2025-04-20', 'PRESENT', 73, 70), ('2025-04-20', 'PRESENT', 74, 70), ('2025-04-20', 'ABSENT', 75, 70), ('2025-04-20', 'PRESENT', 76, 70), ('2025-04-20', 'PRESENT', 77, 70), ('2025-04-20', 'PRESENT', 78, 70), ('2025-04-20', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 80, 80), ('2025-04-20', 'PRESENT', 81, 80), ('2025-04-20', 'PRESENT', 82, 80), ('2025-04-20', 'PRESENT', 83, 80), ('2025-04-20', 'PRESENT', 84, 80), ('2025-04-20', 'ABSENT', 85, 80), ('2025-04-20', 'PRESENT', 86, 80), ('2025-04-20', 'PRESENT', 87, 80), ('2025-04-20', 'PRESENT', 88, 80), ('2025-04-20', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'ABSENT', 90, 90), ('2025-04-20', 'PRESENT', 91, 90), ('2025-04-20', 'PRESENT', 92, 90), ('2025-04-20', 'PRESENT', 93, 90), ('2025-04-20', 'PRESENT', 94, 90), ('2025-04-20', 'ABSENT', 95, 90), ('2025-04-20', 'PRESENT', 96, 90), ('2025-04-20', 'PRESENT', 97, 90), ('2025-04-20', 'PRESENT', 98, 90), ('2025-04-20', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-04-20', '2025-04-20 주일 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-20', 'PRESENT', 100, 100), ('2025-04-20', 'ABSENT', 101, 100), ('2025-04-20', 'ABSENT', 102, 100), ('2025-04-20', 'PRESENT', 103, 100), ('2025-04-20', 'ABSENT', 104, 100), ('2025-04-20', 'PRESENT', 105, 100), ('2025-04-20', 'ABSENT', 106, 100), ('2025-04-20', 'PRESENT', 107, 100), ('2025-04-20', 'PRESENT', 108, 100), ('2025-04-20', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'ABSENT', 10, 10), ('2025-04-27', 'PRESENT', 11, 10), ('2025-04-27', 'PRESENT', 12, 10), ('2025-04-27', 'PRESENT', 13, 10), ('2025-04-27', 'PRESENT', 14, 10), ('2025-04-27', 'PRESENT', 15, 10), ('2025-04-27', 'PRESENT', 16, 10), ('2025-04-27', 'PRESENT', 17, 10), ('2025-04-27', 'PRESENT', 18, 10), ('2025-04-27', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'PRESENT', 20, 20), ('2025-04-27', 'PRESENT', 21, 20), ('2025-04-27', 'ABSENT', 22, 20), ('2025-04-27', 'PRESENT', 23, 20), ('2025-04-27', 'PRESENT', 24, 20), ('2025-04-27', 'ABSENT', 25, 20), ('2025-04-27', 'PRESENT', 26, 20), ('2025-04-27', 'PRESENT', 27, 20), ('2025-04-27', 'PRESENT', 28, 20), ('2025-04-27', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'ABSENT', 30, 30), ('2025-04-27', 'ABSENT', 31, 30), ('2025-04-27', 'PRESENT', 32, 30), ('2025-04-27', 'ABSENT', 33, 30), ('2025-04-27', 'PRESENT', 34, 30), ('2025-04-27', 'ABSENT', 35, 30), ('2025-04-27', 'PRESENT', 36, 30), ('2025-04-27', 'PRESENT', 37, 30), ('2025-04-27', 'ABSENT', 38, 30), ('2025-04-27', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'PRESENT', 40, 40), ('2025-04-27', 'PRESENT', 41, 40), ('2025-04-27', 'PRESENT', 42, 40), ('2025-04-27', 'ABSENT', 43, 40), ('2025-04-27', 'PRESENT', 44, 40), ('2025-04-27', 'ABSENT', 45, 40), ('2025-04-27', 'PRESENT', 46, 40), ('2025-04-27', 'ABSENT', 47, 40), ('2025-04-27', 'PRESENT', 48, 40), ('2025-04-27', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'ABSENT', 50, 50), ('2025-04-27', 'PRESENT', 51, 50), ('2025-04-27', 'PRESENT', 52, 50), ('2025-04-27', 'PRESENT', 53, 50), ('2025-04-27', 'PRESENT', 54, 50), ('2025-04-27', 'ABSENT', 55, 50), ('2025-04-27', 'PRESENT', 56, 50), ('2025-04-27', 'ABSENT', 57, 50), ('2025-04-27', 'PRESENT', 58, 50), ('2025-04-27', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'ABSENT', 60, 60), ('2025-04-27', 'PRESENT', 61, 60), ('2025-04-27', 'PRESENT', 62, 60), ('2025-04-27', 'PRESENT', 63, 60), ('2025-04-27', 'PRESENT', 64, 60), ('2025-04-27', 'PRESENT', 65, 60), ('2025-04-27', 'PRESENT', 66, 60), ('2025-04-27', 'PRESENT', 67, 60), ('2025-04-27', 'PRESENT', 68, 60), ('2025-04-27', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'PRESENT', 70, 70), ('2025-04-27', 'PRESENT', 71, 70), ('2025-04-27', 'PRESENT', 72, 70), ('2025-04-27', 'ABSENT', 73, 70), ('2025-04-27', 'PRESENT', 74, 70), ('2025-04-27', 'ABSENT', 75, 70), ('2025-04-27', 'PRESENT', 76, 70), ('2025-04-27', 'PRESENT', 77, 70), ('2025-04-27', 'ABSENT', 78, 70), ('2025-04-27', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'PRESENT', 80, 80), ('2025-04-27', 'ABSENT', 81, 80), ('2025-04-27', 'PRESENT', 82, 80), ('2025-04-27', 'PRESENT', 83, 80), ('2025-04-27', 'PRESENT', 84, 80), ('2025-04-27', 'PRESENT', 85, 80), ('2025-04-27', 'PRESENT', 86, 80), ('2025-04-27', 'PRESENT', 87, 80), ('2025-04-27', 'ABSENT', 88, 80), ('2025-04-27', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'PRESENT', 90, 90), ('2025-04-27', 'PRESENT', 91, 90), ('2025-04-27', 'PRESENT', 92, 90), ('2025-04-27', 'PRESENT', 93, 90), ('2025-04-27', 'ABSENT', 94, 90), ('2025-04-27', 'PRESENT', 95, 90), ('2025-04-27', 'PRESENT', 96, 90), ('2025-04-27', 'PRESENT', 97, 90), ('2025-04-27', 'PRESENT', 98, 90), ('2025-04-27', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-04-27', '2025-04-27 주일 나눔입니다.', '', '2025-04-27 16:00:00', '2025-04-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-04-27', 'ABSENT', 100, 100), ('2025-04-27', 'PRESENT', 101, 100), ('2025-04-27', 'ABSENT', 102, 100), ('2025-04-27', 'PRESENT', 103, 100), ('2025-04-27', 'PRESENT', 104, 100), ('2025-04-27', 'ABSENT', 105, 100), ('2025-04-27', 'ABSENT', 106, 100), ('2025-04-27', 'PRESENT', 107, 100), ('2025-04-27', 'PRESENT', 108, 100), ('2025-04-27', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'ABSENT', 10, 10), ('2025-05-04', 'PRESENT', 11, 10), ('2025-05-04', 'PRESENT', 12, 10), ('2025-05-04', 'PRESENT', 13, 10), ('2025-05-04', 'PRESENT', 14, 10), ('2025-05-04', 'ABSENT', 15, 10), ('2025-05-04', 'PRESENT', 16, 10), ('2025-05-04', 'PRESENT', 17, 10), ('2025-05-04', 'PRESENT', 18, 10), ('2025-05-04', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'PRESENT', 20, 20), ('2025-05-04', 'PRESENT', 21, 20), ('2025-05-04', 'PRESENT', 22, 20), ('2025-05-04', 'PRESENT', 23, 20), ('2025-05-04', 'ABSENT', 24, 20), ('2025-05-04', 'PRESENT', 25, 20), ('2025-05-04', 'PRESENT', 26, 20), ('2025-05-04', 'PRESENT', 27, 20), ('2025-05-04', 'PRESENT', 28, 20), ('2025-05-04', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'PRESENT', 30, 30), ('2025-05-04', 'PRESENT', 31, 30), ('2025-05-04', 'PRESENT', 32, 30), ('2025-05-04', 'PRESENT', 33, 30), ('2025-05-04', 'PRESENT', 34, 30), ('2025-05-04', 'PRESENT', 35, 30), ('2025-05-04', 'PRESENT', 36, 30), ('2025-05-04', 'PRESENT', 37, 30), ('2025-05-04', 'PRESENT', 38, 30), ('2025-05-04', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'PRESENT', 40, 40), ('2025-05-04', 'PRESENT', 41, 40), ('2025-05-04', 'PRESENT', 42, 40), ('2025-05-04', 'PRESENT', 43, 40), ('2025-05-04', 'PRESENT', 44, 40), ('2025-05-04', 'ABSENT', 45, 40), ('2025-05-04', 'PRESENT', 46, 40), ('2025-05-04', 'PRESENT', 47, 40), ('2025-05-04', 'PRESENT', 48, 40), ('2025-05-04', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'ABSENT', 50, 50), ('2025-05-04', 'PRESENT', 51, 50), ('2025-05-04', 'PRESENT', 52, 50), ('2025-05-04', 'PRESENT', 53, 50), ('2025-05-04', 'PRESENT', 54, 50), ('2025-05-04', 'ABSENT', 55, 50), ('2025-05-04', 'PRESENT', 56, 50), ('2025-05-04', 'PRESENT', 57, 50), ('2025-05-04', 'PRESENT', 58, 50), ('2025-05-04', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'ABSENT', 60, 60), ('2025-05-04', 'PRESENT', 61, 60), ('2025-05-04', 'PRESENT', 62, 60), ('2025-05-04', 'PRESENT', 63, 60), ('2025-05-04', 'PRESENT', 64, 60), ('2025-05-04', 'ABSENT', 65, 60), ('2025-05-04', 'PRESENT', 66, 60), ('2025-05-04', 'PRESENT', 67, 60), ('2025-05-04', 'PRESENT', 68, 60), ('2025-05-04', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'PRESENT', 70, 70), ('2025-05-04', 'PRESENT', 71, 70), ('2025-05-04', 'PRESENT', 72, 70), ('2025-05-04', 'PRESENT', 73, 70), ('2025-05-04', 'ABSENT', 74, 70), ('2025-05-04', 'ABSENT', 75, 70), ('2025-05-04', 'ABSENT', 76, 70), ('2025-05-04', 'PRESENT', 77, 70), ('2025-05-04', 'PRESENT', 78, 70), ('2025-05-04', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'ABSENT', 80, 80), ('2025-05-04', 'PRESENT', 81, 80), ('2025-05-04', 'PRESENT', 82, 80), ('2025-05-04', 'PRESENT', 83, 80), ('2025-05-04', 'PRESENT', 84, 80), ('2025-05-04', 'ABSENT', 85, 80), ('2025-05-04', 'PRESENT', 86, 80), ('2025-05-04', 'PRESENT', 87, 80), ('2025-05-04', 'PRESENT', 88, 80), ('2025-05-04', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'ABSENT', 90, 90), ('2025-05-04', 'PRESENT', 91, 90), ('2025-05-04', 'PRESENT', 92, 90), ('2025-05-04', 'PRESENT', 93, 90), ('2025-05-04', 'PRESENT', 94, 90), ('2025-05-04', 'ABSENT', 95, 90), ('2025-05-04', 'PRESENT', 96, 90), ('2025-05-04', 'PRESENT', 97, 90), ('2025-05-04', 'PRESENT', 98, 90), ('2025-05-04', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-05-04', '2025-05-04 주일 나눔입니다.', '', '2025-05-04 16:00:00', '2025-05-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-04', 'PRESENT', 100, 100), ('2025-05-04', 'PRESENT', 101, 100), ('2025-05-04', 'PRESENT', 102, 100), ('2025-05-04', 'PRESENT', 103, 100), ('2025-05-04', 'PRESENT', 104, 100), ('2025-05-04', 'PRESENT', 105, 100), ('2025-05-04', 'PRESENT', 106, 100), ('2025-05-04', 'ABSENT', 107, 100), ('2025-05-04', 'PRESENT', 108, 100), ('2025-05-04', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 10, 10), ('2025-05-11', 'PRESENT', 11, 10), ('2025-05-11', 'PRESENT', 12, 10), ('2025-05-11', 'PRESENT', 13, 10), ('2025-05-11', 'PRESENT', 14, 10), ('2025-05-11', 'PRESENT', 15, 10), ('2025-05-11', 'ABSENT', 16, 10), ('2025-05-11', 'PRESENT', 17, 10), ('2025-05-11', 'PRESENT', 18, 10), ('2025-05-11', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 20, 20), ('2025-05-11', 'PRESENT', 21, 20), ('2025-05-11', 'PRESENT', 22, 20), ('2025-05-11', 'PRESENT', 23, 20), ('2025-05-11', 'ABSENT', 24, 20), ('2025-05-11', 'ABSENT', 25, 20), ('2025-05-11', 'PRESENT', 26, 20), ('2025-05-11', 'PRESENT', 27, 20), ('2025-05-11', 'PRESENT', 28, 20), ('2025-05-11', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 30, 30), ('2025-05-11', 'PRESENT', 31, 30), ('2025-05-11', 'PRESENT', 32, 30), ('2025-05-11', 'PRESENT', 33, 30), ('2025-05-11', 'PRESENT', 34, 30), ('2025-05-11', 'ABSENT', 35, 30), ('2025-05-11', 'ABSENT', 36, 30), ('2025-05-11', 'PRESENT', 37, 30), ('2025-05-11', 'PRESENT', 38, 30), ('2025-05-11', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 40, 40), ('2025-05-11', 'PRESENT', 41, 40), ('2025-05-11', 'ABSENT', 42, 40), ('2025-05-11', 'PRESENT', 43, 40), ('2025-05-11', 'PRESENT', 44, 40), ('2025-05-11', 'ABSENT', 45, 40), ('2025-05-11', 'PRESENT', 46, 40), ('2025-05-11', 'PRESENT', 47, 40), ('2025-05-11', 'PRESENT', 48, 40), ('2025-05-11', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 50, 50), ('2025-05-11', 'PRESENT', 51, 50), ('2025-05-11', 'PRESENT', 52, 50), ('2025-05-11', 'PRESENT', 53, 50), ('2025-05-11', 'PRESENT', 54, 50), ('2025-05-11', 'ABSENT', 55, 50), ('2025-05-11', 'PRESENT', 56, 50), ('2025-05-11', 'PRESENT', 57, 50), ('2025-05-11', 'ABSENT', 58, 50), ('2025-05-11', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 60, 60), ('2025-05-11', 'PRESENT', 61, 60), ('2025-05-11', 'PRESENT', 62, 60), ('2025-05-11', 'PRESENT', 63, 60), ('2025-05-11', 'PRESENT', 64, 60), ('2025-05-11', 'ABSENT', 65, 60), ('2025-05-11', 'PRESENT', 66, 60), ('2025-05-11', 'PRESENT', 67, 60), ('2025-05-11', 'ABSENT', 68, 60), ('2025-05-11', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 70, 70), ('2025-05-11', 'PRESENT', 71, 70), ('2025-05-11', 'PRESENT', 72, 70), ('2025-05-11', 'PRESENT', 73, 70), ('2025-05-11', 'PRESENT', 74, 70), ('2025-05-11', 'ABSENT', 75, 70), ('2025-05-11', 'PRESENT', 76, 70), ('2025-05-11', 'PRESENT', 77, 70), ('2025-05-11', 'PRESENT', 78, 70), ('2025-05-11', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 80, 80), ('2025-05-11', 'PRESENT', 81, 80), ('2025-05-11', 'PRESENT', 82, 80), ('2025-05-11', 'PRESENT', 83, 80), ('2025-05-11', 'PRESENT', 84, 80), ('2025-05-11', 'ABSENT', 85, 80), ('2025-05-11', 'PRESENT', 86, 80), ('2025-05-11', 'PRESENT', 87, 80), ('2025-05-11', 'PRESENT', 88, 80), ('2025-05-11', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'PRESENT', 90, 90), ('2025-05-11', 'PRESENT', 91, 90), ('2025-05-11', 'PRESENT', 92, 90), ('2025-05-11', 'PRESENT', 93, 90), ('2025-05-11', 'PRESENT', 94, 90), ('2025-05-11', 'PRESENT', 95, 90), ('2025-05-11', 'PRESENT', 96, 90), ('2025-05-11', 'PRESENT', 97, 90), ('2025-05-11', 'ABSENT', 98, 90), ('2025-05-11', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-05-11', '2025-05-11 주일 나눔입니다.', '', '2025-05-11 16:00:00', '2025-05-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-11', 'ABSENT', 100, 100), ('2025-05-11', 'PRESENT', 101, 100), ('2025-05-11', 'PRESENT', 102, 100), ('2025-05-11', 'PRESENT', 103, 100), ('2025-05-11', 'PRESENT', 104, 100), ('2025-05-11', 'PRESENT', 105, 100), ('2025-05-11', 'ABSENT', 106, 100), ('2025-05-11', 'PRESENT', 107, 100), ('2025-05-11', 'PRESENT', 108, 100), ('2025-05-11', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'PRESENT', 10, 10), ('2025-05-18', 'ABSENT', 11, 10), ('2025-05-18', 'PRESENT', 12, 10), ('2025-05-18', 'PRESENT', 13, 10), ('2025-05-18', 'PRESENT', 14, 10), ('2025-05-18', 'PRESENT', 15, 10), ('2025-05-18', 'PRESENT', 16, 10), ('2025-05-18', 'PRESENT', 17, 10), ('2025-05-18', 'PRESENT', 18, 10), ('2025-05-18', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'ABSENT', 20, 20), ('2025-05-18', 'PRESENT', 21, 20), ('2025-05-18', 'PRESENT', 22, 20), ('2025-05-18', 'PRESENT', 23, 20), ('2025-05-18', 'PRESENT', 24, 20), ('2025-05-18', 'ABSENT', 25, 20), ('2025-05-18', 'ABSENT', 26, 20), ('2025-05-18', 'PRESENT', 27, 20), ('2025-05-18', 'PRESENT', 28, 20), ('2025-05-18', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'PRESENT', 30, 30), ('2025-05-18', 'PRESENT', 31, 30), ('2025-05-18', 'PRESENT', 32, 30), ('2025-05-18', 'PRESENT', 33, 30), ('2025-05-18', 'PRESENT', 34, 30), ('2025-05-18', 'PRESENT', 35, 30), ('2025-05-18', 'PRESENT', 36, 30), ('2025-05-18', 'PRESENT', 37, 30), ('2025-05-18', 'PRESENT', 38, 30), ('2025-05-18', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'ABSENT', 40, 40), ('2025-05-18', 'PRESENT', 41, 40), ('2025-05-18', 'PRESENT', 42, 40), ('2025-05-18', 'PRESENT', 43, 40), ('2025-05-18', 'ABSENT', 44, 40), ('2025-05-18', 'ABSENT', 45, 40), ('2025-05-18', 'ABSENT', 46, 40), ('2025-05-18', 'PRESENT', 47, 40), ('2025-05-18', 'PRESENT', 48, 40), ('2025-05-18', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'ABSENT', 50, 50), ('2025-05-18', 'PRESENT', 51, 50), ('2025-05-18', 'PRESENT', 52, 50), ('2025-05-18', 'PRESENT', 53, 50), ('2025-05-18', 'PRESENT', 54, 50), ('2025-05-18', 'ABSENT', 55, 50), ('2025-05-18', 'PRESENT', 56, 50), ('2025-05-18', 'PRESENT', 57, 50), ('2025-05-18', 'PRESENT', 58, 50), ('2025-05-18', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'ABSENT', 60, 60), ('2025-05-18', 'PRESENT', 61, 60), ('2025-05-18', 'PRESENT', 62, 60), ('2025-05-18', 'PRESENT', 63, 60), ('2025-05-18', 'PRESENT', 64, 60), ('2025-05-18', 'PRESENT', 65, 60), ('2025-05-18', 'PRESENT', 66, 60), ('2025-05-18', 'PRESENT', 67, 60), ('2025-05-18', 'PRESENT', 68, 60), ('2025-05-18', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'ABSENT', 70, 70), ('2025-05-18', 'ABSENT', 71, 70), ('2025-05-18', 'PRESENT', 72, 70), ('2025-05-18', 'PRESENT', 73, 70), ('2025-05-18', 'PRESENT', 74, 70), ('2025-05-18', 'ABSENT', 75, 70), ('2025-05-18', 'PRESENT', 76, 70), ('2025-05-18', 'ABSENT', 77, 70), ('2025-05-18', 'PRESENT', 78, 70), ('2025-05-18', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'PRESENT', 80, 80), ('2025-05-18', 'PRESENT', 81, 80), ('2025-05-18', 'PRESENT', 82, 80), ('2025-05-18', 'PRESENT', 83, 80), ('2025-05-18', 'PRESENT', 84, 80), ('2025-05-18', 'PRESENT', 85, 80), ('2025-05-18', 'PRESENT', 86, 80), ('2025-05-18', 'PRESENT', 87, 80), ('2025-05-18', 'PRESENT', 88, 80), ('2025-05-18', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'PRESENT', 90, 90), ('2025-05-18', 'PRESENT', 91, 90), ('2025-05-18', 'PRESENT', 92, 90), ('2025-05-18', 'PRESENT', 93, 90), ('2025-05-18', 'PRESENT', 94, 90), ('2025-05-18', 'ABSENT', 95, 90), ('2025-05-18', 'PRESENT', 96, 90), ('2025-05-18', 'PRESENT', 97, 90), ('2025-05-18', 'PRESENT', 98, 90), ('2025-05-18', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-05-18', '2025-05-18 주일 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-18', 'ABSENT', 100, 100), ('2025-05-18', 'PRESENT', 101, 100), ('2025-05-18', 'PRESENT', 102, 100), ('2025-05-18', 'PRESENT', 103, 100), ('2025-05-18', 'PRESENT', 104, 100), ('2025-05-18', 'PRESENT', 105, 100), ('2025-05-18', 'PRESENT', 106, 100), ('2025-05-18', 'ABSENT', 107, 100), ('2025-05-18', 'PRESENT', 108, 100), ('2025-05-18', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 10, 10), ('2025-05-25', 'PRESENT', 11, 10), ('2025-05-25', 'PRESENT', 12, 10), ('2025-05-25', 'PRESENT', 13, 10), ('2025-05-25', 'PRESENT', 14, 10), ('2025-05-25', 'PRESENT', 15, 10), ('2025-05-25', 'PRESENT', 16, 10), ('2025-05-25', 'PRESENT', 17, 10), ('2025-05-25', 'PRESENT', 18, 10), ('2025-05-25', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'PRESENT', 20, 20), ('2025-05-25', 'PRESENT', 21, 20), ('2025-05-25', 'PRESENT', 22, 20), ('2025-05-25', 'PRESENT', 23, 20), ('2025-05-25', 'PRESENT', 24, 20), ('2025-05-25', 'PRESENT', 25, 20), ('2025-05-25', 'PRESENT', 26, 20), ('2025-05-25', 'PRESENT', 27, 20), ('2025-05-25', 'PRESENT', 28, 20), ('2025-05-25', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 30, 30), ('2025-05-25', 'ABSENT', 31, 30), ('2025-05-25', 'PRESENT', 32, 30), ('2025-05-25', 'PRESENT', 33, 30), ('2025-05-25', 'PRESENT', 34, 30), ('2025-05-25', 'PRESENT', 35, 30), ('2025-05-25', 'PRESENT', 36, 30), ('2025-05-25', 'PRESENT', 37, 30), ('2025-05-25', 'PRESENT', 38, 30), ('2025-05-25', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 40, 40), ('2025-05-25', 'PRESENT', 41, 40), ('2025-05-25', 'PRESENT', 42, 40), ('2025-05-25', 'PRESENT', 43, 40), ('2025-05-25', 'PRESENT', 44, 40), ('2025-05-25', 'ABSENT', 45, 40), ('2025-05-25', 'PRESENT', 46, 40), ('2025-05-25', 'PRESENT', 47, 40), ('2025-05-25', 'PRESENT', 48, 40), ('2025-05-25', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 50, 50), ('2025-05-25', 'PRESENT', 51, 50), ('2025-05-25', 'PRESENT', 52, 50), ('2025-05-25', 'PRESENT', 53, 50), ('2025-05-25', 'PRESENT', 54, 50), ('2025-05-25', 'PRESENT', 55, 50), ('2025-05-25', 'PRESENT', 56, 50), ('2025-05-25', 'PRESENT', 57, 50), ('2025-05-25', 'ABSENT', 58, 50), ('2025-05-25', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 60, 60), ('2025-05-25', 'ABSENT', 61, 60), ('2025-05-25', 'PRESENT', 62, 60), ('2025-05-25', 'ABSENT', 63, 60), ('2025-05-25', 'PRESENT', 64, 60), ('2025-05-25', 'ABSENT', 65, 60), ('2025-05-25', 'PRESENT', 66, 60), ('2025-05-25', 'PRESENT', 67, 60), ('2025-05-25', 'PRESENT', 68, 60), ('2025-05-25', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 70, 70), ('2025-05-25', 'PRESENT', 71, 70), ('2025-05-25', 'ABSENT', 72, 70), ('2025-05-25', 'PRESENT', 73, 70), ('2025-05-25', 'PRESENT', 74, 70), ('2025-05-25', 'ABSENT', 75, 70), ('2025-05-25', 'PRESENT', 76, 70), ('2025-05-25', 'PRESENT', 77, 70), ('2025-05-25', 'PRESENT', 78, 70), ('2025-05-25', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 80, 80), ('2025-05-25', 'PRESENT', 81, 80), ('2025-05-25', 'PRESENT', 82, 80), ('2025-05-25', 'PRESENT', 83, 80), ('2025-05-25', 'PRESENT', 84, 80), ('2025-05-25', 'PRESENT', 85, 80), ('2025-05-25', 'PRESENT', 86, 80), ('2025-05-25', 'PRESENT', 87, 80), ('2025-05-25', 'PRESENT', 88, 80), ('2025-05-25', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'ABSENT', 90, 90), ('2025-05-25', 'PRESENT', 91, 90), ('2025-05-25', 'PRESENT', 92, 90), ('2025-05-25', 'PRESENT', 93, 90), ('2025-05-25', 'PRESENT', 94, 90), ('2025-05-25', 'ABSENT', 95, 90), ('2025-05-25', 'PRESENT', 96, 90), ('2025-05-25', 'PRESENT', 97, 90), ('2025-05-25', 'ABSENT', 98, 90), ('2025-05-25', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-05-25', '2025-05-25 주일 나눔입니다.', '', '2025-05-25 16:00:00', '2025-05-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-05-25', 'PRESENT', 100, 100), ('2025-05-25', 'PRESENT', 101, 100), ('2025-05-25', 'PRESENT', 102, 100), ('2025-05-25', 'PRESENT', 103, 100), ('2025-05-25', 'PRESENT', 104, 100), ('2025-05-25', 'ABSENT', 105, 100), ('2025-05-25', 'PRESENT', 106, 100), ('2025-05-25', 'ABSENT', 107, 100), ('2025-05-25', 'PRESENT', 108, 100), ('2025-05-25', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'PRESENT', 10, 10), ('2025-06-01', 'PRESENT', 11, 10), ('2025-06-01', 'PRESENT', 12, 10), ('2025-06-01', 'PRESENT', 13, 10), ('2025-06-01', 'PRESENT', 14, 10), ('2025-06-01', 'PRESENT', 15, 10), ('2025-06-01', 'PRESENT', 16, 10), ('2025-06-01', 'PRESENT', 17, 10), ('2025-06-01', 'ABSENT', 18, 10), ('2025-06-01', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'PRESENT', 20, 20), ('2025-06-01', 'PRESENT', 21, 20), ('2025-06-01', 'ABSENT', 22, 20), ('2025-06-01', 'PRESENT', 23, 20), ('2025-06-01', 'PRESENT', 24, 20), ('2025-06-01', 'PRESENT', 25, 20), ('2025-06-01', 'ABSENT', 26, 20), ('2025-06-01', 'PRESENT', 27, 20), ('2025-06-01', 'PRESENT', 28, 20), ('2025-06-01', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'ABSENT', 30, 30), ('2025-06-01', 'PRESENT', 31, 30), ('2025-06-01', 'PRESENT', 32, 30), ('2025-06-01', 'PRESENT', 33, 30), ('2025-06-01', 'PRESENT', 34, 30), ('2025-06-01', 'ABSENT', 35, 30), ('2025-06-01', 'PRESENT', 36, 30), ('2025-06-01', 'ABSENT', 37, 30), ('2025-06-01', 'PRESENT', 38, 30), ('2025-06-01', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'PRESENT', 40, 40), ('2025-06-01', 'PRESENT', 41, 40), ('2025-06-01', 'ABSENT', 42, 40), ('2025-06-01', 'PRESENT', 43, 40), ('2025-06-01', 'PRESENT', 44, 40), ('2025-06-01', 'PRESENT', 45, 40), ('2025-06-01', 'ABSENT', 46, 40), ('2025-06-01', 'PRESENT', 47, 40), ('2025-06-01', 'PRESENT', 48, 40), ('2025-06-01', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'PRESENT', 50, 50), ('2025-06-01', 'PRESENT', 51, 50), ('2025-06-01', 'PRESENT', 52, 50), ('2025-06-01', 'ABSENT', 53, 50), ('2025-06-01', 'PRESENT', 54, 50), ('2025-06-01', 'PRESENT', 55, 50), ('2025-06-01', 'PRESENT', 56, 50), ('2025-06-01', 'PRESENT', 57, 50), ('2025-06-01', 'ABSENT', 58, 50), ('2025-06-01', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'ABSENT', 60, 60), ('2025-06-01', 'PRESENT', 61, 60), ('2025-06-01', 'PRESENT', 62, 60), ('2025-06-01', 'PRESENT', 63, 60), ('2025-06-01', 'PRESENT', 64, 60), ('2025-06-01', 'ABSENT', 65, 60), ('2025-06-01', 'PRESENT', 66, 60), ('2025-06-01', 'PRESENT', 67, 60), ('2025-06-01', 'PRESENT', 68, 60), ('2025-06-01', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'ABSENT', 70, 70), ('2025-06-01', 'PRESENT', 71, 70), ('2025-06-01', 'ABSENT', 72, 70), ('2025-06-01', 'PRESENT', 73, 70), ('2025-06-01', 'PRESENT', 74, 70), ('2025-06-01', 'ABSENT', 75, 70), ('2025-06-01', 'PRESENT', 76, 70), ('2025-06-01', 'PRESENT', 77, 70), ('2025-06-01', 'PRESENT', 78, 70), ('2025-06-01', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'ABSENT', 80, 80), ('2025-06-01', 'PRESENT', 81, 80), ('2025-06-01', 'PRESENT', 82, 80), ('2025-06-01', 'PRESENT', 83, 80), ('2025-06-01', 'PRESENT', 84, 80), ('2025-06-01', 'PRESENT', 85, 80), ('2025-06-01', 'ABSENT', 86, 80), ('2025-06-01', 'PRESENT', 87, 80), ('2025-06-01', 'PRESENT', 88, 80), ('2025-06-01', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'ABSENT', 90, 90), ('2025-06-01', 'PRESENT', 91, 90), ('2025-06-01', 'ABSENT', 92, 90), ('2025-06-01', 'PRESENT', 93, 90), ('2025-06-01', 'ABSENT', 94, 90), ('2025-06-01', 'PRESENT', 95, 90), ('2025-06-01', 'PRESENT', 96, 90), ('2025-06-01', 'PRESENT', 97, 90), ('2025-06-01', 'PRESENT', 98, 90), ('2025-06-01', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-06-01', '2025-06-01 주일 나눔입니다.', '', '2025-06-01 16:00:00', '2025-06-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-01', 'ABSENT', 100, 100), ('2025-06-01', 'PRESENT', 101, 100), ('2025-06-01', 'PRESENT', 102, 100), ('2025-06-01', 'PRESENT', 103, 100), ('2025-06-01', 'PRESENT', 104, 100), ('2025-06-01', 'PRESENT', 105, 100), ('2025-06-01', 'PRESENT', 106, 100), ('2025-06-01', 'ABSENT', 107, 100), ('2025-06-01', 'ABSENT', 108, 100), ('2025-06-01', 'ABSENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'ABSENT', 10, 10), ('2025-06-08', 'PRESENT', 11, 10), ('2025-06-08', 'PRESENT', 12, 10), ('2025-06-08', 'PRESENT', 13, 10), ('2025-06-08', 'PRESENT', 14, 10), ('2025-06-08', 'ABSENT', 15, 10), ('2025-06-08', 'PRESENT', 16, 10), ('2025-06-08', 'PRESENT', 17, 10), ('2025-06-08', 'PRESENT', 18, 10), ('2025-06-08', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'PRESENT', 20, 20), ('2025-06-08', 'PRESENT', 21, 20), ('2025-06-08', 'PRESENT', 22, 20), ('2025-06-08', 'PRESENT', 23, 20), ('2025-06-08', 'PRESENT', 24, 20), ('2025-06-08', 'ABSENT', 25, 20), ('2025-06-08', 'PRESENT', 26, 20), ('2025-06-08', 'PRESENT', 27, 20), ('2025-06-08', 'PRESENT', 28, 20), ('2025-06-08', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'ABSENT', 30, 30), ('2025-06-08', 'PRESENT', 31, 30), ('2025-06-08', 'PRESENT', 32, 30), ('2025-06-08', 'PRESENT', 33, 30), ('2025-06-08', 'PRESENT', 34, 30), ('2025-06-08', 'ABSENT', 35, 30), ('2025-06-08', 'PRESENT', 36, 30), ('2025-06-08', 'PRESENT', 37, 30), ('2025-06-08', 'PRESENT', 38, 30), ('2025-06-08', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'PRESENT', 40, 40), ('2025-06-08', 'PRESENT', 41, 40), ('2025-06-08', 'PRESENT', 42, 40), ('2025-06-08', 'PRESENT', 43, 40), ('2025-06-08', 'PRESENT', 44, 40), ('2025-06-08', 'ABSENT', 45, 40), ('2025-06-08', 'PRESENT', 46, 40), ('2025-06-08', 'PRESENT', 47, 40), ('2025-06-08', 'PRESENT', 48, 40), ('2025-06-08', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'PRESENT', 50, 50), ('2025-06-08', 'PRESENT', 51, 50), ('2025-06-08', 'ABSENT', 52, 50), ('2025-06-08', 'ABSENT', 53, 50), ('2025-06-08', 'PRESENT', 54, 50), ('2025-06-08', 'PRESENT', 55, 50), ('2025-06-08', 'PRESENT', 56, 50), ('2025-06-08', 'PRESENT', 57, 50), ('2025-06-08', 'PRESENT', 58, 50), ('2025-06-08', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'ABSENT', 60, 60), ('2025-06-08', 'PRESENT', 61, 60), ('2025-06-08', 'PRESENT', 62, 60), ('2025-06-08', 'PRESENT', 63, 60), ('2025-06-08', 'PRESENT', 64, 60), ('2025-06-08', 'ABSENT', 65, 60), ('2025-06-08', 'PRESENT', 66, 60), ('2025-06-08', 'PRESENT', 67, 60), ('2025-06-08', 'PRESENT', 68, 60), ('2025-06-08', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'PRESENT', 70, 70), ('2025-06-08', 'PRESENT', 71, 70), ('2025-06-08', 'PRESENT', 72, 70), ('2025-06-08', 'PRESENT', 73, 70), ('2025-06-08', 'PRESENT', 74, 70), ('2025-06-08', 'PRESENT', 75, 70), ('2025-06-08', 'PRESENT', 76, 70), ('2025-06-08', 'PRESENT', 77, 70), ('2025-06-08', 'PRESENT', 78, 70), ('2025-06-08', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'PRESENT', 80, 80), ('2025-06-08', 'ABSENT', 81, 80), ('2025-06-08', 'PRESENT', 82, 80), ('2025-06-08', 'PRESENT', 83, 80), ('2025-06-08', 'PRESENT', 84, 80), ('2025-06-08', 'ABSENT', 85, 80), ('2025-06-08', 'PRESENT', 86, 80), ('2025-06-08', 'PRESENT', 87, 80), ('2025-06-08', 'ABSENT', 88, 80), ('2025-06-08', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'ABSENT', 90, 90), ('2025-06-08', 'PRESENT', 91, 90), ('2025-06-08', 'PRESENT', 92, 90), ('2025-06-08', 'PRESENT', 93, 90), ('2025-06-08', 'PRESENT', 94, 90), ('2025-06-08', 'ABSENT', 95, 90), ('2025-06-08', 'PRESENT', 96, 90), ('2025-06-08', 'ABSENT', 97, 90), ('2025-06-08', 'PRESENT', 98, 90), ('2025-06-08', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-06-08', '2025-06-08 주일 나눔입니다.', '', '2025-06-08 16:00:00', '2025-06-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-08', 'PRESENT', 100, 100), ('2025-06-08', 'PRESENT', 101, 100), ('2025-06-08', 'PRESENT', 102, 100), ('2025-06-08', 'PRESENT', 103, 100), ('2025-06-08', 'PRESENT', 104, 100), ('2025-06-08', 'ABSENT', 105, 100), ('2025-06-08', 'PRESENT', 106, 100), ('2025-06-08', 'PRESENT', 107, 100), ('2025-06-08', 'PRESENT', 108, 100), ('2025-06-08', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'PRESENT', 10, 10), ('2025-06-15', 'PRESENT', 11, 10), ('2025-06-15', 'PRESENT', 12, 10), ('2025-06-15', 'PRESENT', 13, 10), ('2025-06-15', 'PRESENT', 14, 10), ('2025-06-15', 'ABSENT', 15, 10), ('2025-06-15', 'PRESENT', 16, 10), ('2025-06-15', 'PRESENT', 17, 10), ('2025-06-15', 'PRESENT', 18, 10), ('2025-06-15', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'PRESENT', 20, 20), ('2025-06-15', 'PRESENT', 21, 20), ('2025-06-15', 'PRESENT', 22, 20), ('2025-06-15', 'PRESENT', 23, 20), ('2025-06-15', 'PRESENT', 24, 20), ('2025-06-15', 'ABSENT', 25, 20), ('2025-06-15', 'PRESENT', 26, 20), ('2025-06-15', 'PRESENT', 27, 20), ('2025-06-15', 'PRESENT', 28, 20), ('2025-06-15', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'PRESENT', 30, 30), ('2025-06-15', 'PRESENT', 31, 30), ('2025-06-15', 'PRESENT', 32, 30), ('2025-06-15', 'PRESENT', 33, 30), ('2025-06-15', 'PRESENT', 34, 30), ('2025-06-15', 'ABSENT', 35, 30), ('2025-06-15', 'PRESENT', 36, 30), ('2025-06-15', 'PRESENT', 37, 30), ('2025-06-15', 'ABSENT', 38, 30), ('2025-06-15', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'PRESENT', 40, 40), ('2025-06-15', 'PRESENT', 41, 40), ('2025-06-15', 'PRESENT', 42, 40), ('2025-06-15', 'PRESENT', 43, 40), ('2025-06-15', 'PRESENT', 44, 40), ('2025-06-15', 'ABSENT', 45, 40), ('2025-06-15', 'PRESENT', 46, 40), ('2025-06-15', 'PRESENT', 47, 40), ('2025-06-15', 'PRESENT', 48, 40), ('2025-06-15', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'ABSENT', 50, 50), ('2025-06-15', 'PRESENT', 51, 50), ('2025-06-15', 'PRESENT', 52, 50), ('2025-06-15', 'PRESENT', 53, 50), ('2025-06-15', 'PRESENT', 54, 50), ('2025-06-15', 'PRESENT', 55, 50), ('2025-06-15', 'PRESENT', 56, 50), ('2025-06-15', 'PRESENT', 57, 50), ('2025-06-15', 'PRESENT', 58, 50), ('2025-06-15', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'ABSENT', 60, 60), ('2025-06-15', 'PRESENT', 61, 60), ('2025-06-15', 'PRESENT', 62, 60), ('2025-06-15', 'PRESENT', 63, 60), ('2025-06-15', 'PRESENT', 64, 60), ('2025-06-15', 'ABSENT', 65, 60), ('2025-06-15', 'PRESENT', 66, 60), ('2025-06-15', 'ABSENT', 67, 60), ('2025-06-15', 'PRESENT', 68, 60), ('2025-06-15', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'PRESENT', 70, 70), ('2025-06-15', 'PRESENT', 71, 70), ('2025-06-15', 'PRESENT', 72, 70), ('2025-06-15', 'PRESENT', 73, 70), ('2025-06-15', 'PRESENT', 74, 70), ('2025-06-15', 'ABSENT', 75, 70), ('2025-06-15', 'PRESENT', 76, 70), ('2025-06-15', 'PRESENT', 77, 70), ('2025-06-15', 'PRESENT', 78, 70), ('2025-06-15', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'ABSENT', 80, 80), ('2025-06-15', 'PRESENT', 81, 80), ('2025-06-15', 'PRESENT', 82, 80), ('2025-06-15', 'PRESENT', 83, 80), ('2025-06-15', 'PRESENT', 84, 80), ('2025-06-15', 'PRESENT', 85, 80), ('2025-06-15', 'PRESENT', 86, 80), ('2025-06-15', 'PRESENT', 87, 80), ('2025-06-15', 'ABSENT', 88, 80), ('2025-06-15', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'ABSENT', 90, 90), ('2025-06-15', 'PRESENT', 91, 90), ('2025-06-15', 'PRESENT', 92, 90), ('2025-06-15', 'PRESENT', 93, 90), ('2025-06-15', 'PRESENT', 94, 90), ('2025-06-15', 'PRESENT', 95, 90), ('2025-06-15', 'PRESENT', 96, 90), ('2025-06-15', 'PRESENT', 97, 90), ('2025-06-15', 'ABSENT', 98, 90), ('2025-06-15', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-06-15', '2025-06-15 주일 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-15', 'PRESENT', 100, 100), ('2025-06-15', 'PRESENT', 101, 100), ('2025-06-15', 'PRESENT', 102, 100), ('2025-06-15', 'PRESENT', 103, 100), ('2025-06-15', 'PRESENT', 104, 100), ('2025-06-15', 'PRESENT', 105, 100), ('2025-06-15', 'ABSENT', 106, 100), ('2025-06-15', 'PRESENT', 107, 100), ('2025-06-15', 'PRESENT', 108, 100), ('2025-06-15', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'ABSENT', 10, 10), ('2025-06-22', 'PRESENT', 11, 10), ('2025-06-22', 'PRESENT', 12, 10), ('2025-06-22', 'PRESENT', 13, 10), ('2025-06-22', 'PRESENT', 14, 10), ('2025-06-22', 'PRESENT', 15, 10), ('2025-06-22', 'PRESENT', 16, 10), ('2025-06-22', 'PRESENT', 17, 10), ('2025-06-22', 'ABSENT', 18, 10), ('2025-06-22', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'ABSENT', 20, 20), ('2025-06-22', 'PRESENT', 21, 20), ('2025-06-22', 'ABSENT', 22, 20), ('2025-06-22', 'PRESENT', 23, 20), ('2025-06-22', 'PRESENT', 24, 20), ('2025-06-22', 'ABSENT', 25, 20), ('2025-06-22', 'PRESENT', 26, 20), ('2025-06-22', 'PRESENT', 27, 20), ('2025-06-22', 'PRESENT', 28, 20), ('2025-06-22', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'ABSENT', 30, 30), ('2025-06-22', 'PRESENT', 31, 30), ('2025-06-22', 'ABSENT', 32, 30), ('2025-06-22', 'PRESENT', 33, 30), ('2025-06-22', 'PRESENT', 34, 30), ('2025-06-22', 'ABSENT', 35, 30), ('2025-06-22', 'PRESENT', 36, 30), ('2025-06-22', 'PRESENT', 37, 30), ('2025-06-22', 'PRESENT', 38, 30), ('2025-06-22', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'PRESENT', 40, 40), ('2025-06-22', 'ABSENT', 41, 40), ('2025-06-22', 'PRESENT', 42, 40), ('2025-06-22', 'PRESENT', 43, 40), ('2025-06-22', 'PRESENT', 44, 40), ('2025-06-22', 'ABSENT', 45, 40), ('2025-06-22', 'PRESENT', 46, 40), ('2025-06-22', 'PRESENT', 47, 40), ('2025-06-22', 'PRESENT', 48, 40), ('2025-06-22', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'PRESENT', 50, 50), ('2025-06-22', 'PRESENT', 51, 50), ('2025-06-22', 'PRESENT', 52, 50), ('2025-06-22', 'PRESENT', 53, 50), ('2025-06-22', 'ABSENT', 54, 50), ('2025-06-22', 'PRESENT', 55, 50), ('2025-06-22', 'PRESENT', 56, 50), ('2025-06-22', 'PRESENT', 57, 50), ('2025-06-22', 'PRESENT', 58, 50), ('2025-06-22', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'PRESENT', 60, 60), ('2025-06-22', 'PRESENT', 61, 60), ('2025-06-22', 'PRESENT', 62, 60), ('2025-06-22', 'PRESENT', 63, 60), ('2025-06-22', 'PRESENT', 64, 60), ('2025-06-22', 'ABSENT', 65, 60), ('2025-06-22', 'PRESENT', 66, 60), ('2025-06-22', 'ABSENT', 67, 60), ('2025-06-22', 'PRESENT', 68, 60), ('2025-06-22', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'PRESENT', 70, 70), ('2025-06-22', 'PRESENT', 71, 70), ('2025-06-22', 'ABSENT', 72, 70), ('2025-06-22', 'PRESENT', 73, 70), ('2025-06-22', 'PRESENT', 74, 70), ('2025-06-22', 'ABSENT', 75, 70), ('2025-06-22', 'PRESENT', 76, 70), ('2025-06-22', 'PRESENT', 77, 70), ('2025-06-22', 'PRESENT', 78, 70), ('2025-06-22', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'ABSENT', 80, 80), ('2025-06-22', 'PRESENT', 81, 80), ('2025-06-22', 'ABSENT', 82, 80), ('2025-06-22', 'PRESENT', 83, 80), ('2025-06-22', 'ABSENT', 84, 80), ('2025-06-22', 'PRESENT', 85, 80), ('2025-06-22', 'PRESENT', 86, 80), ('2025-06-22', 'PRESENT', 87, 80), ('2025-06-22', 'PRESENT', 88, 80), ('2025-06-22', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'PRESENT', 90, 90), ('2025-06-22', 'PRESENT', 91, 90), ('2025-06-22', 'PRESENT', 92, 90), ('2025-06-22', 'PRESENT', 93, 90), ('2025-06-22', 'PRESENT', 94, 90), ('2025-06-22', 'ABSENT', 95, 90), ('2025-06-22', 'PRESENT', 96, 90), ('2025-06-22', 'PRESENT', 97, 90), ('2025-06-22', 'ABSENT', 98, 90), ('2025-06-22', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-06-22', '2025-06-22 주일 나눔입니다.', '', '2025-06-22 16:00:00', '2025-06-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-22', 'PRESENT', 100, 100), ('2025-06-22', 'PRESENT', 101, 100), ('2025-06-22', 'PRESENT', 102, 100), ('2025-06-22', 'PRESENT', 103, 100), ('2025-06-22', 'PRESENT', 104, 100), ('2025-06-22', 'ABSENT', 105, 100), ('2025-06-22', 'PRESENT', 106, 100), ('2025-06-22', 'PRESENT', 107, 100), ('2025-06-22', 'PRESENT', 108, 100), ('2025-06-22', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'ABSENT', 10, 10), ('2025-06-29', 'ABSENT', 11, 10), ('2025-06-29', 'PRESENT', 12, 10), ('2025-06-29', 'PRESENT', 13, 10), ('2025-06-29', 'PRESENT', 14, 10), ('2025-06-29', 'PRESENT', 15, 10), ('2025-06-29', 'PRESENT', 16, 10), ('2025-06-29', 'PRESENT', 17, 10), ('2025-06-29', 'PRESENT', 18, 10), ('2025-06-29', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'PRESENT', 20, 20), ('2025-06-29', 'ABSENT', 21, 20), ('2025-06-29', 'ABSENT', 22, 20), ('2025-06-29', 'PRESENT', 23, 20), ('2025-06-29', 'PRESENT', 24, 20), ('2025-06-29', 'PRESENT', 25, 20), ('2025-06-29', 'PRESENT', 26, 20), ('2025-06-29', 'PRESENT', 27, 20), ('2025-06-29', 'PRESENT', 28, 20), ('2025-06-29', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'ABSENT', 30, 30), ('2025-06-29', 'ABSENT', 31, 30), ('2025-06-29', 'PRESENT', 32, 30), ('2025-06-29', 'PRESENT', 33, 30), ('2025-06-29', 'PRESENT', 34, 30), ('2025-06-29', 'PRESENT', 35, 30), ('2025-06-29', 'PRESENT', 36, 30), ('2025-06-29', 'ABSENT', 37, 30), ('2025-06-29', 'PRESENT', 38, 30), ('2025-06-29', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'PRESENT', 40, 40), ('2025-06-29', 'PRESENT', 41, 40), ('2025-06-29', 'PRESENT', 42, 40), ('2025-06-29', 'PRESENT', 43, 40), ('2025-06-29', 'PRESENT', 44, 40), ('2025-06-29', 'PRESENT', 45, 40), ('2025-06-29', 'PRESENT', 46, 40), ('2025-06-29', 'PRESENT', 47, 40), ('2025-06-29', 'PRESENT', 48, 40), ('2025-06-29', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'PRESENT', 50, 50), ('2025-06-29', 'PRESENT', 51, 50), ('2025-06-29', 'PRESENT', 52, 50), ('2025-06-29', 'PRESENT', 53, 50), ('2025-06-29', 'PRESENT', 54, 50), ('2025-06-29', 'ABSENT', 55, 50), ('2025-06-29', 'PRESENT', 56, 50), ('2025-06-29', 'PRESENT', 57, 50), ('2025-06-29', 'PRESENT', 58, 50), ('2025-06-29', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'PRESENT', 60, 60), ('2025-06-29', 'PRESENT', 61, 60), ('2025-06-29', 'PRESENT', 62, 60), ('2025-06-29', 'PRESENT', 63, 60), ('2025-06-29', 'PRESENT', 64, 60), ('2025-06-29', 'PRESENT', 65, 60), ('2025-06-29', 'PRESENT', 66, 60), ('2025-06-29', 'PRESENT', 67, 60), ('2025-06-29', 'ABSENT', 68, 60), ('2025-06-29', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'PRESENT', 70, 70), ('2025-06-29', 'PRESENT', 71, 70), ('2025-06-29', 'PRESENT', 72, 70), ('2025-06-29', 'PRESENT', 73, 70), ('2025-06-29', 'PRESENT', 74, 70), ('2025-06-29', 'PRESENT', 75, 70), ('2025-06-29', 'PRESENT', 76, 70), ('2025-06-29', 'PRESENT', 77, 70), ('2025-06-29', 'PRESENT', 78, 70), ('2025-06-29', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'ABSENT', 80, 80), ('2025-06-29', 'PRESENT', 81, 80), ('2025-06-29', 'ABSENT', 82, 80), ('2025-06-29', 'PRESENT', 83, 80), ('2025-06-29', 'PRESENT', 84, 80), ('2025-06-29', 'ABSENT', 85, 80), ('2025-06-29', 'PRESENT', 86, 80), ('2025-06-29', 'PRESENT', 87, 80), ('2025-06-29', 'PRESENT', 88, 80), ('2025-06-29', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'PRESENT', 90, 90), ('2025-06-29', 'PRESENT', 91, 90), ('2025-06-29', 'PRESENT', 92, 90), ('2025-06-29', 'PRESENT', 93, 90), ('2025-06-29', 'PRESENT', 94, 90), ('2025-06-29', 'ABSENT', 95, 90), ('2025-06-29', 'PRESENT', 96, 90), ('2025-06-29', 'ABSENT', 97, 90), ('2025-06-29', 'PRESENT', 98, 90), ('2025-06-29', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-06-29', '2025-06-29 주일 나눔입니다.', '', '2025-06-29 16:00:00', '2025-06-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-06-29', 'ABSENT', 100, 100), ('2025-06-29', 'PRESENT', 101, 100), ('2025-06-29', 'PRESENT', 102, 100), ('2025-06-29', 'PRESENT', 103, 100), ('2025-06-29', 'PRESENT', 104, 100), ('2025-06-29', 'PRESENT', 105, 100), ('2025-06-29', 'PRESENT', 106, 100), ('2025-06-29', 'PRESENT', 107, 100), ('2025-06-29', 'PRESENT', 108, 100), ('2025-06-29', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'ABSENT', 10, 10), ('2025-07-06', 'ABSENT', 11, 10), ('2025-07-06', 'PRESENT', 12, 10), ('2025-07-06', 'PRESENT', 13, 10), ('2025-07-06', 'PRESENT', 14, 10), ('2025-07-06', 'ABSENT', 15, 10), ('2025-07-06', 'ABSENT', 16, 10), ('2025-07-06', 'PRESENT', 17, 10), ('2025-07-06', 'PRESENT', 18, 10), ('2025-07-06', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'PRESENT', 20, 20), ('2025-07-06', 'PRESENT', 21, 20), ('2025-07-06', 'PRESENT', 22, 20), ('2025-07-06', 'ABSENT', 23, 20), ('2025-07-06', 'PRESENT', 24, 20), ('2025-07-06', 'ABSENT', 25, 20), ('2025-07-06', 'PRESENT', 26, 20), ('2025-07-06', 'PRESENT', 27, 20), ('2025-07-06', 'PRESENT', 28, 20), ('2025-07-06', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'ABSENT', 30, 30), ('2025-07-06', 'PRESENT', 31, 30), ('2025-07-06', 'PRESENT', 32, 30), ('2025-07-06', 'PRESENT', 33, 30), ('2025-07-06', 'PRESENT', 34, 30), ('2025-07-06', 'PRESENT', 35, 30), ('2025-07-06', 'PRESENT', 36, 30), ('2025-07-06', 'ABSENT', 37, 30), ('2025-07-06', 'PRESENT', 38, 30), ('2025-07-06', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'ABSENT', 40, 40), ('2025-07-06', 'PRESENT', 41, 40), ('2025-07-06', 'ABSENT', 42, 40), ('2025-07-06', 'PRESENT', 43, 40), ('2025-07-06', 'PRESENT', 44, 40), ('2025-07-06', 'PRESENT', 45, 40), ('2025-07-06', 'ABSENT', 46, 40), ('2025-07-06', 'PRESENT', 47, 40), ('2025-07-06', 'PRESENT', 48, 40), ('2025-07-06', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'PRESENT', 50, 50), ('2025-07-06', 'ABSENT', 51, 50), ('2025-07-06', 'PRESENT', 52, 50), ('2025-07-06', 'PRESENT', 53, 50), ('2025-07-06', 'PRESENT', 54, 50), ('2025-07-06', 'PRESENT', 55, 50), ('2025-07-06', 'PRESENT', 56, 50), ('2025-07-06', 'PRESENT', 57, 50), ('2025-07-06', 'PRESENT', 58, 50), ('2025-07-06', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'ABSENT', 60, 60), ('2025-07-06', 'PRESENT', 61, 60), ('2025-07-06', 'PRESENT', 62, 60), ('2025-07-06', 'PRESENT', 63, 60), ('2025-07-06', 'PRESENT', 64, 60), ('2025-07-06', 'ABSENT', 65, 60), ('2025-07-06', 'ABSENT', 66, 60), ('2025-07-06', 'PRESENT', 67, 60), ('2025-07-06', 'PRESENT', 68, 60), ('2025-07-06', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'PRESENT', 70, 70), ('2025-07-06', 'PRESENT', 71, 70), ('2025-07-06', 'PRESENT', 72, 70), ('2025-07-06', 'PRESENT', 73, 70), ('2025-07-06', 'PRESENT', 74, 70), ('2025-07-06', 'ABSENT', 75, 70), ('2025-07-06', 'PRESENT', 76, 70), ('2025-07-06', 'PRESENT', 77, 70), ('2025-07-06', 'PRESENT', 78, 70), ('2025-07-06', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'ABSENT', 80, 80), ('2025-07-06', 'PRESENT', 81, 80), ('2025-07-06', 'PRESENT', 82, 80), ('2025-07-06', 'PRESENT', 83, 80), ('2025-07-06', 'PRESENT', 84, 80), ('2025-07-06', 'ABSENT', 85, 80), ('2025-07-06', 'PRESENT', 86, 80), ('2025-07-06', 'PRESENT', 87, 80), ('2025-07-06', 'PRESENT', 88, 80), ('2025-07-06', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'PRESENT', 90, 90), ('2025-07-06', 'ABSENT', 91, 90), ('2025-07-06', 'PRESENT', 92, 90), ('2025-07-06', 'PRESENT', 93, 90), ('2025-07-06', 'ABSENT', 94, 90), ('2025-07-06', 'PRESENT', 95, 90), ('2025-07-06', 'PRESENT', 96, 90), ('2025-07-06', 'ABSENT', 97, 90), ('2025-07-06', 'PRESENT', 98, 90), ('2025-07-06', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-07-06', '2025-07-06 주일 나눔입니다.', '', '2025-07-06 16:00:00', '2025-07-06 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-06', 'ABSENT', 100, 100), ('2025-07-06', 'ABSENT', 101, 100), ('2025-07-06', 'PRESENT', 102, 100), ('2025-07-06', 'PRESENT', 103, 100), ('2025-07-06', 'PRESENT', 104, 100), ('2025-07-06', 'PRESENT', 105, 100), ('2025-07-06', 'PRESENT', 106, 100), ('2025-07-06', 'PRESENT', 107, 100), ('2025-07-06', 'ABSENT', 108, 100), ('2025-07-06', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 10, 10), ('2025-07-13', 'PRESENT', 11, 10), ('2025-07-13', 'PRESENT', 12, 10), ('2025-07-13', 'PRESENT', 13, 10), ('2025-07-13', 'ABSENT', 14, 10), ('2025-07-13', 'ABSENT', 15, 10), ('2025-07-13', 'PRESENT', 16, 10), ('2025-07-13', 'PRESENT', 17, 10), ('2025-07-13', 'PRESENT', 18, 10), ('2025-07-13', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 20, 20), ('2025-07-13', 'PRESENT', 21, 20), ('2025-07-13', 'PRESENT', 22, 20), ('2025-07-13', 'ABSENT', 23, 20), ('2025-07-13', 'ABSENT', 24, 20), ('2025-07-13', 'ABSENT', 25, 20), ('2025-07-13', 'PRESENT', 26, 20), ('2025-07-13', 'ABSENT', 27, 20), ('2025-07-13', 'PRESENT', 28, 20), ('2025-07-13', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 30, 30), ('2025-07-13', 'PRESENT', 31, 30), ('2025-07-13', 'PRESENT', 32, 30), ('2025-07-13', 'PRESENT', 33, 30), ('2025-07-13', 'PRESENT', 34, 30), ('2025-07-13', 'ABSENT', 35, 30), ('2025-07-13', 'ABSENT', 36, 30), ('2025-07-13', 'ABSENT', 37, 30), ('2025-07-13', 'PRESENT', 38, 30), ('2025-07-13', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 40, 40), ('2025-07-13', 'PRESENT', 41, 40), ('2025-07-13', 'PRESENT', 42, 40), ('2025-07-13', 'PRESENT', 43, 40), ('2025-07-13', 'PRESENT', 44, 40), ('2025-07-13', 'ABSENT', 45, 40), ('2025-07-13', 'PRESENT', 46, 40), ('2025-07-13', 'PRESENT', 47, 40), ('2025-07-13', 'PRESENT', 48, 40), ('2025-07-13', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 50, 50), ('2025-07-13', 'PRESENT', 51, 50), ('2025-07-13', 'PRESENT', 52, 50), ('2025-07-13', 'PRESENT', 53, 50), ('2025-07-13', 'PRESENT', 54, 50), ('2025-07-13', 'ABSENT', 55, 50), ('2025-07-13', 'ABSENT', 56, 50), ('2025-07-13', 'PRESENT', 57, 50), ('2025-07-13', 'PRESENT', 58, 50), ('2025-07-13', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 60, 60), ('2025-07-13', 'PRESENT', 61, 60), ('2025-07-13', 'PRESENT', 62, 60), ('2025-07-13', 'PRESENT', 63, 60), ('2025-07-13', 'PRESENT', 64, 60), ('2025-07-13', 'PRESENT', 65, 60), ('2025-07-13', 'PRESENT', 66, 60), ('2025-07-13', 'PRESENT', 67, 60), ('2025-07-13', 'PRESENT', 68, 60), ('2025-07-13', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 70, 70), ('2025-07-13', 'PRESENT', 71, 70), ('2025-07-13', 'PRESENT', 72, 70), ('2025-07-13', 'ABSENT', 73, 70), ('2025-07-13', 'PRESENT', 74, 70), ('2025-07-13', 'ABSENT', 75, 70), ('2025-07-13', 'PRESENT', 76, 70), ('2025-07-13', 'PRESENT', 77, 70), ('2025-07-13', 'PRESENT', 78, 70), ('2025-07-13', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 80, 80), ('2025-07-13', 'PRESENT', 81, 80), ('2025-07-13', 'PRESENT', 82, 80), ('2025-07-13', 'PRESENT', 83, 80), ('2025-07-13', 'PRESENT', 84, 80), ('2025-07-13', 'PRESENT', 85, 80), ('2025-07-13', 'PRESENT', 86, 80), ('2025-07-13', 'ABSENT', 87, 80), ('2025-07-13', 'PRESENT', 88, 80), ('2025-07-13', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'ABSENT', 90, 90), ('2025-07-13', 'PRESENT', 91, 90), ('2025-07-13', 'PRESENT', 92, 90), ('2025-07-13', 'PRESENT', 93, 90), ('2025-07-13', 'PRESENT', 94, 90), ('2025-07-13', 'ABSENT', 95, 90), ('2025-07-13', 'PRESENT', 96, 90), ('2025-07-13', 'PRESENT', 97, 90), ('2025-07-13', 'PRESENT', 98, 90), ('2025-07-13', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-07-13', '2025-07-13 주일 나눔입니다.', '', '2025-07-13 16:00:00', '2025-07-13 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-13', 'PRESENT', 100, 100), ('2025-07-13', 'PRESENT', 101, 100), ('2025-07-13', 'PRESENT', 102, 100), ('2025-07-13', 'PRESENT', 103, 100), ('2025-07-13', 'PRESENT', 104, 100), ('2025-07-13', 'ABSENT', 105, 100), ('2025-07-13', 'PRESENT', 106, 100), ('2025-07-13', 'PRESENT', 107, 100), ('2025-07-13', 'PRESENT', 108, 100), ('2025-07-13', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 10, 10), ('2025-07-20', 'PRESENT', 11, 10), ('2025-07-20', 'ABSENT', 12, 10), ('2025-07-20', 'PRESENT', 13, 10), ('2025-07-20', 'PRESENT', 14, 10), ('2025-07-20', 'PRESENT', 15, 10), ('2025-07-20', 'ABSENT', 16, 10), ('2025-07-20', 'PRESENT', 17, 10), ('2025-07-20', 'PRESENT', 18, 10), ('2025-07-20', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'PRESENT', 20, 20), ('2025-07-20', 'PRESENT', 21, 20), ('2025-07-20', 'PRESENT', 22, 20), ('2025-07-20', 'PRESENT', 23, 20), ('2025-07-20', 'PRESENT', 24, 20), ('2025-07-20', 'ABSENT', 25, 20), ('2025-07-20', 'PRESENT', 26, 20), ('2025-07-20', 'ABSENT', 27, 20), ('2025-07-20', 'PRESENT', 28, 20), ('2025-07-20', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'PRESENT', 30, 30), ('2025-07-20', 'PRESENT', 31, 30), ('2025-07-20', 'PRESENT', 32, 30), ('2025-07-20', 'PRESENT', 33, 30), ('2025-07-20', 'PRESENT', 34, 30), ('2025-07-20', 'PRESENT', 35, 30), ('2025-07-20', 'PRESENT', 36, 30), ('2025-07-20', 'PRESENT', 37, 30), ('2025-07-20', 'PRESENT', 38, 30), ('2025-07-20', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 40, 40), ('2025-07-20', 'PRESENT', 41, 40), ('2025-07-20', 'PRESENT', 42, 40), ('2025-07-20', 'PRESENT', 43, 40), ('2025-07-20', 'PRESENT', 44, 40), ('2025-07-20', 'ABSENT', 45, 40), ('2025-07-20', 'ABSENT', 46, 40), ('2025-07-20', 'PRESENT', 47, 40), ('2025-07-20', 'PRESENT', 48, 40), ('2025-07-20', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 50, 50), ('2025-07-20', 'ABSENT', 51, 50), ('2025-07-20', 'PRESENT', 52, 50), ('2025-07-20', 'PRESENT', 53, 50), ('2025-07-20', 'ABSENT', 54, 50), ('2025-07-20', 'ABSENT', 55, 50), ('2025-07-20', 'PRESENT', 56, 50), ('2025-07-20', 'PRESENT', 57, 50), ('2025-07-20', 'PRESENT', 58, 50), ('2025-07-20', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 60, 60), ('2025-07-20', 'PRESENT', 61, 60), ('2025-07-20', 'PRESENT', 62, 60), ('2025-07-20', 'PRESENT', 63, 60), ('2025-07-20', 'PRESENT', 64, 60), ('2025-07-20', 'ABSENT', 65, 60), ('2025-07-20', 'PRESENT', 66, 60), ('2025-07-20', 'PRESENT', 67, 60), ('2025-07-20', 'PRESENT', 68, 60), ('2025-07-20', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 70, 70), ('2025-07-20', 'PRESENT', 71, 70), ('2025-07-20', 'PRESENT', 72, 70), ('2025-07-20', 'ABSENT', 73, 70), ('2025-07-20', 'PRESENT', 74, 70), ('2025-07-20', 'ABSENT', 75, 70), ('2025-07-20', 'PRESENT', 76, 70), ('2025-07-20', 'PRESENT', 77, 70), ('2025-07-20', 'PRESENT', 78, 70), ('2025-07-20', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 80, 80), ('2025-07-20', 'PRESENT', 81, 80), ('2025-07-20', 'PRESENT', 82, 80), ('2025-07-20', 'PRESENT', 83, 80), ('2025-07-20', 'PRESENT', 84, 80), ('2025-07-20', 'ABSENT', 85, 80), ('2025-07-20', 'PRESENT', 86, 80), ('2025-07-20', 'PRESENT', 87, 80), ('2025-07-20', 'PRESENT', 88, 80), ('2025-07-20', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'ABSENT', 90, 90), ('2025-07-20', 'PRESENT', 91, 90), ('2025-07-20', 'PRESENT', 92, 90), ('2025-07-20', 'PRESENT', 93, 90), ('2025-07-20', 'PRESENT', 94, 90), ('2025-07-20', 'PRESENT', 95, 90), ('2025-07-20', 'ABSENT', 96, 90), ('2025-07-20', 'PRESENT', 97, 90), ('2025-07-20', 'PRESENT', 98, 90), ('2025-07-20', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-07-20', '2025-07-20 주일 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-20', 'PRESENT', 100, 100), ('2025-07-20', 'PRESENT', 101, 100), ('2025-07-20', 'PRESENT', 102, 100), ('2025-07-20', 'ABSENT', 103, 100), ('2025-07-20', 'PRESENT', 104, 100), ('2025-07-20', 'PRESENT', 105, 100), ('2025-07-20', 'PRESENT', 106, 100), ('2025-07-20', 'PRESENT', 107, 100), ('2025-07-20', 'PRESENT', 108, 100), ('2025-07-20', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 10, 10), ('2025-07-27', 'PRESENT', 11, 10), ('2025-07-27', 'PRESENT', 12, 10), ('2025-07-27', 'PRESENT', 13, 10), ('2025-07-27', 'ABSENT', 14, 10), ('2025-07-27', 'ABSENT', 15, 10), ('2025-07-27', 'PRESENT', 16, 10), ('2025-07-27', 'ABSENT', 17, 10), ('2025-07-27', 'PRESENT', 18, 10), ('2025-07-27', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 20, 20), ('2025-07-27', 'PRESENT', 21, 20), ('2025-07-27', 'PRESENT', 22, 20), ('2025-07-27', 'PRESENT', 23, 20), ('2025-07-27', 'ABSENT', 24, 20), ('2025-07-27', 'ABSENT', 25, 20), ('2025-07-27', 'ABSENT', 26, 20), ('2025-07-27', 'PRESENT', 27, 20), ('2025-07-27', 'PRESENT', 28, 20), ('2025-07-27', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 30, 30), ('2025-07-27', 'PRESENT', 31, 30), ('2025-07-27', 'ABSENT', 32, 30), ('2025-07-27', 'PRESENT', 33, 30), ('2025-07-27', 'PRESENT', 34, 30), ('2025-07-27', 'ABSENT', 35, 30), ('2025-07-27', 'PRESENT', 36, 30), ('2025-07-27', 'PRESENT', 37, 30), ('2025-07-27', 'PRESENT', 38, 30), ('2025-07-27', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 40, 40), ('2025-07-27', 'PRESENT', 41, 40), ('2025-07-27', 'ABSENT', 42, 40), ('2025-07-27', 'PRESENT', 43, 40), ('2025-07-27', 'PRESENT', 44, 40), ('2025-07-27', 'ABSENT', 45, 40), ('2025-07-27', 'PRESENT', 46, 40), ('2025-07-27', 'PRESENT', 47, 40), ('2025-07-27', 'PRESENT', 48, 40), ('2025-07-27', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'PRESENT', 50, 50), ('2025-07-27', 'PRESENT', 51, 50), ('2025-07-27', 'PRESENT', 52, 50), ('2025-07-27', 'PRESENT', 53, 50), ('2025-07-27', 'PRESENT', 54, 50), ('2025-07-27', 'ABSENT', 55, 50), ('2025-07-27', 'PRESENT', 56, 50), ('2025-07-27', 'PRESENT', 57, 50), ('2025-07-27', 'PRESENT', 58, 50), ('2025-07-27', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 60, 60), ('2025-07-27', 'PRESENT', 61, 60), ('2025-07-27', 'PRESENT', 62, 60), ('2025-07-27', 'ABSENT', 63, 60), ('2025-07-27', 'PRESENT', 64, 60), ('2025-07-27', 'ABSENT', 65, 60), ('2025-07-27', 'PRESENT', 66, 60), ('2025-07-27', 'PRESENT', 67, 60), ('2025-07-27', 'PRESENT', 68, 60), ('2025-07-27', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 70, 70), ('2025-07-27', 'PRESENT', 71, 70), ('2025-07-27', 'PRESENT', 72, 70), ('2025-07-27', 'ABSENT', 73, 70), ('2025-07-27', 'ABSENT', 74, 70), ('2025-07-27', 'ABSENT', 75, 70), ('2025-07-27', 'PRESENT', 76, 70), ('2025-07-27', 'PRESENT', 77, 70), ('2025-07-27', 'ABSENT', 78, 70), ('2025-07-27', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'PRESENT', 80, 80), ('2025-07-27', 'PRESENT', 81, 80), ('2025-07-27', 'PRESENT', 82, 80), ('2025-07-27', 'PRESENT', 83, 80), ('2025-07-27', 'PRESENT', 84, 80), ('2025-07-27', 'ABSENT', 85, 80), ('2025-07-27', 'PRESENT', 86, 80), ('2025-07-27', 'PRESENT', 87, 80), ('2025-07-27', 'PRESENT', 88, 80), ('2025-07-27', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'ABSENT', 90, 90), ('2025-07-27', 'PRESENT', 91, 90), ('2025-07-27', 'PRESENT', 92, 90), ('2025-07-27', 'PRESENT', 93, 90), ('2025-07-27', 'PRESENT', 94, 90), ('2025-07-27', 'PRESENT', 95, 90), ('2025-07-27', 'PRESENT', 96, 90), ('2025-07-27', 'PRESENT', 97, 90), ('2025-07-27', 'PRESENT', 98, 90), ('2025-07-27', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-07-27', '2025-07-27 주일 나눔입니다.', '', '2025-07-27 16:00:00', '2025-07-27 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-07-27', 'PRESENT', 100, 100), ('2025-07-27', 'PRESENT', 101, 100), ('2025-07-27', 'PRESENT', 102, 100), ('2025-07-27', 'PRESENT', 103, 100), ('2025-07-27', 'PRESENT', 104, 100), ('2025-07-27', 'PRESENT', 105, 100), ('2025-07-27', 'PRESENT', 106, 100), ('2025-07-27', 'PRESENT', 107, 100), ('2025-07-27', 'PRESENT', 108, 100), ('2025-07-27', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 10, 10), ('2025-08-03', 'PRESENT', 11, 10), ('2025-08-03', 'PRESENT', 12, 10), ('2025-08-03', 'PRESENT', 13, 10), ('2025-08-03', 'PRESENT', 14, 10), ('2025-08-03', 'PRESENT', 15, 10), ('2025-08-03', 'PRESENT', 16, 10), ('2025-08-03', 'PRESENT', 17, 10), ('2025-08-03', 'PRESENT', 18, 10), ('2025-08-03', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 20, 20), ('2025-08-03', 'PRESENT', 21, 20), ('2025-08-03', 'PRESENT', 22, 20), ('2025-08-03', 'PRESENT', 23, 20), ('2025-08-03', 'PRESENT', 24, 20), ('2025-08-03', 'ABSENT', 25, 20), ('2025-08-03', 'PRESENT', 26, 20), ('2025-08-03', 'PRESENT', 27, 20), ('2025-08-03', 'PRESENT', 28, 20), ('2025-08-03', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'PRESENT', 30, 30), ('2025-08-03', 'PRESENT', 31, 30), ('2025-08-03', 'PRESENT', 32, 30), ('2025-08-03', 'PRESENT', 33, 30), ('2025-08-03', 'ABSENT', 34, 30), ('2025-08-03', 'ABSENT', 35, 30), ('2025-08-03', 'PRESENT', 36, 30), ('2025-08-03', 'PRESENT', 37, 30), ('2025-08-03', 'PRESENT', 38, 30), ('2025-08-03', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 40, 40), ('2025-08-03', 'PRESENT', 41, 40), ('2025-08-03', 'PRESENT', 42, 40), ('2025-08-03', 'PRESENT', 43, 40), ('2025-08-03', 'PRESENT', 44, 40), ('2025-08-03', 'PRESENT', 45, 40), ('2025-08-03', 'PRESENT', 46, 40), ('2025-08-03', 'ABSENT', 47, 40), ('2025-08-03', 'PRESENT', 48, 40), ('2025-08-03', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 50, 50), ('2025-08-03', 'PRESENT', 51, 50), ('2025-08-03', 'PRESENT', 52, 50), ('2025-08-03', 'PRESENT', 53, 50), ('2025-08-03', 'PRESENT', 54, 50), ('2025-08-03', 'PRESENT', 55, 50), ('2025-08-03', 'PRESENT', 56, 50), ('2025-08-03', 'PRESENT', 57, 50), ('2025-08-03', 'PRESENT', 58, 50), ('2025-08-03', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 60, 60), ('2025-08-03', 'PRESENT', 61, 60), ('2025-08-03', 'PRESENT', 62, 60), ('2025-08-03', 'PRESENT', 63, 60), ('2025-08-03', 'PRESENT', 64, 60), ('2025-08-03', 'ABSENT', 65, 60), ('2025-08-03', 'PRESENT', 66, 60), ('2025-08-03', 'PRESENT', 67, 60), ('2025-08-03', 'PRESENT', 68, 60), ('2025-08-03', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 70, 70), ('2025-08-03', 'PRESENT', 71, 70), ('2025-08-03', 'PRESENT', 72, 70), ('2025-08-03', 'PRESENT', 73, 70), ('2025-08-03', 'PRESENT', 74, 70), ('2025-08-03', 'PRESENT', 75, 70), ('2025-08-03', 'PRESENT', 76, 70), ('2025-08-03', 'PRESENT', 77, 70), ('2025-08-03', 'PRESENT', 78, 70), ('2025-08-03', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'PRESENT', 80, 80), ('2025-08-03', 'PRESENT', 81, 80), ('2025-08-03', 'PRESENT', 82, 80), ('2025-08-03', 'PRESENT', 83, 80), ('2025-08-03', 'PRESENT', 84, 80), ('2025-08-03', 'PRESENT', 85, 80), ('2025-08-03', 'PRESENT', 86, 80), ('2025-08-03', 'PRESENT', 87, 80), ('2025-08-03', 'PRESENT', 88, 80), ('2025-08-03', 'ABSENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'ABSENT', 90, 90), ('2025-08-03', 'PRESENT', 91, 90), ('2025-08-03', 'PRESENT', 92, 90), ('2025-08-03', 'PRESENT', 93, 90), ('2025-08-03', 'PRESENT', 94, 90), ('2025-08-03', 'ABSENT', 95, 90), ('2025-08-03', 'PRESENT', 96, 90), ('2025-08-03', 'PRESENT', 97, 90), ('2025-08-03', 'PRESENT', 98, 90), ('2025-08-03', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-08-03', '2025-08-03 주일 나눔입니다.', '', '2025-08-03 16:00:00', '2025-08-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-03', 'PRESENT', 100, 100), ('2025-08-03', 'PRESENT', 101, 100), ('2025-08-03', 'PRESENT', 102, 100), ('2025-08-03', 'PRESENT', 103, 100), ('2025-08-03', 'PRESENT', 104, 100), ('2025-08-03', 'ABSENT', 105, 100), ('2025-08-03', 'PRESENT', 106, 100), ('2025-08-03', 'PRESENT', 107, 100), ('2025-08-03', 'PRESENT', 108, 100), ('2025-08-03', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'PRESENT', 10, 10), ('2025-08-10', 'PRESENT', 11, 10), ('2025-08-10', 'ABSENT', 12, 10), ('2025-08-10', 'PRESENT', 13, 10), ('2025-08-10', 'PRESENT', 14, 10), ('2025-08-10', 'PRESENT', 15, 10), ('2025-08-10', 'PRESENT', 16, 10), ('2025-08-10', 'ABSENT', 17, 10), ('2025-08-10', 'PRESENT', 18, 10), ('2025-08-10', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 20, 20), ('2025-08-10', 'PRESENT', 21, 20), ('2025-08-10', 'PRESENT', 22, 20), ('2025-08-10', 'ABSENT', 23, 20), ('2025-08-10', 'PRESENT', 24, 20), ('2025-08-10', 'ABSENT', 25, 20), ('2025-08-10', 'ABSENT', 26, 20), ('2025-08-10', 'PRESENT', 27, 20), ('2025-08-10', 'ABSENT', 28, 20), ('2025-08-10', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'PRESENT', 30, 30), ('2025-08-10', 'PRESENT', 31, 30), ('2025-08-10', 'PRESENT', 32, 30), ('2025-08-10', 'PRESENT', 33, 30), ('2025-08-10', 'ABSENT', 34, 30), ('2025-08-10', 'ABSENT', 35, 30), ('2025-08-10', 'ABSENT', 36, 30), ('2025-08-10', 'PRESENT', 37, 30), ('2025-08-10', 'PRESENT', 38, 30), ('2025-08-10', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'PRESENT', 40, 40), ('2025-08-10', 'PRESENT', 41, 40), ('2025-08-10', 'PRESENT', 42, 40), ('2025-08-10', 'PRESENT', 43, 40), ('2025-08-10', 'PRESENT', 44, 40), ('2025-08-10', 'PRESENT', 45, 40), ('2025-08-10', 'PRESENT', 46, 40), ('2025-08-10', 'PRESENT', 47, 40), ('2025-08-10', 'ABSENT', 48, 40), ('2025-08-10', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 50, 50), ('2025-08-10', 'ABSENT', 51, 50), ('2025-08-10', 'PRESENT', 52, 50), ('2025-08-10', 'PRESENT', 53, 50), ('2025-08-10', 'PRESENT', 54, 50), ('2025-08-10', 'ABSENT', 55, 50), ('2025-08-10', 'PRESENT', 56, 50), ('2025-08-10', 'PRESENT', 57, 50), ('2025-08-10', 'ABSENT', 58, 50), ('2025-08-10', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 60, 60), ('2025-08-10', 'PRESENT', 61, 60), ('2025-08-10', 'PRESENT', 62, 60), ('2025-08-10', 'PRESENT', 63, 60), ('2025-08-10', 'PRESENT', 64, 60), ('2025-08-10', 'PRESENT', 65, 60), ('2025-08-10', 'PRESENT', 66, 60), ('2025-08-10', 'PRESENT', 67, 60), ('2025-08-10', 'PRESENT', 68, 60), ('2025-08-10', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 70, 70), ('2025-08-10', 'PRESENT', 71, 70), ('2025-08-10', 'PRESENT', 72, 70), ('2025-08-10', 'PRESENT', 73, 70), ('2025-08-10', 'PRESENT', 74, 70), ('2025-08-10', 'ABSENT', 75, 70), ('2025-08-10', 'PRESENT', 76, 70), ('2025-08-10', 'PRESENT', 77, 70), ('2025-08-10', 'PRESENT', 78, 70), ('2025-08-10', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 80, 80), ('2025-08-10', 'PRESENT', 81, 80), ('2025-08-10', 'PRESENT', 82, 80), ('2025-08-10', 'PRESENT', 83, 80), ('2025-08-10', 'PRESENT', 84, 80), ('2025-08-10', 'ABSENT', 85, 80), ('2025-08-10', 'ABSENT', 86, 80), ('2025-08-10', 'PRESENT', 87, 80), ('2025-08-10', 'PRESENT', 88, 80), ('2025-08-10', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 90, 90), ('2025-08-10', 'PRESENT', 91, 90), ('2025-08-10', 'PRESENT', 92, 90), ('2025-08-10', 'PRESENT', 93, 90), ('2025-08-10', 'PRESENT', 94, 90), ('2025-08-10', 'PRESENT', 95, 90), ('2025-08-10', 'PRESENT', 96, 90), ('2025-08-10', 'PRESENT', 97, 90), ('2025-08-10', 'PRESENT', 98, 90), ('2025-08-10', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-08-10', '2025-08-10 주일 나눔입니다.', '', '2025-08-10 16:00:00', '2025-08-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-10', 'ABSENT', 100, 100), ('2025-08-10', 'PRESENT', 101, 100), ('2025-08-10', 'PRESENT', 102, 100), ('2025-08-10', 'PRESENT', 103, 100), ('2025-08-10', 'PRESENT', 104, 100), ('2025-08-10', 'PRESENT', 105, 100), ('2025-08-10', 'ABSENT', 106, 100), ('2025-08-10', 'PRESENT', 107, 100), ('2025-08-10', 'PRESENT', 108, 100), ('2025-08-10', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 10, 10), ('2025-08-17', 'PRESENT', 11, 10), ('2025-08-17', 'PRESENT', 12, 10), ('2025-08-17', 'PRESENT', 13, 10), ('2025-08-17', 'ABSENT', 14, 10), ('2025-08-17', 'ABSENT', 15, 10), ('2025-08-17', 'ABSENT', 16, 10), ('2025-08-17', 'PRESENT', 17, 10), ('2025-08-17', 'PRESENT', 18, 10), ('2025-08-17', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 20, 20), ('2025-08-17', 'PRESENT', 21, 20), ('2025-08-17', 'PRESENT', 22, 20), ('2025-08-17', 'PRESENT', 23, 20), ('2025-08-17', 'PRESENT', 24, 20), ('2025-08-17', 'ABSENT', 25, 20), ('2025-08-17', 'PRESENT', 26, 20), ('2025-08-17', 'PRESENT', 27, 20), ('2025-08-17', 'PRESENT', 28, 20), ('2025-08-17', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 30, 30), ('2025-08-17', 'PRESENT', 31, 30), ('2025-08-17', 'PRESENT', 32, 30), ('2025-08-17', 'PRESENT', 33, 30), ('2025-08-17', 'ABSENT', 34, 30), ('2025-08-17', 'ABSENT', 35, 30), ('2025-08-17', 'ABSENT', 36, 30), ('2025-08-17', 'PRESENT', 37, 30), ('2025-08-17', 'PRESENT', 38, 30), ('2025-08-17', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 40, 40), ('2025-08-17', 'ABSENT', 41, 40), ('2025-08-17', 'PRESENT', 42, 40), ('2025-08-17', 'PRESENT', 43, 40), ('2025-08-17', 'PRESENT', 44, 40), ('2025-08-17', 'PRESENT', 45, 40), ('2025-08-17', 'PRESENT', 46, 40), ('2025-08-17', 'PRESENT', 47, 40), ('2025-08-17', 'PRESENT', 48, 40), ('2025-08-17', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'PRESENT', 50, 50), ('2025-08-17', 'PRESENT', 51, 50), ('2025-08-17', 'PRESENT', 52, 50), ('2025-08-17', 'ABSENT', 53, 50), ('2025-08-17', 'ABSENT', 54, 50), ('2025-08-17', 'ABSENT', 55, 50), ('2025-08-17', 'ABSENT', 56, 50), ('2025-08-17', 'PRESENT', 57, 50), ('2025-08-17', 'PRESENT', 58, 50), ('2025-08-17', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 60, 60), ('2025-08-17', 'PRESENT', 61, 60), ('2025-08-17', 'PRESENT', 62, 60), ('2025-08-17', 'PRESENT', 63, 60), ('2025-08-17', 'PRESENT', 64, 60), ('2025-08-17', 'ABSENT', 65, 60), ('2025-08-17', 'PRESENT', 66, 60), ('2025-08-17', 'PRESENT', 67, 60), ('2025-08-17', 'PRESENT', 68, 60), ('2025-08-17', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'PRESENT', 70, 70), ('2025-08-17', 'PRESENT', 71, 70), ('2025-08-17', 'PRESENT', 72, 70), ('2025-08-17', 'PRESENT', 73, 70), ('2025-08-17', 'PRESENT', 74, 70), ('2025-08-17', 'ABSENT', 75, 70), ('2025-08-17', 'PRESENT', 76, 70), ('2025-08-17', 'PRESENT', 77, 70), ('2025-08-17', 'PRESENT', 78, 70), ('2025-08-17', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 80, 80), ('2025-08-17', 'PRESENT', 81, 80), ('2025-08-17', 'PRESENT', 82, 80), ('2025-08-17', 'PRESENT', 83, 80), ('2025-08-17', 'PRESENT', 84, 80), ('2025-08-17', 'ABSENT', 85, 80), ('2025-08-17', 'PRESENT', 86, 80), ('2025-08-17', 'PRESENT', 87, 80), ('2025-08-17', 'PRESENT', 88, 80), ('2025-08-17', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'PRESENT', 90, 90), ('2025-08-17', 'PRESENT', 91, 90), ('2025-08-17', 'PRESENT', 92, 90), ('2025-08-17', 'PRESENT', 93, 90), ('2025-08-17', 'PRESENT', 94, 90), ('2025-08-17', 'ABSENT', 95, 90), ('2025-08-17', 'ABSENT', 96, 90), ('2025-08-17', 'PRESENT', 97, 90), ('2025-08-17', 'PRESENT', 98, 90), ('2025-08-17', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-08-17', '2025-08-17 주일 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-17', 'ABSENT', 100, 100), ('2025-08-17', 'PRESENT', 101, 100), ('2025-08-17', 'PRESENT', 102, 100), ('2025-08-17', 'PRESENT', 103, 100), ('2025-08-17', 'PRESENT', 104, 100), ('2025-08-17', 'ABSENT', 105, 100), ('2025-08-17', 'PRESENT', 106, 100), ('2025-08-17', 'PRESENT', 107, 100), ('2025-08-17', 'PRESENT', 108, 100), ('2025-08-17', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 10, 10), ('2025-08-24', 'ABSENT', 11, 10), ('2025-08-24', 'PRESENT', 12, 10), ('2025-08-24', 'PRESENT', 13, 10), ('2025-08-24', 'PRESENT', 14, 10), ('2025-08-24', 'ABSENT', 15, 10), ('2025-08-24', 'PRESENT', 16, 10), ('2025-08-24', 'PRESENT', 17, 10), ('2025-08-24', 'PRESENT', 18, 10), ('2025-08-24', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 20, 20), ('2025-08-24', 'PRESENT', 21, 20), ('2025-08-24', 'PRESENT', 22, 20), ('2025-08-24', 'PRESENT', 23, 20), ('2025-08-24', 'PRESENT', 24, 20), ('2025-08-24', 'ABSENT', 25, 20), ('2025-08-24', 'PRESENT', 26, 20), ('2025-08-24', 'PRESENT', 27, 20), ('2025-08-24', 'PRESENT', 28, 20), ('2025-08-24', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 30, 30), ('2025-08-24', 'ABSENT', 31, 30), ('2025-08-24', 'PRESENT', 32, 30), ('2025-08-24', 'PRESENT', 33, 30), ('2025-08-24', 'PRESENT', 34, 30), ('2025-08-24', 'ABSENT', 35, 30), ('2025-08-24', 'PRESENT', 36, 30), ('2025-08-24', 'PRESENT', 37, 30), ('2025-08-24', 'PRESENT', 38, 30), ('2025-08-24', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 40, 40), ('2025-08-24', 'PRESENT', 41, 40), ('2025-08-24', 'PRESENT', 42, 40), ('2025-08-24', 'PRESENT', 43, 40), ('2025-08-24', 'PRESENT', 44, 40), ('2025-08-24', 'ABSENT', 45, 40), ('2025-08-24', 'PRESENT', 46, 40), ('2025-08-24', 'ABSENT', 47, 40), ('2025-08-24', 'PRESENT', 48, 40), ('2025-08-24', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'PRESENT', 50, 50), ('2025-08-24', 'PRESENT', 51, 50), ('2025-08-24', 'ABSENT', 52, 50), ('2025-08-24', 'ABSENT', 53, 50), ('2025-08-24', 'PRESENT', 54, 50), ('2025-08-24', 'ABSENT', 55, 50), ('2025-08-24', 'PRESENT', 56, 50), ('2025-08-24', 'PRESENT', 57, 50), ('2025-08-24', 'PRESENT', 58, 50), ('2025-08-24', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 60, 60), ('2025-08-24', 'PRESENT', 61, 60), ('2025-08-24', 'PRESENT', 62, 60), ('2025-08-24', 'ABSENT', 63, 60), ('2025-08-24', 'PRESENT', 64, 60), ('2025-08-24', 'PRESENT', 65, 60), ('2025-08-24', 'PRESENT', 66, 60), ('2025-08-24', 'PRESENT', 67, 60), ('2025-08-24', 'PRESENT', 68, 60), ('2025-08-24', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 70, 70), ('2025-08-24', 'PRESENT', 71, 70), ('2025-08-24', 'PRESENT', 72, 70), ('2025-08-24', 'ABSENT', 73, 70), ('2025-08-24', 'PRESENT', 74, 70), ('2025-08-24', 'ABSENT', 75, 70), ('2025-08-24', 'PRESENT', 76, 70), ('2025-08-24', 'ABSENT', 77, 70), ('2025-08-24', 'PRESENT', 78, 70), ('2025-08-24', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 80, 80), ('2025-08-24', 'PRESENT', 81, 80), ('2025-08-24', 'PRESENT', 82, 80), ('2025-08-24', 'PRESENT', 83, 80), ('2025-08-24', 'PRESENT', 84, 80), ('2025-08-24', 'ABSENT', 85, 80), ('2025-08-24', 'PRESENT', 86, 80), ('2025-08-24', 'PRESENT', 87, 80), ('2025-08-24', 'PRESENT', 88, 80), ('2025-08-24', 'ABSENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 90, 90), ('2025-08-24', 'PRESENT', 91, 90), ('2025-08-24', 'ABSENT', 92, 90), ('2025-08-24', 'ABSENT', 93, 90), ('2025-08-24', 'PRESENT', 94, 90), ('2025-08-24', 'PRESENT', 95, 90), ('2025-08-24', 'PRESENT', 96, 90), ('2025-08-24', 'ABSENT', 97, 90), ('2025-08-24', 'PRESENT', 98, 90), ('2025-08-24', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-08-24', '2025-08-24 주일 나눔입니다.', '', '2025-08-24 16:00:00', '2025-08-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-24', 'ABSENT', 100, 100), ('2025-08-24', 'PRESENT', 101, 100), ('2025-08-24', 'PRESENT', 102, 100), ('2025-08-24', 'PRESENT', 103, 100), ('2025-08-24', 'PRESENT', 104, 100), ('2025-08-24', 'PRESENT', 105, 100), ('2025-08-24', 'PRESENT', 106, 100), ('2025-08-24', 'PRESENT', 107, 100), ('2025-08-24', 'PRESENT', 108, 100), ('2025-08-24', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 10, 10), ('2025-08-31', 'ABSENT', 11, 10), ('2025-08-31', 'PRESENT', 12, 10), ('2025-08-31', 'PRESENT', 13, 10), ('2025-08-31', 'PRESENT', 14, 10), ('2025-08-31', 'PRESENT', 15, 10), ('2025-08-31', 'PRESENT', 16, 10), ('2025-08-31', 'ABSENT', 17, 10), ('2025-08-31', 'PRESENT', 18, 10), ('2025-08-31', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 20, 20), ('2025-08-31', 'PRESENT', 21, 20), ('2025-08-31', 'PRESENT', 22, 20), ('2025-08-31', 'PRESENT', 23, 20), ('2025-08-31', 'PRESENT', 24, 20), ('2025-08-31', 'PRESENT', 25, 20), ('2025-08-31', 'PRESENT', 26, 20), ('2025-08-31', 'PRESENT', 27, 20), ('2025-08-31', 'ABSENT', 28, 20), ('2025-08-31', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'PRESENT', 30, 30), ('2025-08-31', 'PRESENT', 31, 30), ('2025-08-31', 'ABSENT', 32, 30), ('2025-08-31', 'PRESENT', 33, 30), ('2025-08-31', 'PRESENT', 34, 30), ('2025-08-31', 'ABSENT', 35, 30), ('2025-08-31', 'ABSENT', 36, 30), ('2025-08-31', 'ABSENT', 37, 30), ('2025-08-31', 'PRESENT', 38, 30), ('2025-08-31', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 40, 40), ('2025-08-31', 'PRESENT', 41, 40), ('2025-08-31', 'PRESENT', 42, 40), ('2025-08-31', 'PRESENT', 43, 40), ('2025-08-31', 'ABSENT', 44, 40), ('2025-08-31', 'PRESENT', 45, 40), ('2025-08-31', 'PRESENT', 46, 40), ('2025-08-31', 'PRESENT', 47, 40), ('2025-08-31', 'PRESENT', 48, 40), ('2025-08-31', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 50, 50), ('2025-08-31', 'PRESENT', 51, 50), ('2025-08-31', 'PRESENT', 52, 50), ('2025-08-31', 'PRESENT', 53, 50), ('2025-08-31', 'PRESENT', 54, 50), ('2025-08-31', 'PRESENT', 55, 50), ('2025-08-31', 'PRESENT', 56, 50), ('2025-08-31', 'PRESENT', 57, 50), ('2025-08-31', 'PRESENT', 58, 50), ('2025-08-31', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'PRESENT', 60, 60), ('2025-08-31', 'PRESENT', 61, 60), ('2025-08-31', 'PRESENT', 62, 60), ('2025-08-31', 'PRESENT', 63, 60), ('2025-08-31', 'PRESENT', 64, 60), ('2025-08-31', 'ABSENT', 65, 60), ('2025-08-31', 'PRESENT', 66, 60), ('2025-08-31', 'PRESENT', 67, 60), ('2025-08-31', 'PRESENT', 68, 60), ('2025-08-31', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 70, 70), ('2025-08-31', 'PRESENT', 71, 70), ('2025-08-31', 'ABSENT', 72, 70), ('2025-08-31', 'PRESENT', 73, 70), ('2025-08-31', 'ABSENT', 74, 70), ('2025-08-31', 'ABSENT', 75, 70), ('2025-08-31', 'PRESENT', 76, 70), ('2025-08-31', 'PRESENT', 77, 70), ('2025-08-31', 'PRESENT', 78, 70), ('2025-08-31', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 80, 80), ('2025-08-31', 'PRESENT', 81, 80), ('2025-08-31', 'PRESENT', 82, 80), ('2025-08-31', 'PRESENT', 83, 80), ('2025-08-31', 'PRESENT', 84, 80), ('2025-08-31', 'ABSENT', 85, 80), ('2025-08-31', 'PRESENT', 86, 80), ('2025-08-31', 'PRESENT', 87, 80), ('2025-08-31', 'PRESENT', 88, 80), ('2025-08-31', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'ABSENT', 90, 90), ('2025-08-31', 'PRESENT', 91, 90), ('2025-08-31', 'PRESENT', 92, 90), ('2025-08-31', 'PRESENT', 93, 90), ('2025-08-31', 'PRESENT', 94, 90), ('2025-08-31', 'ABSENT', 95, 90), ('2025-08-31', 'PRESENT', 96, 90), ('2025-08-31', 'PRESENT', 97, 90), ('2025-08-31', 'PRESENT', 98, 90), ('2025-08-31', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-08-31', '2025-08-31 주일 나눔입니다.', '', '2025-08-31 16:00:00', '2025-08-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-08-31', 'PRESENT', 100, 100), ('2025-08-31', 'PRESENT', 101, 100), ('2025-08-31', 'PRESENT', 102, 100), ('2025-08-31', 'PRESENT', 103, 100), ('2025-08-31', 'PRESENT', 104, 100), ('2025-08-31', 'ABSENT', 105, 100), ('2025-08-31', 'PRESENT', 106, 100), ('2025-08-31', 'PRESENT', 107, 100), ('2025-08-31', 'PRESENT', 108, 100), ('2025-08-31', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'PRESENT', 10, 10), ('2025-09-07', 'PRESENT', 11, 10), ('2025-09-07', 'PRESENT', 12, 10), ('2025-09-07', 'PRESENT', 13, 10), ('2025-09-07', 'PRESENT', 14, 10), ('2025-09-07', 'ABSENT', 15, 10), ('2025-09-07', 'PRESENT', 16, 10), ('2025-09-07', 'ABSENT', 17, 10), ('2025-09-07', 'PRESENT', 18, 10), ('2025-09-07', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'PRESENT', 20, 20), ('2025-09-07', 'PRESENT', 21, 20), ('2025-09-07', 'PRESENT', 22, 20), ('2025-09-07', 'ABSENT', 23, 20), ('2025-09-07', 'PRESENT', 24, 20), ('2025-09-07', 'PRESENT', 25, 20), ('2025-09-07', 'PRESENT', 26, 20), ('2025-09-07', 'PRESENT', 27, 20), ('2025-09-07', 'PRESENT', 28, 20), ('2025-09-07', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'ABSENT', 30, 30), ('2025-09-07', 'PRESENT', 31, 30), ('2025-09-07', 'PRESENT', 32, 30), ('2025-09-07', 'PRESENT', 33, 30), ('2025-09-07', 'PRESENT', 34, 30), ('2025-09-07', 'PRESENT', 35, 30), ('2025-09-07', 'PRESENT', 36, 30), ('2025-09-07', 'ABSENT', 37, 30), ('2025-09-07', 'PRESENT', 38, 30), ('2025-09-07', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'PRESENT', 40, 40), ('2025-09-07', 'PRESENT', 41, 40), ('2025-09-07', 'PRESENT', 42, 40), ('2025-09-07', 'PRESENT', 43, 40), ('2025-09-07', 'PRESENT', 44, 40), ('2025-09-07', 'ABSENT', 45, 40), ('2025-09-07', 'PRESENT', 46, 40), ('2025-09-07', 'PRESENT', 47, 40), ('2025-09-07', 'PRESENT', 48, 40), ('2025-09-07', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'ABSENT', 50, 50), ('2025-09-07', 'PRESENT', 51, 50), ('2025-09-07', 'PRESENT', 52, 50), ('2025-09-07', 'PRESENT', 53, 50), ('2025-09-07', 'PRESENT', 54, 50), ('2025-09-07', 'ABSENT', 55, 50), ('2025-09-07', 'PRESENT', 56, 50), ('2025-09-07', 'PRESENT', 57, 50), ('2025-09-07', 'PRESENT', 58, 50), ('2025-09-07', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'ABSENT', 60, 60), ('2025-09-07', 'ABSENT', 61, 60), ('2025-09-07', 'PRESENT', 62, 60), ('2025-09-07', 'PRESENT', 63, 60), ('2025-09-07', 'ABSENT', 64, 60), ('2025-09-07', 'PRESENT', 65, 60), ('2025-09-07', 'PRESENT', 66, 60), ('2025-09-07', 'PRESENT', 67, 60), ('2025-09-07', 'PRESENT', 68, 60), ('2025-09-07', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'PRESENT', 70, 70), ('2025-09-07', 'ABSENT', 71, 70), ('2025-09-07', 'PRESENT', 72, 70), ('2025-09-07', 'PRESENT', 73, 70), ('2025-09-07', 'PRESENT', 74, 70), ('2025-09-07', 'ABSENT', 75, 70), ('2025-09-07', 'PRESENT', 76, 70), ('2025-09-07', 'PRESENT', 77, 70), ('2025-09-07', 'PRESENT', 78, 70), ('2025-09-07', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'ABSENT', 80, 80), ('2025-09-07', 'PRESENT', 81, 80), ('2025-09-07', 'PRESENT', 82, 80), ('2025-09-07', 'PRESENT', 83, 80), ('2025-09-07', 'PRESENT', 84, 80), ('2025-09-07', 'ABSENT', 85, 80), ('2025-09-07', 'PRESENT', 86, 80), ('2025-09-07', 'PRESENT', 87, 80), ('2025-09-07', 'ABSENT', 88, 80), ('2025-09-07', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'PRESENT', 90, 90), ('2025-09-07', 'PRESENT', 91, 90), ('2025-09-07', 'PRESENT', 92, 90), ('2025-09-07', 'ABSENT', 93, 90), ('2025-09-07', 'ABSENT', 94, 90), ('2025-09-07', 'ABSENT', 95, 90), ('2025-09-07', 'PRESENT', 96, 90), ('2025-09-07', 'PRESENT', 97, 90), ('2025-09-07', 'ABSENT', 98, 90), ('2025-09-07', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-09-07', '2025-09-07 주일 나눔입니다.', '', '2025-09-07 16:00:00', '2025-09-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-07', 'ABSENT', 100, 100), ('2025-09-07', 'PRESENT', 101, 100), ('2025-09-07', 'PRESENT', 102, 100), ('2025-09-07', 'PRESENT', 103, 100), ('2025-09-07', 'PRESENT', 104, 100), ('2025-09-07', 'ABSENT', 105, 100), ('2025-09-07', 'PRESENT', 106, 100), ('2025-09-07', 'PRESENT', 107, 100), ('2025-09-07', 'ABSENT', 108, 100), ('2025-09-07', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 10, 10), ('2025-09-14', 'ABSENT', 11, 10), ('2025-09-14', 'ABSENT', 12, 10), ('2025-09-14', 'PRESENT', 13, 10), ('2025-09-14', 'PRESENT', 14, 10), ('2025-09-14', 'ABSENT', 15, 10), ('2025-09-14', 'PRESENT', 16, 10), ('2025-09-14', 'PRESENT', 17, 10), ('2025-09-14', 'PRESENT', 18, 10), ('2025-09-14', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'PRESENT', 20, 20), ('2025-09-14', 'ABSENT', 21, 20), ('2025-09-14', 'PRESENT', 22, 20), ('2025-09-14', 'PRESENT', 23, 20), ('2025-09-14', 'ABSENT', 24, 20), ('2025-09-14', 'ABSENT', 25, 20), ('2025-09-14', 'PRESENT', 26, 20), ('2025-09-14', 'ABSENT', 27, 20), ('2025-09-14', 'PRESENT', 28, 20), ('2025-09-14', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 30, 30), ('2025-09-14', 'PRESENT', 31, 30), ('2025-09-14', 'PRESENT', 32, 30), ('2025-09-14', 'PRESENT', 33, 30), ('2025-09-14', 'ABSENT', 34, 30), ('2025-09-14', 'ABSENT', 35, 30), ('2025-09-14', 'PRESENT', 36, 30), ('2025-09-14', 'ABSENT', 37, 30), ('2025-09-14', 'PRESENT', 38, 30), ('2025-09-14', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 40, 40), ('2025-09-14', 'ABSENT', 41, 40), ('2025-09-14', 'PRESENT', 42, 40), ('2025-09-14', 'PRESENT', 43, 40), ('2025-09-14', 'PRESENT', 44, 40), ('2025-09-14', 'ABSENT', 45, 40), ('2025-09-14', 'PRESENT', 46, 40), ('2025-09-14', 'PRESENT', 47, 40), ('2025-09-14', 'PRESENT', 48, 40), ('2025-09-14', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 50, 50), ('2025-09-14', 'PRESENT', 51, 50), ('2025-09-14', 'PRESENT', 52, 50), ('2025-09-14', 'PRESENT', 53, 50), ('2025-09-14', 'PRESENT', 54, 50), ('2025-09-14', 'PRESENT', 55, 50), ('2025-09-14', 'PRESENT', 56, 50), ('2025-09-14', 'PRESENT', 57, 50), ('2025-09-14', 'ABSENT', 58, 50), ('2025-09-14', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 60, 60), ('2025-09-14', 'PRESENT', 61, 60), ('2025-09-14', 'ABSENT', 62, 60), ('2025-09-14', 'PRESENT', 63, 60), ('2025-09-14', 'PRESENT', 64, 60), ('2025-09-14', 'ABSENT', 65, 60), ('2025-09-14', 'PRESENT', 66, 60), ('2025-09-14', 'PRESENT', 67, 60), ('2025-09-14', 'PRESENT', 68, 60), ('2025-09-14', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 70, 70), ('2025-09-14', 'PRESENT', 71, 70), ('2025-09-14', 'PRESENT', 72, 70), ('2025-09-14', 'PRESENT', 73, 70), ('2025-09-14', 'PRESENT', 74, 70), ('2025-09-14', 'ABSENT', 75, 70), ('2025-09-14', 'PRESENT', 76, 70), ('2025-09-14', 'PRESENT', 77, 70), ('2025-09-14', 'PRESENT', 78, 70), ('2025-09-14', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 80, 80), ('2025-09-14', 'ABSENT', 81, 80), ('2025-09-14', 'PRESENT', 82, 80), ('2025-09-14', 'PRESENT', 83, 80), ('2025-09-14', 'PRESENT', 84, 80), ('2025-09-14', 'ABSENT', 85, 80), ('2025-09-14', 'PRESENT', 86, 80), ('2025-09-14', 'PRESENT', 87, 80), ('2025-09-14', 'PRESENT', 88, 80), ('2025-09-14', 'ABSENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'ABSENT', 90, 90), ('2025-09-14', 'PRESENT', 91, 90), ('2025-09-14', 'PRESENT', 92, 90), ('2025-09-14', 'PRESENT', 93, 90), ('2025-09-14', 'PRESENT', 94, 90), ('2025-09-14', 'ABSENT', 95, 90), ('2025-09-14', 'PRESENT', 96, 90), ('2025-09-14', 'ABSENT', 97, 90), ('2025-09-14', 'PRESENT', 98, 90), ('2025-09-14', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-09-14', '2025-09-14 주일 나눔입니다.', '', '2025-09-14 16:00:00', '2025-09-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-14', 'PRESENT', 100, 100), ('2025-09-14', 'PRESENT', 101, 100), ('2025-09-14', 'ABSENT', 102, 100), ('2025-09-14', 'PRESENT', 103, 100), ('2025-09-14', 'PRESENT', 104, 100), ('2025-09-14', 'ABSENT', 105, 100), ('2025-09-14', 'PRESENT', 106, 100), ('2025-09-14', 'PRESENT', 107, 100), ('2025-09-14', 'PRESENT', 108, 100), ('2025-09-14', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 10, 10), ('2025-09-21', 'PRESENT', 11, 10), ('2025-09-21', 'PRESENT', 12, 10), ('2025-09-21', 'PRESENT', 13, 10), ('2025-09-21', 'PRESENT', 14, 10), ('2025-09-21', 'PRESENT', 15, 10), ('2025-09-21', 'PRESENT', 16, 10), ('2025-09-21', 'PRESENT', 17, 10), ('2025-09-21', 'PRESENT', 18, 10), ('2025-09-21', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'ABSENT', 20, 20), ('2025-09-21', 'PRESENT', 21, 20), ('2025-09-21', 'PRESENT', 22, 20), ('2025-09-21', 'PRESENT', 23, 20), ('2025-09-21', 'PRESENT', 24, 20), ('2025-09-21', 'PRESENT', 25, 20), ('2025-09-21', 'ABSENT', 26, 20), ('2025-09-21', 'PRESENT', 27, 20), ('2025-09-21', 'PRESENT', 28, 20), ('2025-09-21', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 30, 30), ('2025-09-21', 'PRESENT', 31, 30), ('2025-09-21', 'PRESENT', 32, 30), ('2025-09-21', 'ABSENT', 33, 30), ('2025-09-21', 'ABSENT', 34, 30), ('2025-09-21', 'PRESENT', 35, 30), ('2025-09-21', 'PRESENT', 36, 30), ('2025-09-21', 'PRESENT', 37, 30), ('2025-09-21', 'PRESENT', 38, 30), ('2025-09-21', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 40, 40), ('2025-09-21', 'PRESENT', 41, 40), ('2025-09-21', 'PRESENT', 42, 40), ('2025-09-21', 'PRESENT', 43, 40), ('2025-09-21', 'PRESENT', 44, 40), ('2025-09-21', 'PRESENT', 45, 40), ('2025-09-21', 'ABSENT', 46, 40), ('2025-09-21', 'PRESENT', 47, 40), ('2025-09-21', 'PRESENT', 48, 40), ('2025-09-21', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 50, 50), ('2025-09-21', 'PRESENT', 51, 50), ('2025-09-21', 'PRESENT', 52, 50), ('2025-09-21', 'PRESENT', 53, 50), ('2025-09-21', 'PRESENT', 54, 50), ('2025-09-21', 'PRESENT', 55, 50), ('2025-09-21', 'PRESENT', 56, 50), ('2025-09-21', 'PRESENT', 57, 50), ('2025-09-21', 'PRESENT', 58, 50), ('2025-09-21', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'ABSENT', 60, 60), ('2025-09-21', 'ABSENT', 61, 60), ('2025-09-21', 'ABSENT', 62, 60), ('2025-09-21', 'PRESENT', 63, 60), ('2025-09-21', 'PRESENT', 64, 60), ('2025-09-21', 'ABSENT', 65, 60), ('2025-09-21', 'PRESENT', 66, 60), ('2025-09-21', 'PRESENT', 67, 60), ('2025-09-21', 'PRESENT', 68, 60), ('2025-09-21', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 70, 70), ('2025-09-21', 'ABSENT', 71, 70), ('2025-09-21', 'PRESENT', 72, 70), ('2025-09-21', 'PRESENT', 73, 70), ('2025-09-21', 'PRESENT', 74, 70), ('2025-09-21', 'ABSENT', 75, 70), ('2025-09-21', 'PRESENT', 76, 70), ('2025-09-21', 'PRESENT', 77, 70), ('2025-09-21', 'PRESENT', 78, 70), ('2025-09-21', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 80, 80), ('2025-09-21', 'ABSENT', 81, 80), ('2025-09-21', 'PRESENT', 82, 80), ('2025-09-21', 'PRESENT', 83, 80), ('2025-09-21', 'PRESENT', 84, 80), ('2025-09-21', 'ABSENT', 85, 80), ('2025-09-21', 'PRESENT', 86, 80), ('2025-09-21', 'PRESENT', 87, 80), ('2025-09-21', 'PRESENT', 88, 80), ('2025-09-21', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'PRESENT', 90, 90), ('2025-09-21', 'PRESENT', 91, 90), ('2025-09-21', 'PRESENT', 92, 90), ('2025-09-21', 'PRESENT', 93, 90), ('2025-09-21', 'PRESENT', 94, 90), ('2025-09-21', 'ABSENT', 95, 90), ('2025-09-21', 'PRESENT', 96, 90), ('2025-09-21', 'PRESENT', 97, 90), ('2025-09-21', 'PRESENT', 98, 90), ('2025-09-21', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-09-21', '2025-09-21 주일 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-21', 'ABSENT', 100, 100), ('2025-09-21', 'PRESENT', 101, 100), ('2025-09-21', 'PRESENT', 102, 100), ('2025-09-21', 'PRESENT', 103, 100), ('2025-09-21', 'PRESENT', 104, 100), ('2025-09-21', 'ABSENT', 105, 100), ('2025-09-21', 'PRESENT', 106, 100), ('2025-09-21', 'PRESENT', 107, 100), ('2025-09-21', 'PRESENT', 108, 100), ('2025-09-21', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 10, 10), ('2025-09-28', 'PRESENT', 11, 10), ('2025-09-28', 'PRESENT', 12, 10), ('2025-09-28', 'PRESENT', 13, 10), ('2025-09-28', 'ABSENT', 14, 10), ('2025-09-28', 'ABSENT', 15, 10), ('2025-09-28', 'PRESENT', 16, 10), ('2025-09-28', 'PRESENT', 17, 10), ('2025-09-28', 'PRESENT', 18, 10), ('2025-09-28', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 20, 20), ('2025-09-28', 'PRESENT', 21, 20), ('2025-09-28', 'PRESENT', 22, 20), ('2025-09-28', 'PRESENT', 23, 20), ('2025-09-28', 'PRESENT', 24, 20), ('2025-09-28', 'ABSENT', 25, 20), ('2025-09-28', 'PRESENT', 26, 20), ('2025-09-28', 'PRESENT', 27, 20), ('2025-09-28', 'ABSENT', 28, 20), ('2025-09-28', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 30, 30), ('2025-09-28', 'PRESENT', 31, 30), ('2025-09-28', 'PRESENT', 32, 30), ('2025-09-28', 'PRESENT', 33, 30), ('2025-09-28', 'ABSENT', 34, 30), ('2025-09-28', 'PRESENT', 35, 30), ('2025-09-28', 'ABSENT', 36, 30), ('2025-09-28', 'ABSENT', 37, 30), ('2025-09-28', 'PRESENT', 38, 30), ('2025-09-28', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 40, 40), ('2025-09-28', 'PRESENT', 41, 40), ('2025-09-28', 'PRESENT', 42, 40), ('2025-09-28', 'PRESENT', 43, 40), ('2025-09-28', 'PRESENT', 44, 40), ('2025-09-28', 'ABSENT', 45, 40), ('2025-09-28', 'PRESENT', 46, 40), ('2025-09-28', 'ABSENT', 47, 40), ('2025-09-28', 'PRESENT', 48, 40), ('2025-09-28', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 50, 50), ('2025-09-28', 'PRESENT', 51, 50), ('2025-09-28', 'PRESENT', 52, 50), ('2025-09-28', 'PRESENT', 53, 50), ('2025-09-28', 'PRESENT', 54, 50), ('2025-09-28', 'ABSENT', 55, 50), ('2025-09-28', 'PRESENT', 56, 50), ('2025-09-28', 'PRESENT', 57, 50), ('2025-09-28', 'PRESENT', 58, 50), ('2025-09-28', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 60, 60), ('2025-09-28', 'PRESENT', 61, 60), ('2025-09-28', 'PRESENT', 62, 60), ('2025-09-28', 'PRESENT', 63, 60), ('2025-09-28', 'ABSENT', 64, 60), ('2025-09-28', 'PRESENT', 65, 60), ('2025-09-28', 'ABSENT', 66, 60), ('2025-09-28', 'PRESENT', 67, 60), ('2025-09-28', 'PRESENT', 68, 60), ('2025-09-28', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 70, 70), ('2025-09-28', 'PRESENT', 71, 70), ('2025-09-28', 'PRESENT', 72, 70), ('2025-09-28', 'PRESENT', 73, 70), ('2025-09-28', 'ABSENT', 74, 70), ('2025-09-28', 'PRESENT', 75, 70), ('2025-09-28', 'ABSENT', 76, 70), ('2025-09-28', 'PRESENT', 77, 70), ('2025-09-28', 'PRESENT', 78, 70), ('2025-09-28', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'PRESENT', 80, 80), ('2025-09-28', 'PRESENT', 81, 80), ('2025-09-28', 'ABSENT', 82, 80), ('2025-09-28', 'PRESENT', 83, 80), ('2025-09-28', 'PRESENT', 84, 80), ('2025-09-28', 'PRESENT', 85, 80), ('2025-09-28', 'PRESENT', 86, 80), ('2025-09-28', 'PRESENT', 87, 80), ('2025-09-28', 'PRESENT', 88, 80), ('2025-09-28', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 90, 90), ('2025-09-28', 'PRESENT', 91, 90), ('2025-09-28', 'ABSENT', 92, 90), ('2025-09-28', 'PRESENT', 93, 90), ('2025-09-28', 'PRESENT', 94, 90), ('2025-09-28', 'ABSENT', 95, 90), ('2025-09-28', 'ABSENT', 96, 90), ('2025-09-28', 'PRESENT', 97, 90), ('2025-09-28', 'PRESENT', 98, 90), ('2025-09-28', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-09-28', '2025-09-28 주일 나눔입니다.', '', '2025-09-28 16:00:00', '2025-09-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-09-28', 'ABSENT', 100, 100), ('2025-09-28', 'PRESENT', 101, 100), ('2025-09-28', 'PRESENT', 102, 100), ('2025-09-28', 'PRESENT', 103, 100), ('2025-09-28', 'PRESENT', 104, 100), ('2025-09-28', 'ABSENT', 105, 100), ('2025-09-28', 'PRESENT', 106, 100), ('2025-09-28', 'ABSENT', 107, 100), ('2025-09-28', 'PRESENT', 108, 100), ('2025-09-28', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'ABSENT', 10, 10), ('2025-10-05', 'PRESENT', 11, 10), ('2025-10-05', 'PRESENT', 12, 10), ('2025-10-05', 'PRESENT', 13, 10), ('2025-10-05', 'PRESENT', 14, 10), ('2025-10-05', 'ABSENT', 15, 10), ('2025-10-05', 'ABSENT', 16, 10), ('2025-10-05', 'ABSENT', 17, 10), ('2025-10-05', 'ABSENT', 18, 10), ('2025-10-05', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'ABSENT', 20, 20), ('2025-10-05', 'PRESENT', 21, 20), ('2025-10-05', 'ABSENT', 22, 20), ('2025-10-05', 'PRESENT', 23, 20), ('2025-10-05', 'PRESENT', 24, 20), ('2025-10-05', 'PRESENT', 25, 20), ('2025-10-05', 'PRESENT', 26, 20), ('2025-10-05', 'PRESENT', 27, 20), ('2025-10-05', 'ABSENT', 28, 20), ('2025-10-05', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'PRESENT', 30, 30), ('2025-10-05', 'PRESENT', 31, 30), ('2025-10-05', 'PRESENT', 32, 30), ('2025-10-05', 'ABSENT', 33, 30), ('2025-10-05', 'PRESENT', 34, 30), ('2025-10-05', 'ABSENT', 35, 30), ('2025-10-05', 'PRESENT', 36, 30), ('2025-10-05', 'PRESENT', 37, 30), ('2025-10-05', 'PRESENT', 38, 30), ('2025-10-05', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'ABSENT', 40, 40), ('2025-10-05', 'ABSENT', 41, 40), ('2025-10-05', 'ABSENT', 42, 40), ('2025-10-05', 'PRESENT', 43, 40), ('2025-10-05', 'PRESENT', 44, 40), ('2025-10-05', 'ABSENT', 45, 40), ('2025-10-05', 'PRESENT', 46, 40), ('2025-10-05', 'PRESENT', 47, 40), ('2025-10-05', 'PRESENT', 48, 40), ('2025-10-05', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'ABSENT', 50, 50), ('2025-10-05', 'PRESENT', 51, 50), ('2025-10-05', 'PRESENT', 52, 50), ('2025-10-05', 'PRESENT', 53, 50), ('2025-10-05', 'PRESENT', 54, 50), ('2025-10-05', 'ABSENT', 55, 50), ('2025-10-05', 'PRESENT', 56, 50), ('2025-10-05', 'ABSENT', 57, 50), ('2025-10-05', 'PRESENT', 58, 50), ('2025-10-05', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'PRESENT', 60, 60), ('2025-10-05', 'PRESENT', 61, 60), ('2025-10-05', 'PRESENT', 62, 60), ('2025-10-05', 'PRESENT', 63, 60), ('2025-10-05', 'PRESENT', 64, 60), ('2025-10-05', 'ABSENT', 65, 60), ('2025-10-05', 'ABSENT', 66, 60), ('2025-10-05', 'PRESENT', 67, 60), ('2025-10-05', 'PRESENT', 68, 60), ('2025-10-05', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'PRESENT', 70, 70), ('2025-10-05', 'PRESENT', 71, 70), ('2025-10-05', 'ABSENT', 72, 70), ('2025-10-05', 'PRESENT', 73, 70), ('2025-10-05', 'PRESENT', 74, 70), ('2025-10-05', 'ABSENT', 75, 70), ('2025-10-05', 'PRESENT', 76, 70), ('2025-10-05', 'PRESENT', 77, 70), ('2025-10-05', 'PRESENT', 78, 70), ('2025-10-05', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'PRESENT', 80, 80), ('2025-10-05', 'PRESENT', 81, 80), ('2025-10-05', 'PRESENT', 82, 80), ('2025-10-05', 'PRESENT', 83, 80), ('2025-10-05', 'PRESENT', 84, 80), ('2025-10-05', 'ABSENT', 85, 80), ('2025-10-05', 'ABSENT', 86, 80), ('2025-10-05', 'PRESENT', 87, 80), ('2025-10-05', 'PRESENT', 88, 80), ('2025-10-05', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'ABSENT', 90, 90), ('2025-10-05', 'PRESENT', 91, 90), ('2025-10-05', 'PRESENT', 92, 90), ('2025-10-05', 'ABSENT', 93, 90), ('2025-10-05', 'PRESENT', 94, 90), ('2025-10-05', 'PRESENT', 95, 90), ('2025-10-05', 'PRESENT', 96, 90), ('2025-10-05', 'PRESENT', 97, 90), ('2025-10-05', 'PRESENT', 98, 90), ('2025-10-05', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-10-05', '2025-10-05 주일 나눔입니다.', '', '2025-10-05 16:00:00', '2025-10-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-05', 'ABSENT', 100, 100), ('2025-10-05', 'PRESENT', 101, 100), ('2025-10-05', 'PRESENT', 102, 100), ('2025-10-05', 'PRESENT', 103, 100), ('2025-10-05', 'PRESENT', 104, 100), ('2025-10-05', 'ABSENT', 105, 100), ('2025-10-05', 'PRESENT', 106, 100), ('2025-10-05', 'PRESENT', 107, 100), ('2025-10-05', 'PRESENT', 108, 100), ('2025-10-05', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'PRESENT', 10, 10), ('2025-10-12', 'PRESENT', 11, 10), ('2025-10-12', 'PRESENT', 12, 10), ('2025-10-12', 'PRESENT', 13, 10), ('2025-10-12', 'PRESENT', 14, 10), ('2025-10-12', 'ABSENT', 15, 10), ('2025-10-12', 'PRESENT', 16, 10), ('2025-10-12', 'ABSENT', 17, 10), ('2025-10-12', 'ABSENT', 18, 10), ('2025-10-12', 'ABSENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'PRESENT', 20, 20), ('2025-10-12', 'PRESENT', 21, 20), ('2025-10-12', 'PRESENT', 22, 20), ('2025-10-12', 'PRESENT', 23, 20), ('2025-10-12', 'PRESENT', 24, 20), ('2025-10-12', 'ABSENT', 25, 20), ('2025-10-12', 'PRESENT', 26, 20), ('2025-10-12', 'PRESENT', 27, 20), ('2025-10-12', 'PRESENT', 28, 20), ('2025-10-12', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'PRESENT', 30, 30), ('2025-10-12', 'ABSENT', 31, 30), ('2025-10-12', 'PRESENT', 32, 30), ('2025-10-12', 'PRESENT', 33, 30), ('2025-10-12', 'PRESENT', 34, 30), ('2025-10-12', 'ABSENT', 35, 30), ('2025-10-12', 'PRESENT', 36, 30), ('2025-10-12', 'PRESENT', 37, 30), ('2025-10-12', 'PRESENT', 38, 30), ('2025-10-12', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'PRESENT', 40, 40), ('2025-10-12', 'PRESENT', 41, 40), ('2025-10-12', 'PRESENT', 42, 40), ('2025-10-12', 'PRESENT', 43, 40), ('2025-10-12', 'PRESENT', 44, 40), ('2025-10-12', 'PRESENT', 45, 40), ('2025-10-12', 'PRESENT', 46, 40), ('2025-10-12', 'ABSENT', 47, 40), ('2025-10-12', 'PRESENT', 48, 40), ('2025-10-12', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'ABSENT', 50, 50), ('2025-10-12', 'ABSENT', 51, 50), ('2025-10-12', 'PRESENT', 52, 50), ('2025-10-12', 'ABSENT', 53, 50), ('2025-10-12', 'PRESENT', 54, 50), ('2025-10-12', 'ABSENT', 55, 50), ('2025-10-12', 'PRESENT', 56, 50), ('2025-10-12', 'PRESENT', 57, 50), ('2025-10-12', 'ABSENT', 58, 50), ('2025-10-12', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'ABSENT', 60, 60), ('2025-10-12', 'PRESENT', 61, 60), ('2025-10-12', 'PRESENT', 62, 60), ('2025-10-12', 'PRESENT', 63, 60), ('2025-10-12', 'PRESENT', 64, 60), ('2025-10-12', 'PRESENT', 65, 60), ('2025-10-12', 'PRESENT', 66, 60), ('2025-10-12', 'PRESENT', 67, 60), ('2025-10-12', 'PRESENT', 68, 60), ('2025-10-12', 'ABSENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'PRESENT', 70, 70), ('2025-10-12', 'ABSENT', 71, 70), ('2025-10-12', 'PRESENT', 72, 70), ('2025-10-12', 'ABSENT', 73, 70), ('2025-10-12', 'PRESENT', 74, 70), ('2025-10-12', 'ABSENT', 75, 70), ('2025-10-12', 'PRESENT', 76, 70), ('2025-10-12', 'PRESENT', 77, 70), ('2025-10-12', 'ABSENT', 78, 70), ('2025-10-12', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'ABSENT', 80, 80), ('2025-10-12', 'PRESENT', 81, 80), ('2025-10-12', 'PRESENT', 82, 80), ('2025-10-12', 'ABSENT', 83, 80), ('2025-10-12', 'PRESENT', 84, 80), ('2025-10-12', 'ABSENT', 85, 80), ('2025-10-12', 'ABSENT', 86, 80), ('2025-10-12', 'PRESENT', 87, 80), ('2025-10-12', 'PRESENT', 88, 80), ('2025-10-12', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'ABSENT', 90, 90), ('2025-10-12', 'PRESENT', 91, 90), ('2025-10-12', 'PRESENT', 92, 90), ('2025-10-12', 'PRESENT', 93, 90), ('2025-10-12', 'PRESENT', 94, 90), ('2025-10-12', 'PRESENT', 95, 90), ('2025-10-12', 'PRESENT', 96, 90), ('2025-10-12', 'PRESENT', 97, 90), ('2025-10-12', 'PRESENT', 98, 90), ('2025-10-12', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-10-12', '2025-10-12 주일 나눔입니다.', '', '2025-10-12 16:00:00', '2025-10-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-12', 'ABSENT', 100, 100), ('2025-10-12', 'PRESENT', 101, 100), ('2025-10-12', 'PRESENT', 102, 100), ('2025-10-12', 'PRESENT', 103, 100), ('2025-10-12', 'PRESENT', 104, 100), ('2025-10-12', 'PRESENT', 105, 100), ('2025-10-12', 'ABSENT', 106, 100), ('2025-10-12', 'PRESENT', 107, 100), ('2025-10-12', 'PRESENT', 108, 100), ('2025-10-12', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'PRESENT', 10, 10), ('2025-10-19', 'PRESENT', 11, 10), ('2025-10-19', 'PRESENT', 12, 10), ('2025-10-19', 'PRESENT', 13, 10), ('2025-10-19', 'PRESENT', 14, 10), ('2025-10-19', 'ABSENT', 15, 10), ('2025-10-19', 'PRESENT', 16, 10), ('2025-10-19', 'PRESENT', 17, 10), ('2025-10-19', 'PRESENT', 18, 10), ('2025-10-19', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'ABSENT', 20, 20), ('2025-10-19', 'PRESENT', 21, 20), ('2025-10-19', 'PRESENT', 22, 20), ('2025-10-19', 'PRESENT', 23, 20), ('2025-10-19', 'ABSENT', 24, 20), ('2025-10-19', 'PRESENT', 25, 20), ('2025-10-19', 'PRESENT', 26, 20), ('2025-10-19', 'PRESENT', 27, 20), ('2025-10-19', 'PRESENT', 28, 20), ('2025-10-19', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'ABSENT', 30, 30), ('2025-10-19', 'PRESENT', 31, 30), ('2025-10-19', 'PRESENT', 32, 30), ('2025-10-19', 'ABSENT', 33, 30), ('2025-10-19', 'ABSENT', 34, 30), ('2025-10-19', 'ABSENT', 35, 30), ('2025-10-19', 'PRESENT', 36, 30), ('2025-10-19', 'PRESENT', 37, 30), ('2025-10-19', 'PRESENT', 38, 30), ('2025-10-19', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'ABSENT', 40, 40), ('2025-10-19', 'PRESENT', 41, 40), ('2025-10-19', 'PRESENT', 42, 40), ('2025-10-19', 'PRESENT', 43, 40), ('2025-10-19', 'PRESENT', 44, 40), ('2025-10-19', 'ABSENT', 45, 40), ('2025-10-19', 'PRESENT', 46, 40), ('2025-10-19', 'PRESENT', 47, 40), ('2025-10-19', 'PRESENT', 48, 40), ('2025-10-19', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'PRESENT', 50, 50), ('2025-10-19', 'PRESENT', 51, 50), ('2025-10-19', 'PRESENT', 52, 50), ('2025-10-19', 'PRESENT', 53, 50), ('2025-10-19', 'PRESENT', 54, 50), ('2025-10-19', 'ABSENT', 55, 50), ('2025-10-19', 'PRESENT', 56, 50), ('2025-10-19', 'PRESENT', 57, 50), ('2025-10-19', 'PRESENT', 58, 50), ('2025-10-19', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'PRESENT', 60, 60), ('2025-10-19', 'PRESENT', 61, 60), ('2025-10-19', 'PRESENT', 62, 60), ('2025-10-19', 'PRESENT', 63, 60), ('2025-10-19', 'PRESENT', 64, 60), ('2025-10-19', 'ABSENT', 65, 60), ('2025-10-19', 'PRESENT', 66, 60), ('2025-10-19', 'PRESENT', 67, 60), ('2025-10-19', 'PRESENT', 68, 60), ('2025-10-19', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'ABSENT', 70, 70), ('2025-10-19', 'PRESENT', 71, 70), ('2025-10-19', 'PRESENT', 72, 70), ('2025-10-19', 'PRESENT', 73, 70), ('2025-10-19', 'PRESENT', 74, 70), ('2025-10-19', 'ABSENT', 75, 70), ('2025-10-19', 'PRESENT', 76, 70), ('2025-10-19', 'PRESENT', 77, 70), ('2025-10-19', 'PRESENT', 78, 70), ('2025-10-19', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'ABSENT', 80, 80), ('2025-10-19', 'PRESENT', 81, 80), ('2025-10-19', 'PRESENT', 82, 80), ('2025-10-19', 'PRESENT', 83, 80), ('2025-10-19', 'PRESENT', 84, 80), ('2025-10-19', 'ABSENT', 85, 80), ('2025-10-19', 'PRESENT', 86, 80), ('2025-10-19', 'PRESENT', 87, 80), ('2025-10-19', 'PRESENT', 88, 80), ('2025-10-19', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'ABSENT', 90, 90), ('2025-10-19', 'PRESENT', 91, 90), ('2025-10-19', 'PRESENT', 92, 90), ('2025-10-19', 'PRESENT', 93, 90), ('2025-10-19', 'PRESENT', 94, 90), ('2025-10-19', 'PRESENT', 95, 90), ('2025-10-19', 'ABSENT', 96, 90), ('2025-10-19', 'PRESENT', 97, 90), ('2025-10-19', 'PRESENT', 98, 90), ('2025-10-19', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-10-19', '2025-10-19 주일 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-19', 'PRESENT', 100, 100), ('2025-10-19', 'PRESENT', 101, 100), ('2025-10-19', 'PRESENT', 102, 100), ('2025-10-19', 'ABSENT', 103, 100), ('2025-10-19', 'PRESENT', 104, 100), ('2025-10-19', 'PRESENT', 105, 100), ('2025-10-19', 'PRESENT', 106, 100), ('2025-10-19', 'PRESENT', 107, 100), ('2025-10-19', 'PRESENT', 108, 100), ('2025-10-19', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'PRESENT', 10, 10), ('2025-10-26', 'PRESENT', 11, 10), ('2025-10-26', 'PRESENT', 12, 10), ('2025-10-26', 'PRESENT', 13, 10), ('2025-10-26', 'PRESENT', 14, 10), ('2025-10-26', 'PRESENT', 15, 10), ('2025-10-26', 'PRESENT', 16, 10), ('2025-10-26', 'PRESENT', 17, 10), ('2025-10-26', 'PRESENT', 18, 10), ('2025-10-26', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 20, 20), ('2025-10-26', 'PRESENT', 21, 20), ('2025-10-26', 'PRESENT', 22, 20), ('2025-10-26', 'PRESENT', 23, 20), ('2025-10-26', 'PRESENT', 24, 20), ('2025-10-26', 'ABSENT', 25, 20), ('2025-10-26', 'ABSENT', 26, 20), ('2025-10-26', 'PRESENT', 27, 20), ('2025-10-26', 'PRESENT', 28, 20), ('2025-10-26', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 30, 30), ('2025-10-26', 'ABSENT', 31, 30), ('2025-10-26', 'PRESENT', 32, 30), ('2025-10-26', 'PRESENT', 33, 30), ('2025-10-26', 'PRESENT', 34, 30), ('2025-10-26', 'PRESENT', 35, 30), ('2025-10-26', 'PRESENT', 36, 30), ('2025-10-26', 'PRESENT', 37, 30), ('2025-10-26', 'PRESENT', 38, 30), ('2025-10-26', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'PRESENT', 40, 40), ('2025-10-26', 'PRESENT', 41, 40), ('2025-10-26', 'PRESENT', 42, 40), ('2025-10-26', 'PRESENT', 43, 40), ('2025-10-26', 'PRESENT', 44, 40), ('2025-10-26', 'PRESENT', 45, 40), ('2025-10-26', 'PRESENT', 46, 40), ('2025-10-26', 'PRESENT', 47, 40), ('2025-10-26', 'PRESENT', 48, 40), ('2025-10-26', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 50, 50), ('2025-10-26', 'PRESENT', 51, 50), ('2025-10-26', 'PRESENT', 52, 50), ('2025-10-26', 'ABSENT', 53, 50), ('2025-10-26', 'PRESENT', 54, 50), ('2025-10-26', 'ABSENT', 55, 50), ('2025-10-26', 'ABSENT', 56, 50), ('2025-10-26', 'PRESENT', 57, 50), ('2025-10-26', 'PRESENT', 58, 50), ('2025-10-26', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 60, 60), ('2025-10-26', 'PRESENT', 61, 60), ('2025-10-26', 'ABSENT', 62, 60), ('2025-10-26', 'ABSENT', 63, 60), ('2025-10-26', 'PRESENT', 64, 60), ('2025-10-26', 'ABSENT', 65, 60), ('2025-10-26', 'PRESENT', 66, 60), ('2025-10-26', 'PRESENT', 67, 60), ('2025-10-26', 'PRESENT', 68, 60), ('2025-10-26', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 70, 70), ('2025-10-26', 'PRESENT', 71, 70), ('2025-10-26', 'ABSENT', 72, 70), ('2025-10-26', 'PRESENT', 73, 70), ('2025-10-26', 'PRESENT', 74, 70), ('2025-10-26', 'PRESENT', 75, 70), ('2025-10-26', 'PRESENT', 76, 70), ('2025-10-26', 'PRESENT', 77, 70), ('2025-10-26', 'PRESENT', 78, 70), ('2025-10-26', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'PRESENT', 80, 80), ('2025-10-26', 'PRESENT', 81, 80), ('2025-10-26', 'PRESENT', 82, 80), ('2025-10-26', 'PRESENT', 83, 80), ('2025-10-26', 'PRESENT', 84, 80), ('2025-10-26', 'ABSENT', 85, 80), ('2025-10-26', 'PRESENT', 86, 80), ('2025-10-26', 'PRESENT', 87, 80), ('2025-10-26', 'PRESENT', 88, 80), ('2025-10-26', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 90, 90), ('2025-10-26', 'PRESENT', 91, 90), ('2025-10-26', 'PRESENT', 92, 90), ('2025-10-26', 'PRESENT', 93, 90), ('2025-10-26', 'PRESENT', 94, 90), ('2025-10-26', 'ABSENT', 95, 90), ('2025-10-26', 'PRESENT', 96, 90), ('2025-10-26', 'PRESENT', 97, 90), ('2025-10-26', 'PRESENT', 98, 90), ('2025-10-26', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-10-26', '2025-10-26 주일 나눔입니다.', '', '2025-10-26 16:00:00', '2025-10-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-10-26', 'ABSENT', 100, 100), ('2025-10-26', 'PRESENT', 101, 100), ('2025-10-26', 'PRESENT', 102, 100), ('2025-10-26', 'PRESENT', 103, 100), ('2025-10-26', 'PRESENT', 104, 100), ('2025-10-26', 'PRESENT', 105, 100), ('2025-10-26', 'ABSENT', 106, 100), ('2025-10-26', 'PRESENT', 107, 100), ('2025-10-26', 'PRESENT', 108, 100), ('2025-10-26', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'PRESENT', 10, 10), ('2025-11-02', 'PRESENT', 11, 10), ('2025-11-02', 'PRESENT', 12, 10), ('2025-11-02', 'PRESENT', 13, 10), ('2025-11-02', 'PRESENT', 14, 10), ('2025-11-02', 'ABSENT', 15, 10), ('2025-11-02', 'PRESENT', 16, 10), ('2025-11-02', 'PRESENT', 17, 10), ('2025-11-02', 'PRESENT', 18, 10), ('2025-11-02', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'PRESENT', 20, 20), ('2025-11-02', 'PRESENT', 21, 20), ('2025-11-02', 'PRESENT', 22, 20), ('2025-11-02', 'PRESENT', 23, 20), ('2025-11-02', 'ABSENT', 24, 20), ('2025-11-02', 'ABSENT', 25, 20), ('2025-11-02', 'PRESENT', 26, 20), ('2025-11-02', 'PRESENT', 27, 20), ('2025-11-02', 'PRESENT', 28, 20), ('2025-11-02', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'PRESENT', 30, 30), ('2025-11-02', 'PRESENT', 31, 30), ('2025-11-02', 'ABSENT', 32, 30), ('2025-11-02', 'PRESENT', 33, 30), ('2025-11-02', 'PRESENT', 34, 30), ('2025-11-02', 'ABSENT', 35, 30), ('2025-11-02', 'PRESENT', 36, 30), ('2025-11-02', 'PRESENT', 37, 30), ('2025-11-02', 'PRESENT', 38, 30), ('2025-11-02', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'ABSENT', 40, 40), ('2025-11-02', 'PRESENT', 41, 40), ('2025-11-02', 'PRESENT', 42, 40), ('2025-11-02', 'PRESENT', 43, 40), ('2025-11-02', 'PRESENT', 44, 40), ('2025-11-02', 'ABSENT', 45, 40), ('2025-11-02', 'PRESENT', 46, 40), ('2025-11-02', 'PRESENT', 47, 40), ('2025-11-02', 'PRESENT', 48, 40), ('2025-11-02', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'ABSENT', 50, 50), ('2025-11-02', 'PRESENT', 51, 50), ('2025-11-02', 'ABSENT', 52, 50), ('2025-11-02', 'PRESENT', 53, 50), ('2025-11-02', 'PRESENT', 54, 50), ('2025-11-02', 'ABSENT', 55, 50), ('2025-11-02', 'PRESENT', 56, 50), ('2025-11-02', 'PRESENT', 57, 50), ('2025-11-02', 'PRESENT', 58, 50), ('2025-11-02', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'PRESENT', 60, 60), ('2025-11-02', 'PRESENT', 61, 60), ('2025-11-02', 'PRESENT', 62, 60), ('2025-11-02', 'PRESENT', 63, 60), ('2025-11-02', 'PRESENT', 64, 60), ('2025-11-02', 'PRESENT', 65, 60), ('2025-11-02', 'PRESENT', 66, 60), ('2025-11-02', 'PRESENT', 67, 60), ('2025-11-02', 'PRESENT', 68, 60), ('2025-11-02', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'ABSENT', 70, 70), ('2025-11-02', 'PRESENT', 71, 70), ('2025-11-02', 'PRESENT', 72, 70), ('2025-11-02', 'PRESENT', 73, 70), ('2025-11-02', 'PRESENT', 74, 70), ('2025-11-02', 'PRESENT', 75, 70), ('2025-11-02', 'PRESENT', 76, 70), ('2025-11-02', 'PRESENT', 77, 70), ('2025-11-02', 'ABSENT', 78, 70), ('2025-11-02', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'ABSENT', 80, 80), ('2025-11-02', 'PRESENT', 81, 80), ('2025-11-02', 'PRESENT', 82, 80), ('2025-11-02', 'PRESENT', 83, 80), ('2025-11-02', 'PRESENT', 84, 80), ('2025-11-02', 'ABSENT', 85, 80), ('2025-11-02', 'PRESENT', 86, 80), ('2025-11-02', 'ABSENT', 87, 80), ('2025-11-02', 'ABSENT', 88, 80), ('2025-11-02', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'PRESENT', 90, 90), ('2025-11-02', 'PRESENT', 91, 90), ('2025-11-02', 'PRESENT', 92, 90), ('2025-11-02', 'PRESENT', 93, 90), ('2025-11-02', 'PRESENT', 94, 90), ('2025-11-02', 'ABSENT', 95, 90), ('2025-11-02', 'ABSENT', 96, 90), ('2025-11-02', 'PRESENT', 97, 90), ('2025-11-02', 'PRESENT', 98, 90), ('2025-11-02', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-11-02', '2025-11-02 주일 나눔입니다.', '', '2025-11-02 16:00:00', '2025-11-02 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-02', 'ABSENT', 100, 100), ('2025-11-02', 'PRESENT', 101, 100), ('2025-11-02', 'PRESENT', 102, 100), ('2025-11-02', 'PRESENT', 103, 100), ('2025-11-02', 'PRESENT', 104, 100), ('2025-11-02', 'ABSENT', 105, 100), ('2025-11-02', 'PRESENT', 106, 100), ('2025-11-02', 'PRESENT', 107, 100), ('2025-11-02', 'ABSENT', 108, 100), ('2025-11-02', 'ABSENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'ABSENT', 10, 10), ('2025-11-09', 'PRESENT', 11, 10), ('2025-11-09', 'ABSENT', 12, 10), ('2025-11-09', 'PRESENT', 13, 10), ('2025-11-09', 'PRESENT', 14, 10), ('2025-11-09', 'ABSENT', 15, 10), ('2025-11-09', 'PRESENT', 16, 10), ('2025-11-09', 'ABSENT', 17, 10), ('2025-11-09', 'PRESENT', 18, 10), ('2025-11-09', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'PRESENT', 20, 20), ('2025-11-09', 'PRESENT', 21, 20), ('2025-11-09', 'PRESENT', 22, 20), ('2025-11-09', 'PRESENT', 23, 20), ('2025-11-09', 'PRESENT', 24, 20), ('2025-11-09', 'ABSENT', 25, 20), ('2025-11-09', 'PRESENT', 26, 20), ('2025-11-09', 'PRESENT', 27, 20), ('2025-11-09', 'PRESENT', 28, 20), ('2025-11-09', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'ABSENT', 30, 30), ('2025-11-09', 'PRESENT', 31, 30), ('2025-11-09', 'ABSENT', 32, 30), ('2025-11-09', 'PRESENT', 33, 30), ('2025-11-09', 'PRESENT', 34, 30), ('2025-11-09', 'ABSENT', 35, 30), ('2025-11-09', 'PRESENT', 36, 30), ('2025-11-09', 'PRESENT', 37, 30), ('2025-11-09', 'PRESENT', 38, 30), ('2025-11-09', 'ABSENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'PRESENT', 40, 40), ('2025-11-09', 'ABSENT', 41, 40), ('2025-11-09', 'PRESENT', 42, 40), ('2025-11-09', 'PRESENT', 43, 40), ('2025-11-09', 'PRESENT', 44, 40), ('2025-11-09', 'PRESENT', 45, 40), ('2025-11-09', 'PRESENT', 46, 40), ('2025-11-09', 'PRESENT', 47, 40), ('2025-11-09', 'ABSENT', 48, 40), ('2025-11-09', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'PRESENT', 50, 50), ('2025-11-09', 'ABSENT', 51, 50), ('2025-11-09', 'PRESENT', 52, 50), ('2025-11-09', 'PRESENT', 53, 50), ('2025-11-09', 'PRESENT', 54, 50), ('2025-11-09', 'ABSENT', 55, 50), ('2025-11-09', 'PRESENT', 56, 50), ('2025-11-09', 'PRESENT', 57, 50), ('2025-11-09', 'ABSENT', 58, 50), ('2025-11-09', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'PRESENT', 60, 60), ('2025-11-09', 'PRESENT', 61, 60), ('2025-11-09', 'PRESENT', 62, 60), ('2025-11-09', 'PRESENT', 63, 60), ('2025-11-09', 'PRESENT', 64, 60), ('2025-11-09', 'ABSENT', 65, 60), ('2025-11-09', 'PRESENT', 66, 60), ('2025-11-09', 'PRESENT', 67, 60), ('2025-11-09', 'PRESENT', 68, 60), ('2025-11-09', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'ABSENT', 70, 70), ('2025-11-09', 'PRESENT', 71, 70), ('2025-11-09', 'PRESENT', 72, 70), ('2025-11-09', 'PRESENT', 73, 70), ('2025-11-09', 'PRESENT', 74, 70), ('2025-11-09', 'PRESENT', 75, 70), ('2025-11-09', 'PRESENT', 76, 70), ('2025-11-09', 'PRESENT', 77, 70), ('2025-11-09', 'PRESENT', 78, 70), ('2025-11-09', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'ABSENT', 80, 80), ('2025-11-09', 'PRESENT', 81, 80), ('2025-11-09', 'PRESENT', 82, 80), ('2025-11-09', 'PRESENT', 83, 80), ('2025-11-09', 'PRESENT', 84, 80), ('2025-11-09', 'PRESENT', 85, 80), ('2025-11-09', 'PRESENT', 86, 80), ('2025-11-09', 'ABSENT', 87, 80), ('2025-11-09', 'PRESENT', 88, 80), ('2025-11-09', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'ABSENT', 90, 90), ('2025-11-09', 'PRESENT', 91, 90), ('2025-11-09', 'ABSENT', 92, 90), ('2025-11-09', 'PRESENT', 93, 90), ('2025-11-09', 'PRESENT', 94, 90), ('2025-11-09', 'ABSENT', 95, 90), ('2025-11-09', 'PRESENT', 96, 90), ('2025-11-09', 'PRESENT', 97, 90), ('2025-11-09', 'PRESENT', 98, 90), ('2025-11-09', 'ABSENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-11-09', '2025-11-09 주일 나눔입니다.', '', '2025-11-09 16:00:00', '2025-11-09 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-09', 'ABSENT', 100, 100), ('2025-11-09', 'PRESENT', 101, 100), ('2025-11-09', 'PRESENT', 102, 100), ('2025-11-09', 'PRESENT', 103, 100), ('2025-11-09', 'PRESENT', 104, 100), ('2025-11-09', 'ABSENT', 105, 100), ('2025-11-09', 'PRESENT', 106, 100), ('2025-11-09', 'ABSENT', 107, 100), ('2025-11-09', 'PRESENT', 108, 100), ('2025-11-09', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'PRESENT', 10, 10), ('2025-11-16', 'PRESENT', 11, 10), ('2025-11-16', 'PRESENT', 12, 10), ('2025-11-16', 'PRESENT', 13, 10), ('2025-11-16', 'PRESENT', 14, 10), ('2025-11-16', 'PRESENT', 15, 10), ('2025-11-16', 'PRESENT', 16, 10), ('2025-11-16', 'ABSENT', 17, 10), ('2025-11-16', 'PRESENT', 18, 10), ('2025-11-16', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 20, 20), ('2025-11-16', 'ABSENT', 21, 20), ('2025-11-16', 'PRESENT', 22, 20), ('2025-11-16', 'PRESENT', 23, 20), ('2025-11-16', 'PRESENT', 24, 20), ('2025-11-16', 'ABSENT', 25, 20), ('2025-11-16', 'PRESENT', 26, 20), ('2025-11-16', 'PRESENT', 27, 20), ('2025-11-16', 'PRESENT', 28, 20), ('2025-11-16', 'ABSENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 30, 30), ('2025-11-16', 'ABSENT', 31, 30), ('2025-11-16', 'PRESENT', 32, 30), ('2025-11-16', 'PRESENT', 33, 30), ('2025-11-16', 'ABSENT', 34, 30), ('2025-11-16', 'ABSENT', 35, 30), ('2025-11-16', 'PRESENT', 36, 30), ('2025-11-16', 'PRESENT', 37, 30), ('2025-11-16', 'PRESENT', 38, 30), ('2025-11-16', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 40, 40), ('2025-11-16', 'ABSENT', 41, 40), ('2025-11-16', 'PRESENT', 42, 40), ('2025-11-16', 'PRESENT', 43, 40), ('2025-11-16', 'PRESENT', 44, 40), ('2025-11-16', 'ABSENT', 45, 40), ('2025-11-16', 'PRESENT', 46, 40), ('2025-11-16', 'PRESENT', 47, 40), ('2025-11-16', 'PRESENT', 48, 40), ('2025-11-16', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 50, 50), ('2025-11-16', 'PRESENT', 51, 50), ('2025-11-16', 'PRESENT', 52, 50), ('2025-11-16', 'PRESENT', 53, 50), ('2025-11-16', 'PRESENT', 54, 50), ('2025-11-16', 'ABSENT', 55, 50), ('2025-11-16', 'PRESENT', 56, 50), ('2025-11-16', 'PRESENT', 57, 50), ('2025-11-16', 'PRESENT', 58, 50), ('2025-11-16', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'PRESENT', 60, 60), ('2025-11-16', 'PRESENT', 61, 60), ('2025-11-16', 'PRESENT', 62, 60), ('2025-11-16', 'PRESENT', 63, 60), ('2025-11-16', 'PRESENT', 64, 60), ('2025-11-16', 'PRESENT', 65, 60), ('2025-11-16', 'ABSENT', 66, 60), ('2025-11-16', 'PRESENT', 67, 60), ('2025-11-16', 'PRESENT', 68, 60), ('2025-11-16', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 70, 70), ('2025-11-16', 'PRESENT', 71, 70), ('2025-11-16', 'PRESENT', 72, 70), ('2025-11-16', 'ABSENT', 73, 70), ('2025-11-16', 'PRESENT', 74, 70), ('2025-11-16', 'ABSENT', 75, 70), ('2025-11-16', 'PRESENT', 76, 70), ('2025-11-16', 'PRESENT', 77, 70), ('2025-11-16', 'PRESENT', 78, 70), ('2025-11-16', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 80, 80), ('2025-11-16', 'PRESENT', 81, 80), ('2025-11-16', 'PRESENT', 82, 80), ('2025-11-16', 'PRESENT', 83, 80), ('2025-11-16', 'PRESENT', 84, 80), ('2025-11-16', 'PRESENT', 85, 80), ('2025-11-16', 'PRESENT', 86, 80), ('2025-11-16', 'PRESENT', 87, 80), ('2025-11-16', 'PRESENT', 88, 80), ('2025-11-16', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 90, 90), ('2025-11-16', 'ABSENT', 91, 90), ('2025-11-16', 'PRESENT', 92, 90), ('2025-11-16', 'ABSENT', 93, 90), ('2025-11-16', 'PRESENT', 94, 90), ('2025-11-16', 'ABSENT', 95, 90), ('2025-11-16', 'PRESENT', 96, 90), ('2025-11-16', 'PRESENT', 97, 90), ('2025-11-16', 'PRESENT', 98, 90), ('2025-11-16', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-11-16', '2025-11-16 주일 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-16', 'ABSENT', 100, 100), ('2025-11-16', 'PRESENT', 101, 100), ('2025-11-16', 'PRESENT', 102, 100), ('2025-11-16', 'PRESENT', 103, 100), ('2025-11-16', 'PRESENT', 104, 100), ('2025-11-16', 'PRESENT', 105, 100), ('2025-11-16', 'PRESENT', 106, 100), ('2025-11-16', 'PRESENT', 107, 100), ('2025-11-16', 'PRESENT', 108, 100), ('2025-11-16', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'PRESENT', 10, 10), ('2025-11-23', 'PRESENT', 11, 10), ('2025-11-23', 'PRESENT', 12, 10), ('2025-11-23', 'PRESENT', 13, 10), ('2025-11-23', 'PRESENT', 14, 10), ('2025-11-23', 'ABSENT', 15, 10), ('2025-11-23', 'PRESENT', 16, 10), ('2025-11-23', 'PRESENT', 17, 10), ('2025-11-23', 'PRESENT', 18, 10), ('2025-11-23', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'ABSENT', 20, 20), ('2025-11-23', 'PRESENT', 21, 20), ('2025-11-23', 'PRESENT', 22, 20), ('2025-11-23', 'PRESENT', 23, 20), ('2025-11-23', 'PRESENT', 24, 20), ('2025-11-23', 'ABSENT', 25, 20), ('2025-11-23', 'PRESENT', 26, 20), ('2025-11-23', 'PRESENT', 27, 20), ('2025-11-23', 'PRESENT', 28, 20), ('2025-11-23', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'ABSENT', 30, 30), ('2025-11-23', 'PRESENT', 31, 30), ('2025-11-23', 'PRESENT', 32, 30), ('2025-11-23', 'PRESENT', 33, 30), ('2025-11-23', 'PRESENT', 34, 30), ('2025-11-23', 'ABSENT', 35, 30), ('2025-11-23', 'PRESENT', 36, 30), ('2025-11-23', 'PRESENT', 37, 30), ('2025-11-23', 'PRESENT', 38, 30), ('2025-11-23', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'ABSENT', 40, 40), ('2025-11-23', 'PRESENT', 41, 40), ('2025-11-23', 'PRESENT', 42, 40), ('2025-11-23', 'PRESENT', 43, 40), ('2025-11-23', 'PRESENT', 44, 40), ('2025-11-23', 'PRESENT', 45, 40), ('2025-11-23', 'PRESENT', 46, 40), ('2025-11-23', 'ABSENT', 47, 40), ('2025-11-23', 'PRESENT', 48, 40), ('2025-11-23', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'PRESENT', 50, 50), ('2025-11-23', 'PRESENT', 51, 50), ('2025-11-23', 'PRESENT', 52, 50), ('2025-11-23', 'PRESENT', 53, 50), ('2025-11-23', 'ABSENT', 54, 50), ('2025-11-23', 'ABSENT', 55, 50), ('2025-11-23', 'PRESENT', 56, 50), ('2025-11-23', 'PRESENT', 57, 50), ('2025-11-23', 'PRESENT', 58, 50), ('2025-11-23', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'PRESENT', 60, 60), ('2025-11-23', 'PRESENT', 61, 60), ('2025-11-23', 'PRESENT', 62, 60), ('2025-11-23', 'PRESENT', 63, 60), ('2025-11-23', 'PRESENT', 64, 60), ('2025-11-23', 'PRESENT', 65, 60), ('2025-11-23', 'PRESENT', 66, 60), ('2025-11-23', 'PRESENT', 67, 60), ('2025-11-23', 'PRESENT', 68, 60), ('2025-11-23', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'ABSENT', 70, 70), ('2025-11-23', 'PRESENT', 71, 70), ('2025-11-23', 'PRESENT', 72, 70), ('2025-11-23', 'PRESENT', 73, 70), ('2025-11-23', 'PRESENT', 74, 70), ('2025-11-23', 'ABSENT', 75, 70), ('2025-11-23', 'PRESENT', 76, 70), ('2025-11-23', 'ABSENT', 77, 70), ('2025-11-23', 'PRESENT', 78, 70), ('2025-11-23', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'PRESENT', 80, 80), ('2025-11-23', 'ABSENT', 81, 80), ('2025-11-23', 'PRESENT', 82, 80), ('2025-11-23', 'PRESENT', 83, 80), ('2025-11-23', 'PRESENT', 84, 80), ('2025-11-23', 'ABSENT', 85, 80), ('2025-11-23', 'PRESENT', 86, 80), ('2025-11-23', 'PRESENT', 87, 80), ('2025-11-23', 'PRESENT', 88, 80), ('2025-11-23', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'PRESENT', 90, 90), ('2025-11-23', 'PRESENT', 91, 90), ('2025-11-23', 'ABSENT', 92, 90), ('2025-11-23', 'PRESENT', 93, 90), ('2025-11-23', 'PRESENT', 94, 90), ('2025-11-23', 'PRESENT', 95, 90), ('2025-11-23', 'PRESENT', 96, 90), ('2025-11-23', 'PRESENT', 97, 90), ('2025-11-23', 'PRESENT', 98, 90), ('2025-11-23', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-11-23', '2025-11-23 주일 나눔입니다.', '', '2025-11-23 16:00:00', '2025-11-23 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-23', 'ABSENT', 100, 100), ('2025-11-23', 'PRESENT', 101, 100), ('2025-11-23', 'PRESENT', 102, 100), ('2025-11-23', 'PRESENT', 103, 100), ('2025-11-23', 'PRESENT', 104, 100), ('2025-11-23', 'PRESENT', 105, 100), ('2025-11-23', 'PRESENT', 106, 100), ('2025-11-23', 'PRESENT', 107, 100), ('2025-11-23', 'PRESENT', 108, 100), ('2025-11-23', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'ABSENT', 10, 10), ('2025-11-30', 'PRESENT', 11, 10), ('2025-11-30', 'PRESENT', 12, 10), ('2025-11-30', 'PRESENT', 13, 10), ('2025-11-30', 'PRESENT', 14, 10), ('2025-11-30', 'ABSENT', 15, 10), ('2025-11-30', 'ABSENT', 16, 10), ('2025-11-30', 'PRESENT', 17, 10), ('2025-11-30', 'PRESENT', 18, 10), ('2025-11-30', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'ABSENT', 20, 20), ('2025-11-30', 'PRESENT', 21, 20), ('2025-11-30', 'PRESENT', 22, 20), ('2025-11-30', 'PRESENT', 23, 20), ('2025-11-30', 'ABSENT', 24, 20), ('2025-11-30', 'ABSENT', 25, 20), ('2025-11-30', 'PRESENT', 26, 20), ('2025-11-30', 'PRESENT', 27, 20), ('2025-11-30', 'PRESENT', 28, 20), ('2025-11-30', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'ABSENT', 30, 30), ('2025-11-30', 'PRESENT', 31, 30), ('2025-11-30', 'PRESENT', 32, 30), ('2025-11-30', 'PRESENT', 33, 30), ('2025-11-30', 'PRESENT', 34, 30), ('2025-11-30', 'PRESENT', 35, 30), ('2025-11-30', 'PRESENT', 36, 30), ('2025-11-30', 'PRESENT', 37, 30), ('2025-11-30', 'ABSENT', 38, 30), ('2025-11-30', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'PRESENT', 40, 40), ('2025-11-30', 'PRESENT', 41, 40), ('2025-11-30', 'PRESENT', 42, 40), ('2025-11-30', 'PRESENT', 43, 40), ('2025-11-30', 'ABSENT', 44, 40), ('2025-11-30', 'ABSENT', 45, 40), ('2025-11-30', 'PRESENT', 46, 40), ('2025-11-30', 'PRESENT', 47, 40), ('2025-11-30', 'PRESENT', 48, 40), ('2025-11-30', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'PRESENT', 50, 50), ('2025-11-30', 'PRESENT', 51, 50), ('2025-11-30', 'ABSENT', 52, 50), ('2025-11-30', 'PRESENT', 53, 50), ('2025-11-30', 'PRESENT', 54, 50), ('2025-11-30', 'ABSENT', 55, 50), ('2025-11-30', 'PRESENT', 56, 50), ('2025-11-30', 'PRESENT', 57, 50), ('2025-11-30', 'PRESENT', 58, 50), ('2025-11-30', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'ABSENT', 60, 60), ('2025-11-30', 'PRESENT', 61, 60), ('2025-11-30', 'PRESENT', 62, 60), ('2025-11-30', 'PRESENT', 63, 60), ('2025-11-30', 'PRESENT', 64, 60), ('2025-11-30', 'PRESENT', 65, 60), ('2025-11-30', 'PRESENT', 66, 60), ('2025-11-30', 'PRESENT', 67, 60), ('2025-11-30', 'PRESENT', 68, 60), ('2025-11-30', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'ABSENT', 70, 70), ('2025-11-30', 'PRESENT', 71, 70), ('2025-11-30', 'PRESENT', 72, 70), ('2025-11-30', 'PRESENT', 73, 70), ('2025-11-30', 'PRESENT', 74, 70), ('2025-11-30', 'ABSENT', 75, 70), ('2025-11-30', 'PRESENT', 76, 70), ('2025-11-30', 'PRESENT', 77, 70), ('2025-11-30', 'PRESENT', 78, 70), ('2025-11-30', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'ABSENT', 80, 80), ('2025-11-30', 'PRESENT', 81, 80), ('2025-11-30', 'ABSENT', 82, 80), ('2025-11-30', 'ABSENT', 83, 80), ('2025-11-30', 'PRESENT', 84, 80), ('2025-11-30', 'ABSENT', 85, 80), ('2025-11-30', 'ABSENT', 86, 80), ('2025-11-30', 'PRESENT', 87, 80), ('2025-11-30', 'PRESENT', 88, 80), ('2025-11-30', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'PRESENT', 90, 90), ('2025-11-30', 'ABSENT', 91, 90), ('2025-11-30', 'ABSENT', 92, 90), ('2025-11-30', 'PRESENT', 93, 90), ('2025-11-30', 'PRESENT', 94, 90), ('2025-11-30', 'ABSENT', 95, 90), ('2025-11-30', 'PRESENT', 96, 90), ('2025-11-30', 'PRESENT', 97, 90), ('2025-11-30', 'PRESENT', 98, 90), ('2025-11-30', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-11-30', '2025-11-30 주일 나눔입니다.', '', '2025-11-30 16:00:00', '2025-11-30 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-11-30', 'PRESENT', 100, 100), ('2025-11-30', 'PRESENT', 101, 100), ('2025-11-30', 'ABSENT', 102, 100), ('2025-11-30', 'PRESENT', 103, 100), ('2025-11-30', 'PRESENT', 104, 100), ('2025-11-30', 'ABSENT', 105, 100), ('2025-11-30', 'PRESENT', 106, 100), ('2025-11-30', 'PRESENT', 107, 100), ('2025-11-30', 'ABSENT', 108, 100), ('2025-11-30', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'ABSENT', 10, 10), ('2025-12-07', 'ABSENT', 11, 10), ('2025-12-07', 'PRESENT', 12, 10), ('2025-12-07', 'PRESENT', 13, 10), ('2025-12-07', 'PRESENT', 14, 10), ('2025-12-07', 'PRESENT', 15, 10), ('2025-12-07', 'PRESENT', 16, 10), ('2025-12-07', 'ABSENT', 17, 10), ('2025-12-07', 'PRESENT', 18, 10), ('2025-12-07', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'PRESENT', 20, 20), ('2025-12-07', 'PRESENT', 21, 20), ('2025-12-07', 'PRESENT', 22, 20), ('2025-12-07', 'PRESENT', 23, 20), ('2025-12-07', 'PRESENT', 24, 20), ('2025-12-07', 'ABSENT', 25, 20), ('2025-12-07', 'PRESENT', 26, 20), ('2025-12-07', 'PRESENT', 27, 20), ('2025-12-07', 'PRESENT', 28, 20), ('2025-12-07', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'ABSENT', 30, 30), ('2025-12-07', 'ABSENT', 31, 30), ('2025-12-07', 'PRESENT', 32, 30), ('2025-12-07', 'PRESENT', 33, 30), ('2025-12-07', 'PRESENT', 34, 30), ('2025-12-07', 'ABSENT', 35, 30), ('2025-12-07', 'PRESENT', 36, 30), ('2025-12-07', 'PRESENT', 37, 30), ('2025-12-07', 'PRESENT', 38, 30), ('2025-12-07', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'ABSENT', 40, 40), ('2025-12-07', 'PRESENT', 41, 40), ('2025-12-07', 'PRESENT', 42, 40), ('2025-12-07', 'PRESENT', 43, 40), ('2025-12-07', 'PRESENT', 44, 40), ('2025-12-07', 'ABSENT', 45, 40), ('2025-12-07', 'PRESENT', 46, 40), ('2025-12-07', 'PRESENT', 47, 40), ('2025-12-07', 'PRESENT', 48, 40), ('2025-12-07', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'PRESENT', 50, 50), ('2025-12-07', 'PRESENT', 51, 50), ('2025-12-07', 'PRESENT', 52, 50), ('2025-12-07', 'PRESENT', 53, 50), ('2025-12-07', 'PRESENT', 54, 50), ('2025-12-07', 'ABSENT', 55, 50), ('2025-12-07', 'PRESENT', 56, 50), ('2025-12-07', 'ABSENT', 57, 50), ('2025-12-07', 'PRESENT', 58, 50), ('2025-12-07', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'PRESENT', 60, 60), ('2025-12-07', 'PRESENT', 61, 60), ('2025-12-07', 'PRESENT', 62, 60), ('2025-12-07', 'PRESENT', 63, 60), ('2025-12-07', 'PRESENT', 64, 60), ('2025-12-07', 'PRESENT', 65, 60), ('2025-12-07', 'PRESENT', 66, 60), ('2025-12-07', 'ABSENT', 67, 60), ('2025-12-07', 'PRESENT', 68, 60), ('2025-12-07', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'ABSENT', 70, 70), ('2025-12-07', 'PRESENT', 71, 70), ('2025-12-07', 'PRESENT', 72, 70), ('2025-12-07', 'ABSENT', 73, 70), ('2025-12-07', 'PRESENT', 74, 70), ('2025-12-07', 'PRESENT', 75, 70), ('2025-12-07', 'PRESENT', 76, 70), ('2025-12-07', 'ABSENT', 77, 70), ('2025-12-07', 'PRESENT', 78, 70), ('2025-12-07', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'ABSENT', 80, 80), ('2025-12-07', 'ABSENT', 81, 80), ('2025-12-07', 'PRESENT', 82, 80), ('2025-12-07', 'PRESENT', 83, 80), ('2025-12-07', 'PRESENT', 84, 80), ('2025-12-07', 'PRESENT', 85, 80), ('2025-12-07', 'PRESENT', 86, 80), ('2025-12-07', 'ABSENT', 87, 80), ('2025-12-07', 'PRESENT', 88, 80), ('2025-12-07', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'ABSENT', 90, 90), ('2025-12-07', 'PRESENT', 91, 90), ('2025-12-07', 'PRESENT', 92, 90), ('2025-12-07', 'PRESENT', 93, 90), ('2025-12-07', 'ABSENT', 94, 90), ('2025-12-07', 'ABSENT', 95, 90), ('2025-12-07', 'PRESENT', 96, 90), ('2025-12-07', 'PRESENT', 97, 90), ('2025-12-07', 'PRESENT', 98, 90), ('2025-12-07', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-12-07', '2025-12-07 주일 나눔입니다.', '', '2025-12-07 16:00:00', '2025-12-07 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-07', 'PRESENT', 100, 100), ('2025-12-07', 'PRESENT', 101, 100), ('2025-12-07', 'PRESENT', 102, 100), ('2025-12-07', 'PRESENT', 103, 100), ('2025-12-07', 'PRESENT', 104, 100), ('2025-12-07', 'ABSENT', 105, 100), ('2025-12-07', 'PRESENT', 106, 100), ('2025-12-07', 'PRESENT', 107, 100), ('2025-12-07', 'PRESENT', 108, 100), ('2025-12-07', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 10, 10), ('2025-12-14', 'PRESENT', 11, 10), ('2025-12-14', 'PRESENT', 12, 10), ('2025-12-14', 'PRESENT', 13, 10), ('2025-12-14', 'PRESENT', 14, 10), ('2025-12-14', 'ABSENT', 15, 10), ('2025-12-14', 'PRESENT', 16, 10), ('2025-12-14', 'PRESENT', 17, 10), ('2025-12-14', 'ABSENT', 18, 10), ('2025-12-14', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 20, 20), ('2025-12-14', 'PRESENT', 21, 20), ('2025-12-14', 'PRESENT', 22, 20), ('2025-12-14', 'ABSENT', 23, 20), ('2025-12-14', 'PRESENT', 24, 20), ('2025-12-14', 'PRESENT', 25, 20), ('2025-12-14', 'ABSENT', 26, 20), ('2025-12-14', 'PRESENT', 27, 20), ('2025-12-14', 'PRESENT', 28, 20), ('2025-12-14', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 30, 30), ('2025-12-14', 'PRESENT', 31, 30), ('2025-12-14', 'PRESENT', 32, 30), ('2025-12-14', 'PRESENT', 33, 30), ('2025-12-14', 'PRESENT', 34, 30), ('2025-12-14', 'PRESENT', 35, 30), ('2025-12-14', 'PRESENT', 36, 30), ('2025-12-14', 'PRESENT', 37, 30), ('2025-12-14', 'PRESENT', 38, 30), ('2025-12-14', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 40, 40), ('2025-12-14', 'PRESENT', 41, 40), ('2025-12-14', 'PRESENT', 42, 40), ('2025-12-14', 'PRESENT', 43, 40), ('2025-12-14', 'PRESENT', 44, 40), ('2025-12-14', 'PRESENT', 45, 40), ('2025-12-14', 'PRESENT', 46, 40), ('2025-12-14', 'PRESENT', 47, 40), ('2025-12-14', 'PRESENT', 48, 40), ('2025-12-14', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'ABSENT', 50, 50), ('2025-12-14', 'PRESENT', 51, 50), ('2025-12-14', 'PRESENT', 52, 50), ('2025-12-14', 'PRESENT', 53, 50), ('2025-12-14', 'PRESENT', 54, 50), ('2025-12-14', 'ABSENT', 55, 50), ('2025-12-14', 'PRESENT', 56, 50), ('2025-12-14', 'PRESENT', 57, 50), ('2025-12-14', 'PRESENT', 58, 50), ('2025-12-14', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'ABSENT', 60, 60), ('2025-12-14', 'PRESENT', 61, 60), ('2025-12-14', 'ABSENT', 62, 60), ('2025-12-14', 'PRESENT', 63, 60), ('2025-12-14', 'PRESENT', 64, 60), ('2025-12-14', 'PRESENT', 65, 60), ('2025-12-14', 'PRESENT', 66, 60), ('2025-12-14', 'PRESENT', 67, 60), ('2025-12-14', 'PRESENT', 68, 60), ('2025-12-14', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 70, 70), ('2025-12-14', 'PRESENT', 71, 70), ('2025-12-14', 'PRESENT', 72, 70), ('2025-12-14', 'PRESENT', 73, 70), ('2025-12-14', 'ABSENT', 74, 70), ('2025-12-14', 'PRESENT', 75, 70), ('2025-12-14', 'PRESENT', 76, 70), ('2025-12-14', 'PRESENT', 77, 70), ('2025-12-14', 'PRESENT', 78, 70), ('2025-12-14', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 80, 80), ('2025-12-14', 'PRESENT', 81, 80), ('2025-12-14', 'PRESENT', 82, 80), ('2025-12-14', 'PRESENT', 83, 80), ('2025-12-14', 'PRESENT', 84, 80), ('2025-12-14', 'PRESENT', 85, 80), ('2025-12-14', 'PRESENT', 86, 80), ('2025-12-14', 'PRESENT', 87, 80), ('2025-12-14', 'ABSENT', 88, 80), ('2025-12-14', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'PRESENT', 90, 90), ('2025-12-14', 'PRESENT', 91, 90), ('2025-12-14', 'PRESENT', 92, 90), ('2025-12-14', 'PRESENT', 93, 90), ('2025-12-14', 'PRESENT', 94, 90), ('2025-12-14', 'PRESENT', 95, 90), ('2025-12-14', 'PRESENT', 96, 90), ('2025-12-14', 'PRESENT', 97, 90), ('2025-12-14', 'PRESENT', 98, 90), ('2025-12-14', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-12-14', '2025-12-14 주일 나눔입니다.', '', '2025-12-14 16:00:00', '2025-12-14 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-14', 'ABSENT', 100, 100), ('2025-12-14', 'PRESENT', 101, 100), ('2025-12-14', 'PRESENT', 102, 100), ('2025-12-14', 'PRESENT', 103, 100), ('2025-12-14', 'PRESENT', 104, 100), ('2025-12-14', 'PRESENT', 105, 100), ('2025-12-14', 'PRESENT', 106, 100), ('2025-12-14', 'PRESENT', 107, 100), ('2025-12-14', 'PRESENT', 108, 100), ('2025-12-14', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 10, 10), ('2025-12-21', 'ABSENT', 11, 10), ('2025-12-21', 'ABSENT', 12, 10), ('2025-12-21', 'PRESENT', 13, 10), ('2025-12-21', 'PRESENT', 14, 10), ('2025-12-21', 'PRESENT', 15, 10), ('2025-12-21', 'PRESENT', 16, 10), ('2025-12-21', 'PRESENT', 17, 10), ('2025-12-21', 'ABSENT', 18, 10), ('2025-12-21', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 20, 20), ('2025-12-21', 'PRESENT', 21, 20), ('2025-12-21', 'PRESENT', 22, 20), ('2025-12-21', 'PRESENT', 23, 20), ('2025-12-21', 'PRESENT', 24, 20), ('2025-12-21', 'ABSENT', 25, 20), ('2025-12-21', 'PRESENT', 26, 20), ('2025-12-21', 'PRESENT', 27, 20), ('2025-12-21', 'PRESENT', 28, 20), ('2025-12-21', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 30, 30), ('2025-12-21', 'PRESENT', 31, 30), ('2025-12-21', 'PRESENT', 32, 30), ('2025-12-21', 'PRESENT', 33, 30), ('2025-12-21', 'PRESENT', 34, 30), ('2025-12-21', 'ABSENT', 35, 30), ('2025-12-21', 'PRESENT', 36, 30), ('2025-12-21', 'PRESENT', 37, 30), ('2025-12-21', 'PRESENT', 38, 30), ('2025-12-21', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'PRESENT', 40, 40), ('2025-12-21', 'PRESENT', 41, 40), ('2025-12-21', 'PRESENT', 42, 40), ('2025-12-21', 'PRESENT', 43, 40), ('2025-12-21', 'ABSENT', 44, 40), ('2025-12-21', 'ABSENT', 45, 40), ('2025-12-21', 'ABSENT', 46, 40), ('2025-12-21', 'PRESENT', 47, 40), ('2025-12-21', 'ABSENT', 48, 40), ('2025-12-21', 'PRESENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 50, 50), ('2025-12-21', 'PRESENT', 51, 50), ('2025-12-21', 'PRESENT', 52, 50), ('2025-12-21', 'ABSENT', 53, 50), ('2025-12-21', 'PRESENT', 54, 50), ('2025-12-21', 'PRESENT', 55, 50), ('2025-12-21', 'PRESENT', 56, 50), ('2025-12-21', 'PRESENT', 57, 50), ('2025-12-21', 'PRESENT', 58, 50), ('2025-12-21', 'ABSENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 60, 60), ('2025-12-21', 'PRESENT', 61, 60), ('2025-12-21', 'PRESENT', 62, 60), ('2025-12-21', 'PRESENT', 63, 60), ('2025-12-21', 'PRESENT', 64, 60), ('2025-12-21', 'ABSENT', 65, 60), ('2025-12-21', 'PRESENT', 66, 60), ('2025-12-21', 'PRESENT', 67, 60), ('2025-12-21', 'PRESENT', 68, 60), ('2025-12-21', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 70, 70), ('2025-12-21', 'PRESENT', 71, 70), ('2025-12-21', 'PRESENT', 72, 70), ('2025-12-21', 'PRESENT', 73, 70), ('2025-12-21', 'ABSENT', 74, 70), ('2025-12-21', 'PRESENT', 75, 70), ('2025-12-21', 'PRESENT', 76, 70), ('2025-12-21', 'PRESENT', 77, 70), ('2025-12-21', 'PRESENT', 78, 70), ('2025-12-21', 'ABSENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 80, 80), ('2025-12-21', 'PRESENT', 81, 80), ('2025-12-21', 'PRESENT', 82, 80), ('2025-12-21', 'PRESENT', 83, 80), ('2025-12-21', 'PRESENT', 84, 80), ('2025-12-21', 'ABSENT', 85, 80), ('2025-12-21', 'ABSENT', 86, 80), ('2025-12-21', 'PRESENT', 87, 80), ('2025-12-21', 'PRESENT', 88, 80), ('2025-12-21', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'PRESENT', 90, 90), ('2025-12-21', 'PRESENT', 91, 90), ('2025-12-21', 'PRESENT', 92, 90), ('2025-12-21', 'ABSENT', 93, 90), ('2025-12-21', 'PRESENT', 94, 90), ('2025-12-21', 'ABSENT', 95, 90), ('2025-12-21', 'PRESENT', 96, 90), ('2025-12-21', 'PRESENT', 97, 90), ('2025-12-21', 'ABSENT', 98, 90), ('2025-12-21', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-12-21', '2025-12-21 주일 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-21', 'ABSENT', 100, 100), ('2025-12-21', 'PRESENT', 101, 100), ('2025-12-21', 'ABSENT', 102, 100), ('2025-12-21', 'PRESENT', 103, 100), ('2025-12-21', 'PRESENT', 104, 100), ('2025-12-21', 'PRESENT', 105, 100), ('2025-12-21', 'ABSENT', 106, 100), ('2025-12-21', 'PRESENT', 107, 100), ('2025-12-21', 'PRESENT', 108, 100), ('2025-12-21', 'PRESENT', 109, 100);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(1, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'PRESENT', 10, 10), ('2025-12-28', 'PRESENT', 11, 10), ('2025-12-28', 'PRESENT', 12, 10), ('2025-12-28', 'ABSENT', 13, 10), ('2025-12-28', 'PRESENT', 14, 10), ('2025-12-28', 'ABSENT', 15, 10), ('2025-12-28', 'PRESENT', 16, 10), ('2025-12-28', 'PRESENT', 17, 10), ('2025-12-28', 'PRESENT', 18, 10), ('2025-12-28', 'PRESENT', 19, 10);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(2, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'PRESENT', 20, 20), ('2025-12-28', 'PRESENT', 21, 20), ('2025-12-28', 'PRESENT', 22, 20), ('2025-12-28', 'ABSENT', 23, 20), ('2025-12-28', 'PRESENT', 24, 20), ('2025-12-28', 'ABSENT', 25, 20), ('2025-12-28', 'PRESENT', 26, 20), ('2025-12-28', 'PRESENT', 27, 20), ('2025-12-28', 'PRESENT', 28, 20), ('2025-12-28', 'PRESENT', 29, 20);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(3, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'PRESENT', 30, 30), ('2025-12-28', 'PRESENT', 31, 30), ('2025-12-28', 'PRESENT', 32, 30), ('2025-12-28', 'ABSENT', 33, 30), ('2025-12-28', 'PRESENT', 34, 30), ('2025-12-28', 'PRESENT', 35, 30), ('2025-12-28', 'ABSENT', 36, 30), ('2025-12-28', 'PRESENT', 37, 30), ('2025-12-28', 'PRESENT', 38, 30), ('2025-12-28', 'PRESENT', 39, 30);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(4, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'PRESENT', 40, 40), ('2025-12-28', 'PRESENT', 41, 40), ('2025-12-28', 'ABSENT', 42, 40), ('2025-12-28', 'PRESENT', 43, 40), ('2025-12-28', 'PRESENT', 44, 40), ('2025-12-28', 'PRESENT', 45, 40), ('2025-12-28', 'ABSENT', 46, 40), ('2025-12-28', 'PRESENT', 47, 40), ('2025-12-28', 'PRESENT', 48, 40), ('2025-12-28', 'ABSENT', 49, 40);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(5, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'PRESENT', 50, 50), ('2025-12-28', 'ABSENT', 51, 50), ('2025-12-28', 'PRESENT', 52, 50), ('2025-12-28', 'PRESENT', 53, 50), ('2025-12-28', 'PRESENT', 54, 50), ('2025-12-28', 'ABSENT', 55, 50), ('2025-12-28', 'PRESENT', 56, 50), ('2025-12-28', 'PRESENT', 57, 50), ('2025-12-28', 'PRESENT', 58, 50), ('2025-12-28', 'PRESENT', 59, 50);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(6, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'ABSENT', 60, 60), ('2025-12-28', 'ABSENT', 61, 60), ('2025-12-28', 'PRESENT', 62, 60), ('2025-12-28', 'PRESENT', 63, 60), ('2025-12-28', 'PRESENT', 64, 60), ('2025-12-28', 'ABSENT', 65, 60), ('2025-12-28', 'ABSENT', 66, 60), ('2025-12-28', 'PRESENT', 67, 60), ('2025-12-28', 'PRESENT', 68, 60), ('2025-12-28', 'PRESENT', 69, 60);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(7, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'ABSENT', 70, 70), ('2025-12-28', 'PRESENT', 71, 70), ('2025-12-28', 'PRESENT', 72, 70), ('2025-12-28', 'ABSENT', 73, 70), ('2025-12-28', 'PRESENT', 74, 70), ('2025-12-28', 'PRESENT', 75, 70), ('2025-12-28', 'PRESENT', 76, 70), ('2025-12-28', 'PRESENT', 77, 70), ('2025-12-28', 'PRESENT', 78, 70), ('2025-12-28', 'PRESENT', 79, 70);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(8, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'ABSENT', 80, 80), ('2025-12-28', 'PRESENT', 81, 80), ('2025-12-28', 'ABSENT', 82, 80), ('2025-12-28', 'ABSENT', 83, 80), ('2025-12-28', 'PRESENT', 84, 80), ('2025-12-28', 'ABSENT', 85, 80), ('2025-12-28', 'ABSENT', 86, 80), ('2025-12-28', 'PRESENT', 87, 80), ('2025-12-28', 'PRESENT', 88, 80), ('2025-12-28', 'PRESENT', 89, 80);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(9, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'PRESENT', 90, 90), ('2025-12-28', 'PRESENT', 91, 90), ('2025-12-28', 'PRESENT', 92, 90), ('2025-12-28', 'PRESENT', 93, 90), ('2025-12-28', 'PRESENT', 94, 90), ('2025-12-28', 'PRESENT', 95, 90), ('2025-12-28', 'PRESENT', 96, 90), ('2025-12-28', 'ABSENT', 97, 90), ('2025-12-28', 'PRESENT', 98, 90), ('2025-12-28', 'PRESENT', 99, 90);
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at) VALUES
(10, '2025-12-28', '2025-12-28 주일 나눔입니다.', '', '2025-12-28 16:00:00', '2025-12-28 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by) VALUES
('2025-12-28', 'ABSENT', 100, 100), ('2025-12-28', 'PRESENT', 101, 100), ('2025-12-28', 'PRESENT', 102, 100), ('2025-12-28', 'PRESENT', 103, 100), ('2025-12-28', 'PRESENT', 104, 100), ('2025-12-28', 'ABSENT', 105, 100), ('2025-12-28', 'PRESENT', 106, 100), ('2025-12-28', 'PRESENT', 107, 100), ('2025-12-28', 'PRESENT', 108, 100), ('2025-12-28', 'PRESENT', 109, 100);

-- 6. Prayers, Notices
INSERT INTO notices (title, content, target, target_cell_id, pinned, created_at, updated_at, created_by, is_deleted) VALUES
('2025년 표어', '복음의 사람, 예배자로 살게 하소서', 'ALL', null, true, '2025-01-01 10:00:00', '2025-01-01 10:00:00', 1, false),
('여름 수련회 안내', '8월 1일부터 3일까지', 'ALL', null, false, '2025-07-01 10:00:00', '2025-07-01 10:00:00', 1, false),
('사랑셀 모임 장소 변경', '이번 주는 카페에서 모입니다.', 'CELL', 1, false, '2025-05-10 10:00:00', '2025-05-10 10:00:00', 10, false);
INSERT INTO prayers (content, visibility, member_id, meeting_date, created_at, updated_at, is_deleted) VALUES
('가족의 건강을 위해', 'CELL', 11, '2025-01-05', '2025-01-05 10:00:00', '2025-01-05 10:00:00', false),
('진로 문제를 놓고 기도합니다', 'CELL', 12, '2025-01-12', '2025-01-12 10:00:00', '2025-01-12 10:00:00', false),
('새로운 직장에서 적응 잘하도록', 'CELL', 21, '2025-02-02', '2025-02-02 10:00:00', '2025-02-02 10:00:00', false);
