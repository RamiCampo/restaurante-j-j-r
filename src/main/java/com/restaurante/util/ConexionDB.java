package com.restaurante.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase ConexionDB.
 * Centraliza la conexión JDBC con la base de datos SQLite.
 * Es ideal para un proyecto simple, portátil y fácil de ejecutar.
 */
public class ConexionDB {

    // URL por defecto para SQLite. Se puede sobrescribir con DB_URL si se desea.
    private static final String URL_DEFAULT = "jdbc:sqlite:restaurante.db";

    /**
     * Obtiene una conexión activa con la base de datos.
     * @return objeto Connection listo para ejecutar consultas SQL.
     * @throws SQLException si ocurre algún error al conectarse.
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el driver de SQLite.", e);
        }

        String url = System.getenv().getOrDefault("DB_URL", URL_DEFAULT);
        Connection conexion = DriverManager.getConnection(url);
        inicializarBaseDatos(conexion);
        return conexion;
    }

    private static void inicializarBaseDatos(Connection conexion) throws SQLException {
        try (var stmt = conexion.createStatement()) {
            stmt.execute("CREATE TABLE IF NOT EXISTS mesas (id_mesa INTEGER PRIMARY KEY AUTOINCREMENT, numero_mesa INTEGER NOT NULL UNIQUE, capacidad INTEGER NOT NULL DEFAULT 4, estado TEXT NOT NULL DEFAULT 'Disponible')");
            stmt.execute("CREATE TABLE IF NOT EXISTS productos (id_producto INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, precio REAL NOT NULL, categoria TEXT NOT NULL)");
            stmt.execute("CREATE TABLE IF NOT EXISTS pedidos (id_pedido INTEGER PRIMARY KEY AUTOINCREMENT, id_mesa INTEGER NOT NULL, fecha TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, total REAL NOT NULL DEFAULT 0.0, estado TEXT NOT NULL DEFAULT 'Pendiente', FOREIGN KEY(id_mesa) REFERENCES mesas(id_mesa))");
            stmt.execute("CREATE TABLE IF NOT EXISTS detalles_pedido (id_detalle INTEGER PRIMARY KEY AUTOINCREMENT, id_pedido INTEGER NOT NULL, id_producto INTEGER NOT NULL, cantidad INTEGER NOT NULL DEFAULT 1, subtotal REAL NOT NULL DEFAULT 0.0, FOREIGN KEY(id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE, FOREIGN KEY(id_producto) REFERENCES productos(id_producto))");
            stmt.execute("CREATE TABLE IF NOT EXISTS usuarios (id_usuario INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT NOT NULL, email TEXT NOT NULL UNIQUE, password TEXT NOT NULL, rol TEXT NOT NULL DEFAULT 'cliente')");

            try (var rs = stmt.executeQuery("SELECT COUNT(*) FROM mesas")) {
                if (rs.next() && rs.getInt(1) == 0) {
                    stmt.execute("INSERT INTO mesas (numero_mesa, capacidad, estado) VALUES (1, 4, 'Disponible'), (2, 2, 'Disponible'), (3, 6, 'Disponible'), (4, 4, 'Disponible')");
                }
            }

            try (var rs = stmt.executeQuery("SELECT COUNT(*) FROM productos")) {
                if (rs.next() && rs.getInt(1) == 0) {
                    stmt.execute("INSERT INTO productos (nombre, precio, categoria) VALUES ('Arroz con Pollo', 12.50, 'Platos Fuertes'), ('Lomo Saltado', 15.00, 'Platos Fuertes'), ('Ceviche', 13.50, 'Mariscos'), ('Jugo de Naranja', 4.00, 'Bebidas'), ('Torta de Chocolate', 6.50, 'Postres')");
                }
            }

            try (var rs = stmt.executeQuery("SELECT COUNT(*) FROM usuarios")) {
                if (rs.next() && rs.getInt(1) == 0) {
                    stmt.execute("INSERT INTO usuarios (nombre, email, password, rol) VALUES ('Administrador', 'admin@restaurante.com', 'admin123', 'admin')");
                }
            }
        }
    }
}
