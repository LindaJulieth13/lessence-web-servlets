
package com.lessence.web;

import com.lessence.dao.PerfumeDAO;
import com.lessence.modelo.Perfume;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/perfumes")
public class PerfumesServlet extends HttpServlet {

    private final PerfumeDAO dao = new PerfumeDAO();

    // METODO GET: CONSULTAR PERFUMES
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        try {

            List<Perfume> perfumes = dao.listar();

            request.setAttribute("perfumes", perfumes);

            if ("1".equals(request.getParameter("registrado"))) {
                request.setAttribute(
                    "mensaje",
                    "Perfume registrado correctamente."
                );
            }

            request.getRequestDispatcher(
                "/WEB-INF/vistas/perfumes.jsp"
            ).forward(request, response);

        } catch (SQLException e) {

            throw new ServletException(
                "Error al consultar los perfumes.",
                e
            );
        }
    }

    // METODO POST: REGISTRAR PERFUME
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String nombre = request.getParameter("nombre");
            String marca = request.getParameter("marca");
            String categoria = request.getParameter("categoria");

            if (nombre == null || nombre.trim().isEmpty()
                || marca == null || marca.trim().isEmpty()
                || categoria == null || categoria.trim().isEmpty()) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Todos los campos de texto son obligatorios."
                );
                return;
            }

            double precio = Double.parseDouble(
                request.getParameter("precio")
            );

            int stock = Integer.parseInt(
                request.getParameter("stock")
            );

            if (!Double.isFinite(precio) || precio < 0 || stock < 0) {
                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "El precio y el stock deben ser valores validos."
                );
                return;
            }

            Perfume perfume = new Perfume(
                nombre.trim(),
                marca.trim(),
                categoria.trim(),
                precio,
                stock
            );

            if (dao.insertar(perfume)) {

                response.sendRedirect(
                    request.getContextPath() + "/perfumes?registrado=1"
                );

            } else {

                response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "No fue posible registrar el perfume."
                );
            }

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "El precio y el stock deben ser numericos."
            );

        } catch (SQLException e) {

            throw new ServletException(
                "Error al registrar el perfume.",
                e
            );
        }
    }
}
