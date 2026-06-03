<%@ page import="java.util.List" %>
<%@ page import="com.restaurante.model.Pedido" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Módulo Administración</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body>
    <header class="hero small">
        <div class="container">
            <h1>Módulo de Administración</h1>
            <p>Vista simple para el historial de ventas y ganancias acumuladas.</p>
            <nav class="menu-principal">
                <a href="${pageContext.request.contextPath}/">Inicio</a>
                <a href="${pageContext.request.contextPath}/mesero">Mesero</a>
                <a href="${pageContext.request.contextPath}/cocina">Cocina</a>
            </nav>
        </div>
    </header>

    <main class="container panel">
        <section class="card resumen-ganancias">
            <h2>Ganancias Totales</h2>
            <p class="monto">S/ <%= String.format("%.2f", request.getAttribute("totalGanancias")) %></p>
        </section>

        <section class="card">
            <h2>Historial de Pedidos</h2>
            <table class="tabla">
                <thead>
                    <tr>
                        <th>ID Pedido</th>
                        <th>Mesa</th>
                        <th>Fecha</th>
                        <th>Total</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Pedido> pedidosVendidos = (List<Pedido>) request.getAttribute("pedidosVendidos");
                        if (pedidosVendidos != null) {
                            for (Pedido pedido : pedidosVendidos) {
                    %>
                    <tr>
                        <td><%= pedido.getIdPedido() %></td>
                        <td><%= pedido.getIdMesa() %></td>
                        <td><%= pedido.getFecha() %></td>
                        <td>S/ <%= String.format("%.2f", pedido.getTotal()) %></td>
                        <td><%= pedido.getEstado() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>
