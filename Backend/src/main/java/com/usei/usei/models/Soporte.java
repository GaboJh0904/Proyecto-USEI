package com.usei.usei.models;

import java.io.Serializable;
import java.time.LocalDateTime;
import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.time.LocalDateTime;

@Entity
@Table(name = "soporte")
public class Soporte implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_soporte")
    private Long idSoporte;

    @Column(name = "mensaje", nullable = false)
    private String mensaje;

    @Column(name = "fecha", nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime fecha;

    // Relación con TipoProblema
    @ManyToOne(optional = false)
    @JoinColumn(name = "tipo_problema_id_problema", referencedColumnName = "id_problema")
    private TipoProblema tipoProblema;

    // Relación con Usuario
    @ManyToOne(optional = false)
    @JoinColumn(name = "usuario_id_usuario", referencedColumnName = "id_usuario")
    private Usuario usuario;

    // Getters y Setters
    public Long getIdSoporte() { return idSoporte; }
    public void setIdSoporte(Long idSoporte) { this.idSoporte = idSoporte; }

    public String getMensaje() { return mensaje; }
    public void setMensaje(String mensaje) { this.mensaje = mensaje; }

    public LocalDateTime getFecha() { return fecha; }
    public void setFecha(LocalDateTime fecha) { this.fecha = fecha; }

    public TipoProblema getTipoProblema() { return tipoProblema; }
    public void setTipoProblema(TipoProblema tipoProblema) { this.tipoProblema = tipoProblema; }

    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }
}
