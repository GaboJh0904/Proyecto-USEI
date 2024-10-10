package com.usei.usei.controllers;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Soporte;
import com.usei.usei.models.TipoProblema;
import com.usei.usei.repositories.SoporteDAO;

@Service
public class SoporteBL implements SoporteService {

    private final SoporteDAO soporteDAO;
    private final TipoProblemaService tipoProblemaService;
    private final EstudianteService estudianteService;

    @Autowired
    public SoporteBL(SoporteDAO soporteDAO, TipoProblemaService tipoProblemaService,
            EstudianteService estudianteService) {
        this.soporteDAO = soporteDAO;
        this.tipoProblemaService = tipoProblemaService;
        this.estudianteService = estudianteService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Soporte> findAll() {
        return soporteDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Soporte> findById(Long id) {
        return soporteDAO.findById(id);
    }

    @Override
    @Transactional
    public Soporte save(Soporte soporte) {
        TipoProblema tipoProblema = tipoProblemaService.findById(soporte.getTipoProblemaIdProblema().getIdProblema())
                .orElseThrow(() -> new RuntimeException(
                        "Tipo problema no encontrada con el id: " + soporte.getTipoProblemaIdProblema().getIdProblema()));

        Estudiante estudiante = estudianteService.findById(soporte.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: "
                        + soporte.getEstudianteIdEstudiante().getIdEstudiante()));

        soporte.setTipoProblemaIdProblema(tipoProblema);
        soporte.setEstudianteIdEstudiante(estudiante);

        return soporteDAO.save(soporte);
    }

    @Override
    @Transactional
    public Soporte update(Soporte soporte, Long id) {
        Optional<Soporte> existingSoporte = soporteDAO.findById(id);
        if (existingSoporte.isPresent()) {
            Soporte soporteToUpdate = existingSoporte.get();

            TipoProblema tipoProblema = tipoProblemaService.findById(soporte.getTipoProblemaIdProblema().getIdProblema())
                    .orElseThrow(() -> new RuntimeException(
                            "Tipo de problema no encontrada con el id: " + soporte.getTipoProblemaIdProblema().getIdProblema()));

            Estudiante estudiante = estudianteService.findById(soporte.getEstudianteIdEstudiante().getIdEstudiante())
                    .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: "
                            + soporte.getEstudianteIdEstudiante().getIdEstudiante()));

            // Actualizar los campos de la respuesta con los valores correspondientes
            soporteToUpdate.setMensaje(soporte.getMensaje());
            soporteToUpdate.setFecha(soporte.getFecha());
            soporteToUpdate.setTipoProblemaIdProblema(tipoProblema);
            soporteToUpdate.setEstudianteIdEstudiante(estudiante);

            return soporteDAO.save(soporteToUpdate);
        } else {
            throw new RuntimeException("Respuesta no encontrada con el id: " + id);
        }
    }
 
}