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
@Table(name = "h_noticias")
@NamedQueries({
    @NamedQuery(name = "HNoticias.findAll", query = "SELECT h FROM HNoticias h"),
    @NamedQuery(name = "HNoticias.findByIdNoticia", query = "SELECT h FROM HNoticias h WHERE h.idNoticia = :idNoticia"),
    @NamedQuery(name = "HNoticias.findByTitulo", query = "SELECT h FROM HNoticias h WHERE h.titulo = :titulo"),
    @NamedQuery(name = "HNoticias.findByDescripcion", query = "SELECT h FROM HNoticias h WHERE h.descripcion = :descripcion"),
    @NamedQuery(name = "HNoticias.findByFechaModificado", query = "SELECT h FROM HNoticias h WHERE h.fechaModificado = :fechaModificado"),
    @NamedQuery(name = "HNoticias.findByEstado", query = "SELECT h FROM HNoticias h WHERE h.estado = :estado"),
    @NamedQuery(name = "HNoticias.findByUsuarioIdUsuario", query = "SELECT h FROM HNoticias h WHERE h.usuarioIdUsuario = :usuarioIdUsuario"),
    @NamedQuery(name = "HNoticias.findByVer", query = "SELECT h FROM HNoticias h WHERE h.ver = :ver"),
    @NamedQuery(name = "HNoticias.findByTxDate", query = "SELECT h FROM HNoticias h WHERE h.txDate = :txDate"),
    @NamedQuery(name = "HNoticias.findByTxUser", query = "SELECT h FROM HNoticias h WHERE h.txUser = :txUser")})
public class HNoticias implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_noticia")
    private Long idNoticia;
    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Lob
    @Column(name = "img")
    private byte[] img;
    @Basic(optional = false)
    @Column(name = "fecha_modificado")
    @Temporal(TemporalType.DATE)
    private Date fechaModificado;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
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

    public HNoticias() {
    }

    public HNoticias(Long idNoticia) {
        this.idNoticia = idNoticia;
    }

    public HNoticias(Long idNoticia, String titulo, String descripcion, byte[] img, Date fechaModificado, String estado, int usuarioIdUsuario, int ver, Date txDate, int txUser) {
        this.idNoticia = idNoticia;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.img = img;
        this.fechaModificado = fechaModificado;
        this.estado = estado;
        this.usuarioIdUsuario = usuarioIdUsuario;
        this.ver = ver;
        this.txDate = txDate;
        this.txUser = txUser;
    }

    public Long getIdNoticia() {
        return idNoticia;
    }

    public void setIdNoticia(Long idNoticia) {
        this.idNoticia = idNoticia;
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

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) {
        this.img = img;
    }

    public Date getFechaModificado() {
        return fechaModificado;
    }

    public void setFechaModificado(Date fechaModificado) {
        this.fechaModificado = fechaModificado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
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
        hash += (idNoticia != null ? idNoticia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HNoticias)) {
            return false;
        }
        HNoticias other = (HNoticias) object;
        if ((this.idNoticia == null && other.idNoticia != null) || (this.idNoticia != null && !this.idNoticia.equals(other.idNoticia))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.HNoticias[ idNoticia=" + idNoticia + " ]";
    }
    
}
