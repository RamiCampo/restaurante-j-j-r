<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Domiciliario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
<header class="hero hero-home">
  <div class="container nav-bar">
    <div>
      <p class="eyebrow">RESTAURANTE J_J_R • Domiciliario</p>
      <h1>Panel de entregas: acepta, cancela o entrega pedidos.</h1>
    </div>
    <div class="nav-actions">
      <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
      <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Salir</a>
    </div>
  </div>
</header>
<main class="container panel">
  <section class="feature-grid">
    <article class="feature-card feature-rose"><h3>Entregas disponibles</h3><p class="monto">5</p><small>Pedidos esperando repartidor</small></article>
    <article class="feature-card feature-gold"><h3>En ruta</h3><p class="monto">2</p><small>Pedidos en proceso</small></article>
    <article class="feature-card feature-emerald"><h3>Entregados</h3><p class="monto">11</p><small>Total hoy</small></article>
  </section>
  <section class="tarjetas">
    <article class="tarjeta tarjeta-rose"><h3>Pedido #201</h3><p>Dirección: Av. Central 123 · Lomo Saltado · 09:15</p><a class="boton boton-principal" href="#">Aceptar</a></article>
    <article class="tarjeta tarjeta-gold"><h3>Pedido #202</h3><p>Dirección: Calle Norte 45 · Ceviche · 09:20</p><a class="boton" href="#">Aceptar</a></article>
    <article class="tarjeta tarjeta-emerald"><h3>Pedido #203</h3><p>Dirección: Plaza 7 · Arroz con Pollo · 09:25</p><a class="boton" href="#">Aceptar</a></article>
  </section>
</main>
</body>
</html>
