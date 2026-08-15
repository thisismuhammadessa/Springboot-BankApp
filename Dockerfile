# ----- Stage 1 -----------

FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /src

COPY . .

RUN mvn clean package -DskipTests


# ----- Stage 2 -----------

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /src/target/*.jar /src/target/bankapp.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/src/target/bankapp.jar"]

