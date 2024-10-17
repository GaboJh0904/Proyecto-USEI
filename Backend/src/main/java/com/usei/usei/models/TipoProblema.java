package com.usei.usei.models;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "tipo_problema")
public class TipoProblema implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_problema")
    private Long idProblema;

    @Column(name = "problema", nullable = false, length = 80)
    private String problema;

    // Relación con Soporte
    @OneToMany(mappedBy = "tipoProblema")
    private List<Soporte> soportes;

    // Getters y Setters
    public Long getIdProblema() { return idProblema; }
    public void setIdProblema(Long idProblema) { this.idProblema = idProblema; }

    public String getProblema() { return problema; }
    public void setProblema(String problema) { this.problema = problema; }
}
