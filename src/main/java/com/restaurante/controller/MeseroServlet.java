package com.restaurante.controller;

import com.restaurante.model.Producto;
import com.restaurante.util.ConexionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet MeseroServlet.
 * Responsable de mostrar el menú y registrar nuevos pedidos.
 * Este servlet actúa como controlador del módulo de mesero del patrón MVC.
 */
@WebServlet(name = "MeseroServlet", urlPatterns = {"/mesero"})
public class MeseroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Se consulta el menú desde la base de datos.
        List<Producto> productos = obtenerMenu();
        request.setAttribute("productos", productos);

        // Se redirige a la vista JSP del mesero.
        request.getRequestDispatcher("/mesero.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String numeroMesa = request.getParameter("numeroMesa");
        String[] ids = request.getParameterValues("productoId");
        String[] cantidades = request.getParameterValues("cantidad");

        if (numeroMesa == null || numeroMesa.trim().isEmpty()) {
            request.setAttribute("mensajeError", "Debe seleccionar un número de mesa.");
            request.getRequestDispatcher("/mesero.jsp").forward(request, response);
            return;
        }

        if (ids == null || cantidades == null) {
            request.setAttribute("mensajeError", "Debe elegir al menos un producto del menú.");
            request.getRequestDispatcher("/mesero.jsp").forward(request, response);
            return;
        }

        Connection conexion = null;
        try {
            conexion = ConexionDB.getConnection();
            conexion.setAutoCommit(false);

            // Se inserta el pedido principal con estado Pendiente.
            PreparedStatement stmtPedido = conexion.prepareStatement(
                    "INSERT INTO pedidos (id_mesa, total, estado) VALUES ((SELECT id_mesa FROM mesas WHERE numero_mesa = ?), 0.00, 'Pendiente')",
                    Statement.RETURN_GENERATED_KEYS);
            stmtPedido.setInt(1, Integer.parseInt(numeroMesa));
            stmtPedido.executeUpdate();

            ResultSet rs = stmtPedido.getGeneratedKeys();
            int idPedido = 0;
            if (rs.next()) {
                idPedido = rs.getInt(1);
            }

            double totalPedido = 0.00;

            // Se recorren los productos seleccionados y se registran en detalles_pedido.
            for (int i = 0; i < ids.length; i++) {
                int idProducto = Integer.parseInt(ids[i]);
                int cantidad = Integer.parseInt(cantidades[i]);

                if (cantidad <= 0) {
                    continue;
                }

                PreparedStatement stmtPrecio = conexion.prepareStatement(
                        "SELECT precio FROM productos WHERE id_producto = ?");
                stmtPrecio.setInt(1, idProducto);
                ResultSet rsPrecio = stmtPrecio.executeQuery();

                if (rsPrecio.next()) {
                    double precioUnitario = rsPrecio.getDouble("precio");
                    double subtotal = precioUnitario * cantidad;
                    totalPedido += subtotal;

                    PreparedStatement stmtDetalle = conexion.prepareStatement(
                            "INSERT INTO detalles_pedido (id_pedido, id_producto, cantidad, subtotal) VALUES (?, ?, ?, ?)");
                    stmtDetalle.setInt(1, idPedido);
                    stmtDetalle.setInt(2, idProducto);
                    stmtDetalle.setInt(3, cantidad);
                    stmtDetalle.setDouble(4, subtotal);
                    stmtDetalle.executeUpdate();
                }
            }

            // Se actualiza el total del pedido con la suma final.
            PreparedStatement stmtActualizar = conexion.prepareStatement(
                    "UPDATE pedidos SET total = ? WHERE id_pedido = ?");
            stmtActualizar.setDouble(1, totalPedido);
            stmtActualizar.setInt(2, idPedido);
            stmtActualizar.executeUpdate();

            conexion.commit();
            request.setAttribute("mensajeExito", "Pedido enviado correctamente a cocina.");
            response.sendRedirect("/mesero?ok=1");

        } catch (Exception e) {
            if (conexion != null) {
                try {
                    conexion.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            request.setAttribute("mensajeError", "No se pudo registrar el pedido: " + e.getMessage());
            request.getRequestDispatcher("/mesero.jsp").forward(request, response);
        } finally {
            if (conexion != null) {
                try {
                    conexion.setAutoCommit(true);
                    conexion.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Método auxiliar para consultar el menú del restaurante.
     * @return lista de productos disponibles.
     */
    private List<Producto> obtenerMenu() {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT id_producto, nombre, precio, categoria FROM productos ORDER BY categoria, nombre";

        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setCategoria(rs.getString("categoria"));
                productos.add(producto);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al consultar el menú: " + e.getMessage(), e);
        }

        return productos;
    }
}
