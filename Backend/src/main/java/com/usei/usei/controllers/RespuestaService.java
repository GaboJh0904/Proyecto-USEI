package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.data.domain.Page;

import com.usei.usei.models.Respuesta;

public interface RespuestaService {

   
    public Iterable<Respuesta> findAll();

    Optional<Respuesta> findById(Long id);

    Respuesta save(Respuesta newRespuesta);

    Respuesta update(Respuesta newRespuesta, Long id);

    boolean hasFilledSurvey(Long idEstudiante);

     /// para vista respuestasEstudiante
     Page<Respuesta> findRespuestasByEstudianteId(Long idEstudiante, String sortBy, String sortType, int page, int pageSize);

     Page<Respuesta> findRespuestasByEstudianteIdAndTipoPregunta(Long idEstudiante, String tipoPregunta, String sortBy, String sortType, int page, int pageSize);

     Page<Respuesta> findRespuestasByEstudianteIdAndSearchQuery(Long idEstudiante, String searchQuery, String sortBy, String sortType, int page, int pageSize);

    ///


     // Paginación y ordenamiento para obtener todas las respuestas
    //  Page<Respuesta> findAll(PageRequest pageRequest);

    // // Paginación y ordenamiento para obtener respuestas de un estudiante
    // Page<Respuesta> findRespuestasByEstudianteId(Long idEstudiante, PageRequest pageRequest);

    // // Paginación, filtrado y ordenamiento para respuestas por texto de respuesta
    // Page<Respuesta> findRespuestasConFiltro(Long idEstudiante, String respuestaFiltro, PageRequest pageRequest);
}
