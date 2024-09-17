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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "estado_encuesta")
@NamedQueries({
    @NamedQuery(name = "EstadoEncuesta.findAll", query = "SELECT e FROM EstadoEncuesta e"),
    @NamedQuery(name = "EstadoEncuesta.findByIdEstEncuesta", query = "SELECT e FROM EstadoEncuesta e WHERE e.idEstEncuesta = :idEstEncuesta"),
    @NamedQuery(name = "EstadoEncuesta.findByEstado", query = "SELECT e FROM EstadoEncuesta e WHERE e.estado = :estado"),
    @NamedQuery(name = "EstadoEncuesta.findByFechaEstado", query = "SELECT e FROM EstadoEncuesta e WHERE e.fechaEstado = :fechaEstado")})
public class EstadoEncuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_est_encuesta")
    private Long idEstEncuesta;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @Basic(optional = false)
    @Column(name = "fechaEstado")
    @Temporal(TemporalType.DATE)
    private Date fechaEstado;
    @JoinColumn(name = "encuesta_id_encuesta", referencedColumnName = "id_encuesta")
    @ManyToOne(optional = false)
    private Encuesta encuestaIdEncuesta;
    @JoinColumn(name = "estudiante_id_estudiante", referencedColumnName = "id_estudiante")
    @ManyToOne(optional = false)
    private Estudiante estudianteIdEstudiante;

    public EstadoEncuesta() {
    }

    public EstadoEncuesta(Long idEstEncuesta) {
        this.idEstEncuesta = idEstEncuesta;
    }

    public EstadoEncuesta(long idEstEncuesta, String estado, Date fechaEstado) {
        this.idEstEncuesta = idEstEncuesta;
        this.estado = estado;
        this.fechaEstado = fechaEstado;
    }

    public Long getIdEstEncuesta() {
        return idEstEncuesta;
    }

    public void setIdEstEncuesta(long idEstEncuesta) {
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

    public Encuesta getEncuestaIdEncuesta() {
        return encuestaIdEncuesta;
    }

    public void setEncuestaIdEncuesta(Encuesta encuestaIdEncuesta) {
        this.encuestaIdEncuesta = encuestaIdEncuesta;
    }

    public Estudiante getEstudianteIdEstudiante() {
        return estudianteIdEstudiante;
    }

    public void setEstudianteIdEstudiante(Estudiante estudianteIdEstudiante) {
        this.estudianteIdEstudiante = estudianteIdEstudiante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstEncuesta != null ? idEstEncuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EstadoEncuesta)) {
            return false;
        }
        EstadoEncuesta other = (EstadoEncuesta) object;
        if ((this.idEstEncuesta == null && other.idEstEncuesta != null) || (this.idEstEncuesta != null && !this.idEstEncuesta.equals(other.idEstEncuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.EstadoEncuesta[ idEstEncuesta=" + idEstEncuesta + " ]";
    }
    
}
