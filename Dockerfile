FROM eclipse-temurin:21-jdk-alpine

# 프로젝트 루트 기준이므로 build/libs/ 안의 jar 파일을 지정합니다.
COPY build/libs/hello-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]