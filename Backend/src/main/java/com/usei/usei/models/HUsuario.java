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
@Table(name = "h_usuario")
@NamedQueries({
    @NamedQuery(name = "HUsuario.findAll", query = "SELECT h FROM HUsuario h"),
    @NamedQuery(name = "HUsuario.findByIdUsuario", query = "SELECT h FROM HUsuario h WHERE h.idUsuario = :idUsuario"),
    @NamedQuery(name = "HUsuario.findByNombre", query = "SELECT h FROM HUsuario h WHERE h.nombre = :nombre"),
    @NamedQuery(name = "HUsuario.findByTelefono", query = "SELECT h FROM HUsuario h WHERE h.telefono = :telefono"),
    @NamedQuery(name = "HUsuario.findByCorreo", query = "SELECT h FROM HUsuario h WHERE h.correo = :correo"),
    @NamedQuery(name = "HUsuario.findByRol", query = "SELECT h FROM HUsuario h WHERE h.rol = :rol"),
    @NamedQuery(name = "HUsuario.findByUsuario", query = "SELECT h FROM HUsuario h WHERE h.usuario = :usuario"),
    @NamedQuery(name = "HUsuario.findByContrasenia", query = "SELECT h FROM HUsuario h WHERE h.contrasenia = :contrasenia"),
    @NamedQuery(name = "HUsuario.findByVer", query = "SELECT h FROM HUsuario h WHERE h.ver = :ver"),
    @NamedQuery(name = "HUsuario.findByTxDate", query = "SELECT h FROM HUsuario h WHERE h.txDate = :txDate"),
    @NamedQuery(name = "HUsuario.findByTxUser", query = "SELECT h FROM HUsuario h WHERE h.txUser = :txUser")})
public class HUsuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_usuario")
    private Long idUsuario;
    @Basic(optional = false)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @Column(name = "telefono")
    private int telefono;
    @Basic(optional = false)
    @Column(name = "correo")
    private String correo;
    @Basic(optional = false)
    @Column(name = "rol")
    private String rol;
    @Basic(optional = false)
    @Column(name = "usuario")
    private String usuario;
    @Basic(optional = false)
    @Column(name = "contrasenia")
    private String contrasenia;
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

    public HUsuario() {
    }

    public HUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public HUsuario(Long idUsuario, String nombre, int telefono, String correo, String rol, String usuario, String contrasenia, int ver, Date txDate, int txUser) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.rol = rol;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
        this.ver = ver;
        this.txDate = txDate;
        this.txUser = txUser;
    }

    public Long getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Long idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
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
        hash += (idUsuario != null ? idUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HUsuario)) {
            return false;
        }
        HUsuario other = (HUsuario) object;
        if ((this.idUsuario == null && other.idUsuario != null) || (this.idUsuario != null && !this.idUsuario.equals(other.idUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.HUsuario[ idUsuario=" + idUsuario + " ]";
    }
    
}
