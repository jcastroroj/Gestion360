package service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.EquiposMapper;
import models.Equipos;
import service.EquiposService;


public class EquiposServiceImpl implements EquiposService {

	@Override
	public List<Equipos> listarEquipos() {
		try {
			SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
			EquiposMapper equiposMapper = session.getMapper(EquiposMapper.class);
			return equiposMapper.listarEquipos();
		} catch (Exception e) {
			System.out.println(e);
			return null;
	   }
	}
	
	@Override
	public Equipos buscarPorId(Integer idEquipo) {
		try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
			return session.getMapper(EquiposMapper.class).buscarPorId(idEquipo);
		}
	}

	@Override
	public void actualizarEquipo(Equipos equipo) {
		try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
			session.getMapper(EquiposMapper.class).actualizarEquipo(equipo);
			session.commit();
		}
	}

	@Override
	public void eliminarLogico(Integer idEquipo) {
		try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
			session.getMapper(EquiposMapper.class).eliminarLogico(idEquipo);
			session.commit();
		}
	}

	@Override
	public void agregarEquipo(Equipos equipo) {
		try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession()) {
			session.getMapper(EquiposMapper.class).agregarEquipo(equipo);
			session.commit();
		}
		
	}
	
	

}
