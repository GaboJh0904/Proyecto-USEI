package com.usei.usei.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.EstadoEncuestaService;
import com.usei.usei.models.Encuesta;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;

import java.util.Optional;

@RestController
@RequestMapping("/estado_encuesta")
public class EstadoEncuestaAPI {

    @Autowired
    private EstadoEncuestaService estadoEncuestaService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody EstadoEncuesta estadoEncuesta) {
        try {
            EstadoEncuesta newEstadoEncuesta = new EstadoEncuesta();
            newEstadoEncuesta.setEstado(estadoEncuesta.getEstado());
            newEstadoEncuesta.setFechaEstado(estadoEncuesta.getFechaEstado());

            Estudiante newEstudiante = new Estudiante();
            newEstudiante.setIdEstudiante(estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante());

            newEstadoEncuesta.setEstudianteIdEstudiante(newEstudiante);

            Encuesta newEncuesta = new Encuesta();
            newEncuesta.setIdEncuesta(estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta());

            newEstadoEncuesta.setEncuestaIdEncuesta(newEncuesta);

            estadoEncuestaService.save(newEstadoEncuesta);
            return new ResponseEntity<>(new MessageResponse("Estado de encuesta registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        try {
            return ResponseEntity.ok(estadoEncuestaService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_estado_encuesta}")
    public ResponseEntity<?> readById(@PathVariable Long id) {
        try {
            Optional<EstadoEncuesta> estadoEncuesta = estadoEncuestaService.findById(id);
            if (estadoEncuesta.isPresent()) {
                return ResponseEntity.ok(estadoEncuesta.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Estado de Encuesta inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_estado_encuesta}")
    public ResponseEntity<?> update(@PathVariable(value = "id_estado_encuesta") Long id_estado_encuesta, @RequestBody EstadoEncuesta estadoEncuesta){
        Optional<EstadoEncuesta> oEstadoEncuesta = estadoEncuestaService.findById(id_estado_encuesta);
        if (oEstadoEncuesta.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        
        try {
            oEstadoEncuesta.get().setEstado(estadoEncuesta.getEstado());
            oEstadoEncuesta.get().setFechaEstado(estadoEncuesta.getFechaEstado());

            Estudiante newEstudiante = new Estudiante();
            newEstudiante.setIdEstudiante(estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante());

            oEstadoEncuesta.get().setEstudianteIdEstudiante(newEstudiante);

            Encuesta newEncuesta = new Encuesta();
            newEncuesta.setIdEncuesta(estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta());

            oEstadoEncuesta.get().setEncuestaIdEncuesta(newEncuesta);
            return ResponseEntity.status(HttpStatus.CREATED).body(estadoEncuestaService.save(oEstadoEncuesta.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
