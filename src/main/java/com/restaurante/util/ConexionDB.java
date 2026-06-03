package com.restaurante.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase ConexionDB.
 * Centraliza la conexión JDBC con la base de datos MySQL.
 * Este código es clásico, simple y fácil de explicar en clase.
 */
public class ConexionDB {

    // URL de conexión a MySQL.
    // En Railway se inyecta automáticamente mediante variables de entorno.
    private static final String URL_DEFAULT = "jdbc:mysql://localhost:3306/restaurante_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    // Credenciales del usuario de base de datos.
    // En un entorno real, estas credenciales deben configurarse con seguridad.
    private static final String USER_DEFAULT = "root";
    private static final String PASSWORD_DEFAULT = "";

    /**
     * Obtiene una conexión activa con la base de datos.
     * @return objeto Connection listo para ejecutar consultas SQL.
     * @throws SQLException si ocurre algún error al conectarse.
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Carga el driver JDBC de MySQL.
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el driver de MySQL.", e);
        }

        String url = System.getenv().getOrDefault("DB_URL", URL_DEFAULT);
        String user = System.getenv().getOrDefault("DB_USER", USER_DEFAULT);
        String password = System.getenv().getOrDefault("DB_PASSWORD", PASSWORD_DEFAULT);

        return DriverManager.getConnection(url, user, password);
    }
}
