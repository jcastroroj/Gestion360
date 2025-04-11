package controllers;
	
	import java.io.IOException;
	import java.sql.Date;
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
	        String action = request.getParameter("action");
	
	        if (action == null) {
	            // Lista de usuarios
	            List<Usuarios> usuarios = usuariosService.listarUsuarios();
	            request.setAttribute("usuarios", usuarios);
	            request.getRequestDispatcher("/views/Usuarios.jsp").forward(request, response);
	        } else if (action.equals("editar")) {
	            Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
	            Usuarios usuario = usuariosService.obtenerUsuarioPorId(idUsuario);
	            request.setAttribute("usuario", usuario);
	            request.getRequestDispatcher("/views/ActualizarUsuario.jsp").forward(request, response);
	        } else if (action.equals("eliminar")) {
	            Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
	            usuariosService.eliminarUsuario(idUsuario);
	            request.getSession().setAttribute("mensajeEliminado", "Usuario eliminado con éxito");
	            response.sendRedirect("Usuarios");
	        } else if (action.equals("agregar")) {
	            // Redirigir a la vista de agregar usuario
	            request.getRequestDispatcher("/views/AgregarUsuario.jsp").forward(request, response);
	        }
	    }
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");
	
	        if (action != null && action.equals("actualizar")) {
	            Integer idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
	            Integer idRol = Integer.parseInt(request.getParameter("idRol"));
	            String tipoDocumento = request.getParameter("tipoDocumento");
	            String numeroDocumento = request.getParameter("numeroDocumento");
	            String username = request.getParameter("username");
	            String password = request.getParameter("password");
	            String nombre = request.getParameter("nombre");
	            String apellidoPaterno = request.getParameter("apellidoPaterno");
	            String apellidoMaterno = request.getParameter("apellidoMaterno");
	            String correo = request.getParameter("correo");
	            String telefono = request.getParameter("telefono");
	            String sexo = request.getParameter("sexo");
	            java.sql.Date fechaNacimiento = java.sql.Date.valueOf(request.getParameter("fechaNacimiento"));
	
	            Usuarios usuario = new Usuarios();
	            usuario.setIdUsuario(idUsuario);
	            usuario.setIdRol(idRol);
	            usuario.setTipoDocumento(tipoDocumento);
	            usuario.setNumeroDocumento(numeroDocumento);
	            usuario.setUsername(username);
	            usuario.setPassword(password);
	            usuario.setNombre(nombre);
	            usuario.setApellidoPaterno(apellidoPaterno);
	            usuario.setApellidoMaterno(apellidoMaterno);
	            usuario.setCorreo(correo);
	            usuario.setTelefono(telefono);
	            usuario.setSexo(sexo);
	            usuario.setFechaNacimiento(fechaNacimiento);
	
	            usuariosService.actualizarUsuario(usuario);
	            request.getSession().setAttribute("mensajeExito", "Usuario actualizado con éxito");
	            response.sendRedirect("Usuarios");
	
	        } else if (action != null && action.equals("agregar")) {
	            // Agregar nuevo usuario
	            try {
	                Integer idRol = Integer.parseInt(request.getParameter("idRol"));
	                String tipoDocumento = request.getParameter("tipoDocumento");
	                String numeroDocumento = request.getParameter("numeroDocumento");
	                String username = request.getParameter("username");
	                String password = request.getParameter("password");
	                String nombre = request.getParameter("nombre");
	                String apellidoPaterno = request.getParameter("apellidoPaterno");
	                String apellidoMaterno = request.getParameter("apellidoMaterno");
	                String correo = request.getParameter("correo");
	                String telefono = request.getParameter("telefono");
	                String sexo = request.getParameter("sexo");
	
	                // Validación de fecha de nacimiento
	                java.sql.Date fechaNacimiento = null;
	                String fechaNacimientoStr = request.getParameter("fechaNacimiento");
	                if (fechaNacimientoStr != null && !fechaNacimientoStr.isEmpty()) {
	                    fechaNacimiento = java.sql.Date.valueOf(fechaNacimientoStr);
	                }
	
	                // Crear un nuevo usuario
	                Usuarios nuevoUsuario = new Usuarios();
	                nuevoUsuario.setIdRol(idRol);
	                nuevoUsuario.setTipoDocumento(tipoDocumento);
	                nuevoUsuario.setNumeroDocumento(numeroDocumento);
	                nuevoUsuario.setUsername(username);
	                nuevoUsuario.setPassword(password);
	                nuevoUsuario.setNombre(nombre);
	                nuevoUsuario.setApellidoPaterno(apellidoPaterno);
	                nuevoUsuario.setApellidoMaterno(apellidoMaterno);
	                nuevoUsuario.setCorreo(correo);
	                nuevoUsuario.setTelefono(telefono);
	                nuevoUsuario.setSexo(sexo);
	                nuevoUsuario.setFechaNacimiento(fechaNacimiento);
	
	                // Llamar al servicio para agregar el usuario
	                usuariosService.agregarUsuario(nuevoUsuario);
	                request.getSession().setAttribute("mensajeExito", "Usuario agregado con éxito");
	                response.sendRedirect("Usuarios");
	
	            } catch (Exception e) {
	                e.printStackTrace();
	                request.getSession().setAttribute("mensajeError", "Error al agregar usuario.");
	                response.sendRedirect("Usuarios");
	            }
	        } else {
	            doGet(request, response);
	        }
	    }
	}