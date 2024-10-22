package com.usei.usei.controllers;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Pregunta;
import com.usei.usei.models.Respuesta;
import com.usei.usei.repositories.RespuestaDAO;

@Service
public class RespuestaBL implements RespuestaService {

    private final RespuestaDAO respuestaDAO;

    @Autowired
    public RespuestaBL(RespuestaDAO respuestaDAO) {
        this.respuestaDAO = respuestaDAO;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Respuesta> findAll(PageRequest pageRequest) {
        return respuestaDAO.findAll(pageRequest);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Respuesta> findById(Long id) {
        return respuestaDAO.findById(id);
    }

    @Override
    @Transactional
    public Respuesta save(Respuesta respuesta) {
        return respuestaDAO.save(respuesta);
    }

    @Override
    @Transactional
    public Respuesta update(Respuesta respuesta, Long id) {
        Optional<Respuesta> existingRespuesta = respuestaDAO.findById(id);
        if (existingRespuesta.isPresent()) {
            return respuestaDAO.save(respuesta);
        } else {
            throw new RuntimeException("Respuesta no encontrada con el id: " + id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public boolean hasFilledSurvey(Long idEstudiante) {
        return respuestaDAO.existsByEstudianteIdEstudiante_IdEstudiante(idEstudiante);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Respuesta> findRespuestasByEstudianteId(Long idEstudiante, PageRequest pageRequest) {
        return respuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante, pageRequest);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Respuesta> findRespuestasByEstudianteIdAndTipoPregunta(Long idEstudiante, String tipoPregunta, PageRequest pageRequest) {
        return respuestaDAO.findRespuestasByEstudianteIdAndTipoPregunta(idEstudiante, tipoPregunta, pageRequest);
    }
}

