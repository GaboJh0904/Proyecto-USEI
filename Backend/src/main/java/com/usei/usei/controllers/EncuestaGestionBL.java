package com.usei.usei.controllers;


import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Encuesta;
import com.usei.usei.models.EncuestaGestion;
import com.usei.usei.models.Pregunta;
import com.usei.usei.repositories.EncuestaGestionDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class EncuestaGestionBL implements EncuestaGestionService{

    private final EncuestaGestionDAO encuestaGestionDAO;
    private final EncuestaService encuestaService;
    private final PreguntaService preguntaService;

    @Autowired
    public EncuestaGestionBL(EncuestaGestionDAO encuestaGestionDAO, EncuestaService encuestaService, PreguntaService preguntaService){
        this.encuestaGestionDAO = encuestaGestionDAO;
        this.encuestaService = encuestaService;
        this.preguntaService = preguntaService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<EncuestaGestion> findAll(){
        return encuestaGestionDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<EncuestaGestion> findById(Long id){
        return encuestaGestionDAO.findById(id);
    }

    @Override
    @Transactional
    public EncuestaGestion save(EncuestaGestion encuestaGestion) {

        Encuesta encuesta = encuestaService.findById(encuestaGestion.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException("encuesta no encontrado con el id: " + encuestaGestion.getEncuestaIdEncuesta().getIdEncuesta()));
        Pregunta pregunta = preguntaService.findById(encuestaGestion.getPreguntaIdPregunta().getIdPregunta())
                .orElseThrow(() -> new RuntimeException("pregunta no encontrado con el id: " + encuestaGestion.getPreguntaIdPregunta().getIdPregunta()));


        encuestaGestion.setEncuestaIdEncuesta(encuesta);
        encuestaGestion.setPreguntaIdPregunta(pregunta);

        return encuestaGestionDAO.save(encuestaGestion);
    }



    @Override
    @Transactional
    public EncuestaGestion update(EncuestaGestion encuestaGestion, Long id) {
        Optional<EncuestaGestion> existingEncuestaGestion = encuestaGestionDAO.findById(id);
        if (existingEncuestaGestion.isPresent()) {
            EncuestaGestion encuestaGestionToUpdate = existingEncuestaGestion.get();

            // Obtener las alergias y el paciente existentes por sus ID
            Encuesta encuesta = encuestaService.findById(encuestaGestion.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException("encuesta no encontrado con el id: " + encuestaGestion.getEncuestaIdEncuesta().getIdEncuesta()));
            Pregunta pregunta = preguntaService.findById(encuestaGestion.getPreguntaIdPregunta().getIdPregunta())
                .orElseThrow(() -> new RuntimeException("pregunta no encontrado con el id: " + encuestaGestion.getPreguntaIdPregunta().getIdPregunta()));

            // Actualizar los campos de la encuesta_gestion con los valores correspondientes
            encuestaGestionToUpdate.setAnio(encuestaGestion.getAnio());
            encuestaGestionToUpdate.setSemestre(encuestaGestion.getSemestre());
            encuestaGestionToUpdate.setEncuestaIdEncuesta(encuesta);
            encuestaGestionToUpdate.setPreguntaIdPregunta(pregunta);

            return encuestaGestionDAO.save(encuestaGestionToUpdate);
        } else {
            throw new RuntimeException("Encuesta_Gestion no encontrado con el id: " + id);
        }
    }


}
