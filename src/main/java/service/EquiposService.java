package service;

import java.util.List;

import models.Equipos;

public interface EquiposService {
	List<Equipos> listarEquipos();
	Equipos buscarPorId(Integer idEquipo);
	void actualizarEquipo(Equipos equipo);
	void eliminarLogico(Integer idEquipo);
	 void agregarEquipo(Equipos equipo);
}
