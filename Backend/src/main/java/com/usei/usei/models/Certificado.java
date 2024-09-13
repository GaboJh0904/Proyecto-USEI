/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/**
 *
 * @author gaboj
 */
@Entity
@Table(name = "certificado")
@NamedQueries({
    @NamedQuery(name = "Certificado.findAll", query = "SELECT c FROM Certificado c"),
    @NamedQuery(name = "Certificado.findByIdCertificado", query = "SELECT c FROM Certificado c WHERE c.idCertificado = :idCertificado"),
    @NamedQuery(name = "Certificado.findByVersion", query = "SELECT c FROM Certificado c WHERE c.version = :version"),
    @NamedQuery(name = "Certificado.findByFechaModificacion", query = "SELECT c FROM Certificado c WHERE c.fechaModificacion = :fechaModificacion")})
public class Certificado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_certificado")
    private Long idCertificado;
    @Basic(optional = false)
    @Lob
    @Column(name = "formato")
    private byte[] formato;
    @Basic(optional = false)
    @Column(name = "version")
    private int version;
    @Basic(optional = false)
    @Column(name = "fecha_modificacion")
    @Temporal(TemporalType.DATE)
    private Date fechaModificacion;
    @JoinColumn(name = "usuario_id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne(optional = false)
    private Usuario usuarioIdUsuario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "certificadoIdCertificado")
    private Collection<EstadoCertificado> estadoCertificadoCollection;

    public Certificado() {
    }

    public Certificado(Long idCertificado) {
        this.idCertificado = idCertificado;
    }

    public Certificado(Long idCertificado, byte[] formato, int version, Date fechaModificacion) {
        this.idCertificado = idCertificado;
        this.formato = formato;
        this.version = version;
        this.fechaModificacion = fechaModificacion;
    }

    public Long getIdCertificado() {
        return idCertificado;
    }

    public void setIdCertificado(Long idCertificado) {
        this.idCertificado = idCertificado;
    }

    public byte[] getFormato() {
        return formato;
    }

    public void setFormato(byte[] formato) {
        this.formato = formato;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public Usuario getUsuarioIdUsuario() {
        return usuarioIdUsuario;
    }

    public void setUsuarioIdUsuario(Usuario usuarioIdUsuario) {
        this.usuarioIdUsuario = usuarioIdUsuario;
    }

    public Collection<EstadoCertificado> getEstadoCertificadoCollection() {
        return estadoCertificadoCollection;
    }

    public void setEstadoCertificadoCollection(Collection<EstadoCertificado> estadoCertificadoCollection) {
        this.estadoCertificadoCollection = estadoCertificadoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCertificado != null ? idCertificado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Certificado)) {
            return false;
        }
        Certificado other = (Certificado) object;
        if ((this.idCertificado == null && other.idCertificado != null) || (this.idCertificado != null && !this.idCertificado.equals(other.idCertificado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Certificado[ idCertificado=" + idCertificado + " ]";
    }
    
}
