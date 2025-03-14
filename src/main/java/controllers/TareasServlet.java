package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Tareas;
import service.TareasService;
import service.impl.TareasServiceImpl;


@WebServlet("/Tareas")
public class TareasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final TareasService tareasService;   
   
    public TareasServlet() {
        super();
        tareasService = new TareasServiceImpl();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Tareas> tareas = tareasService.listarTareas();
		request.setAttribute("tareas", tareas);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Tareas.jsp");
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
