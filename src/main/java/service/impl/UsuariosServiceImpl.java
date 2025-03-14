package service.impl;

import java.util.List;


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

}

