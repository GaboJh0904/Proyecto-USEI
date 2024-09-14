package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.Encuesta;

public interface EncuestaService {

    public Iterable<Encuesta> findAll();

        public Optional<Encuesta> findById(Long id);

            public Encuesta save(Encuesta newEncuesta);

                public Encuesta update(Encuesta newEncuesta, Long id);

                }

