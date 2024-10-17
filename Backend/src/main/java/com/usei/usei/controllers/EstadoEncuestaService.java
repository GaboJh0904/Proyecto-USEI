package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import com.usei.usei.models.EstadoEncuesta;


public interface EstadoEncuestaService {
    
    public Iterable<EstadoEncuesta> findAll();

    public Optional<EstadoEncuesta> findById(Long id);

    public EstadoEncuesta save(EstadoEncuesta newEstadoEncuesta);

    public EstadoEncuesta update (EstadoEncuesta newEstadoEncuesta, Long id);

    // Método para obtener encuestas con estado "Pendiente"
    public List<EstadoEncuesta> findByEstadoPendiente();

    // método para obtener encuestas con estado "Completado"
    public List<EstadoEncuesta> findByEstadoCompletado();

}
