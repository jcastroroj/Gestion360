package service;

import java.util.List;



import models.Usuarios;

public interface UsuariosService {
	List<Usuarios> listarUsuarios();
	 Usuarios obtenerUsuarioPorId(int idUsuario);
	    
	    void agregarUsuario(Usuarios usuario);
	    
	    void actualizarUsuario(Usuarios usuario);
	    
	    void eliminarUsuario(int idUsuario);

}
