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
TRUNCATE TABLE suggestions;
TRUNCATE TABLE suggestion_status_history;
SET FOREIGN_KEY_CHECKS = 1;

# SET FOREIGN_KEY_CHECKS = 0;
# DROP TABLE IF EXISTS audit_logs;
# DROP TABLE IF EXISTS member_teams;
# DROP TABLE IF EXISTS attendances;
# DROP TABLE IF EXISTS prayers;
# DROP TABLE IF EXISTS notices;
# DROP TABLE IF EXISTS cell_reports;
# DROP TABLE IF EXISTS users;
# DROP TABLE IF EXISTS cells;
# DROP TABLE IF EXISTS members;
# DROP TABLE IF EXISTS teams;
# DROP TABLE IF EXISTS semesters;
# DROP TABLE IF EXISTS suggestions;
# DROP TABLE IF EXISTS suggestion_status_history;
# SET FOREIGN_KEY_CHECKS = 1;

--
-- 1. Semesters
INSERT INTO semesters (id, name, start_date, end_date, is_active)
VALUES (1, '2025 상반기', '2025-01-01', '2025-06-30', false),
       (2, '2025 하반기', '2025-07-01', '2025-12-31', false),
       (3, '2026 상반기', '2026-01-01', '2026-06-30', true),
       (4, '2026 하반기', '2026-07-01', '2026-12-31', false);

-- 2. Teams
INSERT INTO teams (id, name, code, description, active)
VALUES (1, '찬양팀', 'PRAISE', '주일 예배 찬양 인도', true),
       (2, '미디어팀', 'MEDIA', '방송 송출 및 PPT', true),
       (3, '새가족팀', 'NEWFAM', '새가족 환영 및 교육', true),
       (4, '주차팀', 'PARKING', '차량 안내', true),
       (5, '식당봉사팀', 'KITCHEN', '주일 점심 식사 준비', true);

-- 3. Cells
INSERT INTO cells (id, name, description, active, created_at, updated_at)
VALUES (1, '사랑셀', '사랑셀입니다.', true, NOW(), NOW()),
       (2, '희락셀', '희락셀입니다.', true, NOW(), NOW()),
       (3, '화평셀', '화평셀입니다.', true, NOW(), NOW()),
       (4, '오래참음셀', '오래참음셀입니다.', true, NOW(), NOW()),
       (5, '자비셀', '자비셀입니다.', true, NOW(), NOW()),
       (6, '양선셀', '양선셀입니다.', true, NOW(), NOW()),
       (7, '충성셀', '충성셀입니다.', true, NOW(), NOW()),
       (8, '온유셀', '온유셀입니다.', true, NOW(), NOW()),
       (9, '절제셀', '절제셀입니다.', true, NOW(), NOW()),
       (10, '소망셀', '소망셀입니다.', true, NOW(), NOW());

-- 4. Members & Users
INSERT INTO members (id, name, gender, birth_date, role, active, created_at, updated_at)
VALUES (1, '관리자', 'MALE', '1980-01-01', 'EXECUTIVE', true, NOW(), NOW());
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (1, 'admin', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 1, 'EXECUTIVE', 'ACTIVE', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (10, '사랑셀장', 'FEMALE', '1988-09-03', 'CELL_LEADER', true, 1, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 10
WHERE id = 1;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (10, 'leader1', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 10, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (11, '사랑1', 'FEMALE', '1998-10-12', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (12, '사랑2', 'MALE', '1996-08-21', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (13, '사랑3', 'FEMALE', '1996-11-13', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (14, '사랑4', 'FEMALE', '1999-04-09', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (15, '사랑5', 'FEMALE', '1997-07-17', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (16, '사랑6', 'MALE', '1997-07-07', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (17, '사랑7', 'FEMALE', '1999-10-05', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (18, '사랑8', 'MALE', '2000-07-19', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW()),
       (19, '사랑9', 'MALE', '1997-11-04', 'MEMBER', true, 1, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (20, '희락셀장', 'MALE', '1985-04-11', 'CELL_LEADER', true, 2, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 20
WHERE id = 2;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (20, 'leader2', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 20, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (21, '희락1', 'FEMALE', '2000-05-02', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (22, '희락2', 'FEMALE', '1999-06-15', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (23, '희락3', 'FEMALE', '1991-01-21', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (24, '희락4', 'FEMALE', '1994-01-13', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (25, '희락5', 'MALE', '1992-03-02', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (26, '희락6', 'FEMALE', '2000-08-12', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (27, '희락7', 'MALE', '1991-02-03', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (28, '희락8', 'MALE', '1996-08-21', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW()),
       (29, '희락9', 'MALE', '1996-03-16', 'MEMBER', true, 2, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (30, '화평셀장', 'FEMALE', '1982-02-07', 'CELL_LEADER', true, 3, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 30
WHERE id = 3;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (30, 'leader3', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 30, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (31, '화평1', 'FEMALE', '1997-09-26', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (32, '화평2', 'FEMALE', '1991-07-08', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (33, '화평3', 'MALE', '1998-11-02', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (34, '화평4', 'FEMALE', '1997-05-09', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (35, '화평5', 'MALE', '1991-05-11', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (36, '화평6', 'FEMALE', '1993-11-22', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (37, '화평7', 'MALE', '1991-05-13', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (38, '화평8', 'MALE', '2000-01-05', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW()),
       (39, '화평9', 'MALE', '2000-06-15', 'MEMBER', true, 3, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (40, '오래참음셀장', 'MALE', '1980-11-07', 'CELL_LEADER', true, 4, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 40
WHERE id = 4;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (40, 'leader4', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 40, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (41, '오래참음1', 'FEMALE', '1991-04-20', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (42, '오래참음2', 'MALE', '1997-09-19', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (43, '오래참음3', 'FEMALE', '1993-04-16', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (44, '오래참음4', 'FEMALE', '1996-03-19', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (45, '오래참음5', 'MALE', '1998-06-25', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (46, '오래참음6', 'MALE', '2000-01-14', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (47, '오래참음7', 'MALE', '2000-07-26', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (48, '오래참음8', 'FEMALE', '1997-12-07', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW()),
       (49, '오래참음9', 'MALE', '1999-03-07', 'MEMBER', true, 4, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (50, '자비셀장', 'FEMALE', '1986-06-02', 'CELL_LEADER', true, 5, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 50
WHERE id = 5;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (50, 'leader5', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 50, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (51, '자비1', 'FEMALE', '2000-03-14', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (52, '자비2', 'MALE', '1996-04-17', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (53, '자비3', 'MALE', '1991-04-21', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (54, '자비4', 'MALE', '2000-03-05', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (55, '자비5', 'MALE', '1991-03-11', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (56, '자비6', 'FEMALE', '1999-03-12', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (57, '자비7', 'FEMALE', '1997-09-02', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (58, '자비8', 'MALE', '1992-11-10', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW()),
       (59, '자비9', 'FEMALE', '1995-08-16', 'MEMBER', true, 5, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (60, '양선셀장', 'MALE', '1982-11-09', 'CELL_LEADER', true, 6, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 60
WHERE id = 6;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (60, 'leader6', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 60, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (61, '양선1', 'FEMALE', '1999-05-13', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (62, '양선2', 'FEMALE', '1991-11-01', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (63, '양선3', 'MALE', '1992-01-08', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (64, '양선4', 'MALE', '1992-01-07', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (65, '양선5', 'FEMALE', '1996-03-14', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (66, '양선6', 'FEMALE', '1994-04-18', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (67, '양선7', 'FEMALE', '1999-04-08', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (68, '양선8', 'FEMALE', '2000-09-02', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW()),
       (69, '양선9', 'FEMALE', '1992-07-11', 'MEMBER', true, 6, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (70, '충성셀장', 'FEMALE', '1983-09-05', 'CELL_LEADER', true, 7, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 70
WHERE id = 7;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (70, 'leader7', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 70, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (71, '충성1', 'MALE', '2000-08-09', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (72, '충성2', 'FEMALE', '1993-11-08', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (73, '충성3', 'MALE', '1996-04-01', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (74, '충성4', 'MALE', '1996-01-15', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (75, '충성5', 'MALE', '1994-03-06', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (76, '충성6', 'FEMALE', '1993-08-13', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (77, '충성7', 'MALE', '1996-03-05', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (78, '충성8', 'FEMALE', '1998-02-13', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW()),
       (79, '충성9', 'MALE', '2000-06-12', 'MEMBER', true, 7, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (80, '온유셀장', 'FEMALE', '1980-07-28', 'CELL_LEADER', true, 8, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 80
WHERE id = 8;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (80, 'leader8', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 80, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (81, '온유1', 'FEMALE', '1998-09-05', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (82, '온유2', 'MALE', '1998-09-27', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (83, '온유3', 'MALE', '1995-12-25', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (84, '온유4', 'MALE', '1998-10-13', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (85, '온유5', 'MALE', '1996-04-19', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (86, '온유6', 'FEMALE', '1994-12-15', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (87, '온유7', 'MALE', '1996-08-06', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (88, '온유8', 'FEMALE', '1997-06-15', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW()),
       (89, '온유9', 'FEMALE', '1991-09-10', 'MEMBER', true, 8, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (90, '절제셀장', 'MALE', '1985-04-25', 'CELL_LEADER', true, 9, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 90
WHERE id = 9;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (90, 'leader9', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 90, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (91, '절제1', 'FEMALE', '1996-01-14', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (92, '절제2', 'FEMALE', '1993-11-17', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (93, '절제3', 'FEMALE', '1996-04-23', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (94, '절제4', 'MALE', '1993-04-06', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (95, '절제5', 'FEMALE', '1996-02-21', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (96, '절제6', 'FEMALE', '1996-10-11', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (97, '절제7', 'FEMALE', '1999-05-14', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (98, '절제8', 'MALE', '1992-12-21', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW()),
       (99, '절제9', 'MALE', '1999-07-06', 'MEMBER', true, 9, '2025-01-01', NOW(), NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (100, '소망셀장', 'MALE', '1985-01-07', 'CELL_LEADER', true, 10, '2025-01-01', NOW(), NOW());
UPDATE cells
SET leader_id = 100
WHERE id = 10;
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (100, 'leader10', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 100, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW());
INSERT INTO members (id, name, gender, birth_date, role, active, cell_id, cell_assignment_date, created_at, updated_at)
VALUES (101, '소망1', 'FEMALE', '1999-04-13', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (102, '소망2', 'MALE', '1991-06-21', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (103, '소망3', 'FEMALE', '1994-09-10', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (104, '소망4', 'MALE', '1995-02-08', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (105, '소망5', 'MALE', '2000-10-27', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (106, '소망6', 'MALE', '1998-12-08', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (107, '소망7', 'MALE', '1999-09-09', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (108, '소망8', 'FEMALE', '1992-04-07', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW()),
       (109, '소망9', 'FEMALE', '1991-08-11', 'MEMBER', true, 10, '2025-01-01', NOW(), NOW());

-- Users for remaining members
INSERT INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (11, 'user11', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 11, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (12, 'user12', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 12, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (13, 'user13', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 13, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (14, 'user14', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 14, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (15, 'user15', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 15, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (16, 'user16', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 16, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (17, 'user17', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 17, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (18, 'user18', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 18, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (19, 'user19', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 19, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (21, 'user21', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 21, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (22, 'user22', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 22, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (23, 'user23', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 23, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (24, 'user24', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 24, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (25, 'user25', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 25, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (26, 'user26', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 26, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (27, 'user27', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 27, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (28, 'user28', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 28, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (29, 'user29', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 29, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (31, 'user31', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 31, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (32, 'user32', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 32, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (33, 'user33', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 33, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (34, 'user34', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 34, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (35, 'user35', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 35, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (36, 'user36', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 36, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (37, 'user37', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 37, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (38, 'user38', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 38, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (39, 'user39', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 39, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (41, 'user41', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 41, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (42, 'user42', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 42, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (43, 'user43', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 43, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (44, 'user44', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 44, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (45, 'user45', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 45, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (46, 'user46', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 46, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (47, 'user47', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 47, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (48, 'user48', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 48, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (49, 'user49', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 49, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (51, 'user51', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 51, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (52, 'user52', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 52, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (53, 'user53', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 53, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (54, 'user54', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 54, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (55, 'user55', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 55, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (56, 'user56', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 56, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (57, 'user57', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 57, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (58, 'user58', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 58, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (59, 'user59', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 59, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (61, 'user61', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 61, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (62, 'user62', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 62, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (63, 'user63', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 63, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (64, 'user64', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 64, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (65, 'user65', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 65, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (66, 'user66', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 66, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (67, 'user67', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 67, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (68, 'user68', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 68, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (69, 'user69', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 69, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (71, 'user71', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 71, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (72, 'user72', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 72, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (73, 'user73', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 73, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (74, 'user74', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 74, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (75, 'user75', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 75, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (76, 'user76', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 76, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (77, 'user77', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 77, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (78, 'user78', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 78, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (79, 'user79', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 79, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (81, 'user81', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 81, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (82, 'user82', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 82, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (83, 'user83', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 83, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (84, 'user84', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 84, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (85, 'user85', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 85, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (86, 'user86', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 86, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (87, 'user87', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 87, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (88, 'user88', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 88, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (89, 'user89', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 89, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (91, 'user91', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 91, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (92, 'user92', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 92, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (93, 'user93', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 93, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (94, 'user94', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 94, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (95, 'user95', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 95, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (96, 'user96', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 96, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (97, 'user97', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 97, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (98, 'user98', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 98, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (99, 'user99', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 99, 'MEMBER', 'ACTIVE', NOW(), NOW()),
       (101, 'user101', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 101, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (102, 'user102', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 102, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (103, 'user103', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 103, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (104, 'user104', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 104, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (105, 'user105', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 105, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (106, 'user106', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 106, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (107, 'user107', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 107, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (108, 'user108', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 108, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (109, 'user109', 'a0/sVz.ml.P5k8c3O0sDs4uLzJ.98Lgkx2/8Fj8Jc4S5PVRi.wNR.2', 109, 'MEMBER', 'ACTIVE', NOW(),
        NOW());

-- 5. Notices
INSERT INTO notices (id, title, content, target, pinned, is_deleted, created_by, created_at, updated_at)
VALUES (1, '공지사항 1', '공지사항 1 내용입니다.', 'ALL', true, false, 1, '2026-02-10 10:00:00', '2026-02-10 10:00:00'),
       (2, '공지사항 2', '공지사항 2 내용입니다.', 'ALL', true, false, 1, '2026-03-10 10:00:00', '2026-03-10 10:00:00'),
       (3, '공지사항 3', '공지사항 3 내용입니다.', 'ALL', true, false, 1, '2026-04-10 10:00:00', '2026-04-10 10:00:00'),
       (4, '공지사항 4', '공지사항 4 내용입니다.', 'ALL', false, false, 1, '2026-05-10 10:00:00', '2026-05-10 10:00:00'),
       (5, '공지사항 5', '공지사항 5 내용입니다.', 'ALL', false, false, 1, '2026-01-10 10:00:00', '2026-01-10 10:00:00'),
       (6, '공지사항 6', '공지사항 6 내용입니다.', 'ALL', false, false, 1, '2026-02-10 10:00:00', '2026-02-10 10:00:00'),
       (7, '공지사항 7', '공지사항 7 내용입니다.', 'ALL', false, false, 1, '2026-03-10 10:00:00', '2026-03-10 10:00:00'),
       (8, '공지사항 8', '공지사항 8 내용입니다.', 'ALL', false, false, 1, '2026-04-10 10:00:00', '2026-04-10 10:00:00'),
       (9, '공지사항 9', '공지사항 9 내용입니다.', 'ALL', false, false, 1, '2026-05-10 10:00:00', '2026-05-10 10:00:00'),
       (10, '공지사항 10', '공지사항 10 내용입니다.', 'ALL', false, false, 1, '2026-01-10 10:00:00', '2026-01-10 10:00:00'),
       (11, '공지사항 11', '공지사항 11 내용입니다.', 'ALL', false, false, 1, '2026-02-10 10:00:00', '2026-02-10 10:00:00'),
       (12, '공지사항 12', '공지사항 12 내용입니다.', 'ALL', false, false, 1, '2026-03-10 10:00:00', '2026-03-10 10:00:00'),
       (13, '공지사항 13', '공지사항 13 내용입니다.', 'ALL', false, false, 1, '2026-04-10 10:00:00', '2026-04-10 10:00:00'),
       (14, '공지사항 14', '공지사항 14 내용입니다.', 'ALL', false, false, 1, '2026-05-10 10:00:00', '2026-05-10 10:00:00'),
       (15, '공지사항 15', '공지사항 15 내용입니다.', 'ALL', false, false, 1, '2026-01-10 10:00:00', '2026-01-10 10:00:00');

-- 6. Prayers
INSERT INTO prayers (id, member_id, meeting_date, content, visibility, is_deleted, created_by, created_at, updated_at)
VALUES (1, 10, '2026-03-01', '멤버 10의 기도제목입니다.', 'CELL', false, 10, NOW(), NOW()),
       (2, 11, '2026-03-01', '멤버 11의 기도제목입니다.', 'CELL', false, 11, NOW(), NOW()),
       (3, 12, '2026-03-01', '멤버 12의 기도제목입니다.', 'CELL', false, 12, NOW(), NOW()),
       (4, 20, '2026-03-01', '멤버 20의 기도제목입니다.', 'CELL', false, 20, NOW(), NOW()),
       (5, 21, '2026-03-01', '멤버 21의 기도제목입니다.', 'CELL', false, 21, NOW(), NOW()),
       (6, 22, '2026-03-01', '멤버 22의 기도제목입니다.', 'CELL', false, 22, NOW(), NOW()),
       (7, 30, '2026-03-01', '멤버 30의 기도제목입니다.', 'CELL', false, 30, NOW(), NOW()),
       (8, 31, '2026-03-01', '멤버 31의 기도제목입니다.', 'CELL', false, 31, NOW(), NOW()),
       (9, 32, '2026-03-01', '멤버 32의 기도제목입니다.', 'CELL', false, 32, NOW(), NOW()),
       (10, 40, '2026-03-01', '멤버 40의 기도제목입니다.', 'CELL', false, 40, NOW(), NOW()),
       (11, 41, '2026-03-01', '멤버 41의 기도제목입니다.', 'CELL', false, 41, NOW(), NOW()),
       (12, 42, '2026-03-01', '멤버 42의 기도제목입니다.', 'CELL', false, 42, NOW(), NOW()),
       (13, 50, '2026-03-01', '멤버 50의 기도제목입니다.', 'CELL', false, 50, NOW(), NOW()),
       (14, 51, '2026-03-01', '멤버 51의 기도제목입니다.', 'CELL', false, 51, NOW(), NOW()),
       (15, 52, '2026-03-01', '멤버 52의 기도제목입니다.', 'CELL', false, 52, NOW(), NOW()),
       (16, 60, '2026-03-01', '멤버 60의 기도제목입니다.', 'CELL', false, 60, NOW(), NOW()),
       (17, 61, '2026-03-01', '멤버 61의 기도제목입니다.', 'CELL', false, 61, NOW(), NOW()),
       (18, 62, '2026-03-01', '멤버 62의 기도제목입니다.', 'CELL', false, 62, NOW(), NOW()),
       (19, 70, '2026-03-01', '멤버 70의 기도제목입니다.', 'CELL', false, 70, NOW(), NOW()),
       (20, 71, '2026-03-01', '멤버 71의 기도제목입니다.', 'CELL', false, 71, NOW(), NOW()),
       (21, 72, '2026-03-01', '멤버 72의 기도제목입니다.', 'CELL', false, 72, NOW(), NOW()),
       (22, 80, '2026-03-01', '멤버 80의 기도제목입니다.', 'CELL', false, 80, NOW(), NOW()),
       (23, 81, '2026-03-01', '멤버 81의 기도제목입니다.', 'CELL', false, 81, NOW(), NOW()),
       (24, 82, '2026-03-01', '멤버 82의 기도제목입니다.', 'CELL', false, 82, NOW(), NOW()),
       (25, 90, '2026-03-01', '멤버 90의 기도제목입니다.', 'CELL', false, 90, NOW(), NOW()),
       (26, 91, '2026-03-01', '멤버 91의 기도제목입니다.', 'CELL', false, 91, NOW(), NOW()),
       (27, 92, '2026-03-01', '멤버 92의 기도제목입니다.', 'CELL', false, 92, NOW(), NOW()),
       (28, 100, '2026-03-01', '멤버 100의 기도제목입니다.', 'CELL', false, 100, NOW(), NOW()),
       (29, 101, '2026-03-01', '멤버 101의 기도제목입니다.', 'CELL', false, 101, NOW(), NOW()),
       (30, 102, '2026-03-01', '멤버 102의 기도제목입니다.', 'CELL', false, 102, NOW(), NOW());

-- 7. Attendance & Reports
-- Week: 2025-01-19
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-01-19', '2025-01-19 사랑셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-01-19', '2025-01-19 희락셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'ABSENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-01-19', '2025-01-19 화평셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-01-19', '2025-01-19 오래참음셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-01-19', '2025-01-19 자비셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-01-19', '2025-01-19 양선셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-01-19', '2025-01-19 충성셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-01-19', '2025-01-19 온유셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-01-19', '2025-01-19 절제셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-01-19', '2025-01-19 소망셀 나눔입니다.', '', '2025-01-19 16:00:00', '2025-01-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-01-19', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'ABSENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-01-19', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-02-16
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-02-16', '2025-02-16 사랑셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-02-16', '2025-02-16 희락셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-02-16', '2025-02-16 화평셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-02-16', '2025-02-16 오래참음셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-02-16', '2025-02-16 자비셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-02-16', '2025-02-16 양선셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-02-16', '2025-02-16 충성셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-02-16', '2025-02-16 온유셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-02-16', '2025-02-16 절제셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-02-16', '2025-02-16 소망셀 나눔입니다.', '', '2025-02-16 16:00:00', '2025-02-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-02-16', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-02-16', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-03-16
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-03-16', '2025-03-16 사랑셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'ABSENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-03-16', '2025-03-16 희락셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-03-16', '2025-03-16 화평셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-03-16', '2025-03-16 오래참음셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-03-16', '2025-03-16 자비셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-03-16', '2025-03-16 양선셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-03-16', '2025-03-16 충성셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-03-16', '2025-03-16 온유셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-03-16', '2025-03-16 절제셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-03-16', '2025-03-16 소망셀 나눔입니다.', '', '2025-03-16 16:00:00', '2025-03-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-03-16', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-03-16', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-04-20
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-04-20', '2025-04-20 사랑셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-04-20', '2025-04-20 희락셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-04-20', '2025-04-20 화평셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-04-20', '2025-04-20 오래참음셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-04-20', '2025-04-20 자비셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-04-20', '2025-04-20 양선셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'ABSENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-04-20', '2025-04-20 충성셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-04-20', '2025-04-20 온유셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-04-20', '2025-04-20 절제셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-04-20', '2025-04-20 소망셀 나눔입니다.', '', '2025-04-20 16:00:00', '2025-04-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-04-20', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'ABSENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-04-20', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-05-18
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-05-18', '2025-05-18 사랑셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-05-18', '2025-05-18 희락셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-05-18', '2025-05-18 화평셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-05-18', '2025-05-18 오래참음셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-05-18', '2025-05-18 자비셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-05-18', '2025-05-18 양선셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-05-18', '2025-05-18 충성셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-05-18', '2025-05-18 온유셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-05-18', '2025-05-18 절제셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-05-18', '2025-05-18 소망셀 나눔입니다.', '', '2025-05-18 16:00:00', '2025-05-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-05-18', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-05-18', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-06-15
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-06-15', '2025-06-15 사랑셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-06-15', '2025-06-15 희락셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-06-15', '2025-06-15 화평셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-06-15', '2025-06-15 오래참음셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-06-15', '2025-06-15 자비셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-06-15', '2025-06-15 양선셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-06-15', '2025-06-15 충성셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-06-15', '2025-06-15 온유셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-06-15', '2025-06-15 절제셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-06-15', '2025-06-15 소망셀 나눔입니다.', '', '2025-06-15 16:00:00', '2025-06-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-06-15', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-06-15', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-07-20
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-07-20', '2025-07-20 사랑셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'ABSENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-07-20', '2025-07-20 희락셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-07-20', '2025-07-20 화평셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-07-20', '2025-07-20 오래참음셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-07-20', '2025-07-20 자비셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-07-20', '2025-07-20 양선셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-07-20', '2025-07-20 충성셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-07-20', '2025-07-20 온유셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-07-20', '2025-07-20 절제셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-07-20', '2025-07-20 소망셀 나눔입니다.', '', '2025-07-20 16:00:00', '2025-07-20 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-07-20', 'ABSENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-07-20', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-08-17
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-08-17', '2025-08-17 사랑셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-08-17', '2025-08-17 희락셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-08-17', '2025-08-17 화평셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-08-17', '2025-08-17 오래참음셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-08-17', '2025-08-17 자비셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-08-17', '2025-08-17 양선셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-08-17', '2025-08-17 충성셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-08-17', '2025-08-17 온유셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-08-17', '2025-08-17 절제셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-08-17', '2025-08-17 소망셀 나눔입니다.', '', '2025-08-17 16:00:00', '2025-08-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-08-17', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-08-17', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-09-21
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-09-21', '2025-09-21 사랑셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'ABSENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-09-21', '2025-09-21 희락셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-09-21', '2025-09-21 화평셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-09-21', '2025-09-21 오래참음셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-09-21', '2025-09-21 자비셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-09-21', '2025-09-21 양선셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'ABSENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-09-21', '2025-09-21 충성셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-09-21', '2025-09-21 온유셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-09-21', '2025-09-21 절제셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-09-21', '2025-09-21 소망셀 나눔입니다.', '', '2025-09-21 16:00:00', '2025-09-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-09-21', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-09-21', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-10-19
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-10-19', '2025-10-19 사랑셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-10-19', '2025-10-19 희락셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-10-19', '2025-10-19 화평셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-10-19', '2025-10-19 오래참음셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-10-19', '2025-10-19 자비셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-10-19', '2025-10-19 양선셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-10-19', '2025-10-19 충성셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-10-19', '2025-10-19 온유셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-10-19', '2025-10-19 절제셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-10-19', '2025-10-19 소망셀 나눔입니다.', '', '2025-10-19 16:00:00', '2025-10-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-10-19', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-10-19', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-11-16
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-11-16', '2025-11-16 사랑셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-11-16', '2025-11-16 희락셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-11-16', '2025-11-16 화평셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-11-16', '2025-11-16 오래참음셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-11-16', '2025-11-16 자비셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-11-16', '2025-11-16 양선셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'ABSENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-11-16', '2025-11-16 충성셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-11-16', '2025-11-16 온유셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-11-16', '2025-11-16 절제셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-11-16', '2025-11-16 소망셀 나눔입니다.', '', '2025-11-16 16:00:00', '2025-11-16 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-11-16', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-11-16', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2025-12-21
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2025-12-21', '2025-12-21 사랑셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2025-12-21', '2025-12-21 희락셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2025-12-21', '2025-12-21 화평셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2025-12-21', '2025-12-21 오래참음셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2025-12-21', '2025-12-21 자비셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2025-12-21', '2025-12-21 양선셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2025-12-21', '2025-12-21 충성셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2025-12-21', '2025-12-21 온유셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2025-12-21', '2025-12-21 절제셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2025-12-21', '2025-12-21 소망셀 나눔입니다.', '', '2025-12-21 16:00:00', '2025-12-21 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2025-12-21', 'ABSENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'ABSENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2025-12-21', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-01-04
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-01-04', '2026-01-04 사랑셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-01-04', '2026-01-04 희락셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-01-04', '2026-01-04 화평셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-01-04', '2026-01-04 오래참음셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-01-04', '2026-01-04 자비셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-01-04', '2026-01-04 양선셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-01-04', '2026-01-04 충성셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-01-04', '2026-01-04 온유셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-01-04', '2026-01-04 절제셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'ABSENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-01-04', '2026-01-04 소망셀 나눔입니다.', '', '2026-01-04 16:00:00', '2026-01-04 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-04', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-04', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-01-11
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-01-11', '2026-01-11 사랑셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-01-11', '2026-01-11 희락셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-01-11', '2026-01-11 화평셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-01-11', '2026-01-11 오래참음셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-01-11', '2026-01-11 자비셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-01-11', '2026-01-11 양선셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-01-11', '2026-01-11 충성셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-01-11', '2026-01-11 온유셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-01-11', '2026-01-11 절제셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-01-11', '2026-01-11 소망셀 나눔입니다.', '', '2026-01-11 16:00:00', '2026-01-11 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-11', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-11', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-01-18
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-01-18', '2026-01-18 사랑셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-01-18', '2026-01-18 희락셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-01-18', '2026-01-18 화평셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-01-18', '2026-01-18 오래참음셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-01-18', '2026-01-18 자비셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-01-18', '2026-01-18 양선셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-01-18', '2026-01-18 충성셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-01-18', '2026-01-18 온유셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'ABSENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-01-18', '2026-01-18 절제셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-01-18', '2026-01-18 소망셀 나눔입니다.', '', '2026-01-18 16:00:00', '2026-01-18 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-18', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-18', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-01-25
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-01-25', '2026-01-25 사랑셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-01-25', '2026-01-25 희락셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-01-25', '2026-01-25 화평셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-01-25', '2026-01-25 오래참음셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'ABSENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-01-25', '2026-01-25 자비셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'ABSENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-01-25', '2026-01-25 양선셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-01-25', '2026-01-25 충성셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-01-25', '2026-01-25 온유셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-01-25', '2026-01-25 절제셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-01-25', '2026-01-25 소망셀 나눔입니다.', '', '2026-01-25 16:00:00', '2026-01-25 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-01-25', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-01-25', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-02-01
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-02-01', '2026-02-01 사랑셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'ABSENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-02-01', '2026-02-01 희락셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-02-01', '2026-02-01 화평셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-02-01', '2026-02-01 오래참음셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-02-01', '2026-02-01 자비셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-02-01', '2026-02-01 양선셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-02-01', '2026-02-01 충성셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-02-01', '2026-02-01 온유셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-02-01', '2026-02-01 절제셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-01', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-02-01', '2026-02-01 소망셀 나눔입니다.', '', '2026-02-01 16:00:00', '2026-02-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-01', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-01', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-02-08
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-02-08', '2026-02-08 사랑셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-02-08', '2026-02-08 희락셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-02-08', '2026-02-08 화평셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'ABSENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-02-08', '2026-02-08 오래참음셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-02-08', '2026-02-08 자비셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-02-08', '2026-02-08 양선셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-02-08', '2026-02-08 충성셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'ABSENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-02-08', '2026-02-08 온유셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-02-08', '2026-02-08 절제셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-02-08', '2026-02-08 소망셀 나눔입니다.', '', '2026-02-08 16:00:00', '2026-02-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-08', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-08', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-02-15
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-02-15', '2026-02-15 사랑셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-02-15', '2026-02-15 희락셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-02-15', '2026-02-15 화평셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'ABSENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-02-15', '2026-02-15 오래참음셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-02-15', '2026-02-15 자비셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'ABSENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-02-15', '2026-02-15 양선셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-02-15', '2026-02-15 충성셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-02-15', '2026-02-15 온유셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'ABSENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-02-15', '2026-02-15 절제셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-02-15', '2026-02-15 소망셀 나눔입니다.', '', '2026-02-15 16:00:00', '2026-02-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-15', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-15', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-02-22
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-02-22', '2026-02-22 사랑셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-02-22', '2026-02-22 희락셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-02-22', '2026-02-22 화평셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-02-22', '2026-02-22 오래참음셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-02-22', '2026-02-22 자비셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'ABSENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-02-22', '2026-02-22 양선셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-02-22', '2026-02-22 충성셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'ABSENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-02-22', '2026-02-22 온유셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-02-22', '2026-02-22 절제셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-02-22', '2026-02-22 소망셀 나눔입니다.', '', '2026-02-22 16:00:00', '2026-02-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-02-22', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'ABSENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-02-22', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-03-01
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-03-01', '2026-03-01 사랑셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-03-01', '2026-03-01 희락셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-03-01', '2026-03-01 화평셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-03-01', '2026-03-01 오래참음셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-03-01', '2026-03-01 자비셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-03-01', '2026-03-01 양선셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-03-01', '2026-03-01 충성셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-03-01', '2026-03-01 온유셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-03-01', '2026-03-01 절제셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-03-01', '2026-03-01 소망셀 나눔입니다.', '', '2026-03-01 16:00:00', '2026-03-01 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-01', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-01', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-03-08
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-03-08', '2026-03-08 사랑셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-03-08', '2026-03-08 희락셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-03-08', '2026-03-08 화평셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-03-08', '2026-03-08 오래참음셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-03-08', '2026-03-08 자비셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-03-08', '2026-03-08 양선셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-03-08', '2026-03-08 충성셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-03-08', '2026-03-08 온유셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-03-08', '2026-03-08 절제셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-03-08', '2026-03-08 소망셀 나눔입니다.', '', '2026-03-08 16:00:00', '2026-03-08 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-08', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-08', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-03-15
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-03-15', '2026-03-15 사랑셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-03-15', '2026-03-15 희락셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'ABSENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-03-15', '2026-03-15 화평셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-03-15', '2026-03-15 오래참음셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-03-15', '2026-03-15 자비셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-03-15', '2026-03-15 양선셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-03-15', '2026-03-15 충성셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-03-15', '2026-03-15 온유셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-03-15', '2026-03-15 절제셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-03-15', '2026-03-15 소망셀 나눔입니다.', '', '2026-03-15 16:00:00', '2026-03-15 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-15', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-15', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-03-22
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-03-22', '2026-03-22 사랑셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-03-22', '2026-03-22 희락셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-03-22', '2026-03-22 화평셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-03-22', '2026-03-22 오래참음셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'ABSENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-03-22', '2026-03-22 자비셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-03-22', '2026-03-22 양선셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-03-22', '2026-03-22 충성셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-03-22', '2026-03-22 온유셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-03-22', '2026-03-22 절제셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'ABSENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-03-22', '2026-03-22 소망셀 나눔입니다.', '', '2026-03-22 16:00:00', '2026-03-22 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-22', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-22', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-03-29
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-03-29', '2026-03-29 사랑셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-03-29', '2026-03-29 희락셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-03-29', '2026-03-29 화평셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-03-29', '2026-03-29 오래참음셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-03-29', '2026-03-29 자비셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-03-29', '2026-03-29 양선셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-03-29', '2026-03-29 충성셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-03-29', '2026-03-29 온유셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-03-29', '2026-03-29 절제셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-03-29', '2026-03-29 소망셀 나눔입니다.', '', '2026-03-29 16:00:00', '2026-03-29 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-03-29', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-03-29', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-04-05
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-04-05', '2026-04-05 사랑셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'ABSENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-04-05', '2026-04-05 희락셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-04-05', '2026-04-05 화평셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-04-05', '2026-04-05 오래참음셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-04-05', '2026-04-05 자비셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'ABSENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-04-05', '2026-04-05 양선셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-04-05', '2026-04-05 충성셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-04-05', '2026-04-05 온유셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-04-05', '2026-04-05 절제셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-04-05', '2026-04-05 소망셀 나눔입니다.', '', '2026-04-05 16:00:00', '2026-04-05 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-05', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-05', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-04-12
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-04-12', '2026-04-12 사랑셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-04-12', '2026-04-12 희락셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-04-12', '2026-04-12 화평셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'ABSENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-04-12', '2026-04-12 오래참음셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-04-12', '2026-04-12 자비셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-04-12', '2026-04-12 양선셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-04-12', '2026-04-12 충성셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-04-12', '2026-04-12 온유셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-04-12', '2026-04-12 절제셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-04-12', '2026-04-12 소망셀 나눔입니다.', '', '2026-04-12 16:00:00', '2026-04-12 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-12', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-12', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-04-19
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-04-19', '2026-04-19 사랑셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-04-19', '2026-04-19 희락셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-04-19', '2026-04-19 화평셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-04-19', '2026-04-19 오래참음셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-04-19', '2026-04-19 자비셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-04-19', '2026-04-19 양선셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-04-19', '2026-04-19 충성셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-04-19', '2026-04-19 온유셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-04-19', '2026-04-19 절제셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-04-19', '2026-04-19 소망셀 나눔입니다.', '', '2026-04-19 16:00:00', '2026-04-19 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-19', 'ABSENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-19', 'ABSENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-04-26
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-04-26', '2026-04-26 사랑셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-04-26', '2026-04-26 희락셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-04-26', '2026-04-26 화평셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-04-26', '2026-04-26 오래참음셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-04-26', '2026-04-26 자비셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-04-26', '2026-04-26 양선셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-04-26', '2026-04-26 충성셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-04-26', '2026-04-26 온유셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-04-26', '2026-04-26 절제셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-04-26', '2026-04-26 소망셀 나눔입니다.', '', '2026-04-26 16:00:00', '2026-04-26 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-04-26', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-04-26', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-05-03
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-05-03', '2026-05-03 사랑셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-05-03', '2026-05-03 희락셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-05-03', '2026-05-03 화평셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-05-03', '2026-05-03 오래참음셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-05-03', '2026-05-03 자비셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-05-03', '2026-05-03 양선셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-05-03', '2026-05-03 충성셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'ABSENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-05-03', '2026-05-03 온유셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-05-03', '2026-05-03 절제셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'ABSENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-05-03', '2026-05-03 소망셀 나눔입니다.', '', '2026-05-03 16:00:00', '2026-05-03 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-03', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'ABSENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-03', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-05-10
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-05-10', '2026-05-10 사랑셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-05-10', '2026-05-10 희락셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-05-10', '2026-05-10 화평셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-05-10', '2026-05-10 오래참음셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-05-10', '2026-05-10 자비셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-05-10', '2026-05-10 양선셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-05-10', '2026-05-10 충성셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-05-10', '2026-05-10 온유셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-05-10', '2026-05-10 절제셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-05-10', '2026-05-10 소망셀 나눔입니다.', '', '2026-05-10 16:00:00', '2026-05-10 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-10', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'ABSENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-10', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-05-17
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-05-17', '2026-05-17 사랑셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-05-17', '2026-05-17 희락셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-05-17', '2026-05-17 화평셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-05-17', '2026-05-17 오래참음셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-05-17', '2026-05-17 자비셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-05-17', '2026-05-17 양선셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-05-17', '2026-05-17 충성셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-05-17', '2026-05-17 온유셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-05-17', '2026-05-17 절제셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-05-17', '2026-05-17 소망셀 나눔입니다.', '', '2026-05-17 16:00:00', '2026-05-17 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-17', 'ABSENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-17', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-05-24
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-05-24', '2026-05-24 사랑셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-05-24', '2026-05-24 희락셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-05-24', '2026-05-24 화평셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-05-24', '2026-05-24 오래참음셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-05-24', '2026-05-24 자비셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-05-24', '2026-05-24 양선셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-05-24', '2026-05-24 충성셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-05-24', '2026-05-24 온유셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-05-24', '2026-05-24 절제셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-05-24', '2026-05-24 소망셀 나눔입니다.', '', '2026-05-24 16:00:00', '2026-05-24 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-24', 'PRESENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-24', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
-- Week: 2026-05-31
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (1, '2026-05-31', '2026-05-31 사랑셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 10, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 11, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 12, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 13, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 14, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 15, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 16, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 17, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 18, 10, 1, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 19, 10, 1, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (2, '2026-05-31', '2026-05-31 희락셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 20, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 21, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 22, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 23, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 24, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 25, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 26, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 27, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 28, 20, 2, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 29, 20, 2, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (3, '2026-05-31', '2026-05-31 화평셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'ABSENT', 30, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 31, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 32, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 33, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 34, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 35, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 36, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 37, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 38, 30, 3, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 39, 30, 3, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (4, '2026-05-31', '2026-05-31 오래참음셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 40, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 41, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 42, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 43, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 44, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 45, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 46, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 47, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 48, 40, 4, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 49, 40, 4, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (5, '2026-05-31', '2026-05-31 자비셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 50, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 51, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 52, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 53, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 54, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 55, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 56, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 57, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 58, 50, 5, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 59, 50, 5, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (6, '2026-05-31', '2026-05-31 양선셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 60, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 61, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 62, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 63, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 64, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 65, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 66, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 67, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 68, 60, 6, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 69, 60, 6, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (7, '2026-05-31', '2026-05-31 충성셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 70, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 71, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 72, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 73, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 74, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 75, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 76, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 77, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 78, 70, 7, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 79, 70, 7, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (8, '2026-05-31', '2026-05-31 온유셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 80, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 81, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 82, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 83, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 84, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 85, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 86, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 87, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 88, 80, 8, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 89, 80, 8, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (9, '2026-05-31', '2026-05-31 절제셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'PRESENT', 90, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 91, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 92, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 93, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 94, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 95, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 96, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 97, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 98, 90, 9, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 99, 90, 9, NULL, NOW(), NOW());
INSERT INTO cell_reports (cell_id, meeting_date, cell_share, special_notes, created_at, updated_at)
VALUES (10, '2026-05-31', '2026-05-31 소망셀 나눔입니다.', '', '2026-05-31 16:00:00', '2026-05-31 16:00:00');
INSERT INTO attendances (date, status, member_id, created_by, cell_id, memo, created_at, updated_at)
VALUES ('2026-05-31', 'ABSENT', 100, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 101, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 102, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 103, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 104, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 105, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 106, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 107, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'ABSENT', 108, 100, 10, NULL, NOW(), NOW()),
       ('2026-05-31', 'PRESENT', 109, 100, 10, NULL, NOW(), NOW());
