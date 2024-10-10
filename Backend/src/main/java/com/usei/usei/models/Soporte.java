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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "soporte")
@NamedQueries({
    @NamedQuery(name = "Soporte.findAll", query = "SELECT s FROM Soporte s"),
    @NamedQuery(name = "Soporte.findByIdSoporte", query = "SELECT s FROM Soporte s WHERE s.idSoporte = :idSoporte"),
    @NamedQuery(name = "Soporte.findByMensaje", query = "SELECT s FROM Soporte s WHERE s.mensaje = :mensaje"),
    @NamedQuery(name = "Soporte.findByFecha", query = "SELECT s FROM Soporte s WHERE s.fecha = :fecha")})
public class Soporte implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_soporte")
    private Long idSoporte;
    @Basic(optional = false)
    @Column(name = "mensaje")
    private String mensaje;
    @Basic(optional = false)
    @Column(name = "fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @JoinColumn(name = "estudiante_id_estudiante", referencedColumnName = "id_estudiante")
    @ManyToOne(optional = false)
    private Estudiante estudianteIdEstudiante;
    @JoinColumn(name = "tipo_problema_id_problema", referencedColumnName = "id_problema")
    @ManyToOne(optional = false)
    private TipoProblema tipoProblemaIdProblema;

    public Soporte() {
    }

    public Soporte(Long idSoporte) {
        this.idSoporte = idSoporte;
    }

    public Soporte(Long idSoporte, String mensaje, Date fecha) {
        this.idSoporte = idSoporte;
        this.mensaje = mensaje;
        this.fecha = fecha;
    }

    public Long getIdSoporte() {
        return idSoporte;
    }

    public void setIdSoporte(Long idSoporte) {
        this.idSoporte = idSoporte;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Estudiante getEstudianteIdEstudiante() {
        return estudianteIdEstudiante;
    }

    public void setEstudianteIdEstudiante(Estudiante estudianteIdEstudiante) {
        this.estudianteIdEstudiante = estudianteIdEstudiante;
    }

    public TipoProblema getTipoProblemaIdProblema() {
        return tipoProblemaIdProblema;
    }

    public void setTipoProblemaIdProblema(TipoProblema tipoProblemaIdProblema) {
        this.tipoProblemaIdProblema = tipoProblemaIdProblema;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idSoporte != null ? idSoporte.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Soporte)) {
            return false;
        }
        Soporte other = (Soporte) object;
        if ((this.idSoporte == null && other.idSoporte != null) || (this.idSoporte != null && !this.idSoporte.equals(other.idSoporte))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Soporte[ idSoporte=" + idSoporte + " ]";
    }
    
}
