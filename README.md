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

Este proyecto ya incluye un Dockerfile que compila el WAR dentro del contenedor, así que Railway no necesita un WAR previo en el repositorio.

Pasos exactos:
1. Sube este repositorio a GitHub.
2. En Railway crea un nuevo proyecto y selecciona "Deploy from GitHub".
3. Añade un servicio de MySQL desde la pestaña de plugins/add-ons de Railway.
4. Abre la app que acabas de desplegar y ve a Variables.
5. Copia los valores del servicio MySQL (host, puerto, usuario, contraseña y nombre de la base de datos) y configura:
   - DB_URL = jdbc:mysql://<HOST>:3306/<DATABASE>?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
   - DB_USER = <USER>
   - DB_PASSWORD = <PASSWORD>
6. Deja el puerto en 8080 (el Dockerfile ya lo expone).
7. Haz Deploy. Railway generará automáticamente una URL pública para tu app.

Importante:
- Usa el host que te da Railway para la base de datos, no localhost.
- Si usas la base de datos del mismo proyecto en Railway, el host suele aparecer automáticamente en la configuración del add-on.
- La URL pública aparecerá en la pestaña de Deploy/Settings una vez finalizada la construcción.

## Objetivo educativo

- Servlets para lógica del negocio.
- JSP para vistas simples y fáciles de mostrar ante un jurado.
- JDBC para conexión directa a MySQL sin ORMs complejos.
