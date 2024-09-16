package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.RespuestaService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Respuesta;

import java.util.Optional;

@RestController
@RequestMapping("/respuesta")
public class RespuestaAPI {

    @Autowired
    private RespuestaService respuestaService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Respuesta respuesta) {
        try {
            respuestaService.save(respuesta);
            return new ResponseEntity<>(new MessageResponse("Respuesta registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        try {
            return ResponseEntity.ok(respuestaService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_respuesta}")
    public ResponseEntity<?> readById(@PathVariable Long id) {
        try {
            Optional<Respuesta> respuesta = respuestaService.findById(id);
            if (respuesta.isPresent()) {
                return ResponseEntity.ok(respuesta.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Respuesta inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_respuesta}")
    public ResponseEntity<?> update(@RequestBody Respuesta respuesta, @PathVariable Long id) {
        try {
            return ResponseEntity.ok(respuestaService.update(respuesta, id));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
