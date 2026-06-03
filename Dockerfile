# Imagen base con Tomcat y Java 17
FROM tomcat:10.1.30-jre17-temurin

# Copiamos el WAR compilado a la carpeta webapps de Tomcat
COPY target/restaurante-j-j-r-1.0.0.war /usr/local/tomcat/webapps/ROOT.war

# Puerto expuesto por Railway
EXPOSE 8080

# Inicio del servidor Tomcat
CMD ["catalina.sh", "run"]
