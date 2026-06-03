-- =========================================================
-- BASE DE DATOS SQLITE DEL SISTEMA DE RESTAURANTE
-- =========================================================
-- Este script crea las tablas necesarias para el proyecto.
-- =========================================================

PRAGMA foreign_keys = ON;

-- ---------------------------------------------------------
-- Tabla: mesas
-- ---------------------------------------------------------
-- Guarda el número de mesa disponible en el restaurante.
CREATE TABLE IF NOT EXISTS mesas (
    id_mesa INTEGER PRIMARY KEY AUTOINCREMENT,
    numero_mesa INTEGER NOT NULL UNIQUE,
    capacidad INTEGER NOT NULL DEFAULT 4,
    estado TEXT NOT NULL DEFAULT 'Disponible'
);

-- ---------------------------------------------------------
-- Tabla: productos
-- ---------------------------------------------------------
-- Contiene el menú del restaurante con nombre, precio y categoría.
CREATE TABLE IF NOT EXISTS productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    precio REAL NOT NULL,
    categoria TEXT NOT NULL
);

-- ---------------------------------------------------------
-- Tabla: pedidos
-- ---------------------------------------------------------
-- Guarda cada orden enviada por el mesero.
-- Estado puede ser: Pendiente / Listo.
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_mesa INTEGER NOT NULL,
    fecha TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total REAL NOT NULL DEFAULT 0.0,
    estado TEXT NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
);

-- ---------------------------------------------------------
-- Tabla: detalles_pedido
-- ---------------------------------------------------------
-- Registra los productos incluidos en cada pedido.
CREATE TABLE IF NOT EXISTS detalles_pedido (
    id_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    id_pedido INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL DEFAULT 1,
    subtotal REAL NOT NULL DEFAULT 0.0,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ---------------------------------------------------------
-- Datos iniciales: mesas
-- ---------------------------------------------------------
INSERT INTO mesas (numero_mesa, capacidad, estado) VALUES
(1, 4, 'Disponible'),
(2, 2, 'Disponible'),
(3, 6, 'Disponible'),
(4, 4, 'Disponible');

-- ---------------------------------------------------------
-- Datos iniciales: menú del restaurante
-- ---------------------------------------------------------
INSERT INTO productos (nombre, precio, categoria) VALUES
('Arroz con Pollo', 12.50, 'Platos Fuertes'),
('Lomo Saltado', 15.00, 'Platos Fuertes'),
('Ceviche', 13.50, 'Mariscos'),
('Jugo de Naranja', 4.00, 'Bebidas'),
('Torta de Chocolate', 6.50, 'Postres');

-- ---------------------------------------------------------
-- FIN DEL SCRIPT SQL
-- ---------------------------------------------------------