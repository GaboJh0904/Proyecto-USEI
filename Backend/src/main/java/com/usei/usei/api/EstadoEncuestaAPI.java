package com.usei.usei.api;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.usei.usei.controllers.EstadoEncuestaService;
import com.usei.usei.models.Encuesta;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;

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

    @GetMapping("/pendientes")
    public ResponseEntity<?> getEncuestasPendientes() {
        try {
            return ResponseEntity.ok(estadoEncuestaService.findByEstadoPendiente());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/completadas")
    public ResponseEntity<?> getEncuestasCompletadas() {
        try {
        return ResponseEntity.ok(estadoEncuestaService.findByEstadoCompletado());
        } catch (Exception e) {
        return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/estudiante/{idEstudiante}")
    public ResponseEntity<?> getEstadoEncuestaPorEstudiante(@PathVariable Long idEstudiante) {
        try {
            Optional<EstadoEncuesta> estadoEncuesta = estadoEncuestaService.findByEstudianteIdEstudiante(idEstudiante);
            if (estadoEncuesta.isPresent()) {
                return ResponseEntity.ok(estadoEncuesta.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("No se encontró estado de encuesta para este estudiante"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
}




