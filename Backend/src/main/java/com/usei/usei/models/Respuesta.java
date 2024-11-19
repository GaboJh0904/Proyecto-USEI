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
@Table(name = "respuesta")
@NamedQueries({
    @NamedQuery(name = "Respuesta.findAll", query = "SELECT r FROM Respuesta r"),
    @NamedQuery(name = "Respuesta.findByIdRespuesta", query = "SELECT r FROM Respuesta r WHERE r.idRespuesta = :idRespuesta"),
    @NamedQuery(name = "Respuesta.findByRespuesta", query = "SELECT r FROM Respuesta r WHERE r.respuesta = :respuesta")})
public class Respuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_respuesta")
    private Long idRespuesta;
    @Basic(optional = false)
    @Column(name = "respuesta")
    private String respuesta;
    @JoinColumn(name = "estudiante_id_estudiante", referencedColumnName = "id_estudiante")
    @ManyToOne(optional = false)
    private Estudiante estudianteIdEstudiante;
    @JoinColumn(name = "pregunta_id_pregunta", referencedColumnName = "id_pregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaIdPregunta;
    @ManyToOne
    @JoinColumn(name = "id_opciones", referencedColumnName = "id_opciones")
    private OpcionesPregunta opcionesPregunta;


    public Respuesta() {
    }

    public Respuesta(Long idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public Respuesta(Long idRespuesta, String respuesta) {
        this.idRespuesta = idRespuesta;
        this.respuesta = respuesta;
    }

    public Long getIdRespuesta() {
        return idRespuesta;
    }

    public void setIdRespuesta(Long idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public Estudiante getEstudianteIdEstudiante() {
        return estudianteIdEstudiante;
    }

    public void setEstudianteIdEstudiante(Estudiante estudianteIdEstudiante) {
        this.estudianteIdEstudiante = estudianteIdEstudiante;
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
        hash += (idRespuesta != null ? idRespuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respuesta)) {
            return false;
        }
        Respuesta other = (Respuesta) object;
        if ((this.idRespuesta == null && other.idRespuesta != null) || (this.idRespuesta != null && !this.idRespuesta.equals(other.idRespuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Respuesta[ idRespuesta=" + idRespuesta + " ]";
    }
    
}
