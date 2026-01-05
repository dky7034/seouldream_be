# 🚀 부하 테스트 및 모니터링 완벽 가이드

이 가이드는 `k6`를 사용하여 서버에 가상의 트래픽을 발생시키고, `Grafana`를 통해 서버가 얼마나 힘들어하는지(CPU, Memory 등) 실시간으로 감시하는 방법을 설명합니다. 처음 접하는 분들도 따라 할 수 있도록 단계별로 구성했습니다.

---

## 🏗 1. 전체 구조 이해하기
우리가 구축할 시스템은 다음과 같습니다.
1.  **k6 (내 컴퓨터)**: 가상의 사용자 20명, 50명, 100명... 역할을 맡아 서버를 계속 괴롭힙니다.
2.  **Spring Boot (서버)**: 요청을 처리하면서 "나 지금 CPU 30% 쓰고 있어!"라는 상태 정보(Metric)를 `/actuator/prometheus` 주소에 흘려보냅니다.
3.  **Prometheus (수집가)**: 5초마다 서버에게 "상태 어때?"라고 물어보고 데이터를 받아 저장합니다.
4.  **Grafana (시각화)**: Prometheus에 저장된 데이터를 가져와 멋진 그래프로 보여줍니다.

---

## 🛠 2. 사전 준비 (필수)
이 세 가지가 설치되어 있어야 합니다.
1.  **Docker Desktop**: [설치 링크](https://www.docker.com/products/docker-desktop/) (서버와 모니터링 도구를 실행합니다.)
2.  **k6**: 부하 테스트 도구
    - macOS: `brew install k6`
    - Windows: `winget install k6`
3.  **Git & Java 17**: 프로젝트 빌드용

---

## 🏃 3. 실행하기 (Step-by-Step)

### Step 1: 최신 코드 빌드
새로운 모니터링 설정이 적용된 서버 파일을 만듭니다.
```bash
./gradlew clean build -x test
```
> **성공 확인**: `BUILD SUCCESSFUL` 메시지가 나와야 합니다.

### Step 2: 서버 및 모니터링 도구 켜기
Docker를 이용해 한 번에 실행합니다.
```bash
docker-compose up -d --build
```
- 실행 후 30초 정도 기다려주세요 (서버가 켜지는 시간).

### Step 3: 테스트용 관리자 계정 만들기 (중요!)
테스트를 하려면 로그인을 해야 하는데, DB가 비어있으면 로그인을 못 합니다. 아래 명령어를 복사해서 터미널에 붙여넣으세요. (관리자 계정을 강제로 만듭니다.)

```bash
docker exec -i seouldream-db mysql -u root -ppassword seouldream_db <<EOF
INSERT INTO member (name, birth_date, gender, phone, role, join_year, created_at, updated_at)
VALUES ('Admin User', '1990-01-01', 'MALE', '010-0000-0000', 'ADMIN', 2024, NOW(), NOW());

SET @member_id = LAST_INSERT_ID();

INSERT INTO users (username, password, member_id, created_at, updated_at)
VALUES ('admin', '\$2a\$10\$8.UnVuG9HHgffUDAlk8qfOpNaNSxFEAd8vQdeIuItqrieRyC6uo.a', @member_id, NOW(), NOW());
EOF
```
> **비밀번호**: 생성된 계정은 ID: `admin`, PW: `password` 입니다.

---

## 📊 4. 모니터링 화면(Grafana) 세팅하기

이제 서버 상태를 볼 수 있는 TV를 켠다고 생각하세요.

1.  **접속**: 브라우저에서 [http://localhost:3001](http://localhost:3001) 접속
2.  **로그인**: `admin` / `admin` (비밀번호 변경창 나오면 Skip 가능)
3.  **데이터 소스 연결** (TV 채널 맞추기):
    - 왼쪽 메뉴 `Connections` (번개 모양 or 기어) -> `Data Sources`
    - `Add data source` 버튼 클릭 -> `Prometheus` 선택
    - **Prometheus server URL**에 `http://prometheus:9090` 입력 (중요!)
    - 맨 아래 `Save & test` 클릭 -> 녹색 체크(Successfully queried) 확인
4.  **대시보드 불러오기** (화면 구성하기):
    - 왼쪽 메뉴 `Dashboards` -> `New` -> `Import`
    - **Import via grafana.com** 칸에 숫자 `4701` 입력 -> `Load` 버튼
    - 하단 **Prometheus** 목록에서 방금 만든 `Prometheus` 선택 -> `Import` 버튼
    - 🎉 **짜잔!** CPU, Memory 그래프가 움직이는 게 보이면 성공입니다.

---

## 💥 5. 부하 테스트 시작! (k6)

이제 서버를 괴롭혀 봅시다.

```bash
# 프로젝트 루트에서 실행
k6 run k6/loadtest.js
```

### 터미널에 나오는 정보 해석
테스트가 진행되는 동안 터미널에 실시간 로그가 뜹니다.
- `✓ login successful`: 로그인 성공!
- `✓ status is 200`: API 호출 성공!
- `http_req_duration`: 요청 처리 시간 (낮을수록 좋음)

### 테스트가 끝난 후 결과표 해석
```text
http_req_duration..............: avg=12.34ms  min=5.67ms  p95=45.12ms  max=120.45ms
http_req_failed................: 0.00% ✓ 0 ✗ 1500
```
- **avg (평균)**: 평균적으로 12ms 걸렸다.
- **p95 (상위 95%)**: 느린 요청 상위 5%를 제외하면, 나머지는 다 45ms 안에 들어온다. **(이 수치가 가장 중요합니다. 튀는 놈들을 잡아내야 하니까요.)**
- **http_req_failed**: 실패율. 0%가 아니면 서버가 에러를 뱉었다는 뜻입니다.

---

## 🧐 6. 무엇을 확인해야 하나요?

테스트를 돌리면서 **Grafana** 화면을 보세요.

1.  **CPU Usage**: 그래프가 100%를 치지 않나요? (치면 서버 성능 부족)
2.  **JVM Memory**: 톱니바퀴 모양으로 올라갔다 내려갔다(GC) 하는 게 정상입니다. 계속 올라가기만 하고 안 내려오면 **메모리 누수(Memory Leak)** 입니다.
3.  **Logback Events (Error)**: 빨간색 에러 로그가 급증하지 않는지 확인하세요.

---

## 🧹 7. 정리하기

테스트가 끝나면 컴퓨터 자원을 위해 꺼주세요.
```bash
docker-compose down
```
(다음에 다시 할 땐 `docker-compose up -d` 만 하면 됩니다.)