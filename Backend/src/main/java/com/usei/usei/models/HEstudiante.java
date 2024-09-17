/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/**
 *
 * @author gaboj
 */
@Entity
@Table(name = "h_estudiante")
@NamedQueries({
    @NamedQuery(name = "HEstudiante.findAll", query = "SELECT h FROM HEstudiante h"),
    @NamedQuery(name = "HEstudiante.findByIdEstudiante", query = "SELECT h FROM HEstudiante h WHERE h.idEstudiante = :idEstudiante"),
    @NamedQuery(name = "HEstudiante.findByCi", query = "SELECT h FROM HEstudiante h WHERE h.ci = :ci"),
    @NamedQuery(name = "HEstudiante.findByNombre", query = "SELECT h FROM HEstudiante h WHERE h.nombre = :nombre"),
    @NamedQuery(name = "HEstudiante.findByApellido", query = "SELECT h FROM HEstudiante h WHERE h.apellido = :apellido"),
    @NamedQuery(name = "HEstudiante.findByCorreoInsitucional", query = "SELECT h FROM HEstudiante h WHERE h.correoInsitucional = :correoInsitucional"),
    @NamedQuery(name = "HEstudiante.findByCorreoPersonal", query = "SELECT h FROM HEstudiante h WHERE h.correoPersonal = :correoPersonal"),
    @NamedQuery(name = "HEstudiante.findByCarrera", query = "SELECT h FROM HEstudiante h WHERE h.carrera = :carrera"),
    @NamedQuery(name = "HEstudiante.findByAsignatura", query = "SELECT h FROM HEstudiante h WHERE h.asignatura = :asignatura"),
    @NamedQuery(name = "HEstudiante.findByTelefono", query = "SELECT h FROM HEstudiante h WHERE h.telefono = :telefono"),
    @NamedQuery(name = "HEstudiante.findByAnio", query = "SELECT h FROM HEstudiante h WHERE h.anio = :anio"),
    @NamedQuery(name = "HEstudiante.findBySemestre", query = "SELECT h FROM HEstudiante h WHERE h.semestre = :semestre"),
    @NamedQuery(name = "HEstudiante.findByVer", query = "SELECT h FROM HEstudiante h WHERE h.ver = :ver"),
    @NamedQuery(name = "HEstudiante.findByTxDate", query = "SELECT h FROM HEstudiante h WHERE h.txDate = :txDate"),
    @NamedQuery(name = "HEstudiante.findByTxUser", query = "SELECT h FROM HEstudiante h WHERE h.txUser = :txUser")})
public class HEstudiante implements Serializable {

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
    @Basic(optional = false)
    @Column(name = "apellido")
    private String apellido;
    @Basic(optional = false)
    @Column(name = "correo_insitucional")
    private String correoInsitucional;
    @Column(name = "correo_personal")
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
    @Column(name = "ver")
    private int ver;
    @Basic(optional = false)
    @Column(name = "tx_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date txDate;
    @Basic(optional = false)
    @Column(name = "tx_user")
    private int txUser;

    public HEstudiante() {
    }

    public HEstudiante(Long idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public HEstudiante(long idEstudiante, int ci, String nombre, String apellido, String correoInsitucional, String carrera, String asignatura, int telefono, int anio, int semestre, int ver, Date txDate, int txUser) {
        this.idEstudiante = idEstudiante;
        this.ci = ci;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correoInsitucional = correoInsitucional;
        this.carrera = carrera;
        this.asignatura = asignatura;
        this.telefono = telefono;
        this.anio = anio;
        this.semestre = semestre;
        this.ver = ver;
        this.txDate = txDate;
        this.txUser = txUser;
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

    public String getCorreoInsitucional() {
        return correoInsitucional;
    }

    public void setCorreoInsitucional(String correoInsitucional) {
        this.correoInsitucional = correoInsitucional;
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

    public int getVer() {
        return ver;
    }

    public void setVer(int ver) {
        this.ver = ver;
    }

    public Date getTxDate() {
        return txDate;
    }

    public void setTxDate(Date txDate) {
        this.txDate = txDate;
    }

    public int getTxUser() {
        return txUser;
    }

    public void setTxUser(int txUser) {
        this.txUser = txUser;
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
        if (!(object instanceof HEstudiante)) {
            return false;
        }
        HEstudiante other = (HEstudiante) object;
        if ((this.idEstudiante == null && other.idEstudiante != null) || (this.idEstudiante != null && !this.idEstudiante.equals(other.idEstudiante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.HEstudiante[ idEstudiante=" + idEstudiante + " ]";
    }
    
}
