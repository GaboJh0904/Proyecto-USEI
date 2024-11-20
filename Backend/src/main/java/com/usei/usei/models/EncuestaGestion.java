/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;

import java.io.Serializable;
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

/**
 *
 * @author gaboj
 */
@Entity
@Table(name = "encuesta_gestion")
@NamedQueries({
    @NamedQuery(name = "EncuestaGestion.findAll", query = "SELECT e FROM EncuestaGestion e"),
    @NamedQuery(name = "EncuestaGestion.findByAnio", query = "SELECT e FROM EncuestaGestion e WHERE e.anio = :anio"),
    @NamedQuery(name = "EncuestaGestion.findBySemestre", query = "SELECT e FROM EncuestaGestion e WHERE e.semestre = :semestre"),
    @NamedQuery(name = "EncuestaGestion.findByIdEncuestaGestion", query = "SELECT e FROM EncuestaGestion e WHERE e.idEncuestaGestion = :idEncuestaGestion")})
public class EncuestaGestion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "anio")
    private int anio;
    @Basic(optional = false)
    @Column(name = "semestre")
    private int semestre;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_encuesta_gestion")
    private Long idEncuestaGestion;
    @JoinColumn(name = "encuesta_id_encuesta", referencedColumnName = "id_encuesta")
    @ManyToOne(optional = false)
    private Encuesta encuestaIdEncuesta;
    @JoinColumn(name = "pregunta_id_pregunta", referencedColumnName = "id_pregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaIdPregunta;
    



    public EncuestaGestion() {
    }

    public EncuestaGestion(long idEncuestaGestion) {
        this.idEncuestaGestion = idEncuestaGestion;
    }

    public EncuestaGestion(Long idEncuestaGestion, int anio, int semestre) {
        this.idEncuestaGestion = idEncuestaGestion;
        this.anio = anio;
        this.semestre = semestre;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public Long getIdEncuestaGestion() {
        return idEncuestaGestion;
    }

    public void setIdEncuestaGestion(Long idEncuestaGestion) {
        this.idEncuestaGestion = idEncuestaGestion;
    }

    public Encuesta getEncuestaIdEncuesta() {
        return encuestaIdEncuesta;
    }

    public void setEncuestaIdEncuesta(Encuesta encuestaIdEncuesta) {
        this.encuestaIdEncuesta = encuestaIdEncuesta;
    }

    public Pregunta getPreguntaIdPregunta() {
        return preguntaIdPregunta;
    }

    public void setPreguntaIdPregunta(Pregunta preguntaIdPregunta) {
        this.preguntaIdPregunta = preguntaIdPregunta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEncuestaGestion != null ? idEncuestaGestion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EncuestaGestion)) {
            return false;
        }
        EncuestaGestion other = (EncuestaGestion) object;
        if ((this.idEncuestaGestion == null && other.idEncuestaGestion != null) || (this.idEncuestaGestion != null && !this.idEncuestaGestion.equals(other.idEncuestaGestion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.EncuestaGestion[ idEncuestaGestion=" + idEncuestaGestion + " ]";
    }
    
}
