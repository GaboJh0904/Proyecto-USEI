package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.repositories.PreguntaDAO;
import com.usei.usei.models.Pregunta;

@Service
public class PreguntaBL implements PreguntaService {

    private final PreguntaDAO preguntaDAO;

        @Autowired
            public PreguntaBL(PreguntaDAO preguntaDAO) {
                    this.preguntaDAO = preguntaDAO;
                        }

                            @Override
                                @Transactional(readOnly = true)
                                    public Iterable<Pregunta> findAll() {
                                            return preguntaDAO.findAll();
                                                }

                                                    @Override
                                                        @Transactional(readOnly = true)
                                                            public Optional<Pregunta> findById(Long id) {
                                                                    return preguntaDAO.findById(id);
                                                                        }

                                                                            @Override
                                                                                @Transactional
                                                                                    public Pregunta save(Pregunta pregunta) {
                                                                                            return preguntaDAO.save(pregunta);
                                                                                                }

                                                                                                    @Override
                                                                                                        @Transactional
                                                                                                            public Pregunta update(Pregunta pregunta, Long id) {
                                                                                                                    Optional<Pregunta> existingPregunta = preguntaDAO.findById(id);
                                                                                                                            if (existingPregunta.isPresent()) {
                                                                                                                                        Pregunta preguntaToUpdate = existingPregunta.get();

                                                                                                                                                    // Actualizar los campos de la pregunta con los valores correspondientes
                                                                                                                                                                preguntaToUpdate.setNumPregunta(pregunta.getNumPregunta());
                                                                                                                                                                            preguntaToUpdate.setPregunta(pregunta.getPregunta());
                                                                                                                                                                                        preguntaToUpdate.setTipoPregunta(pregunta.getTipoPregunta());
                                                                                                                                                                                                    preguntaToUpdate.setEstado(pregunta.getEstado());

                                                                                                                                                                                                                return preguntaDAO.save(preguntaToUpdate);
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                    throw new RuntimeException("Pregunta no encontrada con el id: " + id);
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                }