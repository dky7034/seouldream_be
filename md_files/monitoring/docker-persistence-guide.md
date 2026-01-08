# Docker 배포 시 데이터 및 설정 유지 (Persistence) 가이드

배포(재실행) 시 컨테이너가 삭제되고 재생성되더라도 중요한 데이터(로그, 설정, DB 데이터 등)가 사라지지 않도록 `docker-compose.yml`에서 볼륨(Volume)을 올바르게 설정하는 방법을 정리합니다.

## 1. 문제 상황 (Problem)

### 증상 1: 로그 파일 확인 불가
- **상황:** `application.yml`에서는 상대 경로(`logs/app.log`)로 로그를 남기도록 설정했지만, 배포 후 EC2 호스트의 `logs/` 폴더에 파일이 생성되지 않음.
- **원인:** `docker-compose.yml`의 볼륨 매핑 경로와 실제 애플리케이션이 로그를 쓰는 내부 경로가 일치하지 않음.
  - 앱은 `/app/logs`에 쓰는데, Docker는 `/var/logs/seouldream`을 마운트함.

### 증상 2: 모니터링 대시보드 및 데이터 초기화
- **상황:** 배포(컨테이너 재생성)를 할 때마다 정성껏 설정한 **Grafana 대시보드**가 사라지고, **Prometheus의 과거 수집 데이터**가 모두 초기화됨.
- **원인:** Docker 컨테이너의 기본 특성상, 컨테이너 내부 데이터는 휘발성임. 별도의 영구 저장소(Volume)를 연결하지 않으면 컨테이너 삭제 시 내부 데이터도 함께 삭제됨.

---

## 2. 해결 방법 (Solution)

### 핵심 원칙
**"보존해야 할 데이터는 반드시 호스트(Host) 디렉토리나 도커 볼륨(Docker Volume)과 연결한다."**

### 2.1 로그 파일 영구 저장 (Bind Mount)

호스트의 특정 폴더를 컨테이너 내부 폴더와 직접 연결합니다.

**수정 전 (불일치):**
```yaml
# application.yml -> logs/application.log (즉, /app/logs/...)
volumes:
  - ./logs:/var/logs/seouldream  # ❌ 앱이 여기다 쓰지 않음
```

**수정 후 (일치):**
```yaml
volumes:
  - ./logs:/app/logs  # ✅ 앱이 로그를 쓰는 경로와 정확히 일치시킴
```

---

### 2.2 모니터링 데이터 보존 (Docker Volume)

데이터베이스나 설정 파일처럼 관리가 필요한 데이터는 `Docker Volume`을 사용하여 관리합니다.

#### Grafana (대시보드, 사용자 설정 유지)
Grafana는 `/var/lib/grafana` 경로에 모든 데이터를 저장합니다.

```yaml
services:
  grafana:
    # ...
    volumes:
      - grafana_data:/var/lib/grafana  # ✅ 데이터 영속화

volumes:
  grafana_data: # 최하단에 선언
```

#### Prometheus (수집된 메트릭 데이터 유지)
Prometheus는 `/prometheus` 경로에 시계열 데이터를 저장합니다.

```yaml
services:
  prometheus:
    # ...
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml # (설정 파일은 호스트 파일 연결)
      - prometheus_data:/prometheus                     # ✅ 데이터 영속화

volumes:
  grafana_data:
  prometheus_data: # 최하단에 선언
```

---

## 3. 적용 결과 (Result)

1. **로그:** `git push` 후 배포되어도 EC2의 `~/seouldream_be/logs` 폴더에서 이전 로그와 최신 로그를 모두 확인할 수 있음.
2. **대시보드:** 배포 후에도 Grafana에 로그인하면 이전에 만들어둔 차트와 대시보드가 그대로 유지됨.
3. **이력 데이터:** 지난주, 어제의 트래픽 및 리소스 사용량 데이터를 끊김 없이 조회 가능.
