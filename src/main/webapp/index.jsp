<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodly Restaurant System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body class="home-page">
    <header class="hero hero-home">
        <div class="container nav-bar">
            <div>
                <p class="eyebrow">Foodly • Proyecto universitario</p>
                <h1>Gestiona tu restaurante con una interfaz moderna y clara.</h1>
            </div>
            <div class="nav-actions">
                <a class="chip" href="${pageContext.request.contextPath}/mesero">Ver mesero</a>
                <a class="chip chip-primary" href="${pageContext.request.contextPath}/cocina">Iniciar sesión</a>
            </div>
        </div>

        <div class="container hero-grid">
            <section class="hero-copy">
                <p class="lead">Un sistema web MVC con Java, JSP, Servlets y MySQL, pensado para presentar un proyecto universitario con una experiencia visual profesional.</p>
                <nav class="menu-principal">
                    <a href="${pageContext.request.contextPath}/mesero">Módulo Mesero</a>
                    <a href="${pageContext.request.contextPath}/cocina">Módulo Cocina</a>
                    <a href="${pageContext.request.contextPath}/administracion">Módulo Administración</a>
                </nav>
            </section>
            <aside class="login-card">
                <h2>Acceso rápido</h2>
                <p>Panel principal para mostrar el sistema al jurado o al profesor.</p>
                <ul>
                    <li>Pedidos en tiempo real</li>
                    <li>Control de cocina</li>
                    <li>Ganancias y ventas</li>
                </ul>
                <a class="boton boton-principal" href="${pageContext.request.contextPath}/mesero">Comenzar</a>
            </aside>
        </div>
    </header>

    <main class="container tarjetas">
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
    </main>
</body>
</html>
