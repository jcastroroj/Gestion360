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

}
