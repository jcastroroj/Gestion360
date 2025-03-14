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
		List<Equipos> equipos = equiposService.listarEquipos();
		request.setAttribute("equipos", equipos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Equipos.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
