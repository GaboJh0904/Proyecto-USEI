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
@Table(name = "opciones_pregunta")
@NamedQueries({
    @NamedQuery(name = "OpcionesPregunta.findAll", query = "SELECT o FROM OpcionesPregunta o"),
    @NamedQuery(name = "OpcionesPregunta.findByIdOpciones", query = "SELECT o FROM OpcionesPregunta o WHERE o.idOpciones = :idOpciones"),
    @NamedQuery(name = "OpcionesPregunta.findByOpcion", query = "SELECT o FROM OpcionesPregunta o WHERE o.opcion = :opcion")})
public class OpcionesPregunta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_opciones")
    private Long idOpciones;
    @Basic(optional = false)
    @Column(name = "opcion")
    private String opcion;
    @JoinColumn(name = "pregunta_id_pregunta", referencedColumnName = "id_pregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaIdPregunta;

    public OpcionesPregunta() {
    }

    public OpcionesPregunta(Long idOpciones) {
        this.idOpciones = idOpciones;
    }

    public OpcionesPregunta(Long idOpciones, String opcion) {
        this.idOpciones = idOpciones;
        this.opcion = opcion;
    }

    public Long getIdOpciones() {
        return idOpciones;
    }

    public void setIdOpciones(Long idOpciones) {
        this.idOpciones = idOpciones;
    }

    public String getOpcion() {
        return opcion;
    }

    public void setOpcion(String opcion) {
        this.opcion = opcion;
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
        hash += (idOpciones != null ? idOpciones.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OpcionesPregunta)) {
            return false;
        }
        OpcionesPregunta other = (OpcionesPregunta) object;
        if ((this.idOpciones == null && other.idOpciones != null) || (this.idOpciones != null && !this.idOpciones.equals(other.idOpciones))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.OpcionesPregunta[ idOpciones=" + idOpciones + " ]";
    }
    
}
