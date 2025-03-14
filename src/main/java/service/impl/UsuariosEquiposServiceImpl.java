package service.impl;

import java.util.List;



import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.UsuariosEquiposMapper;
import models.UsuariosEquipos;
import service.UsuariosEquiposService;

public class UsuariosEquiposServiceImpl implements UsuariosEquiposService {

	@Override
	public List<UsuariosEquipos> listarUsuariosEquipos() {
		try {
			SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
			UsuariosEquiposMapper usuariosEquiposMapper = session.getMapper(UsuariosEquiposMapper.class);
			return usuariosEquiposMapper.listarUsuariosEquipos();
		} catch (Exception e) {
			System.out.println(e);
			return null;
	   }
	}

}
