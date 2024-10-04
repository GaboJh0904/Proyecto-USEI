package com.usei.usei.controllers;
import java.util.Optional;

import com.usei.usei.models.Respuesta;

public interface RespuestaService {

    public Iterable<Respuesta> findAll();

    public Optional<Respuesta> findById(Long id);

    public Respuesta save(Respuesta newRespuesta);

    public Respuesta update(Respuesta newRespuesta, Long id);

// Metodo para verificar si el estudiante ya lleno la encuesta
boolean hasFilledSurvey(Long idEstudiante);
}