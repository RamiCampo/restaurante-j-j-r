# Etapa de compilación
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn -DskipTests package

# Etapa de ejecución con Tomcat
FROM tomcat:10.1.30-jre17-temurin
COPY --from=build /app/target/restaurante-j-j-r-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
