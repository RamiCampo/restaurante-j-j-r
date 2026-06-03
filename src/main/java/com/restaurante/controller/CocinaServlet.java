package com.restaurante.controller;

import com.restaurante.util.ConexionDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet CocinaServlet.
 * Consulta los pedidos con estado Pendiente y permite
 * cambiarlos a Listo cuando la cocina termina de preparar la orden.
 */
@WebServlet(name = "CocinaServlet", urlPatterns = {"/cocina"})
public class CocinaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> pedidosPendientes = obtenerPedidosPendientes();
        request.setAttribute("pedidosPendientes", pedidosPendientes);

        request.getRequestDispatcher("/cocina.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String idPedido = request.getParameter("idPedido");

        if ("marcarListo".equals(accion) && idPedido != null) {
            try (Connection conexion = ConexionDB.getConnection();
                 PreparedStatement stmt = conexion.prepareStatement(
                         "UPDATE pedidos SET estado = 'Listo' WHERE id_pedido = ?")) {

                stmt.setInt(1, Integer.parseInt(idPedido));
                stmt.executeUpdate();
            } catch (SQLException e) {
                throw new ServletException("Error al actualizar el estado del pedido: " + e.getMessage(), e);
            }
        }

        response.sendRedirect("/cocina");
    }

    /**
     * Consulta todos los pedidos pendientes y sus detalles.
     * @return lista de pedidos con información para mostrar en la vista.
     */
    private List<Map<String, Object>> obtenerPedidosPendientes() {
        List<Map<String, Object>> lista = new ArrayList<>();
        String sql = """
                SELECT p.id_pedido, p.id_mesa, p.fecha, p.total, p.estado,
                       dp.cantidad, pr.nombre AS producto
                FROM pedidos p
                JOIN detalles_pedido dp ON p.id_pedido = dp.id_pedido
                JOIN productos pr ON dp.id_producto = pr.id_producto
                WHERE p.estado = 'Pendiente'
                ORDER BY p.fecha ASC
                """;

        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            Map<Integer, Map<String, Object>> agrupados = new LinkedHashMap<>();

            while (rs.next()) {
                int idPedido = rs.getInt("id_pedido");
                Map<String, Object> pedido = agrupados.get(idPedido);
                if (pedido == null) {
                    pedido = new LinkedHashMap<>();
                    pedido.put("idPedido", idPedido);
                    pedido.put("idMesa", rs.getInt("id_mesa"));
                    pedido.put("fecha", rs.getTimestamp("fecha"));
                    pedido.put("total", rs.getDouble("total"));
                    pedido.put("estado", rs.getString("estado"));
                    pedido.put("productos", new ArrayList<String>());
                    agrupados.put(idPedido, pedido);
                }

                @SuppressWarnings("unchecked")
                List<String> productos = (List<String>) pedido.get("productos");
                productos.add(rs.getInt("cantidad") + " x " + rs.getString("producto"));
            }

            lista.addAll(agrupados.values());

        } catch (SQLException e) {
            throw new RuntimeException("Error al consultar pedidos pendientes: " + e.getMessage(), e);
        }

        return lista;
    }
}
