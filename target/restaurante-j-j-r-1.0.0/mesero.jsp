<%@ page import="java.util.List" %>
<%@ page import="com.restaurante.model.Producto" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Módulo Mesero</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/estilos.css">
</head>
<body>
    <header class="hero small">
        <div class="container">
            <h1>Módulo de Pedidos</h1>
            <p>El mesero registra la orden y la envía a cocina.</p>
            <nav class="menu-principal">
                <a href="${pageContext.request.contextPath}/">Inicio</a>
                <a href="${pageContext.request.contextPath}/cocina">Cocina</a>
                <a href="${pageContext.request.contextPath}/administracion">Administración</a>
            </nav>
        </div>
    </header>

    <main class="container panel">
        <section class="card">
            <h2>Nuevo Pedido</h2>
            <% if (request.getAttribute("mensajeExito") != null) { %>
                <p class="alert success"><%= request.getAttribute("mensajeExito") %></p>
            <% } %>
            <% if (request.getAttribute("mensajeError") != null) { %>
                <p class="alert error"><%= request.getAttribute("mensajeError") %></p>
            <% } %>

            <form action="${pageContext.request.contextPath}/mesero" method="post" class="form-grid">
                <label>
                    Número de mesa:
                    <select name="numeroMesa" required>
                        <option value="">Seleccione...</option>
                        <option value="1">Mesa 1</option>
                        <option value="2">Mesa 2</option>
                        <option value="3">Mesa 3</option>
                        <option value="4">Mesa 4</option>
                    </select>
                </label>

                <div class="productos-grid">
                    <%
                        List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                        if (productos != null) {
                            for (Producto producto : productos) {
                    %>
                    <article class="producto-card">
                        <input type="hidden" name="productoId" value="<%= producto.getIdProducto() %>">
                        <strong><%= producto.getNombre() %></strong>
                        <span class="precio">S/ <%= String.format("%.2f", producto.getPrecio()) %></span>
                        <span class="categoria"><%= producto.getCategoria() %></span>
                        <label>Cantidad
                            <input type="number" name="cantidad" min="0" value="0" />
                        </label>
                    </article>
                    <%
                            }
                        }
                    %>
                </div>

                <button class="boton boton-principal" type="submit">Enviar Pedido</button>
            </form>
        </section>
    </main>
</body>
</html>
