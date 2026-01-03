package com.sdc.seouldreamcellbe.config;

import com.sdc.seouldreamcellbe.domain.*;
import com.sdc.seouldreamcellbe.domain.common.AttendanceStatus;
import com.sdc.seouldreamcellbe.domain.common.Gender;
import com.sdc.seouldreamcellbe.domain.common.Role;
import com.sdc.seouldreamcellbe.domain.common.UserStatus;
import com.sdc.seouldreamcellbe.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Component
@RequiredArgsConstructor
@Slf4j
@Profile("!prod") // 프로덕션 환경에서는 실행되지 않도록 주의
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final MemberRepository memberRepository;
    private final CellRepository cellRepository;
    private final TeamRepository teamRepository;
    private final MemberTeamRepository memberTeamRepository;
    private final SemesterRepository semesterRepository;
    private final AttendanceRepository attendanceRepository;
    private final PasswordEncoder passwordEncoder;

    private final Random random = new Random();

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (memberRepository.count() > 0) {
            log.info("Data already exists. Skipping initialization.");
            return;
        }

        log.info("Starting large-scale data initialization...");

        // 1. Semesters
        Semester semester2025_1 = createSemester("2025-1학기", LocalDate.of(2025, 1, 1), LocalDate.of(2025, 6, 30), true);
        Semester semester2024_2 = createSemester("2024-2학기", LocalDate.of(2024, 7, 1), LocalDate.of(2024, 12, 31), false);
        log.info("Created Semesters.");

        // 2. Teams (4 Teams)
        List<Team> teams = new ArrayList<>();
        teams.add(createTeam("청년1팀", "Y1", "청년부 1팀입니다."));
        teams.add(createTeam("청년2팀", "Y2", "청년부 2팀입니다."));
        teams.add(createTeam("청년3팀", "Y3", "청년부 3팀입니다."));
        teams.add(createTeam("청년4팀", "Y4", "청년부 4팀입니다."));
        log.info("Created 4 Teams.");

        // 3. Admin User & Member
        createAdminUser();
        log.info("Created Admin User.");

        // 4. Cells & Members (10 cells per team, ~15 members per cell)
        for (Team team : teams) {
            for (int i = 1; i <= 10; i++) {
                String cellName = team.getName() + "-" + i + "셀";
                createCellWithMembers(cellName, team, 12 + random.nextInt(6)); // 12~17 members
            }
            log.info("Created cells and members for " + team.getName());
        }

        log.info("Data initialization completed. Total members: {}", memberRepository.count());
    }

    private Semester createSemester(String name, LocalDate start, LocalDate end, boolean active) {
        return semesterRepository.save(Semester.builder()
                .name(name)
                .startDate(start)
                .endDate(end)
                .isActive(active)
                .build());
    }

    private Team createTeam(String name, String code, String description) {
        return teamRepository.save(Team.builder()
                .name(name)
                .code(code)
                .description(description)
                .active(true)
                .build());
    }

    private void createAdminUser() {
        Member adminMember = memberRepository.save(Member.builder()
                .name("관리자")
                .gender(Gender.MALE)
                .birthDate(LocalDate.of(1990, 1, 1))
                .phone("010-0000-0000")
                .email("admin@seouldream.com")
                .role(Role.EXECUTIVE)
                .active(true)
                .build());

        userRepository.save(User.builder()
                .username("admin")
                .password(passwordEncoder.encode("password"))
                .member(adminMember)
                .role(Role.EXECUTIVE)
                .status(UserStatus.ACTIVE)
                .build());
    }

    private void createCellWithMembers(String cellName, Team team, int memberCount) {
        Cell cell = cellRepository.save(Cell.builder()
                .name(cellName)
                .description(cellName + "입니다.")
                .active(true)
                .build());

        List<Member> members = new ArrayList<>();
        
        // Leader
        Member leader = createMember(cell, team, Role.CELL_LEADER, true);
        cell.setLeader(leader);
        members.add(leader);

        // Vice Leader (80% chance for large scale)
        if (random.nextInt(10) < 8) {
            Member viceLeader = createMember(cell, team, Role.MEMBER, true);
            cell.setViceLeader(viceLeader);
            members.add(viceLeader);
        }

        // Members
        for (int i = 0; i < memberCount; i++) {
            // 30% chance of having a login account for regular members
            members.add(createMember(cell, team, Role.MEMBER, random.nextInt(10) < 3));
        }
        
        cellRepository.save(cell);

        // Generate Attendance (Last 12 Sundays)
        generateAttendance(members, cell);
    }

    private Member createMember(Cell cell, Team team, Role role, boolean createUser) {
        String name = getRandomName();
        Gender gender = random.nextBoolean() ? Gender.MALE : Gender.FEMALE;
        LocalDate birthDate = LocalDate.of(1985 + random.nextInt(20), 1 + random.nextInt(12), 1 + random.nextInt(28));
        
        Member member = memberRepository.save(Member.builder()
                .name(name)
                .gender(gender)
                .birthDate(birthDate)
                .phone("010-" + String.format("%04d", random.nextInt(10000)) + "-" + String.format("%04d", random.nextInt(10000)))
                .email("user" + random.nextInt(1000000) + "@example.com")
                .cell(cell)
                .cellAssignmentDate(LocalDate.now().minusMonths(random.nextInt(24)))
                .role(role)
                .joinYear(2015 + random.nextInt(10))
                .active(true)
                .address("서울시 어딘가")
                .build());

        memberTeamRepository.save(MemberTeam.builder()
                .member(member)
                .team(team)
                .joinedAt(LocalDate.now().minusMonths(12))
                .build());

        if (createUser || role == Role.CELL_LEADER) {
            String username = "user_" + member.getId();
            if (role == Role.CELL_LEADER) {
                // Simplified leader username: e.g., leader_y1_1
                String cellSuffix = cell.getName().replace("청년", "y").replace("팀", "").replace("-", "_").replace("셀", "");
                username = "leader_" + cellSuffix.toLowerCase();
            }
            
            try {
                userRepository.save(User.builder()
                        .username(username)
                        .password(passwordEncoder.encode("password"))
                        .member(member)
                        .role(role)
                        .status(UserStatus.ACTIVE)
                        .build());
            } catch (Exception e) {
                // Duplicate username fallback
                userRepository.save(User.builder()
                        .username(username)
                        .password(passwordEncoder.encode("password"))
                        .member(member)
                        .role(role)
                        .status(UserStatus.ACTIVE)
                        .build());
            }
        }

        return member;
    }

    private void generateAttendance(List<Member> members, Cell cell) {
        LocalDate today = LocalDate.now();
        for (int i = 0; i < 24; i++) { // Last 24 weeks (approx. 6 months)
            LocalDate sunday = today.minusWeeks(i).with(java.time.temporal.TemporalAdjusters.previousOrSame(java.time.DayOfWeek.SUNDAY));
            
            for (Member member : members) {
                // 70% ~ 95% attendance rate
                AttendanceStatus status = (random.nextInt(100) < 85) ? AttendanceStatus.PRESENT : AttendanceStatus.ABSENT;
                
                attendanceRepository.save(Attendance.builder()
                        .member(member)
                        .cell(cell)
                        .date(sunday)
                        .status(status)
                        .memo(status == AttendanceStatus.ABSENT ? "개인사정" : null)
                        .build());
            }
        }
    }

    private final List<String> lastNames = Arrays.asList("김", "이", "박", "최", "정", "강", "조", "윤", "장", "임");
    private final List<String> firstNames = Arrays.asList("민수", "서준", "도윤", "예준", "시우", "하준", "지호", "지유", "서윤", "서연", "민서", "하은", "지우", "은지", "수진");

    private String getRandomName() {
        return lastNames.get(random.nextInt(lastNames.size())) + firstNames.get(random.nextInt(firstNames.size()));
    }
}
