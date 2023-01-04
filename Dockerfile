# 참조 [Gradle을 사용할 때 도커 빌드를 빠르게 하는 방법](https://findstar.pe.kr/2022/05/13/gradle-docker-cache/)

FROM gradle:jdk17 as builder
# Docker 내 빌드 페이지 명세
WORKDIR /build

# 빌더 이미지에 소스 복사 후 애플리케이션 빌드
COPY . /build
RUN gradle -x test bootJar


FROM openjdk:17-jdk-slim
WORKDIR /app
# 빌더 이미지에서 jar 파일만 복사
COPY --from=builder /build/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]