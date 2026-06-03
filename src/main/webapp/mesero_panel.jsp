<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Mesero</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
<header class="hero hero-home">
  <div class="container nav-bar">
    <div>
      <p class="eyebrow">RESTAURANTE J_J_R • Mesero</p>
      <h1>Panel del mesero: mesas asignadas y pedidos pendientes.</h1>
    </div>
    <div class="nav-actions">
      <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
      <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Salir</a>
    </div>
  </div>
</header>
<main class="container panel">
  <section class="feature-grid">
    <article class="feature-card feature-rose"><h3>Mesas asignadas</h3><p class="monto">4</p><small>Mesas abiertas hoy</small></article>
    <article class="feature-card feature-gold"><h3>Pedidos por atender</h3><p class="monto">3</p><small>En espera de entrega</small></article>
    <article class="feature-card feature-emerald"><h3>Clientes satisfechos</h3><p class="monto">18</p><small>Calificación alta</small></article>
  </section>
  <section class="tarjetas">
    <article class="tarjeta tarjeta-rose"><h3>Mesa 1</h3><p>Pedido #104 · Ceviche · 1 bebida · 08:45</p><a class="boton boton-principal" href="#">Confirmar entrega</a></article>
    <article class="tarjeta tarjeta-gold"><h3>Mesa 3</h3><p>Pedido #105 · Lomo Saltado · 08:52</p><a class="boton" href="#">Confirmar entrega</a></article>
    <article class="tarjeta tarjeta-emerald"><h3>Mesa 4</h3><p>Pedido #106 · Arroz con Pollo · 08:58</p><a class="boton" href="#">Confirmar entrega</a></article>
  </section>
</main>
</body>
</html>
