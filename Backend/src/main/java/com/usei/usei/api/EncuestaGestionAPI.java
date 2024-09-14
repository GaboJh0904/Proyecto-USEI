package com.usei.usei.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.EncuestaGestionService;
import com.usei.usei.models.EncuestaGestion;
import com.usei.usei.models.MessageResponse;

import java.util.Optional;

@RestController
@RequestMapping("/encuesta-gestion")
public class EncuestaGestionAPI {

    @Autowired
    private EncuestaGestionService encuestaGestionService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody EncuestaGestion encuestaGestion) {
        try {
            encuestaGestionService.save(encuestaGestion);
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
    public ResponseEntity<?> readById(@PathVariable Long id) {
        try {
            Optional<EncuestaGestion> encuestaGestion = encuestaGestionService.findById(id);
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
    public ResponseEntity<?> update(@RequestBody EncuestaGestion encuestaGestion, @PathVariable Long id) {
        try {
            return ResponseEntity.ok(encuestaGestionService.update(encuestaGestion, id));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
