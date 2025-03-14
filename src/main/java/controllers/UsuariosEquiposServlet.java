package controllers;

import java.io.IOException;



import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import models.UsuariosEquipos;
import service.UsuariosEquiposService;
import service.impl.UsuariosEquiposServiceImpl;



@WebServlet("/UsuariosEquipos")
public class UsuariosEquiposServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UsuariosEquiposService usuariosEquiposService;  
       
    
    public UsuariosEquiposServlet() {
        super();
        usuariosEquiposService = new UsuariosEquiposServiceImpl();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UsuariosEquipos> usuariosEquipos = usuariosEquiposService.listarUsuariosEquipos();
		request.setAttribute("usuariosEquipos", usuariosEquipos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/UsuariosEquipos.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
