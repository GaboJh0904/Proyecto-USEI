package com.usei.usei.api;

import java.util.Optional;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.PreguntaService;
import com.usei.usei.models.Pregunta;

@RestController
@RequestMapping("/pregunta")
public class PreguntaAPI{

    @Autowired
    private PreguntaService preguntaService;

    //Crear un nueva pregunta:
    @PostMapping
    public ResponseEntity<?> create (@RequestBody Pregunta pregunta){
        return ResponseEntity.status(HttpStatus.CREATED).body(preguntaService.save(pregunta));
    }

    @GetMapping("/{id_pregunta}")
    public ResponseEntity<?> read(@PathVariable(value = "id_pregunta") Long id_pregunta) {
    Optional<Pregunta> oPregunta = preguntaService.findById(id_pregunta);
    
    return oPregunta.map(pregunta -> ResponseEntity.ok(pregunta))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(preguntaService.findAll());
    }

    // @DeleteMapping("/{id_pregunta}")
    // public ResponseEntity<?> delete(@PathVariable(value = "id_pregunta") Long id_pregunta) {
    //     Optional<Pregunta> oPregunta = preguntaService.findById(id_pregunta);
    //     if (oPregunta.isEmpty()) {
    //         return ResponseEntity.notFound().build();
    //     }
    //     preguntaService.deleteById(id_pregunta);
    //     return ResponseEntity.ok(oPregunta);
    // }

    @PutMapping("/{id_pregunta}")
    public ResponseEntity<?> update(@PathVariable(value = "id_pregunta") Long id_pregunta, @RequestBody Pregunta pregunta){
        Optional<Pregunta> oPregunta = preguntaService.findById(id_pregunta);
        if(oPregunta.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        oPregunta.get().setNumPregunta(pregunta.getNumPregunta());
        oPregunta.get().setPregunta(pregunta.getPregunta());
        oPregunta.get().setTipoPregunta(pregunta.getTipoPregunta());
        oPregunta.get().setEstado(pregunta.getEstado());
        return ResponseEntity.status(HttpStatus.CREATED).body(preguntaService.save(oPregunta.get()));
    }

    
    @GetMapping("/tipos")
    public ResponseEntity<?> getTiposDePregunta() {
        List<String> tipos = preguntaService.findDistinctTipoPregunta();
        return ResponseEntity.ok(tipos);
    }





}
