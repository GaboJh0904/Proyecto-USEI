package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.EncuestaGestion;

public interface EncuestaGestionService {
    
    public Iterable<EncuestaGestion> findAll();

    public Optional<EncuestaGestion> findById(Long id);

    public EncuestaGestion save(EncuestaGestion newEncuestaGestion);

    public EncuestaGestion update (EncuestaGestion newEncuestaGestion, Long id);

}
