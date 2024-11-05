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
@Table(name = "parametros_aviso")
@NamedQueries({
    @NamedQuery(name = "ParametrosAviso.findAll", query = "SELECT p FROM ParametrosAviso p"),
    @NamedQuery(name = "ParametrosAviso.findByIdParametro", query = "SELECT p FROM ParametrosAviso p WHERE p.idParametro = :idParametro"),
    @NamedQuery(name = "ParametrosAviso.findByPorcentaje", query = "SELECT p FROM ParametrosAviso p WHERE p.porcentaje = :porcentaje"),
    @NamedQuery(name = "ParametrosAviso.findByFechaCambio", query = "SELECT p FROM ParametrosAviso p WHERE p.fechaCambio = :fechaCambio"),
    @NamedQuery(name = "ParametrosAviso.findByFechaNotificacion", query = "SELECT p FROM ParametrosAviso p WHERE p.fechaNotificacion = :fechaNotificacion"),
    @NamedQuery(name = "ParametrosAviso.findByMensajePredeterminado", query = "SELECT p FROM ParametrosAviso p WHERE p.mensajePredeterminado = :mensajePredeterminado")})
public class ParametrosAviso implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_parametro")
    private Long idParametro;
    @Basic(optional = false)
    @Column(name = "porcentaje")
    private int porcentaje;
    @Basic(optional = false)
    @Column(name = "fechaCambio")
    @Temporal(TemporalType.DATE)
    private Date fechaCambio;
    @Basic(optional = false)
    @Column(name = "fechaNotificacion")
    @Temporal(TemporalType.DATE)
    private Date fechaNotificacion;
    @Basic(optional = false)
    @Column(name = "mensajePredeterminado")
    private String mensajePredeterminado;

    public ParametrosAviso() {
    }

    public ParametrosAviso(Long idParametro) {
        this.idParametro = idParametro;
    }

    public ParametrosAviso(Long idParametro, int porcentaje, Date fechaCambio, Date fechaNotificacion, String mensajePredeterminado) {
        this.idParametro = idParametro;
        this.porcentaje = porcentaje;
        this.fechaCambio = fechaCambio;
        this.fechaNotificacion = fechaNotificacion;
        this.mensajePredeterminado = mensajePredeterminado;
    }

    public Long getIdParametro() {
        return idParametro;
    }

    public void setIdParametro(Long idParametro) {
        this.idParametro = idParametro;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }

    public Date getFechaCambio() {
        return fechaCambio;
    }

    public void setFechaCambio(Date fechaCambio) {
        this.fechaCambio = fechaCambio;
    }

    public Date getFechaNotificacion() {
        return fechaNotificacion;
    }

    public void setFechaNotificacion(Date fechaNotificacion) {
        this.fechaNotificacion = fechaNotificacion;
    }

    public String getMensajePredeterminado() {
        return mensajePredeterminado;
    }

    public void setMensajePredeterminado(String mensajePredeterminado) {
        this.mensajePredeterminado = mensajePredeterminado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idParametro != null ? idParametro.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ParametrosAviso)) {
            return false;
        }
        ParametrosAviso other = (ParametrosAviso) object;
        if ((this.idParametro == null && other.idParametro != null) || (this.idParametro != null && !this.idParametro.equals(other.idParametro))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.ParametrosAviso[ idParametro=" + idParametro + " ]";
    }
    
}
