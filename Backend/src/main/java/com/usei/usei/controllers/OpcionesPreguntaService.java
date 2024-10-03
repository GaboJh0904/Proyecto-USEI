package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import com.usei.usei.models.OpcionesPregunta;

public interface OpcionesPreguntaService {

    public Iterable<OpcionesPregunta> findAll();

    public Optional<OpcionesPregunta> findById(Long id);

    public OpcionesPregunta save(OpcionesPregunta newOpcionesPregunta);

    public OpcionesPregunta update(OpcionesPregunta newOpcionesPregunta, Long id);

    List<OpcionesPregunta> findByPreguntaId(Long idPregunta);

    public void deleteById(Long id);
}
