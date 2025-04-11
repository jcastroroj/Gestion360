package dao;

import java.util.List;


import models.Usuarios;

public interface UsuariosMapper {
	List<Usuarios> listarUsuarios();
	// Obtener un usuario por su ID
    Usuarios obtenerUsuarioPorId(int idUsuario);

    // Agregar un nuevo usuario
    void agregarUsuario(Usuarios usuario);

    // Actualizar un usuario
    void actualizarUsuario(Usuarios usuario);

    // Eliminar un usuario
    void eliminarUsuario(int idUsuario);

}
