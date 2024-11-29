/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usei.usei.models;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
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
@Table(name = "noticias")
@NamedQueries({
        @NamedQuery(name = "Noticias.findAll", query = "SELECT n FROM Noticias n"),
        @NamedQuery(name = "Noticias.findByIdNoticia", query = "SELECT n FROM Noticias n WHERE n.idNoticia = :idNoticia"),
        @NamedQuery(name = "Noticias.findByTitulo", query = "SELECT n FROM Noticias n WHERE n.titulo = :titulo"),
        @NamedQuery(name = "Noticias.findByDescripcion", query = "SELECT n FROM Noticias n WHERE n.descripcion = :descripcion"),
        @NamedQuery(name = "Noticias.findByFechaModificado", query = "SELECT n FROM Noticias n WHERE n.fechaModificado = :fechaModificado"),
        @NamedQuery(name = "Noticias.findByEstado", query = "SELECT n FROM Noticias n WHERE n.estado = :estado")})
public class Noticias implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Basic(optional = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_noticia")
    private Long idNoticia;

    @Basic(optional = false)
    @Column(name = "titulo")
    private String titulo;

    @Basic(optional = false)
    @Column(name = "descripcion")
    private String descripcion;

    @Basic(optional = false)
    @Column(name = "img")
    private String img;

    @Basic(optional = false)
    @Column(name = "fecha_modificado", columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime fechaModificado;

    @Basic(optional = false)
    @Column(name = "estado")
    private String estado;

    @JoinColumn(name = "usuario_id_usuario", referencedColumnName = "id_usuario")
    @ManyToOne(optional = false)
    private Usuario usuarioIdUsuario;

    public Noticias() {
    }

    public Noticias(Long idNoticia) {
        this.idNoticia = idNoticia;
    }

    public Noticias(Long idNoticia, String titulo, String descripcion, String img, LocalDateTime fechaModificado, String estado) {
        this.idNoticia = idNoticia;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.img = img;
        this.fechaModificado = fechaModificado;
        this.estado = estado;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public LocalDateTime getFechaModificado() {
        return fechaModificado;
    }

    public void setFechaModificado(LocalDateTime fechaModificado) {
        this.fechaModificado = fechaModificado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Usuario getUsuarioIdUsuario() {
        return usuarioIdUsuario;
    }

    public void setUsuarioIdUsuario(Usuario usuarioIdUsuario) {
        this.usuarioIdUsuario = usuarioIdUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idNoticia != null ? idNoticia.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Noticias)) {
            return false;
        }
        Noticias other = (Noticias) object;
        return !((this.idNoticia == null && other.idNoticia != null) || (this.idNoticia != null && !this.idNoticia.equals(other.idNoticia)));
    }

    @Override
    public String toString() {
        return "com.usei.usei.models.Noticias[ idNoticia=" + idNoticia + " ]";
    }
}
