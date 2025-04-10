package controllers;
 
import java.io.IOException;

import java.util.List;
 
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
 
import models.DetalleUsuarios;

import service.DetalleUsuariosService;

import service.impl.DetalleUsuariosServiceImpl;
 
@WebServlet("/detalleUsuarios")

public class DetalleUsuariosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final DetalleUsuariosService detalleUsuariosService;
 
    // Constructor

    public DetalleUsuariosServlet() {

        super();

        detalleUsuariosService = new DetalleUsuariosServiceImpl();

    }
 
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            // Obtener el idEquipo desde los parámetros de la solicitud

            int idEquipo = Integer.parseInt(request.getParameter("idEquipo"));

            // Obtener los detalles de los usuarios relacionados con el equipo

            List<DetalleUsuarios> detalleUsuarios = detalleUsuariosService.listarDetalleUsuarioEquipos(idEquipo);

            // Verificar si la lista está vacía y agregar el mensaje de error si es necesario

            if (detalleUsuarios.isEmpty()) {

                request.setAttribute("errorMessage", "No se encontraron detalles de usuarios para este equipo.");

            }

            // Pasar los detalles de los usuarios al JSP

            request.setAttribute("detalleUsuarios", detalleUsuarios);

            // Redirigir al JSP para mostrar los detalles de los usuarios

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/DetalleUsuarios.jsp");

            dispatcher.forward(request, response);

        } catch (Exception e) {

            // Imprimir el mensaje de error en consola si hay excepciones

            System.out.println("Error en DetalleUsuariosServlet: " + e.getMessage());

            request.setAttribute("errorMessage", "Hubo un problema al cargar los detalles de los usuarios.");

            // Redirigir al JSP sin manejar una página de error específica

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/DetalleUsuarios.jsp");

            dispatcher.forward(request, response);

        }

    }
 
    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Llamar al método doGet para manejar la lógica de la solicitud POST

        doGet(request, response);

    }

}