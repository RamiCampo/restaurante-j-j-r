<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Cocina</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
<header class="hero hero-home">
  <div class="container nav-bar">
    <div>
      <p class="eyebrow">RESTAURANTE J_J_R • Cocina</p>
      <h1>Panel de cocina: pedidos en orden de prioridad.</h1>
    </div>
    <div class="nav-actions">
      <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
      <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Salir</a>
    </div>
  </div>
</header>
<main class="container panel">
  <section class="feature-grid">
    <article class="feature-card feature-gold"><h3>Pedidos pendientes</h3><p class="monto">6</p><small>Ordenes listas para cocinar</small></article>
    <article class="feature-card feature-rose"><h3>Tiempo promedio</h3><p class="monto">18 min</p><small>Desde la toma de pedido</small></article>
    <article class="feature-card feature-emerald"><h3>Órdenes listas</h3><p class="monto">12</p><small>Preparadas hoy</small></article>
  </section>
  <section class="tarjetas">
    <article class="tarjeta tarjeta-rose"><h3>Pedido #104</h3><p>Mesa 2 · Lomo Saltado · 2 x Ceviche · 08:45</p><a class="boton boton-principal" href="${pageContext.request.contextPath}/cocinero">Marcar listo</a></article>
    <article class="tarjeta tarjeta-gold"><h3>Pedido #105</h3><p>Mesa 4 · Arroz con Pollo · 1 x Jugo · 08:52</p><a class="boton" href="${pageContext.request.contextPath}/cocinero">Marcar listo</a></article>
    <article class="tarjeta tarjeta-emerald"><h3>Pedido #106</h3><p>Mesa 1 · Torta de Chocolate · 08:58</p><a class="boton" href="${pageContext.request.contextPath}/cocinero">Marcar listo</a></article>
  </section>
</main>
</body>
</html>
