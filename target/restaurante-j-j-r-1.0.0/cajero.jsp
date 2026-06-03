<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Cajero</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
<header class="hero hero-home">
  <div class="container nav-bar">
    <div>
      <p class="eyebrow">RESTAURANTE J_J_R • Cajero</p>
      <h1>Panel del cajero: pedidos, pagos y despachos.</h1>
    </div>
    <div class="nav-actions">
      <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
      <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Salir</a>
    </div>
  </div>
</header>
<main class="container panel">
  <% if (request.getAttribute("mensajeExito") != null) { %>
      <div class="alert success"><%= request.getAttribute("mensajeExito") %></div>
  <% } %>

  <section class="feature-grid">
    <article class="feature-card feature-rose"><h3>Pedidos hoy</h3><p class="monto">3</p><small>En caja y entregas activas</small></article>
    <article class="feature-card feature-gold"><h3>Pagos pendientes</h3><p class="monto">1</p><small>Revisión de cierre de caja</small></article>
    <article class="feature-card feature-emerald"><h3>Despachos listos</h3><p class="monto">1</p><small>Listos para entregar</small></article>
  </section>

  <section class="tarjetas">
    <% java.util.List pedidos = (java.util.List) request.getAttribute("pedidos");
       java.util.Map estados = (java.util.Map) request.getAttribute("estadoPedidos");
       if (pedidos != null) {
         for (Object item : pedidos) {
           java.util.Map pedido = (java.util.Map) item;
           String id = (String) pedido.get("id");
           String cliente = (String) pedido.get("cliente");
           String detalle = (String) pedido.get("detalle");
           String total = (String) pedido.get("total");
           String estado = estados != null && estados.get(id) != null ? (String) estados.get(id) : "En revisión";
    %>
      <article class="tarjeta tarjeta-rose">
        <h3>Pedido #<%= id %></h3>
        <p><strong><%= cliente %></strong> · <%= detalle %></p>
        <p>Total: <%= total %></p>
        <p class="muted">Estado actual: <strong><%= estado %></strong></p>
        <div class="form-grid" style="margin-top: 10px;">
          <form action="${pageContext.request.contextPath}/cajero" method="post" class="form-grid">
            <input type="hidden" name="pedidoId" value="<%= id %>">
            <input type="hidden" name="accion" value="pagado">
            <button class="boton boton-principal" type="submit">Marcar como pagado</button>
          </form>
          <form action="${pageContext.request.contextPath}/cajero" method="post" class="form-grid">
            <input type="hidden" name="pedidoId" value="<%= id %>">
            <input type="hidden" name="accion" value="despachado">
            <button class="boton" type="submit">Marcar como despachado</button>
          </form>
          <form action="${pageContext.request.contextPath}/cajero" method="post" class="form-grid">
            <input type="hidden" name="pedidoId" value="<%= id %>">
            <input type="hidden" name="accion" value="revision">
            <button class="boton" type="submit">Enviar a revisión</button>
          </form>
        </div>
      </article>
    <% }
       } %>
  </section>
</main>
</body>
</html>
