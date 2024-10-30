package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.OpcionesPreguntaService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.OpcionesPregunta;
import com.usei.usei.models.Pregunta;

import java.util.List;
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
            OpcionesPregunta newOpcionesPregunta = new OpcionesPregunta();
            newOpcionesPregunta.setOpcion(opcionesPregunta.getOpcion());

            Pregunta newPregunta = new Pregunta();
            newPregunta.setIdPregunta(opcionesPregunta.getPreguntaIdPregunta().getIdPregunta());

            newOpcionesPregunta.setPreguntaIdPregunta(newPregunta);

            opcionesPreguntaService.save(opcionesPregunta);
            return new ResponseEntity<>(new MessageResponse("Estado de encuesta registrada"), HttpStatus.CREATED);
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

        Optional<OpcionesPregunta> oOpcionesPregunta = opcionesPreguntaService.findById(id_opcionesPregunta);
        if (oOpcionesPregunta.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        try {
            oOpcionesPregunta.get().setOpcion(opcionesPregunta.getOpcion());
            // Vincular a una pregunta
            Pregunta pregunta = new Pregunta();
            pregunta.setIdPregunta(opcionesPregunta.getPreguntaIdPregunta().getIdPregunta());
            oOpcionesPregunta.get().setPreguntaIdPregunta(pregunta);

            return ResponseEntity.status(HttpStatus.CREATED).body(opcionesPreguntaService.save(oOpcionesPregunta.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        
    }

    // Nuevo método para buscar por IdPregunta
    @GetMapping("/pregunta/{id_pregunta}")
    public ResponseEntity<?> readByPreguntaId(@PathVariable(value = "id_pregunta") Long idPregunta) {
        try {
            List<OpcionesPregunta> opcionesPreguntas = opcionesPreguntaService.findByPreguntaId(idPregunta);
            if (opcionesPreguntas.isEmpty()) {
                return new ResponseEntity<>(new MessageResponse("No se encontraron opciones para esta pregunta"), HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<>(opcionesPreguntas, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{id_opciones_pregunta}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_opciones_pregunta") Long id_opciones_pregunta) {
        Optional<OpcionesPregunta> oOpcionesPregunta = opcionesPreguntaService.findById(id_opciones_pregunta);
        if (oOpcionesPregunta.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        opcionesPreguntaService.deleteById(id_opciones_pregunta);
        return ResponseEntity.ok(oOpcionesPregunta);
    }

    
}
