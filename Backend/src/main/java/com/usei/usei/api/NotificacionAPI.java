package com.usei.usei.api;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

import com.usei.usei.controllers.NotificacionService;
import com.usei.usei.controllers.TipoNotificacionService;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Notificacion;
import com.usei.usei.models.TipoNotificacion;

@RestController
@RequestMapping("/notificacion")
public class NotificacionAPI {

    @Autowired
    private NotificacionService notificacionService;
    @Autowired
    private TipoNotificacionService tipoNotificacionService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Notificacion notificacion) {
        try {
            Notificacion newNotificacion = new Notificacion();
            newNotificacion.setTitulo(notificacion.getTitulo());
            newNotificacion.setContenido(notificacion.getContenido());
            newNotificacion.setFecha(notificacion.getFecha());
            newNotificacion.setEstadoNotificacion(notificacion.getEstadoNotificacion());


            if(notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion() == 0){
                TipoNotificacion newTipoNotificacion = tipoNotificacionService.findByTipoNotificacion("Encuesta completa");
                newNotificacion.setTipoNotificacionIdNotificacion(newTipoNotificacion);
            }else{
                // Vincular a una tipo de notificacion
                TipoNotificacion tipoNotificacion = new TipoNotificacion();
                tipoNotificacion.setIdNotificacion(notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion());
                newNotificacion.setTipoNotificacionIdNotificacion(tipoNotificacion);
            }
            // Vincular a un estudiante
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(notificacion.getEstudianteIdEstudiante().getIdEstudiante());
            newNotificacion.setEstudianteIdEstudiante(estudiante);

            notificacionService.save(newNotificacion);

            return new ResponseEntity<>(new MessageResponse("Notificacion registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping
    public ResponseEntity<?> readAll() {
        try {
            return ResponseEntity.ok(notificacionService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_notificacion}")
    public ResponseEntity<?> readById(@PathVariable(value = "id_notificacion") Long id) {
        try {
            Optional<Notificacion> notificacion = notificacionService.findById(id);
            if (notificacion.isPresent()) {
                return ResponseEntity.ok(notificacion.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Notificacion inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_notificacion}")
    public ResponseEntity<?> update(@PathVariable(value = "id_notificacion") Long id, @RequestBody Notificacion notificacion) {

        Optional<Notificacion> oNotificacion = notificacionService.findById(id);
        if (oNotificacion.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        try {
            oNotificacion.get().setTitulo(notificacion.getTitulo());
            oNotificacion.get().setContenido(notificacion.getContenido());
            oNotificacion.get().setFecha(notificacion.getFecha());
            oNotificacion.get().setEstadoNotificacion(notificacion.getEstadoNotificacion());
            
            // Vincular a una tipo de notificacion
            TipoNotificacion tipoNotificacion = new TipoNotificacion();
            tipoNotificacion.setIdNotificacion(notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion());
            oNotificacion.get().setTipoNotificacionIdNotificacion(tipoNotificacion);
            // Vincular a un estudiante
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(notificacion.getEstudianteIdEstudiante().getIdEstudiante());
            oNotificacion.get().setEstudianteIdEstudiante(estudiante);

            return ResponseEntity.status(HttpStatus.CREATED).body(notificacionService.save(oNotificacion.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_notificacion}/lectura")
    public ResponseEntity<?> marcarComoLeida(@PathVariable(value = "id_notificacion") Long id) {
        try {
            notificacionService.marcarComoLeida(id);
            return ResponseEntity.ok(new MessageResponse("Notificación marcada como leída (estado = false)"));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/estudiante/{id_estudiante}")
    public ResponseEntity<?> readByEstudianteId(
            @PathVariable(value = "id_estudiante") Long idEstudiante,
            @RequestParam(defaultValue = "0") int page,  // Parámetro para la página
            @RequestParam(defaultValue = "10") int size) // Parámetro para el tamaño de la página
    {
        try {
            // Llamamos al servicio para obtener las notificaciones por el id del estudiante
            Pageable pageable = PageRequest.of(page, size); // Crear el objeto Pageable con los parámetros de paginación
            Page<Notificacion> notificaciones = notificacionService.findByEstudiante(idEstudiante, pageable);
            
            // Si no hay notificaciones, podemos devolver un código 404
            if (!notificaciones.hasContent()) {
                return new ResponseEntity<>(new MessageResponse("No se encontraron notificaciones para este estudiante"), HttpStatus.NOT_FOUND);
            }
            
            // Si hay notificaciones, las devolvemos con un código 200 (OK)
            return ResponseEntity.ok(notificaciones);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
