package com.usei.usei.controllers;
import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Respuesta;
import com.usei.usei.models.Estudiante;

public interface RespuestaService {

    public Iterable<Respuesta> findAll();

    public Optional<Respuesta> findById(Long id);

    public Respuesta save(Respuesta newRespuesta);

    public Respuesta update(Respuesta newRespuesta, Long id);

    // Método para verificar si el estudiante ya llenó la encuesta
    boolean hasFilledSurvey(Long idEstudiante);

    // estudiantes con encuesta completada
    List<Estudiante> findEstudiantesQueCompletaronEncuesta();
}