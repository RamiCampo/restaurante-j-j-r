<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
    <header class="hero hero-home">
        <div class="container nav-bar">
            <div>
                <p class="eyebrow">RESTAURANTE J_J_R • Diseño gastronómico moderno</p>
                <h1>Una experiencia visual de restaurante, lista para vender, atender y administrar.</h1>
            </div>
            <div class="nav-actions">
                <a class="chip" href="${pageContext.request.contextPath}/cliente">Cliente</a>
                <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Iniciar sesión</a>
            </div>
        </div>

        <div class="container hero-grid">
            <section class="hero-copy">
                <p class="lead">Descubre el menú del restaurante, prueba la experiencia de cliente y entra al acceso por roles para administrar cocina, meseros, entregas y ventas.</p>
                <div class="category-pills">
                    <span>🍤 Mariscos</span>
                    <span>🍝 Pastas</span>
                    <span>🥗 Saludables</span>
                    <span>🍰 Postres</span>
                    <span>🥤 Bebidas</span>
                </div>
                <nav class="menu-principal">
                    <a href="${pageContext.request.contextPath}/cliente">Cliente</a>
                    <a href="${pageContext.request.contextPath}/mesero">Mesero</a>
                    <a href="${pageContext.request.contextPath}/cocina">Cocina</a>
                    <a href="${pageContext.request.contextPath}/administracion">Admin</a>
                    <a href="${pageContext.request.contextPath}/login">Acceso</a>
                </nav>
            </section>
            <aside class="login-card">
                <h2>Experiencia cliente</h2>
                <p>La vista principal ahora destaca la experiencia del cliente: menú visual, pedidos y reseñas con un diseño más apetitoso.</p>
                <ul>
                    <li>Menú visual con categorías</li>
                    <li>Panel de administración</li>
                    <li>Gestión de cocina, meseros y domicilios</li>
                </ul>
                <a class="boton boton-principal" href="${pageContext.request.contextPath}/login">Entrar al sistema</a>
            </aside>
        </div>
    </header>

    <main class="container">
        <section class="section-heading">
            <div>
                <p class="eyebrow eyebrow-dark">Categorías</p>
                <h2>Explora el menú por tipo de comida</h2>
            </div>
            <p class="muted">Cada categoría se presenta con un estilo visual diferente para que la experiencia se sienta más real y atractiva.</p>
        </section>

        <section class="feature-grid">
            <article class="feature-card feature-rose">
                <span>🍽️</span>
                <h3>Platos fuertes</h3>
                <p>Arroz con pollo, lomo saltado y opciones de cocina tradicional.</p>
            </article>
            <article class="feature-card feature-gold">
                <span>🦐</span>
                <h3>Mariscos</h3>
                <p>Ceviches, entradas y sabores frescos para una carta más atractiva.</p>
            </article>
            <article class="feature-card feature-emerald">
                <span>🥤</span>
                <h3>Bebidas</h3>
                <p>Jugo, refrescos y opciones rápidas para acompañar cualquier pedido.</p>
            </article>
            <article class="feature-card feature-sky">
                <span>🍰</span>
                <h3>Postres</h3>
                <p>Opciones dulces con presentación moderna para cerrar la experiencia.</p>
            </article>
        </section>

        <section class="section-heading">
            <div>
                <p class="eyebrow eyebrow-dark">Módulos</p>
                <h2>Todo el sistema en una sola vista</h2>
            </div>
        </section>

        <section class="tarjetas">
            <article class="tarjeta tarjeta-rose">
                <span class="badge">Mesero</span>
                <h2>Tomar pedidos</h2>
                <p>Selecciona mesa, agrega productos y envía la orden directamente a cocina.</p>
                <a class="boton" href="${pageContext.request.contextPath}/mesero">Ingresar</a>
            </article>
            <article class="tarjeta tarjeta-gold">
                <span class="badge">Cocina</span>
                <h2>Preparar órdenes</h2>
                <p>Revisa los pedidos pendientes y marca cada uno como listo al terminar.</p>
                <a class="boton" href="${pageContext.request.contextPath}/cocina">Ingresar</a>
            </article>
            <article class="tarjeta tarjeta-emerald">
                <span class="badge">Administración</span>
                <h2>Control de ventas</h2>
                <p>Consulta el historial de pedidos y visualiza el total acumulado de ganancias.</p>
                <a class="boton" href="${pageContext.request.contextPath}/administracion">Ingresar</a>
            </article>
        </section>
    </main>
</body>
</html>
