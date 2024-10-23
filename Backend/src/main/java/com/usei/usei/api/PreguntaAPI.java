package com.usei.usei.api;
import java.util.List;
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

import com.usei.usei.controllers.PreguntaService;
import com.usei.usei.models.Pregunta;


@RestController
@RequestMapping("/pregunta")
public class PreguntaAPI {

    @Autowired
    private PreguntaService preguntaService;

    // Crear una nueva pregunta:
    @PostMapping
    public ResponseEntity<?> create(@RequestBody Pregunta pregunta) {
        return ResponseEntity.status(HttpStatus.CREATED).body(preguntaService.save(pregunta));
    }

    // Obtener una pregunta por ID
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

    // // Leer todas las preguntas con soporte para paginación, filtrado y ordenación
    // @GetMapping
    // public ResponseEntity<?> readAll(
    //         @RequestParam(value = "page", defaultValue = "0") int page,
    //         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
    //         @RequestParam(value = "sortBy", defaultValue = "numPregunta") String sortBy,
    //         @RequestParam(value = "sortType", defaultValue = "ASC") String sortType,
    //         @RequestParam(value = "filter", required = false) String filter) {

    //     // Construir la paginación y la ordenación
    //     Sort.Direction sortDirection = sortType.equalsIgnoreCase("DESC") ? Sort.Direction.DESC : Sort.Direction.ASC;
    //     PageRequest pageable = PageRequest.of(page, pageSize, Sort.by(sortDirection, sortBy));

    //     // Llamar al servicio para obtener las preguntas
    //     Page<Pregunta> preguntas = preguntaService.findAllWithPaginationAndFilter(pageable, filter);

    //     // Retornar las preguntas paginadas
    //     return ResponseEntity.ok(preguntas);
    // }

    // Actualizar una pregunta
    @PutMapping("/{id_pregunta}")
    public ResponseEntity<?> update(@PathVariable(value = "id_pregunta") Long id_pregunta, @RequestBody Pregunta pregunta) {
        Optional<Pregunta> oPregunta = preguntaService.findById(id_pregunta);
        if (oPregunta.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        oPregunta.get().setNumPregunta(pregunta.getNumPregunta());
        oPregunta.get().setPregunta(pregunta.getPregunta());
        oPregunta.get().setTipoPregunta(pregunta.getTipoPregunta());
        oPregunta.get().setEstado(pregunta.getEstado());
        return ResponseEntity.status(HttpStatus.CREATED).body(preguntaService.save(oPregunta.get()));
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

    @GetMapping("/tipos")
    public ResponseEntity<?> getTiposDePregunta() {
        List<String> tipos = preguntaService.findDistinctTipoPregunta();
        return ResponseEntity.ok(tipos);
    }
}
