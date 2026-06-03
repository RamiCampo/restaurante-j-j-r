-- =========================================================
-- BASE DE DATOS DEL SISTEMA DE RESTAURANTE
-- =========================================================
-- Este script crea la base de datos y las tablas necesarias
-- para operar el sistema de pedidos, cocina y administración.
-- =========================================================

CREATE DATABASE IF NOT EXISTS restaurante_db;
USE restaurante_db;

-- ---------------------------------------------------------
-- Tabla: mesas
-- ---------------------------------------------------------
-- Guarda el número de mesa disponible en el restaurante.
CREATE TABLE IF NOT EXISTS mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE,
    capacidad INT NOT NULL DEFAULT 4,
    estado VARCHAR(20) NOT NULL DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
-- Tabla: productos
-- ---------------------------------------------------------
-- Contiene el menú del restaurante con nombre, precio y categoría.
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
-- Tabla: pedidos
-- ---------------------------------------------------------
-- Guarda cada orden enviada por el mesero.
-- Estado puede ser: Pendiente / Listo.
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
    CONSTRAINT fk_pedidos_mesa
        FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ---------------------------------------------------------
-- Tabla: detalles_pedido
-- ---------------------------------------------------------
-- Registra los productos incluidos en cada pedido.
CREATE TABLE IF NOT EXISTS detalles_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    subtotal DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_detalles_pedido_pedido
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_detalles_pedido_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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