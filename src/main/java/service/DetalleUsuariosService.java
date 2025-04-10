package service;
 
import java.util.List;
import models.DetalleUsuarios;
 
public interface DetalleUsuariosService {
    List<DetalleUsuarios> listarDetalleUsuarioEquipos(Integer idEquipo);
}