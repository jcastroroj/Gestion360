package models;

public class UsuariosEquipos {
	
	 	private String equipo;
	 	private int idEquipo;
	    private String integrantes;

	    
	    public int getIdEquipo() {
			return idEquipo;
		}

		public void setIdEquipo(int idEquipo) {
			this.idEquipo = idEquipo;
		}

		public UsuariosEquipos() {}

	    public String getEquipo() {
	        return equipo;
	    }

	    public void setEquipo(String equipo) {
	        this.equipo = equipo;
	    }

	    public String getIntegrantes() {
	        return integrantes;
	    }

	    public void setIntegrantes(String integrantes) {
	        this.integrantes = integrantes;
	    }
	

}
