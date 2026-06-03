<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Iniciar sesión</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
    <header class="hero hero-home">
        <div class="container nav-bar">
            <div>
                <p class="eyebrow">RESTAURANTE J_J_R • Acceso por rol</p>
                <h1>Ingresa con tu cuenta para acceder al sistema.</h1>
            </div>
            <div class="nav-actions">
                <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
                <a class="chip chip-primary" href="${pageContext.request.contextPath}/admin">Panel admin</a>
            </div>
        </div>
    </header>

    <main class="container panel">
        <% if (request.getAttribute("mensajeError") != null) { %>
            <div class="alert error"><%= request.getAttribute("mensajeError") %></div>
        <% } %>
        <% if (request.getAttribute("mensajeExito") != null) { %>
            <div class="alert success"><%= request.getAttribute("mensajeExito") %></div>
        <% } %>
        <section class="section-heading">
            <div>
                <p class="eyebrow eyebrow-dark">Roles</p>
                <h2>Inicia sesión según tu función</h2>
            </div>
            <p class="muted">Esta versión visual presenta la experiencia completa del restaurante: administración, cocina, meseros, cajeros y entregas.</p>
        </section>

        <section class="feature-grid">
            <article class="feature-card feature-rose">
                <h3>👑 Administrador</h3>
                <p>Credenciales de prueba: admin@restaurante.com / admin123</p>
                <form action="${pageContext.request.contextPath}/login" method="post" class="form-grid">
                    <input type="email" name="email" placeholder="Correo" required>
                    <input type="password" name="password" placeholder="Contraseña" required>
                    <button class="boton boton-principal" type="submit">Iniciar sesión</button>
                </form>
            </article>
            <article class="feature-card feature-gold">
                <h3>🧑‍🍳 Cocina</h3>
                <p>Acceso para cocineros: crea un usuario con rol <strong>cocinero</strong> desde el panel admin.</p>
                <p>Ve pedidos pendientes, prioriza por hora y marca órdenes como listas.</p>
                <a class="boton" href="${pageContext.request.contextPath}/cocinero">Entrar</a>
            </article>
            <article class="feature-card feature-emerald">
                <h3>🧑‍🍽️ Mesero</h3>
                <p>Acceso para meseros: crea un usuario con rol <strong>mesero</strong> desde el panel admin.</p>
                <p>Consulta mesas, confirma pedidos y atiende al cliente con una vista clara.</p>
                <a class="boton" href="${pageContext.request.contextPath}/mesero-panel">Entrar</a>
            </article>
            <article class="feature-card feature-sky">
                <h3>💵 Cajero</h3>
                <p>Acceso para cajeros: crea un usuario con rol <strong>cajero</strong> desde el panel admin.</p>
                <p>Revisa pedidos, registra pagos y marca despachos o revisiones.</p>
                <a class="boton" href="${pageContext.request.contextPath}/cajero">Entrar</a>
            </article>
            <article class="feature-card feature-rose">
                <h3>🚚 Domiciliario</h3>
                <p>Acceso para repartidores: crea un usuario con rol <strong>domiciliario</strong> desde el panel admin.</p>
                <p>Revisa entregas disponibles, acepta y finaliza pedidos en ruta.</p>
                <a class="boton" href="${pageContext.request.contextPath}/domiciliario">Entrar</a>
            </article>
        </section>
    </main>
</body>
</html>
