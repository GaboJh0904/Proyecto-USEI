package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.usei.usei.models.EstadoCertificado;

public interface EstadoCertificadoService {
    
    public Iterable<EstadoCertificado> findAll();

    public Optional<EstadoCertificado> findById(Long id);

    public EstadoCertificado save(EstadoCertificado newEstadoCertificado);

    public EstadoCertificado update (EstadoCertificado newEstadoCertificado, Long id);

    Optional<EstadoCertificado> findByEstudianteId(Long idEstudiante);


    // Método para obtener encuestas con estado "Pendiente"
    // public List<EstadoEncuesta> findByEstadoPendiente();

    // método para obtener encuestas con estado "Completado"
    // public List<EstadoEncuesta> findByEstadoCompletado();

    Page<EstadoCertificado> findByEstado(String estado, Pageable pageable);

    Page<EstadoCertificado> findByNombreEstudiante(String nombre, Pageable pageable);

    Page<EstadoCertificado> findByEstadoAndNombre(String estado, String nombre, Pageable pageable);

    Page<EstadoCertificado> findAll(Pageable pageable);
    
    
}
