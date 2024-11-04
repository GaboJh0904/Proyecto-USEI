/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;

import java.io.Serializable;
import java.util.Collection;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/**
 *
 * @author gaboj
 */
@Entity
@Table(name = "tipo_problema")
@NamedQueries({
    @NamedQuery(name = "TipoProblema.findAll", query = "SELECT t FROM TipoProblema t"),
    @NamedQuery(name = "TipoProblema.findByIdProblema", query = "SELECT t FROM TipoProblema t WHERE t.idProblema = :idProblema"),
    @NamedQuery(name = "TipoProblema.findByProblema", query = "SELECT t FROM TipoProblema t WHERE t.problema = :problema")})
public class TipoProblema implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_problema")
    private Long idProblema;
    @Basic(optional = false)
    @Column(name = "problema")
    private String problema;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tipoProblema")
    @JsonIgnore
    private Collection<Soporte> soporteCollection;

    public TipoProblema() {
    }

    public TipoProblema(Long idProblema) {
        this.idProblema = idProblema;
    }

    public TipoProblema(Long idProblema, String problema) {
        this.idProblema = idProblema;
        this.problema = problema;
    }

    public Long getIdProblema() {
        return idProblema;
    }

    public void setIdProblema(Long idProblema) {
        this.idProblema = idProblema;
    }

    public String getProblema() {
        return problema;
    }

    public void setProblema(String problema) {
        this.problema = problema;
    }

    public Collection<Soporte> getSoporteCollection() {
        return soporteCollection;
    }

    public void setSoporteCollection(Collection<Soporte> soporteCollection) {
        this.soporteCollection = soporteCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProblema != null ? idProblema.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TipoProblema)) {
            return false;
        }
        TipoProblema other = (TipoProblema) object;
        if ((this.idProblema == null && other.idProblema != null) || (this.idProblema != null && !this.idProblema.equals(other.idProblema))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.TipoProblema[ idProblema=" + idProblema + " ]";
    }
    
}
