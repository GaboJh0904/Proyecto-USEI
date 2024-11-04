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
@Table(name = "plazo")
@NamedQueries({
    @NamedQuery(name = "Plazo.findAll", query = "SELECT p FROM Plazo p"),
    @NamedQuery(name = "Plazo.findByIdPlazo", query = "SELECT p FROM Plazo p WHERE p.idPlazo = :idPlazo"),
    @NamedQuery(name = "Plazo.findByFechaFinalizacion", query = "SELECT p FROM Plazo p WHERE p.fechaFinalizacion = :fechaFinalizacion"),
    @NamedQuery(name = "Plazo.findByFechaModificacion", query = "SELECT p FROM Plazo p WHERE p.fechaModificacion = :fechaModificacion"),
    @NamedQuery(name = "Plazo.findByEstado", query = "SELECT p FROM Plazo p WHERE p.estado = :estado")})
public class Plazo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_plazo")
    private Long idPlazo;
    @Basic(optional = false)
    @Column(name = "fechaFinalizacion")
    @Temporal(TemporalType.DATE)
    private Date fechaFinalizacion;
    @Basic(optional = false)
    @Column(name = "fechaModificacion")
    @Temporal(TemporalType.DATE)
    private Date fechaModificacion;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "encuesta_id_encuesta", referencedColumnName = "id_encuesta")
    @ManyToOne(optional = false)
    private Encuesta encuestaIdEncuesta;
    @JoinColumn(name = "usuario_id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne(optional = false)
    private Usuario usuarioIdUsuario;

    public Plazo() {
    }

    public Plazo(Long idPlazo) {
        this.idPlazo = idPlazo;
    }

    public Plazo(Long idPlazo, Date fechaFinalizacion, Date fechaModificacion, String estado) {
        this.idPlazo = idPlazo;
        this.fechaFinalizacion = fechaFinalizacion;
        this.fechaModificacion = fechaModificacion;
        this.estado = estado;
    }

    public Long getIdPlazo() {
        return idPlazo;
    }

    public void setIdPlazo(Long idPlazo) {
        this.idPlazo = idPlazo;
    }

    public Date getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    public void setFechaFinalizacion(Date fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Encuesta getEncuestaIdEncuesta() {
        return encuestaIdEncuesta;
    }

    public void setEncuestaIdEncuesta(Encuesta encuestaIdEncuesta) {
        this.encuestaIdEncuesta = encuestaIdEncuesta;
    }

    public Usuario getUsuarioIdUsuario() {
        return usuarioIdUsuario;
    }

    public void setUsuarioIdUsuario(Usuario usuarioIdUsuario) {
        this.usuarioIdUsuario = usuarioIdUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPlazo != null ? idPlazo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Plazo)) {
            return false;
        }
        Plazo other = (Plazo) object;
        if ((this.idPlazo == null && other.idPlazo != null) || (this.idPlazo != null && !this.idPlazo.equals(other.idPlazo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Plazo[ idPlazo=" + idPlazo + " ]";
    }
    
}
