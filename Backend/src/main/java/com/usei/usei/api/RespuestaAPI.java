package com.usei.usei.api;

import java.util.Date;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.usei.usei.controllers.EstadoCertificadoService;
import com.usei.usei.controllers.RespuestaService;
import com.usei.usei.models.EstadoCertificado;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Pregunta;
import com.usei.usei.models.Respuesta;

@RestController
@RequestMapping("/respuesta")
public class RespuestaAPI {

    @Autowired
    private RespuestaService respuestaService;

    @Autowired
    private EstadoCertificadoService estadoCertificadoService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Respuesta respuesta) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(respuestaService.save(respuesta));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<?> readAll(
        @RequestParam(defaultValue = "0") int page,
        @RequestParam(defaultValue = "10") int pageSize,
        @RequestParam(defaultValue = "idRespuesta") String sortBy,
        @RequestParam(defaultValue = "ASC") String sortType
    ) {
        try {
            PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.fromString(sortType), sortBy);
            Page<Respuesta> respuestasPage = respuestaService.findAll(pageRequest);
            return ResponseEntity.ok(respuestasPage);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_respuesta}")
    public ResponseEntity<?> readById(@PathVariable(value = "id_respuesta") Long id) {
        try {
            Optional<Respuesta> respuesta = respuestaService.findById(id);
            return respuesta.map(ResponseEntity::ok)
                            .orElseThrow();
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_respuesta}")
    public ResponseEntity<?> update(@PathVariable(value = "id_respuesta") Long id, @RequestBody Respuesta respuesta) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(respuestaService.update(respuesta, id));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/filled/{id_estudiante}")
    public ResponseEntity<?> hasFilledSurvey(@PathVariable Long id_estudiante) {
        try {
            boolean hasFilled = respuestaService.hasFilledSurvey(id_estudiante);
            return ResponseEntity.ok().body(Map.of("filled", hasFilled));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/estudiante/{idEstudiante}")
    public ResponseEntity<?> getRespuestasPorEstudiante(
        @PathVariable Long idEstudiante,
        @RequestParam(defaultValue = "idRespuesta") String sortBy,
        @RequestParam(defaultValue = "ASC") String sortType,
        @RequestParam(defaultValue = "0") int page,
        @RequestParam(defaultValue = "10") int pageSize,
        @RequestParam(required = false) String respuestaFiltro
    ) {
        try {
            PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.fromString(sortType), sortBy);
            Page<Respuesta> respuestasPage = respuestaService.findRespuestasConFiltro(idEstudiante, respuestaFiltro, pageRequest);
            
            if (respuestasPage.isEmpty()) {
                return new ResponseEntity<>(new MessageResponse("No se encontraron respuestas para este estudiante"), HttpStatus.NOT_FOUND);
            }

            return ResponseEntity.ok(respuestasPage);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
   

    }
}