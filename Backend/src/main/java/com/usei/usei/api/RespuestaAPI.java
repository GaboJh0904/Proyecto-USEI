package com.usei.usei.api;
import java.util.Date;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usei.usei.controllers.EstadoCertificadoService;
import com.usei.usei.controllers.RespuestaService;
import com.usei.usei.models.Certificado;
import com.usei.usei.models.EstadoCertificado;
import com.usei.usei.models.Estudiante;
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

            // Verificar si el estudiante ha llenado la encuesta completa
            boolean hasFilled = respuestaService.hasFilledSurvey(estudiante.getIdEstudiante());
            if (hasFilled) {
                // Verificar si el registro de estado_certificado ya existe
                Optional<EstadoCertificado> estadoExistente = estadoCertificadoService.findByEstudianteId(estudiante.getIdEstudiante());
                if (estadoExistente.isEmpty()) {
                    // Crear un registro en la tabla estado_certificado por el momento con valores predefinidos
                    EstadoCertificado estadoCertificado = new EstadoCertificado();
                    estadoCertificado.setEstudianteIdEstudiante(estudiante);
                    estadoCertificado.setEstado("Pendiente");
                    estadoCertificado.setArchivo("Archivo");
                    estadoCertificado.setFechaEstado(new Date());

                    // Asignar el certificado con id = 1 (predefinido)
                    Certificado certificado = new Certificado();
                    certificado.setIdCertificado(1L); // ID predefinido del certificado
                    estadoCertificado.setCertificadoIdCertificado(certificado);

                    estadoCertificadoService.save(estadoCertificado);
                }
            }

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
        @GetMapping("/llenado/{id_estudiante}")
        public ResponseEntity<?> hasFilledSurvey(@PathVariable Long id_estudiante) {
            if (id_estudiante == null) {
                return new ResponseEntity<>(new MessageResponse("ID de estudiante no proporcionado"), HttpStatus.BAD_REQUEST);
            }
        
            boolean hasFilled = respuestaService.hasFilledSurvey(id_estudiante);
            return ResponseEntity.ok().body(Map.of("filled", hasFilled));
        }

    
        @GetMapping("/estudiante/{idEstudiante}")
    public ResponseEntity<?> getRespuestasPorEstudiante(
        @PathVariable Long idEstudiante,
        @RequestParam(required = false) String tipoPregunta,
        @RequestParam(required = false) String searchQuery,
        @RequestParam(required = false, defaultValue = "pregunta") String sortBy,
        @RequestParam(required = false, defaultValue = "ASC") String sortType,
        @RequestParam(required = false, defaultValue = "0") int page,
        @RequestParam(required = false, defaultValue = "10") int pageSize) {

             // Validar que el índice de página sea siempre >= 0
             int pageIndex = Math.max(page - 1, 0); 
             Pageable pageable = PageRequest.of(pageIndex, pageSize, Sort.by(Sort.Direction.fromString(sortType), sortBy));

        try {
            Page<Respuesta> respuestas;

           // Manejar filtros de búsqueda
        if (searchQuery != null && !searchQuery.isEmpty()) {
            respuestas = respuestaService.findRespuestasByEstudianteIdAndSearchQuery(idEstudiante, searchQuery, sortBy, sortType, pageIndex, pageSize);
        } else if (tipoPregunta != null && !tipoPregunta.isEmpty()) {
            respuestas = respuestaService.findRespuestasByEstudianteIdAndTipoPregunta(idEstudiante, tipoPregunta, sortBy, sortType, pageIndex, pageSize);
        } else {
            respuestas = respuestaService.findRespuestasByEstudianteId(idEstudiante, sortBy, sortType, pageIndex, pageSize);
        }

            if (respuestas.isEmpty()) {
                return new ResponseEntity<>(new MessageResponse("No se encontraron respuestas para este estudiante"), HttpStatus.NOT_FOUND);
            }

            return ResponseEntity.ok(respuestas);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // @GetMapping
    // public ResponseEntity<?> readAll(
    //     @RequestParam(defaultValue = "0") int page,
    //     @RequestParam(defaultValue = "10") int pageSize,
    //     @RequestParam(defaultValue = "idRespuesta") String sortBy,
    //     @RequestParam(defaultValue = "ASC") String sortType
    // ) {
    //     try {
    //         PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.fromString(sortType), sortBy);
    //         Page<Respuesta> respuestasPage = respuestaService.findAll(pageRequest);
    //         return ResponseEntity.ok(respuestasPage);
    //     } catch (Exception e) {
    //         return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
    //     }
    // }

    // @GetMapping("/estudiante/{idEstudiante}")
    // public ResponseEntity<?> getRespuestasPorEstudiante(
    //     @PathVariable Long idEstudiante,
    //     @RequestParam(defaultValue = "idRespuesta") String sortBy,
    //     @RequestParam(defaultValue = "ASC") String sortType,
    //     @RequestParam(defaultValue = "0") int page,
    //     @RequestParam(defaultValue = "10") int pageSize,
    //     @RequestParam(required = false) String respuestaFiltro
    // ) {
    //     try {
    //         PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.fromString(sortType), sortBy);
    //         Page<Respuesta> respuestasPage = respuestaService.findRespuestasConFiltro(idEstudiante, respuestaFiltro, pageRequest);
            
    //         if (respuestasPage.isEmpty()) {
    //             return new ResponseEntity<>(new MessageResponse("No se encontraron respuestas para este estudiante"), HttpStatus.NOT_FOUND);
    //         }

    //         return ResponseEntity.ok(respuestasPage);
    //     } catch (Exception e) {
    //         return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
    //     }
   

    // }
}