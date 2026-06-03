package com.restaurante.controller;

import com.restaurante.model.Pedido;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet AdministracionServlet.
 * Muestra el historial de pedidos vendidos y el total acumulado de ganancias.
 */
@WebServlet(name = "AdministracionServlet", urlPatterns = {"/administracion"})
public class AdministracionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Pedido> pedidosVendidos = obtenerHistorial();
        double totalGanancias = obtenerTotalGanancias();

        request.setAttribute("pedidosVendidos", pedidosVendidos);
        request.setAttribute("totalGanancias", totalGanancias);

        request.getRequestDispatcher("/administracion.jsp").forward(request, response);
    }

    /**
     * Consulta el historial de órdenes terminadas (estado Listo).
     * @return lista de pedidos vendidos.
     */
    private List<Pedido> obtenerHistorial() {
        List<Pedido> lista = new ArrayList<>();
        String sql = "SELECT id_pedido, id_mesa, fecha, total, estado FROM pedidos WHERE estado = 'Listo' ORDER BY fecha DESC";

        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setIdPedido(rs.getInt("id_pedido"));
                pedido.setIdMesa(rs.getInt("id_mesa"));
                pedido.setFecha(rs.getTimestamp("fecha").toString());
                pedido.setTotal(rs.getDouble("total"));
                pedido.setEstado(rs.getString("estado"));
                lista.add(pedido);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al consultar historial: " + e.getMessage(), e);
        }

        return lista;
    }

    /**
     * Calcula el total de ganancias acumuladas de los pedidos listos.
     * @return suma económica total.
     */
    private double obtenerTotalGanancias() {
        String sql = "SELECT COALESCE(SUM(total), 0) AS total_ganancias FROM pedidos WHERE estado = 'Listo'";

        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement stmt = conexion.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getDouble("total_ganancias");
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al calcular ganancias: " + e.getMessage(), e);
        }

        return 0.00;
    }
}
