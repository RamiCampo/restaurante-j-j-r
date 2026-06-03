<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Cliente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
    <header class="hero hero-home">
        <div class="container nav-bar">
            <div>
                <p class="eyebrow">RESTAURANTE J_J_R • Cliente</p>
                <h1>Ordena tus platos favoritos y deja tu opinión.</h1>
            </div>
            <div class="nav-actions">
                <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
                <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Acceso</a>
            </div>
        </div>
    </header>

    <main class="container panel">
        <section class="section-heading">
            <div>
                <p class="eyebrow eyebrow-dark">Menú</p>
                <h2>Platos recomendados</h2>
            </div>
            <p class="muted">Los clientes pueden ver el menú, agregar pedidos y dejar reseñas visibles para todos.</p>
        </section>

        <section class="feature-grid">
            <article class="feature-card feature-rose">
                <h3>🍛 Arroz con Pollo</h3>
                <p>Clásico, sabroso y muy solicitado.</p>
                <strong>$12.50</strong>
                <a class="boton boton-principal" href="#">Agregar al pedido</a>
            </article>
            <article class="feature-card feature-gold">
                <h3>🥩 Lomo Saltado</h3>
                <p>Un plato completo con sabor irresistible.</p>
                <strong>$15.00</strong>
                <a class="boton" href="#">Agregar al pedido</a>
            </article>
            <article class="feature-card feature-emerald">
                <h3>🍤 Ceviche</h3>
                <p>Fresco, ligero y muy popular.</p>
                <strong>$13.50</strong>
                <a class="boton" href="#">Agregar al pedido</a>
            </article>
            <article class="feature-card feature-sky">
                <h3>🍰 Torta de Chocolate</h3>
                <p>Postre perfecto para cerrar tu comida.</p>
                <strong>$6.50</strong>
                <a class="boton" href="#">Agregar al pedido</a>
            </article>
        </section>

        <section class="section-heading">
            <div>
                <p class="eyebrow eyebrow-dark">Reseñas</p>
                <h2>Opiniones de nuestros clientes</h2>
            </div>
        </section>

        <section class="tarjetas">
            <article class="tarjeta tarjeta-rose">
                <h3>⭐️⭐️⭐️⭐️⭐️</h3>
                <p>“La comida estuvo deliciosa y el servicio muy rápido.”</p>
                <small>— Ana, cliente</small>
            </article>
            <article class="tarjeta tarjeta-gold">
                <h3>⭐️⭐️⭐️⭐️</h3>
                <p>“El ceviche está increíble y la presentación muy bonita.”</p>
                <small>— Luis, cliente</small>
            </article>
            <article class="tarjeta tarjeta-emerald">
                <h3>⭐️⭐️⭐️⭐️⭐️</h3>
                <p>“Muy buena experiencia, definitivamente volveré.”</p>
                <small>— Sofia, cliente</small>
            </article>
        </section>
    </main>
</body>
</html>
