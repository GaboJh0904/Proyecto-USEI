package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.OpcionesPreguntaService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.OpcionesPregunta;

import java.util.Optional;

@RestController
@RequestMapping("/opciones_pregunta")
public class OpcionesPreguntaAPI {
    @Autowired
    private OpcionesPreguntaService opcionesPreguntaService;

    //Crear nueva opcion
    @PostMapping
    public ResponseEntity<?> create (@RequestBody OpcionesPregunta opcionesPregunta){
        try {
            opcionesPreguntaService.save(opcionesPregunta);
            return new ResponseEntity<>(new MessageResponse("Opcion registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_opciones_pregunta}")
    public ResponseEntity<?> read(@PathVariable(value = "id_opciones_pregunta") Long id_opcionesPregunta) {
    Optional<OpcionesPregunta> oOpcionesPregunta = opcionesPreguntaService.findById(id_opcionesPregunta);
    
    return oOpcionesPregunta.map(opcionesPregunta -> ResponseEntity.ok(opcionesPregunta))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(opcionesPreguntaService.findAll());
    }

    

    @PutMapping("/{id_opciones_pregunta}")
    public ResponseEntity<?> update(@PathVariable(value = "id_opciones_pregunta") Long id_opcionesPregunta, @RequestBody OpcionesPregunta opcionesPregunta){

        try {
            OpcionesPregunta updatedOpcionesPregunta = opcionesPreguntaService.update( opcionesPregunta, id_opcionesPregunta);
            return ResponseEntity.ok(updatedOpcionesPregunta);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        
    }

    
}
