<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Módulo Cocina</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body>
    <header class="hero small">
        <div class="container">
            <h1>Módulo de Cocina</h1>
            <p>Revisa los pedidos pendientes y marca cada orden como lista.</p>
            <nav class="menu-principal">
                <a href="${pageContext.request.contextPath}/">Inicio</a>
                <a href="${pageContext.request.contextPath}/mesero">Mesero</a>
                <a href="${pageContext.request.contextPath}/administracion">Administración</a>
            </nav>
        </div>
    </header>

    <main class="container panel">
        <section class="card">
            <h2>Pedidos Pendientes</h2>
            <div class="lista-pedidos">
                <%
                    List<Map<String, Object>> pedidosPendientes = (List<Map<String, Object>>) request.getAttribute("pedidosPendientes");
                    if (pedidosPendientes != null && !pedidosPendientes.isEmpty()) {
                        for (Map<String, Object> pedido : pedidosPendientes) {
                %>
                <article class="pedido-card">
                    <div>
                        <h3>Pedido #<%= pedido.get("idPedido") %></h3>
                        <p><strong>Mesa:</strong> <%= pedido.get("idMesa") %></p>
                        <p><strong>Fecha:</strong> <%= pedido.get("fecha") %></p>
                        <p><strong>Total:</strong> S/ <%= String.format("%.2f", pedido.get("total")) %></p>
                    </div>
                    <ul>
                        <% for (String detalle : (List<String>) pedido.get("productos")) { %>
                            <li><%= detalle %></li>
                        <% } %>
                    </ul>
                    <form action="${pageContext.request.contextPath}/cocina" method="post">
                        <input type="hidden" name="accion" value="marcarListo">
                        <input type="hidden" name="idPedido" value="<%= pedido.get("idPedido") %>">
                        <button class="boton boton-principal" type="submit">Marcar como Listo</button>
                    </form>
                </article>
                <%
                        }
                    } else {
                %>
                <p class="alert success">No hay pedidos pendientes en este momento.</p>
                <% } %>
            </div>
        </section>
    </main>
</body>
</html>
