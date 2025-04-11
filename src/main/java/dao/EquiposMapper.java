package dao;

import java.util.List;



import models.Equipos;

public interface EquiposMapper {
	List<Equipos> listarEquipos();
	Equipos buscarPorId(Integer idEquipo);
	void actualizarEquipo(Equipos equipo);
	void eliminarLogico(Integer idEquipo);
	 void agregarEquipo(Equipos equipo);
}
