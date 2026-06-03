<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurante MVC</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <header class="hero">
        <div class="container">
            <h1>Sistema de Gestión del Restaurante</h1>
            <p>Proyecto universitario con arquitectura MVC, Servlets, JSP y MySQL.</p>
            <nav class="menu-principal">
                <a href="mesero">Módulo Mesero</a>
                <a href="cocina">Módulo Cocina</a>
                <a href="administracion">Módulo Administración</a>
            </nav>
        </div>
    </header>

    <main class="container tarjetas">
        <article class="tarjeta">
            <h2>Mesero</h2>
            <p>Registra pedidos, selecciona mesa y platos, y envía la orden a cocina.</p>
            <a class="boton" href="mesero">Ingresar</a>
        </article>
        <article class="tarjeta">
            <h2>Cocina</h2>
            <p>Consulta los pedidos pendientes y marca cada orden como lista.</p>
            <a class="boton" href="cocina">Ingresar</a>
        </article>
        <article class="tarjeta">
            <h2>Administración</h2>
            <p>Visualiza el historial de ventas y el total acumulado de ganancias.</p>
            <a class="boton" href="administracion">Ingresar</a>
        </article>
    </main>
</body>
</html>
