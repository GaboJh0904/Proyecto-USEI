package com.usei.usei.dto.request;

import java.util.Date;

public class EstadoEncuestaEstudianteDTO {

    private Long idEstEncuesta;
    private String estado;
    private Date fechaEstado;
    private Long idEstudiante;
    private String nombre;
    private String apellido;
    private int ci;
    private int anio;
    private int telefono;
    private String correoInstitucional;

    public EstadoEncuestaEstudianteDTO(Long idEstEncuesta, String estado, Date fechaEstado, Long idEstudiante, String nombre, String apellido, int ci, int anio, int telefono, String correoInstitucional) {
        this.idEstEncuesta = idEstEncuesta;
        this.estado = estado;
        this.fechaEstado = fechaEstado;
        this.idEstudiante = idEstudiante;
        this.nombre = nombre;
        this.apellido = apellido;
        this.ci = ci;
        this.anio = anio;
        this.telefono = telefono;
        this.correoInstitucional = correoInstitucional;
    }

    public Long getIdEstEncuesta() {
        return idEstEncuesta;
    }

    public void setIdEstEncuesta(Long idEstEncuesta) {
        this.idEstEncuesta = idEstEncuesta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFechaEstado() {
        return fechaEstado;
    }

    public void setFechaEstado(Date fechaEstado) {
        this.fechaEstado = fechaEstado;
    }

    public Long getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(Long idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreoInstitucional() {
        return correoInstitucional;
    }

    public void setCorreoInstitucional(String correoInstitucional) {
        this.correoInstitucional = correoInstitucional;
    }
}