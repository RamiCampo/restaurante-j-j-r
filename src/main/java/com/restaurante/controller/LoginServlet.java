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
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isBlank() || password.isBlank()) {
            request.setAttribute("mensajeError", "Debe llenar correo y contraseña.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement stmt = conexion.prepareStatement("SELECT nombre, email, rol FROM usuarios WHERE email=? AND password=?")) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usuario", rs.getString("nombre"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("rol", rs.getString("rol"));

                    if ("admin".equalsIgnoreCase(rs.getString("rol"))) {
                        response.sendRedirect(request.getContextPath() + "/admin");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/cliente");
                    }
                    return;
                }
            }
        } catch (Exception e) {
            throw new ServletException("Error al iniciar sesión: " + e.getMessage(), e);
        }

        request.setAttribute("mensajeError", "Credenciales inválidas. Usa admin@restaurante.com / admin123 para probar.");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
