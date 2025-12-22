# 빌드 과정(Gradle)을 싹 뺐습니다. 오직 실행만 합니다.
FROM openjdk:17-jdk-slim

WORKDIR /app

# GitHub Actions가 만들어서 보내준 jar 파일을 복사합니다.
# (deploy.yml에서 파일 이름을 app.jar로 바꿔서 보낸다고 가정)
COPY app.jar app.jar

# 실행
ENTRYPOINT ["java", "-jar", "app.jar"]