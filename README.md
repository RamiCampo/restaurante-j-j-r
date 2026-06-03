# Sistema de Restaurante MVC con Java + JSP + MySQL

Este proyecto está diseñado como ejemplo académico para un sistema web de restaurante con arquitectura MVC.

## Estructura del proyecto

src/main/java/com/restaurante/
  controller/
    MeseroServlet.java
    CocinaServlet.java
    AdministracionServlet.java
  model/
    Producto.java
    Pedido.java
  util/
    ConexionDB.java
src/main/webapp/
  index.jsp
  mesero.jsp
  cocina.jsp
  administracion.jsp
  estilos.css
  WEB-INF/web.xml
sql/
  restaurante_db.sql

## Cómo ejecutar

1. Crear la base de datos MySQL con el script en sql/restaurante_db.sql.
2. Ajustar las credenciales de usuario y contraseña en src/main/java/com/restaurante/util/ConexionDB.java o usar variables de entorno DB_URL / DB_USER / DB_PASSWORD.
3. Desplegar el proyecto en un servidor Tomcat o similar.
4. Ingresar a la URL base y navegar por los módulos de mesero, cocina y administración.

## Despliegue en Railway

Este proyecto ya incluye un Dockerfile para desplegarlo en Railway.

Pasos:
1. Sube el repositorio a GitHub.
2. Crea un servicio en Railway y elige "Deploy from GitHub".
3. Añade una base de datos MySQL en Railway.
4. En Variables, configura:
   - DB_URL = jdbc:mysql://<host>:3306/restaurante_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
   - DB_USER = <usuario_mysql>
   - DB_PASSWORD = <contraseña_mysql>
5. Railway construirá el contenedor con el Dockerfile y expondrá la app en el puerto 8080.

## Objetivo educativo

- Servlets para lógica del negocio.
- JSP para vistas simples y fáciles de mostrar ante un jurado.
- JDBC para conexión directa a MySQL sin ORMs complejos.
