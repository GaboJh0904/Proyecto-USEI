package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.Pregunta;

public interface PreguntaService {
    
    public Iterable<Pregunta> findAll();

    public Optional<Pregunta> findById(Long id);

    public Pregunta save(Pregunta newPregunta);

    public Pregunta update (Pregunta newPregunta, Long id);

}
