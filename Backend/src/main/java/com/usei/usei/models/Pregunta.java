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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

/**
 *
 * @author gaboj
 */
@Entity
@Table(name = "pregunta")
@NamedQueries({
    @NamedQuery(name = "Pregunta.findAll", query = "SELECT p FROM Pregunta p"),
    @NamedQuery(name = "Pregunta.findByIdPregunta", query = "SELECT p FROM Pregunta p WHERE p.idPregunta = :idPregunta"),
    @NamedQuery(name = "Pregunta.findByNumPregunta", query = "SELECT p FROM Pregunta p WHERE p.numPregunta = :numPregunta"),
    @NamedQuery(name = "Pregunta.findByPregunta", query = "SELECT p FROM Pregunta p WHERE p.pregunta = :pregunta"),
    @NamedQuery(name = "Pregunta.findByTipoPregunta", query = "SELECT p FROM Pregunta p WHERE p.tipoPregunta = :tipoPregunta"),
    @NamedQuery(name = "Pregunta.findByEstado", query = "SELECT p FROM Pregunta p WHERE p.estado = :estado")})
public class Pregunta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pregunta")
    private Long idPregunta;
    @Basic(optional = false)
    @Column(name = "numPregunta")
    private int numPregunta;
    @Basic(optional = false)
    @Column(name = "pregunta")
    private String pregunta;
    @Basic(optional = false)
    @Column(name = "tipoPregunta")
    private String tipoPregunta;
    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaIdPregunta")
    @JsonIgnore
    private Collection<OpcionesPregunta> opcionesPreguntaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaIdPregunta")
    @JsonIgnore
    private Collection<EncuestaGestion> encuestaGestionCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaIdPregunta")
    @JsonIgnore
    private Collection<Respuesta> respuestaCollection;
    

    public Pregunta() {
    }

    public Pregunta(Long idPregunta) {
        this.idPregunta = idPregunta;
    }

    public Pregunta(Long idPregunta, int numPregunta, String pregunta, String tipoPregunta, String estado) {
        this.idPregunta = idPregunta;
        this.numPregunta = numPregunta;
        this.pregunta = pregunta;
        this.tipoPregunta = tipoPregunta;
        this.estado = estado;
    }

    public Long getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(Long idPregunta) {
        this.idPregunta = idPregunta;
    }

    public int getNumPregunta() {
        return numPregunta;
    }

    public void setNumPregunta(int numPregunta) {
        this.numPregunta = numPregunta;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getTipoPregunta() {
        return tipoPregunta;
    }

    public void setTipoPregunta(String tipoPregunta) {
        this.tipoPregunta = tipoPregunta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Collection<OpcionesPregunta> getOpcionesPreguntaCollection() {
        return opcionesPreguntaCollection;
    }

    public void setOpcionesPreguntaCollection(Collection<OpcionesPregunta> opcionesPreguntaCollection) {
        this.opcionesPreguntaCollection = opcionesPreguntaCollection;
    }

    public Collection<EncuestaGestion> getEncuestaGestionCollection() {
        return encuestaGestionCollection;
    }

    public void setEncuestaGestionCollection(Collection<EncuestaGestion> encuestaGestionCollection) {
        this.encuestaGestionCollection = encuestaGestionCollection;
    }

    public Collection<Respuesta> getRespuestaCollection() {
        return respuestaCollection;
    }

    public void setRespuestaCollection(Collection<Respuesta> respuestaCollection) {
        this.respuestaCollection = respuestaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPregunta != null ? idPregunta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pregunta)) {
            return false;
        }
        Pregunta other = (Pregunta) object;
        if ((this.idPregunta == null && other.idPregunta != null) || (this.idPregunta != null && !this.idPregunta.equals(other.idPregunta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Pregunta[ idPregunta=" + idPregunta + " ]";
    }
    
}
