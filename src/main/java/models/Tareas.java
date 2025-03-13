package models;

import java.sql.Date;

public class Tareas {
	
	  private Integer idTarea;
	    private String titulo;
	    private String descripcion;
	    private Date fechaLimite;
	    private String estado;
	    private Integer idPrioridad; 
	    private String prioridad; 
	    private Date fechaCreacion;

	    // Getters y Setters
	    public Integer getIdTarea() { return idTarea; }
	    public void setIdTarea(Integer idTarea) { this.idTarea = idTarea; }

	    public String getTitulo() { return titulo; }
	    public void setTitulo(String titulo) { this.titulo = titulo; }

	    public String getDescripcion() { return descripcion; }
	    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

	    public Date getFechaLimite() { return fechaLimite; }
	    public void setFechaLimite(Date fechaLimite) { this.fechaLimite = fechaLimite; }

	    public String getEstado() { return estado; }
	    public void setEstado(String estado) { this.estado = estado; }

	    public Integer getIdPrioridad() { return idPrioridad; }
	    public void setIdPrioridad(Integer idPrioridad) { this.idPrioridad = idPrioridad; }

	    public String getPrioridad() { return prioridad; }
	    public void setPrioridad(String prioridad) { this.prioridad = prioridad; }

	    public Date getFechaCreacion() { return fechaCreacion; }
	    public void setFechaCreacion(Date fechaCreacion) { this.fechaCreacion = fechaCreacion; }
 
}
