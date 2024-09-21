package com.usei.usei.api;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.RespuestaService;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Pregunta;
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
            Respuesta newRespuesta = new Respuesta();

            newRespuesta.setRespuesta(respuesta.getRespuesta());
            // Vincular a una pregunta
            Pregunta pregunta = new Pregunta();
            pregunta.setIdPregunta(respuesta.getPreguntaIdPregunta().getIdPregunta());
            newRespuesta.setPreguntaIdPregunta(pregunta);
            // Vincular a un estudiante
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(respuesta.getEstudianteIdEstudiante().getIdEstudiante());
            newRespuesta.setEstudianteIdEstudiante(estudiante);

            respuestaService.save(newRespuesta);
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
    public ResponseEntity<?> readById(@PathVariable(value = "id_respuesta") Long id) {
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
    public ResponseEntity<?> update(@PathVariable(value = "id_respuesta") Long id, @RequestBody Respuesta respuesta) {

        Optional<Respuesta> oRespuesta = respuestaService.findById(id);
        if (oRespuesta.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        try {
            oRespuesta.get().setRespuesta(respuesta.getRespuesta());
            // Vincular a una pregunta
            Pregunta pregunta = new Pregunta();
            pregunta.setIdPregunta(respuesta.getPreguntaIdPregunta().getIdPregunta());
            oRespuesta.get().setPreguntaIdPregunta(pregunta);
            // Vincular a un estudiante
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(respuesta.getEstudianteIdEstudiante().getIdEstudiante());
            oRespuesta.get().setEstudianteIdEstudiante(estudiante);

            return ResponseEntity.status(HttpStatus.CREATED).body(respuestaService.save(oRespuesta.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //verifica si el estudiante ya realizo la encuesta
    @GetMapping("/filled/{id_estudiante}")
    public ResponseEntity<?> hasFilledSurvey(@PathVariable Long id_estudiante) {
        boolean hasFilled = respuestaService.hasFilledSurvey(id_estudiante);
        return ResponseEntity.ok().body(Map.of("filled", hasFilled));
    }

    @GetMapping("/estudiantes-completaron")
    public ResponseEntity<List<Estudiante>> getEstudiantesQueCompletaronEncuesta() {
        List<Estudiante> estudiantes = respuestaService.findEstudiantesQueCompletaronEncuesta();
        System.out.println(estudiantes); // Verifica los datos en el backend
        return ResponseEntity.ok(estudiantes);
    }

}
