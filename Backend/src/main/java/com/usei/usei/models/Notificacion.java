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
@Table(name = "notificacion")
@NamedQueries({
    @NamedQuery(name = "Notificacion.findAll", query = "SELECT n FROM Notificacion n"),
    @NamedQuery(name = "Notificacion.findByIdNotificacion", query = "SELECT n FROM Notificacion n WHERE n.idNotificacion = :idNotificacion"),
    @NamedQuery(name = "Notificacion.findByTitulo", query = "SELECT n FROM Notificacion n WHERE n.titulo = :titulo"),
    @NamedQuery(name = "Notificacion.findByContenido", query = "SELECT n FROM Notificacion n WHERE n.contenido = :contenido"),
    @NamedQuery(name = "Notificacion.findByFecha", query = "SELECT n FROM Notificacion n WHERE n.fecha = :fecha"),
    @NamedQuery(name = "Notificacion.findByEstadoNotificacion", query = "SELECT n FROM Notificacion n WHERE n.estadoNotificacion = :estadoNotificacion")})
public class Notificacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_notificacion")
    private Long idNotificacion;
    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @Column(name = "contenido")
    private String contenido;
    @Basic(optional = false)
    @Column(name = "fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @Basic(optional = false)
    @Column(name = "estadoNotificacion")
    private boolean estadoNotificacion;
    @JoinColumn(name = "estudiante_id_estudiante", referencedColumnName = "id_estudiante")
    @ManyToOne(optional = false)
    private Estudiante estudianteIdEstudiante;
    @JoinColumn(name = "tipo_notificacion_id_notificacion", referencedColumnName = "id_notificacion")
    @ManyToOne(optional = false)
    private TipoNotificacion tipoNotificacionIdNotificacion;

    public Notificacion() {
    }

    public Notificacion(Long idNotificacion) {
        this.idNotificacion = idNotificacion;
    }

    public Notificacion(Long idNotificacion, String titulo, String contenido, Date fecha, boolean estadoNotificacion) {
        this.idNotificacion = idNotificacion;
        this.titulo = titulo;
        this.contenido = contenido;
        this.fecha = fecha;
        this.estadoNotificacion = estadoNotificacion;
    }

    public Long getIdNotificacion() {
        return idNotificacion;
    }

    public void setIdNotificacion(Long idNotificacion) {
        this.idNotificacion = idNotificacion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public boolean getEstadoNotificacion() {
        return estadoNotificacion;
    }

    public void setEstadoNotificacion(boolean estadoNotificacion) {
        this.estadoNotificacion = estadoNotificacion;
    }

    public Estudiante getEstudianteIdEstudiante() {
        return estudianteIdEstudiante;
    }

    public void setEstudianteIdEstudiante(Estudiante estudianteIdEstudiante) {
        this.estudianteIdEstudiante = estudianteIdEstudiante;
    }

    public TipoNotificacion getTipoNotificacionIdNotificacion() {
        return tipoNotificacionIdNotificacion;
    }

    public void setTipoNotificacionIdNotificacion(TipoNotificacion tipoNotificacionIdNotificacion) {
        this.tipoNotificacionIdNotificacion = tipoNotificacionIdNotificacion;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idNotificacion != null ? idNotificacion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notificacion)) {
            return false;
        }
        Notificacion other = (Notificacion) object;
        if ((this.idNotificacion == null && other.idNotificacion != null) || (this.idNotificacion != null && !this.idNotificacion.equals(other.idNotificacion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Notificacion[ idNotificacion=" + idNotificacion + " ]";
    }
    
}
