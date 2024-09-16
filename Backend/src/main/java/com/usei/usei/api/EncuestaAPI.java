package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.EncuestaService;
import com.usei.usei.models.Encuesta;
import com.usei.usei.models.MessageResponse;

import java.util.Optional;

@RestController
@RequestMapping("/encuesta")
public class EncuestaAPI {
    @Autowired
    private EncuestaService encuestaService;

    //Crear nueva encuesta
    @PostMapping
    public ResponseEntity<?> create (@RequestBody Encuesta encuesta){
        try {
            encuestaService.save(encuesta);
            return new ResponseEntity<>(new MessageResponse("Encuesta registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_encuesta}")
    public ResponseEntity<?> read(@PathVariable(value = "id_encuesta") Long id_encuesta) {
    Optional<Encuesta> oEncuesta = encuestaService.findById(id_encuesta);
    
    return oEncuesta.map(encuesta -> ResponseEntity.ok(encuesta))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(encuestaService.findAll());
    }

    

    @PutMapping("/{id_encuesta}")
    public ResponseEntity<?> update(@PathVariable(value = "id_encuesta") Long id_encuesta, @RequestBody Encuesta encuesta){

        try {
            Encuesta updatedEncuesta = encuestaService.update( encuesta, id_encuesta);
            return ResponseEntity.ok(updatedEncuesta);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        
    }

    
}
