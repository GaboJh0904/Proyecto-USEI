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
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
@Table(name = "h_respuesta")
@NamedQueries({
    @NamedQuery(name = "HRespuesta.findAll", query = "SELECT h FROM HRespuesta h"),
    @NamedQuery(name = "HRespuesta.findByIdRespuesta", query = "SELECT h FROM HRespuesta h WHERE h.idRespuesta = :idRespuesta"),
    @NamedQuery(name = "HRespuesta.findByRespuesta", query = "SELECT h FROM HRespuesta h WHERE h.respuesta = :respuesta"),
    @NamedQuery(name = "HRespuesta.findByPreguntaIdPregunta", query = "SELECT h FROM HRespuesta h WHERE h.preguntaIdPregunta = :preguntaIdPregunta"),
    @NamedQuery(name = "HRespuesta.findByEstudianteIdEstudiante", query = "SELECT h FROM HRespuesta h WHERE h.estudianteIdEstudiante = :estudianteIdEstudiante"),
    @NamedQuery(name = "HRespuesta.findByVer", query = "SELECT h FROM HRespuesta h WHERE h.ver = :ver"),
    @NamedQuery(name = "HRespuesta.findByTxDate", query = "SELECT h FROM HRespuesta h WHERE h.txDate = :txDate"),
    @NamedQuery(name = "HRespuesta.findByTxUser", query = "SELECT h FROM HRespuesta h WHERE h.txUser = :txUser")})
public class HRespuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_respuesta")
    private Long idRespuesta;
    @Basic(optional = false)
    @Column(name = "respuesta")
    private String respuesta;
    @Basic(optional = false)
    @Column(name = "pregunta_id_pregunta")
    private int preguntaIdPregunta;
    @Basic(optional = false)
    @Column(name = "estudiante_id_estudiante")
    private int estudianteIdEstudiante;
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

    public HRespuesta() {
    }

    public HRespuesta(Long idRespuesta) {
        this.idRespuesta = idRespuesta;
    }

    public HRespuesta(Long idRespuesta, String respuesta, int preguntaIdPregunta, int estudianteIdEstudiante, int ver, Date txDate, int txUser) {
        this.idRespuesta = idRespuesta;
        this.respuesta = respuesta;
        this.preguntaIdPregunta = preguntaIdPregunta;
        this.estudianteIdEstudiante = estudianteIdEstudiante;
        this.ver = ver;
        this.txDate = txDate;
        this.txUser = txUser;
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

    public int getPreguntaIdPregunta() {
        return preguntaIdPregunta;
    }

    public void setPreguntaIdPregunta(int preguntaIdPregunta) {
        this.preguntaIdPregunta = preguntaIdPregunta;
    }

    public int getEstudianteIdEstudiante() {
        return estudianteIdEstudiante;
    }

    public void setEstudianteIdEstudiante(int estudianteIdEstudiante) {
        this.estudianteIdEstudiante = estudianteIdEstudiante;
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
        hash += (idRespuesta != null ? idRespuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HRespuesta)) {
            return false;
        }
        HRespuesta other = (HRespuesta) object;
        if ((this.idRespuesta == null && other.idRespuesta != null) || (this.idRespuesta != null && !this.idRespuesta.equals(other.idRespuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.HRespuesta[ idRespuesta=" + idRespuesta + " ]";
    }
    
}
