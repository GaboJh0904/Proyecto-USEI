package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.OpcionesPregunta;

public interface OpcionesPreguntaService {

    public Iterable<OpcionesPregunta> findAll();

    public Optional<OpcionesPregunta> findById(Long id);

    public OpcionesPregunta save(OpcionesPregunta newOpcionesPregunta);

    public void update(OpcionesPregunta newOpcionesPregunta, Long id);
}
