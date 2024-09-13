/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;

import java.io.Serializable;
import java.util.Collection;
import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
@Table(name = "encuesta")
@NamedQueries({
    @NamedQuery(name = "Encuesta.findAll", query = "SELECT e FROM Encuesta e"),
    @NamedQuery(name = "Encuesta.findByIdEncuesta", query = "SELECT e FROM Encuesta e WHERE e.idEncuesta = :idEncuesta"),
    @NamedQuery(name = "Encuesta.findByTitulo", query = "SELECT e FROM Encuesta e WHERE e.titulo = :titulo"),
    @NamedQuery(name = "Encuesta.findByDescripcion", query = "SELECT e FROM Encuesta e WHERE e.descripcion = :descripcion"),
    @NamedQuery(name = "Encuesta.findByFechaModificado", query = "SELECT e FROM Encuesta e WHERE e.fechaModificado = :fechaModificado")})
public class Encuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id_encuesta")
    private Long idEncuesta;
    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;
    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "fecha_modificado")
    private int fechaModificado;
    @JoinColumn(name = "usuario_id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne(optional = false)
    private Usuario usuarioIdUsuario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "encuestaIdEncuesta")
    private Collection<EstadoEncuesta> estadoEncuestaCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "encuestaIdEncuesta")
    private Collection<EncuestaGestion> encuestaGestionCollection;

    public Encuesta() {
    }

    public Encuesta(long idEncuesta) {
        this.idEncuesta = idEncuesta;
    }

    public Encuesta(long idEncuesta, String titulo, String descripcion, int fechaModificado) {
        this.idEncuesta = idEncuesta;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaModificado = fechaModificado;
    }

    public Long getIdEncuesta() {
        return idEncuesta;
    }

    public void setIdEncuesta(Long idEncuesta) {
        this.idEncuesta = idEncuesta;
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

    public int getFechaModificado() {
        return fechaModificado;
    }

    public void setFechaModificado(int fechaModificado) {
        this.fechaModificado = fechaModificado;
    }

    public Usuario getUsuarioIdUsuario() {
        return usuarioIdUsuario;
    }

    public void setUsuarioIdUsuario(Usuario usuarioIdUsuario) {
        this.usuarioIdUsuario = usuarioIdUsuario;
    }

    public Collection<EstadoEncuesta> getEstadoEncuestaCollection() {
        return estadoEncuestaCollection;
    }

    public void setEstadoEncuestaCollection(Collection<EstadoEncuesta> estadoEncuestaCollection) {
        this.estadoEncuestaCollection = estadoEncuestaCollection;
    }

    public Collection<EncuestaGestion> getEncuestaGestionCollection() {
        return encuestaGestionCollection;
    }

    public void setEncuestaGestionCollection(Collection<EncuestaGestion> encuestaGestionCollection) {
        this.encuestaGestionCollection = encuestaGestionCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEncuesta != null ? idEncuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Encuesta)) {
            return false;
        }
        Encuesta other = (Encuesta) object;
        if ((this.idEncuesta == null && other.idEncuesta != null) || (this.idEncuesta != null && !this.idEncuesta.equals(other.idEncuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Encuesta[ idEncuesta=" + idEncuesta + " ]";
    }
    
}
