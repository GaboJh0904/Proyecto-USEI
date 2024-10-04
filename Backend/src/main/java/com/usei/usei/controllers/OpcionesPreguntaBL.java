package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.OpcionesPregunta;
import com.usei.usei.repositories.OpcionesPreguntaDAO;

@Service
public class OpcionesPreguntaBL implements OpcionesPreguntaService{

    private final OpcionesPreguntaDAO opcionesPreguntaDAO;

    @Autowired
    public OpcionesPreguntaBL(OpcionesPreguntaDAO opcionesPreguntaDAO) {
        this.opcionesPreguntaDAO = opcionesPreguntaDAO;
    }

    @Transactional(readOnly = true)
    public Iterable<OpcionesPregunta> findAll() {
        return opcionesPreguntaDAO.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<OpcionesPregunta> findById(Long id) {
        return opcionesPreguntaDAO.findById(id);
    }

    @Transactional
    public OpcionesPregunta save(OpcionesPregunta opcionesPregunta) {
        return opcionesPreguntaDAO.save(opcionesPregunta);
    }

    @Transactional
    public OpcionesPregunta update(OpcionesPregunta opcionesPregunta, Long id) {
        Optional<OpcionesPregunta> existingOpcionesPregunta = opcionesPreguntaDAO.findById(id);
        if (existingOpcionesPregunta.isPresent()) {
            OpcionesPregunta opcionesPreguntaToUpdate = existingOpcionesPregunta.get();
            opcionesPreguntaToUpdate.setOpcion(opcionesPregunta.getOpcion());
            // Actualizar otros campos si es necesario

            return opcionesPreguntaDAO.save(opcionesPreguntaToUpdate);
        } else {
            throw new RuntimeException("Opción de Pregunta no encontrada con el id: " + id);
        }
    }

    // Implementación del método para buscar por IdPregunta
    @Transactional(readOnly = true)
    public List<OpcionesPregunta> findByPreguntaId(Long idPregunta) {
        return opcionesPreguntaDAO.findByPreguntaIdPregunta_IdPregunta(idPregunta);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        opcionesPreguntaDAO.deleteById(id);
    }
}
