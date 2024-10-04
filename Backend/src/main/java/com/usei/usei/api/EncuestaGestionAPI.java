package com.usei.usei.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.EncuestaGestionService;
import com.usei.usei.models.Encuesta;
import com.usei.usei.models.EncuestaGestion;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Pregunta;

import java.util.Optional;

@RestController
@RequestMapping("/encuesta_gestion")
public class EncuestaGestionAPI {

    @Autowired
    private EncuestaGestionService encuestaGestionService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody EncuestaGestion encuestaGestion) {
        try {
            EncuestaGestion newEncuestaGestion = new EncuestaGestion();
            newEncuestaGestion.setAnio(encuestaGestion.getAnio());
            newEncuestaGestion.setSemestre(encuestaGestion.getSemestre());

            Pregunta newPregunta = new Pregunta();
            newPregunta.setIdPregunta(encuestaGestion.getPreguntaIdPregunta().getIdPregunta());

            newEncuestaGestion.setPreguntaIdPregunta(newPregunta);

            Encuesta newEncuesta = new Encuesta();
            newEncuesta.setIdEncuesta(encuestaGestion.getEncuestaIdEncuesta().getIdEncuesta());

            newEncuestaGestion.setEncuestaIdEncuesta(newEncuesta);

            encuestaGestionService.save(newEncuestaGestion);
            return new ResponseEntity<>(new MessageResponse("Encuesta por Gestion registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        try {
            return ResponseEntity.ok(encuestaGestionService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/{id_encuesta_gestion}")
    public ResponseEntity<?> readById(@PathVariable("id_encuesta_gestion") Long id_encuesta_gestion) {
        try {
            Optional<EncuestaGestion> encuestaGestion = encuestaGestionService.findById(id_encuesta_gestion);
            if (encuestaGestion.isPresent()) {
                return ResponseEntity.ok(encuestaGestion.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Encuesta por Gestion inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    

    @PutMapping("/{id_encuesta_gestion}")
    public ResponseEntity<?> update(@PathVariable(value = "id_encuesta_gestion") Long id_encuesta_gestion, @RequestBody EncuestaGestion encuestaGestion){
        Optional<EncuestaGestion> oEncuestaGestion = encuestaGestionService.findById(id_encuesta_gestion);
        if (oEncuestaGestion.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        
        try {
            oEncuestaGestion.get().setAnio(encuestaGestion.getAnio());
            oEncuestaGestion.get().setSemestre(encuestaGestion.getSemestre());

            Pregunta newPregunta = new Pregunta();
            newPregunta.setIdPregunta(encuestaGestion.getPreguntaIdPregunta().getIdPregunta());

            oEncuestaGestion.get().setPreguntaIdPregunta(newPregunta);

            Encuesta newEncuesta = new Encuesta();
            newEncuesta.setIdEncuesta(encuestaGestion.getEncuestaIdEncuesta().getIdEncuesta());

            oEncuestaGestion.get().setEncuestaIdEncuesta(newEncuesta);
            return ResponseEntity.status(HttpStatus.CREATED).body(encuestaGestionService.save(oEncuestaGestion.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
