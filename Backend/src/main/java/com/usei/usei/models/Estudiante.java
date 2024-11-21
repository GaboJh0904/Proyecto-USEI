/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;


import java.io.Serializable;
import java.util.Collection;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/**
 *
 * @author gaboj
 */
@Entity
@Table(name = "estudiante")
@NamedQueries({
    @NamedQuery(name = "Estudiante.findAll", query = "SELECT e FROM Estudiante e"),
    @NamedQuery(name = "Estudiante.findByIdEstudiante", query = "SELECT e FROM Estudiante e WHERE e.idEstudiante = :idEstudiante"),
    @NamedQuery(name = "Estudiante.findByCi", query = "SELECT e FROM Estudiante e WHERE e.ci = :ci"),
    @NamedQuery(name = "Estudiante.findByNombre", query = "SELECT e FROM Estudiante e WHERE e.nombre = :nombre"),
    @NamedQuery(name = "Estudiante.findByApellido", query = "SELECT e FROM Estudiante e WHERE e.apellido = :apellido"),
    @NamedQuery(name = "Estudiante.findByCorreoInstitucional", query = "SELECT e FROM Estudiante e WHERE e.correoInstitucional = :correoInstitucional"),
    @NamedQuery(name = "Estudiante.findByCorreoPersonal", query = "SELECT e FROM Estudiante e WHERE e.correoPersonal = :correoPersonal"),
    @NamedQuery(name = "Estudiante.findByCarrera", query = "SELECT e FROM Estudiante e WHERE e.carrera = :carrera"),
    @NamedQuery(name = "Estudiante.findByAsignatura", query = "SELECT e FROM Estudiante e WHERE e.asignatura = :asignatura"),
    @NamedQuery(name = "Estudiante.findByTelefono", query = "SELECT e FROM Estudiante e WHERE e.telefono = :telefono"),
    @NamedQuery(name = "Estudiante.findByAnio", query = "SELECT e FROM Estudiante e WHERE e.anio = :anio"),
    @NamedQuery(name = "Estudiante.findBySemestre", query = "SELECT e FROM Estudiante e WHERE e.semestre = :semestre")})
public class Estudiante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estudiante")
    private Long idEstudiante;
    @Basic(optional = false)
    @Column(name = "ci")
    private int ci;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = true) // Marca true para procesar el listado de estudiantes ya que no contiene apellido sino solo nombre donde ahi esta el nombre completo del estudiante
    @Column(name = "apellido")
    private String apellido;
    @Basic(optional = true)
    @Column(name = "correoInstitucional")
    private String correoInstitucional;
    @Column(name = "correoPersonal")
    private String correoPersonal;
    @Basic(optional = false)
    @Column(name = "carrera")
    private String carrera;
    @Basic(optional = false)
    @Column(name = "asignatura")
    private String asignatura;
    @Basic(optional = false)
    @Column(name = "telefono")
    private int telefono;
    @Basic(optional = false)
    @Column(name = "anio")
    private int anio;
    @Basic(optional = false)
    @Column(name = "semestre")
    private int semestre;
    @Basic(optional = false)
    @Column(name = "estadoInvitacion")
    private String estadoInvitacion;
    @Basic(optional = false)
    @Column(name = "contrasena")
    private String contrasena;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudianteIdEstudiante")
    @JsonIgnore
    private Collection<EstadoEncuesta> estadoEncuestaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudianteIdEstudiante")
    @JsonIgnore
    private Collection<EstadoCertificado> estadoCertificadoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudianteIdEstudiante")
    @JsonIgnore
    private Collection<Respuesta> respuestaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estudianteIdEstudiante")
    @JsonIgnore
    
    private Collection<Notificacion> notificacionCollection;

    public Estudiante() {
    }

    public Estudiante(Long idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public Estudiante(long idEstudiante, int ci, String nombre, String apellido, String correoInstitucional, String carrera, String asignatura, int telefono, int anio, int semestre,String estadoInvitacion, String contrasena) {
        this.idEstudiante = idEstudiante;
        this.ci = ci;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correoInstitucional = correoInstitucional;
        this.carrera = carrera;
        this.asignatura = asignatura;
        this.telefono = telefono;
        this.anio = anio;
        this.semestre = semestre;
        this.estadoInvitacion = estadoInvitacion;
        this.contrasena = contrasena;
    }
    public Estudiante(Long idEstudiante, String nombre, String apellido) {
        this.idEstudiante = idEstudiante;
        this.nombre = nombre;
        this.apellido = apellido;
    }


    public Long getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(Long idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
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

    public String getCorreoInstitucional() {
        return correoInstitucional;
    }

    public void setCorreoInstitucional(String correoInstitucional) {
        this.correoInstitucional = correoInstitucional;
    }

    public String getCorreoPersonal() {
        return correoPersonal;
    }

    public void setCorreoPersonal(String correoPersonal) {
        this.correoPersonal = correoPersonal;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public String getEstadoInvitacion() {
        return estadoInvitacion;
    }

    public void setEstadoInvitacion(String estadoInvitacion) {
        this.estadoInvitacion = estadoInvitacion;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Collection<EstadoEncuesta> getEstadoEncuestaCollection() {
        return estadoEncuestaCollection;
    }

    public void setEstadoEncuestaCollection(Collection<EstadoEncuesta> estadoEncuestaCollection) {
        this.estadoEncuestaCollection = estadoEncuestaCollection;
    }

    public Collection<EstadoCertificado> getEstadoCertificadoCollection() {
        return estadoCertificadoCollection;
    }

    public void setEstadoCertificadoCollection(Collection<EstadoCertificado> estadoCertificadoCollection) {
        this.estadoCertificadoCollection = estadoCertificadoCollection;
    }

    public Collection<Respuesta> getRespuestaCollection() {
        return respuestaCollection;
    }

    public void setRespuestaCollection(Collection<Respuesta> respuestaCollection) {
        this.respuestaCollection = respuestaCollection;
    }

    public Collection<Notificacion> getNotificacionCollection() {
        return notificacionCollection;
    }

    public void setNotificacionCollection(Collection<Notificacion> notificacionCollection) {
        this.notificacionCollection = notificacionCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstudiante != null ? idEstudiante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estudiante)) {
            return false;
        }
        Estudiante other = (Estudiante) object;
        if ((this.idEstudiante == null && other.idEstudiante != null) || (this.idEstudiante != null && !this.idEstudiante.equals(other.idEstudiante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Estudiante[ idEstudiante=" + idEstudiante + " ]";
    }
    
}
