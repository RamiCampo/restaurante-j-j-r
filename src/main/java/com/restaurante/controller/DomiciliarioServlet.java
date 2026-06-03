package com.restaurante.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "DomiciliarioServlet", urlPatterns = {"/domiciliario"})
public class DomiciliarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"domiciliario".equals(session.getAttribute("rol"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("rol", session.getAttribute("rol"));
        request.getRequestDispatcher("/domiciliario.jsp").forward(request, response);
    }
}
