package com.usei.usei.controllers;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.usei.usei.models.Respuesta;
import com.usei.usei.repositories.RespuestaDAO;
import com.usei.usei.repositories.RespuestaSpecification;

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
    public Page<Respuesta> findRespuestasConFiltro(Long idEstudiante, String respuestaFiltro, PageRequest pageRequest) {
        Specification<Respuesta> spec = RespuestaSpecification.byEstudianteId(idEstudiante);

        if (respuestaFiltro != null && !respuestaFiltro.isEmpty()) {
            spec = spec.and(RespuestaSpecification.byTextoRespuesta(respuestaFiltro));
        }

        return respuestaDAO.findAll(spec, pageRequest);
    }
}
