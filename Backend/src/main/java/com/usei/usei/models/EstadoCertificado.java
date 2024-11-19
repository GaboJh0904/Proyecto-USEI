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
@Table(name = "estado_certificado")
@NamedQueries({
    @NamedQuery(name = "EstadoCertificado.findAll", query = "SELECT e FROM EstadoCertificado e"),
    @NamedQuery(name = "EstadoCertificado.findByIdEstCertificado", query = "SELECT e FROM EstadoCertificado e WHERE e.idEstCertificado = :idEstCertificado"),
    @NamedQuery(name = "EstadoCertificado.findByEstado", query = "SELECT e FROM EstadoCertificado e WHERE e.estado = :estado"),
    @NamedQuery(name = "EstadoCertificado.findByFechaEstado", query = "SELECT e FROM EstadoCertificado e WHERE e.fechaEstado = :fechaEstado")})
public class EstadoCertificado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_est_certificado")
    private Long idEstCertificado;
    @Basic(optional = false)
    @Column(name = "archivo")
    private String archivo;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @Basic(optional = false)
    @Column(name = "fechaEstado")
    @Temporal(TemporalType.DATE)
    private Date fechaEstado;
    @JoinColumn(name = "certificado_id_certificado", referencedColumnName = "id_certificado", nullable = true)
    @ManyToOne(optional = true)
    private Certificado certificadoIdCertificado;
    @ManyToOne(optional = true)
    @JoinColumn(name = "estudiante_id_estudiante", referencedColumnName = "id_estudiante", nullable = true)
    private Estudiante estudianteIdEstudiante;
    @Column(name = "correo_enviado")
    private String correoEnviado;

    public EstadoCertificado() {
    }

    public EstadoCertificado(Long idEstCertificado) {
        this.idEstCertificado = idEstCertificado;
    }

    public EstadoCertificado(Long idEstCertificado, String archivo, String estado, Date fechaEstado) {
        this.idEstCertificado = idEstCertificado;
        this.archivo = archivo;
        this.estado = estado;
        this.fechaEstado = fechaEstado;
    }

    public Long getIdEstCertificado() {
        return idEstCertificado;
    }

    public void setIdEstCertificado(Long idEstCertificado) {
        this.idEstCertificado = idEstCertificado;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
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

    public Certificado getCertificadoIdCertificado() {
        return certificadoIdCertificado;
    }

    public void setCertificadoIdCertificado(Certificado certificadoIdCertificado) {
        this.certificadoIdCertificado = certificadoIdCertificado;
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
        hash += (idEstCertificado != null ? idEstCertificado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EstadoCertificado)) {
            return false;
        }
        EstadoCertificado other = (EstadoCertificado) object;
        if ((this.idEstCertificado == null && other.idEstCertificado != null) || (this.idEstCertificado != null && !this.idEstCertificado.equals(other.idEstCertificado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.EstadoCertificado[ idEstCertificado=" + idEstCertificado + " ]";
    }

    public void setCorreoEnviado(String nuevoCorreo) {
        this.correoEnviado = correoEnviado;
    }

    public String getCorreoEnviado() {
        return correoEnviado;
    }
}
