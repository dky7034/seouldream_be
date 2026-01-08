# Spring Boot 모니터링 대시보드 명세서 (Lite & Clean)

이 문서는 실무에서 서비스의 건강 상태를 직관적으로 파악하고, 문제 발생 시 빠르게 원인을 진단하기 위한 핵심 지표 중심의 그라파나(Grafana) 대시보드 구성을 정의합니다.

---

## 1. 지표 상세 정의 (Metrics Definition)

### 1-1. 서비스 트래픽 및 건강 상태 (Service Status)
사용자가 느끼는 서비스의 가용성과 품질을 최우선으로 확인합니다.

| 원본 명칭 (English Title) | 한글 명칭 (Korean Title) | 기술 설명 (Description) | 관련 메트릭 (Prometheus) |
| :--- | :--- | :--- | :--- |
| **Requests/second** | **초당 요청 수 (RPS)** | 서버로 유입되는 초당 HTTP 요청의 총량 (Traffic Throughput) | `http_server_requests_seconds_count` |
| **Request duration** | **평균 응답 속도 (Latency)** | HTTP 요청 처리에 소요된 평균 시간 (사용자 체감 성능) | `http_server_requests_seconds_sum / count` |
| **HTTP Codes** | **HTTP 응답 코드 분포** | 2xx, 4xx, 5xx 발생 비율 및 추이 | `http_server_requests_seconds_count` (status label) |
| **ERROR logs** | **에러(Error) 로그 발생 수** | `ERROR` 레벨 로그 발생 건수 (즉시 확인 필요) | `logback_events_total{level="error"}` |
| **WARN logs** | **경고(Warn) 로그 발생 수** | `WARN` 레벨 로그 발생 건수 (잠재적 문제 식별) | `logback_events_total{level="warn"}` |

### 1-2. 성능 병목 구간 분석 (Bottleneck Analysis)
서버 지연 발생 시, 어떤 자원에서 병목이 발생하는지 진단합니다.

| 원본 명칭 (English Title) | 한글 명칭 (Korean Title) | 기술 설명 (Description) | 관련 메트릭 (Prometheus) |
| :--- | :--- | :--- | :--- |
| **Busy Threads** | **활성 작업 스레드 (Busy)** | 현재 요청을 실제로 처리 중인 Tomcat 스레드 개수 | `tomcat_threads_busy_threads` |
| **Connection Acquire Time** | **커넥션 획득 대기 시간** | DB 커넥션을 얻기 위해 스레드가 대기한 시간 (가장 중요) | `hikaricp_connections_acquire_seconds` |
| **Connection Timeout** | **커넥션 타임아웃 횟수** | 커넥션을 기다리다 실패(Timeout)한 횟수 | `hikaricp_connections_timeout_total` |
| **Connections** | **커넥션 상태** | DB 커넥션 풀의 상태 추이 (Active, Pending, Idle) | `hikaricp_connections` |
| **Slow Requests** | **느린 요청 TOP 10** | 처리 시간이 가장 오래 걸리는 상위 10개 API 목록 | `http_server_requests_seconds_max` |

### 1-3. 시스템 리소스 (System Resources)
JVM 및 OS 레벨의 자원 사용량을 모니터링하여 인프라 증설 혹은 최적화 여부를 판단합니다.

| 원본 명칭 (English Title) | 한글 명칭 (Korean Title) | 기술 설명 (Description) | 관련 메트릭 (Prometheus) |
| :--- | :--- | :--- | :--- |
| **Load Average** | **시스템 부하량 (Load)** | CPU 작업 대기열의 평균 길이 | `system_load_average_1m` |
| **CPU Usage** | **CPU 사용률** | 전체 시스템 및 JVM 프로세스의 CPU 점유율 | `process_cpu_usage`, `system_cpu_usage` |
| **Heap Used** | **힙 메모리 사용률** | JVM 메모리(Heap) 사용량 및 최대치 대비 비율 | `jvm_memory_used_bytes{area="heap"}` |
| **GC Duration** | **GC 중단 시간** | GC(Garbage Collection)로 인해 애플리케이션이 멈춘 시간 | `jvm_gc_pause_seconds_sum` |
| **JVM Threads** | **JVM 전체 스레드** | JVM 내의 모든 스레드 총개수 (Daemon 포함) | `jvm_threads_live_threads` |

### 1-4. 기타 상세 정보 (Details)
정기 점검 시 참고하는 정적 정보 및 부가 지표입니다.

| 원본 명칭 (English Title) | 한글 명칭 (Korean Title) | 기술 설명 (Description) | 관련 메트릭 (Prometheus) |
| :--- | :--- | :--- | :--- |
| **Uptime** | **서버 가동 시간** | 애플리케이션 시작 후 경과 시간 | `process_uptime_seconds` |
| **Connection Usage** | **커넥션 점유 시간** | 한 트랜잭션이 DB 커넥션을 점유하고 있는 시간 | `hikaricp_connections_usage_seconds` |
| **Pool Size** | **커넥션 풀 크기** | 현재 설정된 DB 커넥션 풀의 전체 크기 | `hikaricp_connections_max` |

---

## 2. 화면 배치 가이드 (3단 구성)

대시보드 상단에서 하단으로 갈수록 상세한 지표를 배치하여 시선의 흐름을 최적화합니다.

### 📍 [1열] Service Status (최우선 확인)
> "지금 서비스에 문제가 없는가?"
- **Requests/second** (초당 요청 수)
- **Request duration** (평균 응답 속도)
- **HTTP Codes** (응답 코드 분포)
- **ERROR / WARN logs** (로그 발생 수)

### 📍 [2열] Bottleneck Analysis (원인 진단)
> "문제가 있다면 어디서 막히고 있는가?"
- **Busy Threads** (활성 스레드)
- **Connection Acquire Time** (커넥션 대기 시간)
- **Connections** (커넥션 상태)
- **Slow Requests** (느린 요청 TOP 10)

### 📍 [3열] Resources & Info (인프라 상태)
> "서버의 물리적 자원은 충분한가?"
- **CPU Usage** (CPU 사용률)
- **Heap Used** (힙 메모리)
- **GC Duration** (GC 중단 시간)
- **JVM Threads** (JVM 스레드)
- **Uptime** (가동 시간)