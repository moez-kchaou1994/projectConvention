FROM maven:3.6.1-jdk-8 AS maven-build
COPY . .
RUN mvn package

FROM tomcat:8.5.43-jdk8
COPY --from=maven-build /target/Project_Convention-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
