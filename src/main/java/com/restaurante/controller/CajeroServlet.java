package com.restaurante.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CajeroServlet", urlPatterns = {"/cajero"})
public class CajeroServlet extends HttpServlet {

    private static final List<Map<String, String>> PEDIDOS_INICIALES = List.of(
        Map.of("id", "104", "cliente", "Mesa 1", "detalle", "Lomo Saltado + bebida", "total", "$19.50", "estado", "En revisión"),
        Map.of("id", "105", "cliente", "Mesa 3", "detalle", "Ceviche + postre", "total", "$20.00", "estado", "Pendiente de pago"),
        Map.of("id", "106", "cliente", "Domicilio", "detalle", "Arroz con Pollo", "total", "$12.50", "estado", "Despachado")
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"cajero".equals(session.getAttribute("rol"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Map<String, String> estados = (Map<String, String>) session.getAttribute("estadoPedidosCajero");
        if (estados == null) {
            estados = new LinkedHashMap<>();
            for (Map<String, String> pedido : PEDIDOS_INICIALES) {
                estados.put(pedido.get("id"), pedido.get("estado"));
            }
            session.setAttribute("estadoPedidosCajero", estados);
        }

        request.setAttribute("pedidos", PEDIDOS_INICIALES);
        request.setAttribute("estadoPedidos", estados);
        request.getRequestDispatcher("/cajero.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"cajero".equals(session.getAttribute("rol"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String pedidoId = request.getParameter("pedidoId");
        String accion = request.getParameter("accion");

        Map<String, String> estados = (Map<String, String>) session.getAttribute("estadoPedidosCajero");
        if (estados == null) {
            estados = new LinkedHashMap<>();
        }

        if (pedidoId != null && accion != null) {
            switch (accion) {
                case "pagado":
                    estados.put(pedidoId, "Pagado");
                    break;
                case "revision":
                    estados.put(pedidoId, "En revisión");
                    break;
                case "despachado":
                    estados.put(pedidoId, "Despachado");
                    break;
                default:
                    break;
            }
            session.setAttribute("estadoPedidosCajero", estados);
            request.setAttribute("mensajeExito", "Pedido " + pedidoId + " marcado como " + estados.get(pedidoId) + ".");
        }

        doGet(request, response);
    }
}
