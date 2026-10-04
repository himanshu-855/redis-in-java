FROM eclipse-temurin:23-jdk-alpine AS build
WORKDIR /app

RUN apk add --no-cache maven

COPY pom.xml .
COPY src src

RUN mvn -B package -DskipTests

FROM eclipse-temurin:23-jre-alpine
WORKDIR /app
COPY --from=build /app/target/redis-in-java.jar .

ENTRYPOINT ["java", "-jar", "redis-in-java.jar"]
