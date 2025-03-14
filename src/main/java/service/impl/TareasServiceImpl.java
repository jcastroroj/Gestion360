package service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.TareasMapper;
import models.Tareas;
import service.TareasService;

public class TareasServiceImpl implements TareasService {

	@Override
	public List<Tareas> listarTareas() {
		try {
			SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
			TareasMapper tareasMapper = session.getMapper(TareasMapper.class);
			return tareasMapper.listarTareas();
		} catch (Exception e) {
			System.out.println(e);
			return null;
	   }
	}

	
	
	
	
	
}
