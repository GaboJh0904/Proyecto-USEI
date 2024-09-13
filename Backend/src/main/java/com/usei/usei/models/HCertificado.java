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
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
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
@Table(name = "h_certificado")
@NamedQueries({
    @NamedQuery(name = "HCertificado.findAll", query = "SELECT h FROM HCertificado h"),
    @NamedQuery(name = "HCertificado.findByIdCertificado", query = "SELECT h FROM HCertificado h WHERE h.idCertificado = :idCertificado"),
    @NamedQuery(name = "HCertificado.findByVersion", query = "SELECT h FROM HCertificado h WHERE h.version = :version"),
    @NamedQuery(name = "HCertificado.findByFechaModificacion", query = "SELECT h FROM HCertificado h WHERE h.fechaModificacion = :fechaModificacion"),
    @NamedQuery(name = "HCertificado.findByUsuarioIdUsuario", query = "SELECT h FROM HCertificado h WHERE h.usuarioIdUsuario = :usuarioIdUsuario"),
    @NamedQuery(name = "HCertificado.findByVer", query = "SELECT h FROM HCertificado h WHERE h.ver = :ver"),
    @NamedQuery(name = "HCertificado.findByTxDate", query = "SELECT h FROM HCertificado h WHERE h.txDate = :txDate"),
    @NamedQuery(name = "HCertificado.findByTxUser", query = "SELECT h FROM HCertificado h WHERE h.txUser = :txUser")})
public class HCertificado implements Serializable {

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
    @Basic(optional = false)
    @Column(name = "usuario_id_usuario")
    private int usuarioIdUsuario;
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

    public HCertificado() {
    }

    public HCertificado(Long idCertificado) {
        this.idCertificado = idCertificado;
    }

    public HCertificado(Long idCertificado, byte[] formato, int version, Date fechaModificacion, int usuarioIdUsuario, int ver, Date txDate, int txUser) {
        this.idCertificado = idCertificado;
        this.formato = formato;
        this.version = version;
        this.fechaModificacion = fechaModificacion;
        this.usuarioIdUsuario = usuarioIdUsuario;
        this.ver = ver;
        this.txDate = txDate;
        this.txUser = txUser;
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

    public int getUsuarioIdUsuario() {
        return usuarioIdUsuario;
    }

    public void setUsuarioIdUsuario(int usuarioIdUsuario) {
        this.usuarioIdUsuario = usuarioIdUsuario;
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
        hash += (idCertificado != null ? idCertificado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HCertificado)) {
            return false;
        }
        HCertificado other = (HCertificado) object;
        if ((this.idCertificado == null && other.idCertificado != null) || (this.idCertificado != null && !this.idCertificado.equals(other.idCertificado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.HCertificado[ idCertificado=" + idCertificado + " ]";
    }
    
}
