package service.impl;
 
import java.util.List;
 
import org.apache.ibatis.session.SqlSession;
 
import config.MyBatisUtil;
import dao.DetalleUsuariosMapper;
import models.DetalleUsuarios;
import service.DetalleUsuariosService;
 
public class DetalleUsuariosServiceImpl implements DetalleUsuariosService {
 
    @Override
    public List<DetalleUsuarios> listarDetalleUsuarioEquipos(Integer idEquipo) {
        try {
            SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
            DetalleUsuariosMapper detalleUsuariosMapper = session.getMapper(DetalleUsuariosMapper.class);
            return detalleUsuariosMapper.listarDetalleUsuarioEquipos(idEquipo);
        } catch (Exception e) {
            System.out.println("Error en DetalleUsuariosServiceImpl: " + e.getMessage());
            return null;
        }
    }
}