-- Teams
INSERT IGNORE INTO teams (name, code, description, active)
VALUES ('새가족팀', 'NEWFAM', '새가족을 환영하고 정착을 돕는 팀입니다.', true),
       ('예배팀', 'WORSHIP', '주일 예배를 준비하고 섬기는 팀입니다.', true),
       ('찬양팀', 'PRAISE', '찬양으로 하나님께 영광을 돌리는 팀입니다.', true),
       ('미디어팀', 'MEDIA', '교회 소식을 알리고 미디어를 통해 복음을 전하는 팀입니다.', true),
       ('중보기도팀', 'PRAYER', '나라와 민족, 교회를 위해 기도하는 팀입니다.', true);

-- Members (100)
INSERT IGNORE INTO members (id, name, gender, birth_date, phone, email,
                            cell_id, role, join_year, active, address, note, created_at, updated_at)
VALUES (1, '김서준', 'MALE', '1990-01-15', '010-1111-1111', 'leader1@example.com', NULL, 'CELL_LEADER', 2020, true,
        '서울시 강남구', '리더 후보 1', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (2, '이하준', 'MALE', '1991-02-20', '010-2222-2222', 'leader2@example.com', NULL, 'CELL_LEADER', 2020, true,
        '서울시 서초구', '리더 후보 2', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (3, '박도윤', 'MALE', '1992-03-10', '010-3333-3333', 'leader3@example.com', NULL, 'CELL_LEADER', 2021, true,
        '서울시 송파구', '리더 후보 3', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (4, '최시우', 'MALE', '1993-04-05', '010-4444-4444', 'leader4@example.com', NULL, 'CELL_LEADER', 2021, true,
        '서울시 강동구', '리더 후보 4', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (5, '정지호', 'MALE', '1994-05-25', '010-5555-5555', 'leader5@example.com', NULL, 'CELL_LEADER', 2022, true,
        '서울시 마포구', '리더 후보 5', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (6, '강예준', 'MALE', '1995-06-12', '010-6666-6666', 'leader6@example.com', NULL, 'CELL_LEADER', 2022, true,
        '서울시 용산구', '리더 후보 6', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (7, '조주원', 'MALE', '1996-07-30', '010-7777-7777', 'leader7@example.com', NULL, 'CELL_LEADER', 2023, true,
        '서울시 종로구', '리더 후보 7', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (8, '윤유준', 'MALE', '1997-08-18', '010-8888-8888', 'leader8@example.com', NULL, 'CELL_LEADER', 2023, true,
        '서울시 중구', '리더 후보 8', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (9, '장서아', 'FEMALE', '1998-09-22', '010-9999-9999', 'leader9@example.com', NULL, 'CELL_LEADER', 2024, true,
        '서울시 성동구', '리더 후보 9', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (10, '임하윤', 'FEMALE', '1999-10-11', '010-1010-1010', 'leader10@example.com', NULL, 'CELL_LEADER', 2024, true,
        '서울시 광진구', '리더 후보 10', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (11, '김지아', 'FEMALE', '1990-11-01', '010-1212-1212', 'vice1@example.com', NULL, 'MEMBER', 2020, true, '서울시 동대문구',
        '부리더 후보 1', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (12, '이서윤', 'FEMALE', '1991-12-02', '010-1313-1313', 'vice2@example.com', NULL, 'MEMBER', 2020, true, '서울시 중랑구',
        '부리더 후보 2', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (13, '박하은', 'FEMALE', '1992-01-03', '010-1414-1414', 'vice3@example.com', NULL, 'MEMBER', 2021, true, '서울시 성북구',
        '부리더 후보 3', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (14, '최지우', 'FEMALE', '1993-02-04', '010-1515-1515', 'vice4@example.com', NULL, 'MEMBER', 2021, true, '서울시 강북구',
        '부리더 후보 4', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (15, '정수아', 'FEMALE', '1994-03-05', '010-1616-1616', 'vice5@example.com', NULL, 'MEMBER', 2022, true, '서울시 도봉구',
        '부리더 후보 5', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (16, '강다은', 'FEMALE', '1995-04-06', '010-1717-1717', 'vice6@example.com', NULL, 'MEMBER', 2022, true, '서울시 노원구',
        '부리더 후보 6', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (17, '조서준', 'MALE', '1996-05-07', '010-1818-1818', 'vice7@example.com', NULL, 'MEMBER', 2023, true, '서울시 은평구',
        '부리더 후보 7', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (18, '윤하준', 'MALE', '1997-06-08', '010-1919-1919', 'vice8@example.com', NULL, 'MEMBER', 2023, true, '서울시 서대문구',
        '부리더 후보 8', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (19, '장도윤', 'MALE', '1998-07-09', '010-2020-2020', 'vice9@example.com', NULL, 'MEMBER', 2024, true, '서울시 동작구',
        '부리더 후보 9', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
       (20, '임시우', 'MALE', '1999-08-10', '010-2121-2121', 'vice10@example.com', NULL, 'MEMBER', 2024, true, '서울시 관악구',
        '부리더 후보 10', '2023-01-01 00:00:00', '2023-01-01 00:00:00');

-- 나머지 80명 멤버 (MEMBER 역할) - id 21 ~ 100
INSERT IGNORE INTO members (id, name, gender, birth_date, phone, email,
                            cell_id, role, join_year, active, address, note, created_at, updated_at)
SELECT i,
       CONCAT('멤버', i),
       CASE WHEN (i % 2 = 0) THEN 'FEMALE' ELSE 'MALE' END,
       DATE('1995-01-01') + INTERVAL (i % 365) DAY,
       CONCAT('010-3', LPAD(i, 3, '0'), '-', LPAD(i + 100, 4, '0')),
       CONCAT('member', i, '@example.com'),
       NULL,
       'MEMBER',
       2022,
       true,
       CONCAT('서울시 어딘가 ', i),
       '일반 멤버',
       '2023-01-01 00:00:00',
       '2023-01-01 00:00:00'
FROM (SELECT 21 + t1.seq + t2.seq AS i
      FROM (SELECT 0 AS seq
            UNION ALL
            SELECT 1
            UNION ALL
            SELECT 2
            UNION ALL
            SELECT 3
            UNION ALL
            SELECT 4
            UNION ALL
            SELECT 5
            UNION ALL
            SELECT 6
            UNION ALL
            SELECT 7
            UNION ALL
            SELECT 8
            UNION ALL
            SELECT 9) t1
               CROSS JOIN (SELECT 0 AS seq
                           UNION ALL
                           SELECT 10
                           UNION ALL
                           SELECT 20
                           UNION ALL
                           SELECT 30
                           UNION ALL
                           SELECT 40
                           UNION ALL
                           SELECT 50
                           UNION ALL
                           SELECT 60
                           UNION ALL
                           SELECT 70) t2) AS numbers
WHERE i BETWEEN 21 AND 100;

-- Users (100)
-- 비밀번호는 모두 'password'를 bcrypt로 해시한 값입니다.
INSERT IGNORE INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
VALUES (1, 'leader1', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 1, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (2, 'leader2', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 2, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (3, 'leader3', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 3, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (4, 'leader4', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 4, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (5, 'leader5', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 5, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (6, 'leader6', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 6, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (7, 'leader7', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 7, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (8, 'leader8', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 8, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (9, 'leader9', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 9, 'CELL_LEADER', 'ACTIVE', NOW(),
        NOW()),
       (10, 'leader10', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 10, 'CELL_LEADER', 'ACTIVE',
        NOW(), NOW()),
       (11, 'vice1', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 11, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (12, 'vice2', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 12, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (13, 'vice3', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 13, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (14, 'vice4', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 14, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (15, 'vice5', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 15, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (16, 'vice6', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 16, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (17, 'vice7', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 17, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (18, 'vice8', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 18, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (19, 'vice9', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 19, 'MEMBER', 'ACTIVE', NOW(),
        NOW()),
       (20, 'vice10', '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S', 20, 'MEMBER', 'ACTIVE', NOW(),
        NOW());

-- 나머지 80명 사용자 (MEMBER 역할)
INSERT IGNORE INTO users (id, username, password_hash, member_id, role, status, created_at, updated_at)
SELECT i,
       CONCAT('user', i),
       '$2a$10$8.A3/6YJ2f0k0g.F53z5.O/3S3T2pFr2JdGAd5G5g7xO.A9S.mI2S',
       i,
       'MEMBER',
       'ACTIVE',
       NOW(),
       NOW()
FROM (SELECT 21 + t1.seq + t2.seq AS i
      FROM (SELECT 0 AS seq
            UNION ALL
            SELECT 1
            UNION ALL
            SELECT 2
            UNION ALL
            SELECT 3
            UNION ALL
            SELECT 4
            UNION ALL
            SELECT 5
            UNION ALL
            SELECT 6
            UNION ALL
            SELECT 7
            UNION ALL
            SELECT 8
            UNION ALL
            SELECT 9) t1
               CROSS JOIN (SELECT 0 AS seq
                           UNION ALL
                           SELECT 10
                           UNION ALL
                           SELECT 20
                           UNION ALL
                           SELECT 30
                           UNION ALL
                           SELECT 40
                           UNION ALL
                           SELECT 50
                           UNION ALL
                           SELECT 60
                           UNION ALL
                           SELECT 70) t2) AS numbers
WHERE i BETWEEN 21 AND 100;

-- Cells (10)
INSERT IGNORE INTO cells (id, name, leader_id, vice_leader_id, description, active)
VALUES (1, '사랑셀', 1, 11, '사랑이 넘치는 셀입니다.', true),
       (2, '믿음셀', 2, 12, '믿음으로 하나되는 셀입니다.', true),
       (3, '소망셀', 3, 13, '소망을 나누는 셀입니다.', true),
       (4, '온유셀', 4, 14, '온유함으로 서로를 섬기는 셀입니다.', true),
       (5, '화평셀', 5, 15, '화평케 하는 자들이 모인 셀입니다.', true),
       (6, '지혜셀', 6, 16, '지혜를 구하며 성장하는 셀입니다.', true),
       (7, '기쁨셀', 7, 17, '항상 기쁨이 가득한 셀입니다.', true),
       (8, '감사셀', 8, 18, '범사에 감사하는 셀입니다.', true),
       (9, '인내셀', 9, 19, '인내로 열매맺는 셀입니다.', true),
       (10, '충성셀', 10, 20, '맡은 자들에게 구할 것은 충성인 셀입니다.', true);

-- Update members with cell_id
UPDATE members
SET cell_id = 1
WHERE id IN (1, 11);
UPDATE members
SET cell_id = 2
WHERE id IN (2, 12);
UPDATE members
SET cell_id = 3
WHERE id IN (3, 13);
UPDATE members
SET cell_id = 4
WHERE id IN (4, 14);
UPDATE members
SET cell_id = 5
WHERE id IN (5, 15);
UPDATE members
SET cell_id = 6
WHERE id IN (6, 16);
UPDATE members
SET cell_id = 7
WHERE id IN (7, 17);
UPDATE members
SET cell_id = 8
WHERE id IN (8, 18);
UPDATE members
SET cell_id = 9
WHERE id IN (9, 19);
UPDATE members
SET cell_id = 10
WHERE id IN (10, 20);

-- 나머지 멤버들을 10개의 셀에 분배 (8명씩)
UPDATE members
SET cell_id = 1
WHERE id BETWEEN 21 AND 28;
UPDATE members
SET cell_id = 2
WHERE id BETWEEN 29 AND 36;
UPDATE members
SET cell_id = 3
WHERE id BETWEEN 37 AND 44;
UPDATE members
SET cell_id = 4
WHERE id BETWEEN 45 AND 52;
UPDATE members
SET cell_id = 5
WHERE id BETWEEN 53 AND 60;
UPDATE members
SET cell_id = 6
WHERE id BETWEEN 61 AND 68;
UPDATE members
SET cell_id = 7
WHERE id BETWEEN 69 AND 76;
UPDATE members
SET cell_id = 8
WHERE id BETWEEN 77 AND 84;
UPDATE members
SET cell_id = 9
WHERE id BETWEEN 85 AND 92;
UPDATE members
SET cell_id = 10
WHERE id BETWEEN 93 AND 100;

-- MemberTeam (Assign members to teams)
INSERT IGNORE INTO member_teams (member_id, team_id, joined_at)
SELECT m.id,
       (m.id % 5) + 1, -- 1~5 팀에 순환 배정
       CURDATE()
FROM members m;

INSERT IGNORE INTO member_teams (member_id, team_id, joined_at)
SELECT m.id,
       ((m.id + 2) % 5) + 1, -- 다른 팀 하나 더
       CURDATE()
FROM members m
WHERE m.id % 3 = 0;

-- Notices (수정됨: created_at, updated_at 추가)
INSERT IGNORE INTO notices (id, title, content, target, target_cell_id, pinned, publish_at, created_by, created_at,
                            updated_at)
VALUES (1, '전체 공지: 주일 예배 안내', '이번 주 주일 예배는 오전 11시에 본당에서 진행됩니다. 모든 성도님들의 참여 바랍니다.', 'ALL', NULL, true, NOW(), 1, NOW(),
        NOW()),
       (2, '셀리더 공지: 월례회 일정', '다음 주 화요일 저녁 7시, 셀리더 월례회가 있습니다. 필히 참석해 주세요.', 'CELL_LEADER', NULL, false, NOW(), 1, NOW(),
        NOW()),
       (3, '교역자 공지: 긴급 회의 소집', '오늘 오후 3시, 교역자 긴급 회의가 있습니다. 장소는 교역자실입니다.', 'EXECUTIVE', NULL, false, NOW(), 1, NOW(),
        NOW()),
       (4, '사랑셀 공지: 셀 모임 안내', '이번 주 사랑셀 모임은 금요일 저녁 8시, 셀장님 댁에서 진행됩니다.', 'CELL', 1, false, NOW(), 1, NOW(), NOW()),
       (5, '전체 공지: 새가족 환영회', '다음 달 첫째 주 주일, 새가족 환영회가 있습니다. 많은 참여 부탁드립니다.', 'ALL', NULL, false, NOW(), 1, NOW(), NOW()),
       (6, '전체 공지: 새가족 환영회', '다음 달 첫째 주 주일, 새가족 환영회가 있습니다. 많은 참여 부탁드립니다.', 'ALL', NULL, false, NOW(), 1, NOW(), NOW()),
       (7, '전체 공지: 새가족 환영회', '다음 달 첫째 주 주일, 새가족 환영회가 있습니다. 많은 참여 부탁드립니다.', 'ALL', NULL, false, NOW(), 1, NOW(), NOW()),
       (8, '전체 공지: 새가족 환영회', '다음 달 첫째 주 주일, 새가족 환영회가 있습니다. 많은 참여 부탁드립니다.', 'ALL', NULL, false, NOW(), 1, NOW(), NOW()),
       (9, '전체 공지: 새가족 환영회', '다음 달 첫째 주 주일, 새가족 환영회가 있습니다. 많은 참여 부탁드립니다.', 'ALL', NULL, false, NOW(), 1, NOW(), NOW()),
       (10, '전체 공지: 새가족 환영회', '다음 달 첫째 주 주일, 새가족 환영회가 있습니다. 많은 참여 부탁드립니다.', 'ALL', NULL, false, NOW(), 1, NOW(), NOW());