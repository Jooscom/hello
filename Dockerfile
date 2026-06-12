FROM gradle:8-jdk21-alpine AS builder

WORKDIR /build

COPY . .

RUN chmod -x gradlew && ./gradlew clean build -x test

FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY --from=builder build/libs/hello-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]