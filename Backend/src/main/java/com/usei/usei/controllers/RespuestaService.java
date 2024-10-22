package com.usei.usei.controllers;

import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import com.usei.usei.models.Respuesta;

public interface RespuestaService {

    // Paginación y ordenamiento para obtener todas las respuestas
    Page<Respuesta> findAll(PageRequest pageRequest);

    Optional<Respuesta> findById(Long id);

    Respuesta save(Respuesta newRespuesta);

    Respuesta update(Respuesta newRespuesta, Long id);

    boolean hasFilledSurvey(Long idEstudiante);

    // Paginación y ordenamiento para obtener respuestas de un estudiante
    Page<Respuesta> findRespuestasByEstudianteId(Long idEstudiante, PageRequest pageRequest);

    // Paginación, filtrado y ordenamiento para respuestas de un estudiante por tipo de pregunta
    Page<Respuesta> findRespuestasByEstudianteIdAndTipoPregunta(Long idEstudiante, String tipoPregunta, PageRequest pageRequest);
}
