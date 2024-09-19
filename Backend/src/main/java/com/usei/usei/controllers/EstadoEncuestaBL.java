package com.usei.usei.controllers;


import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Encuesta;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.repositories.EstadoEncuestaDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EstadoEncuestaBL implements EstadoEncuestaService{

    private final EstadoEncuestaDAO estadoEncuestaDAO;
    private final EncuestaService encuestaService;
    private final EstudianteService estudianteService;

    @Autowired
    public EstadoEncuestaBL(EstadoEncuestaDAO estadoEncuestaDAO, EncuestaService encuestaService, EstudianteService estudianteService){
        this.estadoEncuestaDAO = estadoEncuestaDAO;
        this.encuestaService = encuestaService;
        this.estudianteService = estudianteService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<EstadoEncuesta> findAll(){
        return estadoEncuestaDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<EstadoEncuesta> findById(Long id){
        return estadoEncuestaDAO.findById(id);
    }

    @Override
    @Transactional
    public EstadoEncuesta save(EstadoEncuesta estadoEncuesta) {

        Encuesta encuesta = encuestaService.findById(estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException("encuesta no encontrado con el id: " + estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta()));
        Estudiante estudiante = estudianteService.findById(estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante()));


        estadoEncuesta.setEncuestaIdEncuesta(encuesta);
        estadoEncuesta.setEstudianteIdEstudiante(estudiante);

        return estadoEncuestaDAO.save(estadoEncuesta);
    }



    @Override
    @Transactional
    public EstadoEncuesta update(EstadoEncuesta estadoEncuesta, Long id) {
        Optional<EstadoEncuesta> existingEstadoEncuesta = estadoEncuestaDAO.findById(id);
        if (existingEstadoEncuesta.isPresent()) {
            EstadoEncuesta estadoEncuestaToUpdate = existingEstadoEncuesta.get();

            // Obtener las alergias y el paciente existentes por sus ID
            Encuesta encuesta = encuestaService.findById(estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException("encuesta no encontrado con el id: " + estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta()));
            Estudiante estudiante = estudianteService.findById(estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante()));

            // Actualizar los campos de la estado_encuesta con los valores correspondientes
            estadoEncuestaToUpdate.setEstado(estadoEncuesta.getEstado());
            estadoEncuestaToUpdate.setFechaEstado(estadoEncuesta.getFechaEstado());
            estadoEncuestaToUpdate.setEncuestaIdEncuesta(encuesta);
            estadoEncuestaToUpdate.setEstudianteIdEstudiante(estudiante);

            return estadoEncuestaDAO.save(estadoEncuestaToUpdate);
        } else {
            throw new RuntimeException("Estado_Encuesta no encontrado con el id: " + id);
        }
    }

    @Override
    @Transactional
    public List<EstadoEncuesta> findByEstadoPendiente() {
        return estadoEncuestaDAO.findByEstado("Pendiente");
    }

}
