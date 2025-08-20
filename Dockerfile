FROM openjdk:17
EXPOSE 8080
ADD target/spring-boot-docker-0.0.1-SNAPSHOT.jar spring-boot-docker.jar
ENTRYPOINT ["java", "-jar", "spring-boot-docker.jar"]