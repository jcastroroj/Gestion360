package service.impl;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.UsuariosMapper;
import models.Usuarios;
import service.UsuariosService;

public class UsuariosServiceImpl implements UsuariosService {

	@Override
	public List<Usuarios> listarUsuarios() {
		try {
			SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
			UsuariosMapper usuariosMapper = session.getMapper(UsuariosMapper.class);
			return usuariosMapper.listarUsuarios();
		} catch (Exception e) {
			System.out.println(e);
			return null;
	   }
	}

	@Override
    public Usuarios obtenerUsuarioPorId(int idUsuario) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            UsuariosMapper usuariosMapper = session.getMapper(UsuariosMapper.class);
            return usuariosMapper.obtenerUsuarioPorId(idUsuario);
        } catch (PersistenceException e) {
            System.err.println("Error al obtener usuario con ID: " + idUsuario + " - " + e.getMessage());
            return null;
        }
    }

    @Override
    public void agregarUsuario(Usuarios usuario) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            UsuariosMapper usuariosMapper = session.getMapper(UsuariosMapper.class);
            usuariosMapper.agregarUsuario(usuario);
            session.commit();
        } catch (PersistenceException e) {
            System.err.println("Error al agregar usuario: " + e.getMessage());
            throw e; // O una excepción personalizada si deseas propagar el error
        }
    }

    @Override
    public void actualizarUsuario(Usuarios usuario) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            UsuariosMapper usuariosMapper = session.getMapper(UsuariosMapper.class);
            usuariosMapper.actualizarUsuario(usuario);
            session.commit();
        } catch (PersistenceException e) {
            System.err.println("Error al actualizar usuario: " + e.getMessage());
            throw e; // O una excepción personalizada si deseas propagar el error
        }
    }

    @Override
    public void eliminarUsuario(int idUsuario) {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
            UsuariosMapper usuariosMapper = session.getMapper(UsuariosMapper.class);
            usuariosMapper.eliminarUsuario(idUsuario);
            session.commit();
        } catch (PersistenceException e) {
            System.err.println("Error al eliminar usuario con ID: " + idUsuario + " - " + e.getMessage());
            throw e; // O una excepción personalizada si deseas propagar el error
        }
    }
}

