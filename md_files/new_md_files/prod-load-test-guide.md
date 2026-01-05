# 🚀 배포(운영) 서버 모니터링 구축 및 부하 테스트 가이드

이 가이드는 로컬이 아닌 **실제 배포된 운영 서버(AWS EC2 등)**에 모니터링 시스템을 구축하고, 외부에서 부하 테스트를 수행하는 방법을 설명합니다.

---

## 🎯 1. 목표
1.  **서버 모니터링**: 운영 서버 안에 `Prometheus`와 `Grafana`를 설치하여 서버 상태(CPU, RAM, 에러 로그)를 실시간으로 감시합니다.
2.  **부하 테스트**: 내 PC에서 `k6`를 실행하여 인터넷을 통해 운영 서버에 트래픽을 보냅니다.

---

## 🛠 2. 배포 서버 설정 (한 번만 수행)

운영 서버에 접속(SSH)하여 모니터링 컨테이너를 띄워야 합니다.

### Step 1: docker-compose.yml 수정
운영 서버의 `docker-compose.yml` 파일에 아래 내용을 추가합니다. (이미 `app`과 `db`는 있을 것입니다.)

```yaml
version: '3'
services:
  # ... (기존 app, db, nginx 설정 유지) ...

  prometheus:
    image: prom/prometheus
    container_name: seouldream-prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"
    networks:
      - seouldream-net
    depends_on:
      - app

  grafana:
    image: grafana/grafana
    container_name: seouldream-grafana
    ports:
      - "3001:3000" # 외부 접속 포트 (3001)
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin # 초기 비밀번호 (접속 후 변경 필수!)
    networks:
      - seouldream-net
    depends_on:
      - prometheus
```

### Step 2: prometheus.yml 생성
운영 서버 프로젝트 루트(docker-compose.yml 옆)에 `prometheus.yml` 파일을 만듭니다.

```yaml
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: 'seouldream-be'
    metrics_path: '/actuator/prometheus'
    static_configs:
      - targets: ['app:8080'] # 내부망 통신이므로 컨테이너명(app) 사용
```

### Step 3: 방화벽(Security Group) 열기 (AWS 기준)
AWS 콘솔에서 EC2 인스턴스의 보안 그룹(Security Group)을 수정하여 포트를 열어줍니다.
- **포트 3001 (Grafana)**: 내 PC의 IP에서만 접근 가능하도록 설정(`My IP`)하는 것을 강력 추천합니다. (전체 개방 시 해킹 위험)

### Step 4: 적용 및 재실행
```bash
# 운영 서버 터미널에서 실행
docker-compose up -d --build
```

---

## 📊 3. 모니터링 대시보드 접속

이제 내 PC 브라우저에서 운영 서버의 그라파나에 접속합니다.

1.  **접속**: `http://<운영서버_IP_또는_도메인>:3001`
2.  **로그인**: `admin` / `admin` (즉시 비밀번호 변경 권장)
3.  **데이터 소스 연결**:
    - `Connections` -> `Data Sources` -> `Add data source` -> `Prometheus`
    - URL: `http://prometheus:9090` (서버 내부 통신이므로 localhost 아님!)
    - `Save & test` 클릭
4.  **JVM 대시보드 로드**:
    - `Dashboards` -> `New` -> `Import` -> ID: `4701` -> `Load`
    - Prometheus 선택 후 `Import`

---

## 💥 4. 부하 테스트 실행 (내 PC에서)

이제 내 컴퓨터 터미널에서 운영 서버로 트래픽을 쏠 차례입니다.

### Step 1: 테스트 스크립트 확인 (`k6/prod_loadtest.js`)
프로젝트의 `k6` 폴더에 `prod_loadtest.js` 파일이 있는지 확인하세요.
- **URL**: `https://api.seouldream.store` (실제 도메인)
- **계정**: `test` / `password` (실제 운영 DB에 존재하는 계정이어야 함)

### Step 2: 실행
**주의**: 운영 중인 서비스라면 실제 사용자가 느려질 수 있으니, 사용자가 적은 시간대에 하거나 부하량(VUs)을 조절하세요.

```bash
# 기본 실행 (터미널 출력)
k6 run k6/prod_loadtest.js

# 웹 대시보드로 보고 싶다면 (추천)
k6 run --out web-dashboard k6/prod_loadtest.js
```

---

## 🧐 5. 결과 분석 포인트

두 개의 화면을 동시에 보며 관찰합니다.

1.  **왼쪽 모니터 (Grafana)**: "서버가 죽지 않는가?"
    - **CPU**: 80% 이상 지속되면 위험합니다. (EC2 인스턴스 사양 업그레이드 고려)
    - **Memory**: 그래프가 계속 우상향하면 메모리 누수 의심.
    
2.  **오른쪽 모니터 (k6)**: "사용자가 답답해하지 않는가?"
    - **p95 (응답 속도)**: 1초(1000ms)를 넘어가면 사용자는 "느리다"고 느낍니다.
    - **Errors**: 1건이라도 발생하면 원인을 찾아야 합니다. (DB 커넥션 부족, 타임아웃 등)

---

## ⚠️ 6. 테스트 종료 후
테스트가 끝나면 보안을 위해 **AWS 보안 그룹에서 3001번 포트를 다시 닫아주는 것**이 안전합니다.
