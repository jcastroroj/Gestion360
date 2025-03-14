package controllers;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Usuarios;
import service.UsuariosService;
import service.impl.UsuariosServiceImpl;


@WebServlet("/Usuarios")
public class UsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
private final UsuariosService usuariosService;  
       
    
    public UsuariosServlet() {
        super();
        usuariosService = new UsuariosServiceImpl();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Usuarios> usuarios = usuariosService.listarUsuarios();
		request.setAttribute("usuarios", usuarios);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Usuarios.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
