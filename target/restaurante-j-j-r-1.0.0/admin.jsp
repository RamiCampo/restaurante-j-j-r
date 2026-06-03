<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESTAURANTE J_J_R | Panel de administración</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
    <header class="hero hero-home">
        <div class="container nav-bar">
            <div>
                <p class="eyebrow">RESTAURANTE J_J_R • Admin</p>
                <h1>Panel ejecutivo del restaurante.</h1>
            </div>
            <div class="nav-actions">
                <a class="chip" href="${pageContext.request.contextPath}/">Inicio</a>
                <a class="chip chip-primary" href="${pageContext.request.contextPath}/login">Volver</a>
            </div>
        </div>
    </header>

    <main class="container panel">
        <% if (request.getAttribute("mensajeExito") != null) { %>
            <div class="alert success"><%= request.getAttribute("mensajeExito") %></div>
        <% } %>
        <% if (request.getAttribute("mensajeError") != null) { %>
            <div class="alert error"><%= request.getAttribute("mensajeError") %></div>
        <% } %>

        <section class="feature-grid">
            <article class="feature-card feature-rose"><h3>Ventas hoy</h3><p class="monto">$ 1,240</p><small>+18% vs. ayer</small></article>
            <article class="feature-card feature-gold"><h3>Pedidos listos</h3><p class="monto">24</p><small>En preparación: 7</small></article>
            <article class="feature-card feature-emerald"><h3>Inventario</h3><p class="monto">82%</p><small>Materias primas disponibles</small></article>
            <article class="feature-card feature-sky"><h3>Personal activo</h3><p class="monto">14</p><small>Meseros, cocineros y domiciliarios</small></article>
        </section>

        <section class="feature-grid" style="margin-top: 18px;">
            <article class="panel-card feature-card">
                <h3>Crear usuario</h3>
                <form action="${pageContext.request.contextPath}/admin" method="post" class="form-grid">
                    <input type="text" name="nombre" placeholder="Nombre completo" required>
                    <input type="email" name="email" placeholder="Correo" required>
                    <input type="password" name="password" placeholder="Contraseña" required>
                    <select name="rol" required>
                        <option value="">Selecciona rol</option>
                        <option value="mesero">Mesero</option>
                        <option value="cocinero">Cocinero</option>
                        <option value="domiciliario">Domiciliario</option>
                        <option value="cliente">Cliente</option>
                    </select>
                    <button class="boton boton-principal" type="submit">Guardar usuario</button>
                </form>
            </article>
            <article class="panel-card feature-card">
                <h3>Ventas por día</h3>
                <div class="chart"><span style="height: 35%"></span><span style="height: 55%"></span><span style="height: 70%"></span><span style="height: 48%"></span><span style="height: 82%"></span></div>
            </article>
            <article class="panel-card feature-card">
                <h3>Gestión rápida</h3>
                <ul class="mini-list">
                    <li>Modificar menú</li>
                    <li>Control de inventario</li>
                    <li>Personal y domicilios</li>
                    <li>Reportes y ventas</li>
                </ul>
            </article>
        </section>
    </main>
</body>
</html>
