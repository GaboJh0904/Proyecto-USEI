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
@Table(name = "h_reporte")
@NamedQueries({
    @NamedQuery(name = "HReporte.findAll", query = "SELECT h FROM HReporte h"),
    @NamedQuery(name = "HReporte.findByIdReporte", query = "SELECT h FROM HReporte h WHERE h.idReporte = :idReporte"),
    @NamedQuery(name = "HReporte.findByTitulo", query = "SELECT h FROM HReporte h WHERE h.titulo = :titulo"),
    @NamedQuery(name = "HReporte.findByDescripcion", query = "SELECT h FROM HReporte h WHERE h.descripcion = :descripcion"),
    @NamedQuery(name = "HReporte.findByFecha", query = "SELECT h FROM HReporte h WHERE h.fecha = :fecha"),
    @NamedQuery(name = "HReporte.findByUsuarioIdUsuario", query = "SELECT h FROM HReporte h WHERE h.usuarioIdUsuario = :usuarioIdUsuario"),
    @NamedQuery(name = "HReporte.findByVer", query = "SELECT h FROM HReporte h WHERE h.ver = :ver"),
    @NamedQuery(name = "HReporte.findByTxDate", query = "SELECT h FROM HReporte h WHERE h.txDate = :txDate"),
    @NamedQuery(name = "HReporte.findByTxUser", query = "SELECT h FROM HReporte h WHERE h.txUser = :txUser")})
public class HReporte implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_reporte")
    private Long idReporte;
    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Lob
    @Column(name = "formato")
    private byte[] formato;
    @Basic(optional = false)
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
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

    public HReporte() {
    }

    public HReporte(Long idReporte) {
        this.idReporte = idReporte;
    }

    public HReporte(long idReporte, String titulo, String descripcion, byte[] formato, Date fecha, int usuarioIdUsuario, int ver, Date txDate, int txUser) {
        this.idReporte = idReporte;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.formato = formato;
        this.fecha = fecha;
        this.usuarioIdUsuario = usuarioIdUsuario;
        this.ver = ver;
        this.txDate = txDate;
        this.txUser = txUser;
    }

    public Long getIdReporte() {
        return idReporte;
    }

    public void setIdReporte(Long idReporte) {
        this.idReporte = idReporte;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public byte[] getFormato() {
        return formato;
    }

    public void setFormato(byte[] formato) {
        this.formato = formato;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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
        hash += (idReporte != null ? idReporte.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HReporte)) {
            return false;
        }
        HReporte other = (HReporte) object;
        if ((this.idReporte == null && other.idReporte != null) || (this.idReporte != null && !this.idReporte.equals(other.idReporte))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.HReporte[ idReporte=" + idReporte + " ]";
    }
    
}
