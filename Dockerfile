# 1. Build Stage
FROM gradle:8.5-jdk17 AS builder
WORKDIR /app
COPY build.gradle settings.gradle ./
COPY src ./src
RUN gradle bootJar --no-daemon

# 2. Run Stage
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar

# 환경 변수로 포트 설정 가능하게 하거나 기본값 8080 사용
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
