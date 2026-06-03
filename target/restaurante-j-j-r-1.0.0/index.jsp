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
                <p class="lead">Un menú visual, una vista rápida para el cliente y acceso por roles para atender el restaurante con estilo.</p>
                <div class="category-pills">
                    <span>🍤 Mariscos</span>
                    <span>🍝 Platos fuertes</span>
                    <span>🥤 Bebidas</span>
                    <span>🍰 Postres</span>
                </div>
            </section>
            <aside class="login-card">
                <h2>Acceso rápido</h2>
                <p>Explora el menú, entra al sistema por rol y gestiona la experiencia del restaurante desde una sola vista.</p>
                <ul>
                    <li>Inicio de sesión por rol</li>
                    <li>Vista de cliente y módulos operativos</li>
                    <li>Diseño moderno y fácil de usar</li>
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
            <p class="muted">Selecciona una categoría y dirígete directamente a sus opciones visuales.</p>
        </section>

        <section class="category-actions">
            <a class="chip chip-primary" href="#platos-fuertes">🍝 Platos fuertes</a>
            <a class="chip chip-primary" href="#mariscos">🍤 Mariscos</a>
            <a class="chip chip-primary" href="#bebidas">🥤 Bebidas</a>
            <a class="chip chip-primary" href="#postres">🍰 Postres</a>
        </section>

        <section class="feature-grid">
            <article id="platos-fuertes" class="feature-card feature-rose">
                <span>🍽️</span>
                <h3>Platos fuertes</h3>
                <p>Arroz con pollo, lomo saltado y opciones de cocina tradicional.</p>
            </article>
            <article id="mariscos" class="feature-card feature-gold">
                <span>🦐</span>
                <h3>Mariscos</h3>
                <p>Ceviches, entradas y sabores frescos para una carta más atractiva.</p>
            </article>
            <article id="bebidas" class="feature-card feature-emerald">
                <span>🥤</span>
                <h3>Bebidas</h3>
                <p>Jugo, refrescos y opciones rápidas para acompañar cualquier pedido.</p>
            </article>
            <article id="postres" class="feature-card feature-sky">
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
                <a class="boton" href="${pageContext.request.contextPath}/mesero-panel">Ingresar</a>
            </article>
            <article class="tarjeta tarjeta-gold">
                <span class="badge">Cocina</span>
                <h2>Preparar órdenes</h2>
                <p>Revisa los pedidos pendientes y marca cada uno como listo al terminar.</p>
                <a class="boton" href="${pageContext.request.contextPath}/cocinero">Ingresar</a>
            </article>
            <article class="tarjeta tarjeta-emerald">
                <span class="badge">Administración</span>
                <h2>Control de ventas</h2>
                <p>Consulta el historial de pedidos y visualiza el total acumulado de ganancias.</p>
                <a class="boton" href="${pageContext.request.contextPath}/admin">Ingresar</a>
            </article>
            <article class="tarjeta tarjeta-sky">
                <span class="badge">Cajero</span>
                <h2>Pagos y despachos</h2>
                <p>Controla pagos, revisiones y estados de entrega para cerrar cada pedido con claridad.</p>
                <a class="boton" href="${pageContext.request.contextPath}/cajero">Ingresar</a>
            </article>
        </section>
    </main>
</body>
</html>
