package com.usei.usei.models;

import java.io.Serializable;
import java.util.Collection;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "usuario")
@NamedQueries({
        @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
        @NamedQuery(name = "Usuario.findByIdUsuario", query = "SELECT u FROM Usuario u WHERE u.idUsuario = :idUsuario"),
        @NamedQuery(name = "Usuario.findByNombre", query = "SELECT u FROM Usuario u WHERE u.nombre = :nombre"),
        @NamedQuery(name = "Usuario.findByTelefono", query = "SELECT u FROM Usuario u WHERE u.telefono = :telefono"),
        @NamedQuery(name = "Usuario.findByCorreo", query = "SELECT u FROM Usuario u WHERE u.correo = :correo"),
        @NamedQuery(name = "Usuario.findByRol", query = "SELECT u FROM Usuario u WHERE u.rol = :rol"),
        @NamedQuery(name = "Usuario.findByUsuario", query = "SELECT u FROM Usuario u WHERE u.usuario = :usuario"),
        @NamedQuery(name = "Usuario.findByContrasenia", query = "SELECT u FROM Usuario u WHERE u.contrasenia = :contrasenia")
})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    // Relación con Soporte
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioIdUsuario")
    @JsonIgnore // Evita problemas de recursión en la serialización
    private Collection<Soporte> soporteCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioIdUsuario")
    @JsonIgnore
    private Collection<Encuesta> encuestaCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioIdUsuario")
    @JsonIgnore
    private Collection<Certificado> certificadoCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioIdUsuario")
    @JsonIgnore
    private Collection<Reporte> reporteCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioIdUsuario")
    @JsonIgnore
    private Collection<Noticias> noticiasCollection;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioIdUsuario")
    @JsonIgnore
    private Collection<Plazo> plazoCollection;

    // Constructores
    public Usuario() {}

    public Usuario(Long idUsuario, String nombre, int telefono, String correo, String rol, String usuario, String contrasenia) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.rol = rol;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
    }

    // Getters y Setters
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

    public Collection<Soporte> getSoporteCollection() {
        return soporteCollection;
    }

    public void setSoporteCollection(Collection<Soporte> soporteCollection) {
        this.soporteCollection = soporteCollection;
    }

    public Collection<Encuesta> getEncuestaCollection() {
        return encuestaCollection;
    }

    public void setEncuestaCollection(Collection<Encuesta> encuestaCollection) {
        this.encuestaCollection = encuestaCollection;
    }

    public Collection<Certificado> getCertificadoCollection() {
        return certificadoCollection;
    }

    public void setCertificadoCollection(Collection<Certificado> certificadoCollection) {
        this.certificadoCollection = certificadoCollection;
    }

    public Collection<Reporte> getReporteCollection() {
        return reporteCollection;
    }

    public void setReporteCollection(Collection<Reporte> reporteCollection) {
        this.reporteCollection = reporteCollection;
    }

    public Collection<Noticias> getNoticiasCollection() {
        return noticiasCollection;
    }

    public void setNoticiasCollection(Collection<Noticias> noticiasCollection) {
        this.noticiasCollection = noticiasCollection;
    }

    public Collection<Plazo> getPlazoCollection() {
        return plazoCollection;
    }

    public void setPlazoCollection(Collection<Plazo> plazoCollection) {
        this.plazoCollection = plazoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUsuario != null ? idUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.idUsuario == null && other.idUsuario != null) || (this.idUsuario != null && !this.idUsuario.equals(other.idUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.usei.usei.Usuario[ idUsuario=" + idUsuario + " ]";
    }
}
