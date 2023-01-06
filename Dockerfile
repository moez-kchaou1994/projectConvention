FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat
COPY --from=build /app/target/Project_Convention-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
