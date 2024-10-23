package com.usei.usei.controllers;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.Optional;
import com.usei.usei.models.Pregunta;

public interface PreguntaService {

    public Iterable<Pregunta> findAll();

    public Optional<Pregunta> findById(Long id);

    public Pregunta save(Pregunta newPregunta);

    public Pregunta update(Pregunta newPregunta, Long id);

    public void deleteById(Long id);

    // Método para obtener preguntas con paginación, filtro y ordenación
    public Page<Pregunta> findAllWithPaginationAndFilter(Pageable pageable, String filter);
}
