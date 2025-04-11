package controllers;

import java.io.IOException;


import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Equipos;
import models.Usuarios;
import service.EquiposService;
import service.impl.EquiposServiceImpl;



@WebServlet("/Equipos")
public class EquiposServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final EquiposService equiposService;
       
 
    public EquiposServlet() {
        super();
        equiposService = new EquiposServiceImpl();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action == null) {
			// Lista por defecto
			List<Equipos> equipos = equiposService.listarEquipos();
			request.setAttribute("equipos", equipos);
			request.getRequestDispatcher("/views/Equipos.jsp").forward(request, response);
		} else if (action.equals("editar")) {
			Integer idEquipo = Integer.parseInt(request.getParameter("idEquipo"));
			Equipos equipo = equiposService.buscarPorId(idEquipo);
			request.setAttribute("equipo", equipo);
			request.getRequestDispatcher("/views/ActualizarEquipo.jsp").forward(request, response);
		} else if (action.equals("eliminar")) {
			Integer idEquipo = Integer.parseInt(request.getParameter("idEquipo"));
			equiposService.eliminarLogico(idEquipo);
			request.getSession().setAttribute("mensajeEliminado", "Equipo eliminado con éxito");
			response.sendRedirect("Equipos");
		} else if (action.equals("agregar")) {
            // Redirigir a la vista de agregar equipo
            request.getRequestDispatcher("/views/AgregarEquipo.jsp").forward(request, response);
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action != null && action.equals("actualizar")) {
			Integer idEquipo = Integer.parseInt(request.getParameter("idEquipo"));
			String nombre = request.getParameter("nombre");
			String descripcion = request.getParameter("descripcion");

			Equipos equipo = new Equipos();
			equipo.setIdEquipo(idEquipo);
			equipo.setNombre(nombre);
			equipo.setDescripcion(descripcion);

			equiposService.actualizarEquipo(equipo);
			request.getSession().setAttribute("mensajeExito", "Equipo actualizado con éxito");
			response.sendRedirect("Equipos");
			
		   } else if (action != null && action.equals("agregar")) {
	            // Agregar nuevo equipo
	            String nombre = request.getParameter("nombre");
	            String descripcion = request.getParameter("descripcion");

	            Equipos nuevoEquipo = new Equipos();
	            nuevoEquipo.setNombre(nombre);
	            nuevoEquipo.setDescripcion(descripcion);

	            // Llamar al servicio para agregar el equipo
	            equiposService.agregarEquipo(nuevoEquipo);
	            request.getSession().setAttribute("mensajeExito", "Equipo agregado con éxito");
	            response.sendRedirect("Equipos");
			
		} else {
			doGet(request, response);
		}
	}

}
