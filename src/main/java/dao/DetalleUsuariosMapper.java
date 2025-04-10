package dao;
 
import java.util.List;
import models.DetalleUsuarios;
 
public interface DetalleUsuariosMapper {
    List<DetalleUsuarios> listarDetalleUsuarioEquipos(Integer idEquipo);
}