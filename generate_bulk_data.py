import random
from datetime import datetime, timedelta

# Configuration
NUM_TEAMS = 4
CELLS_PER_TEAM = 10
MEMBERS_PER_CELL = 15  # Average
WEEKS_OF_ATTENDANCE = 12

OUTPUT_FILE = 'src/main/resources/data.sql'

# Data Pools
LAST_NAMES = ["김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안", "송", "류", "전"]
FIRST_NAMES = ["민수", "서준", "도윤", "예준", "시우", "하준", "지호", "지유", "서윤", "서연", "민서", "하은", "지우", "은지", "수진", "연우", "예은", "현우", "준우", "다은"]

def get_random_name():
    return random.choice(LAST_NAMES) + random.choice(FIRST_NAMES)

def get_random_date(start_year, end_year):
    start = datetime(start_year, 1, 1)
    end = datetime(end_year, 12, 31)
    delta = end - start
    random_days = random.randrange(delta.days)
    return (start + timedelta(days=random_days)).strftime('%Y-%m-%d')

def get_sunday_dates(weeks):
    dates = []
    today = datetime.now()
    # Find last Sunday
    last_sunday = today - timedelta(days=today.weekday() + 1)
    for i in range(weeks):
        dates.append((last_sunday - timedelta(weeks=i)).strftime('%Y-%m-%d'))
    return dates

with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
    f.write("SET FOREIGN_KEY_CHECKS = 0;\n")
    f.write("TRUNCATE TABLE attendances;\n")
    f.write("TRUNCATE TABLE member_teams;\n")
    f.write("TRUNCATE TABLE users;\n")
    f.write("TRUNCATE TABLE members;\n")
    f.write("TRUNCATE TABLE cells;\n")
    f.write("TRUNCATE TABLE teams;\n")
    f.write("TRUNCATE TABLE semesters;\n")
    
    # 1. Semesters
    f.write("\n-- Semesters\n")
    f.write("INSERT INTO semesters (id, name, start_date, end_date, is_active) VALUES (1, '2025-1학기', '2025-01-01', '2025-06-30', 1);\n")
    f.write("INSERT INTO semesters (id, name, start_date, end_date, is_active) VALUES (2, '2024-2학기', '2024-07-01', '2024-12-31', 0);\n")

    # 2. Teams
    f.write("\n-- Teams\n")
    team_ids = []
    for i in range(1, NUM_TEAMS + 1):
        team_name = f"청년{i}팀"
        code = f"Y{i}"
        f.write(f"INSERT INTO teams (id, name, code, description, active, created_at, updated_at) VALUES ({i}, '{team_name}', '{code}', '{team_name}입니다.', 1, NOW(), NOW());\n")
        team_ids.append(i)

    # 3. Cells & Members
    cell_id_counter = 1
    member_id_counter = 1
    
    # Admin User
    f.write("\n-- Admin Member\n")
    f.write(f"INSERT INTO members (id, name, gender, birth_date, phone, email, role, active, created_at, updated_at) VALUES ({member_id_counter}, '관리자', 'MALE', '1990-01-01', '010-0000-0000', 'admin@seouldream.com', 'EXECUTIVE', 1, NOW(), NOW());\n")
    f.write(f"INSERT INTO users (username, password_hash, member_id, role, status, created_at, updated_at) VALUES ('admin', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a', {member_id_counter}, 'EXECUTIVE', 'ACTIVE', NOW(), NOW());\n") # password: password
    member_id_counter += 1

    attendance_sql_buffer = []
    member_team_sql_buffer = []
    user_sql_buffer = []
    cell_update_sql_buffer = []

    for team_id in team_ids:
        f.write(f"\n-- Cells for Team {team_id}\n")
        for c in range(CELLS_PER_TEAM):
            cell_name = f"청년{team_id}팀-{c+1}셀"
            current_cell_id = cell_id_counter
            
            # Insert Cell (Leader/ViceLeader NULL initially)
            f.write(f"INSERT INTO cells (id, name, description, active, created_at, updated_at) VALUES ({current_cell_id}, '{cell_name}', '{cell_name}입니다.', 1, NOW(), NOW());\n")
            
            # Members for this cell
            num_members = MEMBERS_PER_CELL + random.randint(-3, 3)
            cell_member_ids = []
            
            for m in range(num_members):
                current_member_id = member_id_counter
                name = get_random_name()
                gender = random.choice(['MALE', 'FEMALE'])
                birth_date = get_random_date(1990, 2005)
                phone = f"010-{random.randint(1000,9999)}-{random.randint(1000,9999)}"
                email = f"user{current_member_id}@example.com"
                
                f.write(f"INSERT INTO members (id, name, gender, birth_date, phone, email, cell_id, role, join_year, active, address, created_at, updated_at) VALUES ({current_member_id}, '{name}', '{gender}', '{birth_date}', '{phone}', '{email}', {current_cell_id}, 'MEMBER', {random.randint(2018, 2024)}, 1, '서울시', NOW(), NOW());\n")
                
                # MemberTeam
                member_team_sql_buffer.append(f"INSERT INTO member_teams (member_id, team_id, joined_at, created_at) VALUES ({current_member_id}, {team_id}, NOW(), NOW());\n")
                
                cell_member_ids.append(current_member_id)
                member_id_counter += 1
            
            # Assign Leader & Vice Leader
            if cell_member_ids:
                leader_id = cell_member_ids[0]
                # Update Member Role
                f.write(f"UPDATE members SET role = 'CELL_LEADER' WHERE id = {leader_id};\n")
                
                # Create User for Leader
                username = f"leader_y{team_id}_{c+1}"
                user_sql_buffer.append(f"INSERT INTO users (username, password_hash, member_id, role, status, created_at, updated_at) VALUES ('{username}', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a', {leader_id}, 'CELL_LEADER', 'ACTIVE', NOW(), NOW());\n")

                vice_leader_id = "NULL"
                if len(cell_member_ids) > 1 and random.choice([True, False]):
                    vice_leader_id = cell_member_ids[1]
                
                cell_update_sql_buffer.append(f"UPDATE cells SET leader_id = {leader_id}, vice_leader_id = {vice_leader_id} WHERE id = {current_cell_id};\n")
                
                # Create random users for some members
                for mid in cell_member_ids[1:]:
                    if random.random() < 0.2: # 20% users
                        username = f"user_{mid}"
                        user_sql_buffer.append(f"INSERT INTO users (username, password_hash, member_id, role, status, created_at, updated_at) VALUES ('{username}', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQiy38a', {mid}, 'MEMBER', 'ACTIVE', NOW(), NOW());\n")

            # Attendances
            sundays = get_sunday_dates(WEEKS_OF_ATTENDANCE)
            for date in sundays:
                for mid in cell_member_ids:
                    status = 'PRESENT' if random.random() < 0.85 else 'ABSENT' # 85% attendance
                    memo = "'개인사정'" if status == 'ABSENT' else "NULL"
                    attendance_sql_buffer.append(f"INSERT INTO attendances (member_id, cell_id, date, status, memo, created_at, updated_at) VALUES ({mid}, {current_cell_id}, '{date}', '{status}', {memo}, NOW(), NOW());\n")
            
            cell_id_counter += 1

    f.write("\n-- Update Cells Leaders\n")
    for sql in cell_update_sql_buffer:
        f.write(sql)
        
    f.write("\n-- Member Teams\n")
    for sql in member_team_sql_buffer:
        f.write(sql)
        
    f.write("\n-- Users\n")
    for sql in user_sql_buffer:
        f.write(sql)
        
    f.write("\n-- Attendances\n")
    for sql in attendance_sql_buffer:
        f.write(sql)

    f.write("\nSET FOREIGN_KEY_CHECKS = 1;\n")

print(f"Generated {OUTPUT_FILE} with {member_id_counter-1} members and {len(attendance_sql_buffer)} attendance records.")
