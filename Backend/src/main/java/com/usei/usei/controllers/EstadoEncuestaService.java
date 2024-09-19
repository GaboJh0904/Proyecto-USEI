package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.EstadoEncuesta;


public interface EstadoEncuestaService {
    
    public Iterable<EstadoEncuesta> findAll();

    public Optional<EstadoEncuesta> findById(Long id);

    public EstadoEncuesta save(EstadoEncuesta newEstadoEncuesta);

    public EstadoEncuesta update (EstadoEncuesta newEstadoEncuesta, Long id);

}