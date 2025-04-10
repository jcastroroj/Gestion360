package models;

import java.sql.Date;

public class DetalleUsuarios {
	
	 private int idEquipo;
	    private int idUsuario;
	    private String tipoDocumento;
	    private String numeroDocumento;
	    private String username;
	    private String nombre;
	    private String apellidoPaterno;
	    private String apellidoMaterno;
	    private String correo;
	    private String telefono;
	    private String sexo;
	    private Date fechaNacimiento;

	    // Getters y Setters
	    public int getIdEquipo() {
	        return idEquipo;
	    }

	    public void setIdEquipo(int idEquipo) {
	        this.idEquipo = idEquipo;
	    }

	    public int getIdUsuario() {
	        return idUsuario;
	    }

	    public void setIdUsuario(int idUsuario) {
	        this.idUsuario = idUsuario;
	    }

	    public String getTipoDocumento() {
	        return tipoDocumento;
	    }

	    public void setTipoDocumento(String tipoDocumento) {
	        this.tipoDocumento = tipoDocumento;
	    }

	    public String getNumeroDocumento() {
	        return numeroDocumento;
	    }

	    public void setNumeroDocumento(String numeroDocumento) {
	        this.numeroDocumento = numeroDocumento;
	    }

	    public String getUsername() {
	        return username;
	    }

	    public void setUsername(String username) {
	        this.username = username;
	    }

	    public String getNombre() {
	        return nombre;
	    }

	    public void setNombre(String nombre) {
	        this.nombre = nombre;
	    }

	    public String getApellidoPaterno() {
	        return apellidoPaterno;
	    }

	    public void setApellidoPaterno(String apellidoPaterno) {
	        this.apellidoPaterno = apellidoPaterno;
	    }

	    public String getApellidoMaterno() {
	        return apellidoMaterno;
	    }

	    public void setApellidoMaterno(String apellidoMaterno) {
	        this.apellidoMaterno = apellidoMaterno;
	    }

	    public String getCorreo() {
	        return correo;
	    }

	    public void setCorreo(String correo) {
	        this.correo = correo;
	    }

	    public String getTelefono() {
	        return telefono;
	    }

	    public void setTelefono(String telefono) {
	        this.telefono = telefono;
	    }

	    public String getSexo() {
	        return sexo;
	    }

	    public void setSexo(String sexo) {
	        this.sexo = sexo;
	    }

	    public Date getFechaNacimiento() {
	        return fechaNacimiento;
	    }

	    public void setFechaNacimiento(Date fechaNacimiento) {
	        this.fechaNacimiento = fechaNacimiento;
	    }
}