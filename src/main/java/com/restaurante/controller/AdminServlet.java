package com.restaurante.controller;

import com.restaurante.util.ConexionDB;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("rol"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("rol"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");

        if (nombre == null || email == null || password == null || rol == null || nombre.isBlank() || email.isBlank() || password.isBlank()) {
            request.setAttribute("mensajeError", "Complete todos los campos del usuario.");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return;
        }

        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement stmt = conexion.prepareStatement("INSERT INTO usuarios (nombre, email, password, rol) VALUES (?, ?, ?, ?)")) {
            stmt.setString(1, nombre);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, rol);
            stmt.executeUpdate();
            request.setAttribute("mensajeExito", "Usuario creado correctamente para el rol " + rol + ".");
        } catch (Exception e) {
            request.setAttribute("mensajeError", "No se pudo crear el usuario: " + e.getMessage());
        }

        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
