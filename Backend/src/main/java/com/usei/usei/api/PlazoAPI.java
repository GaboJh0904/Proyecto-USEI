package com.usei.usei.api;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.usei.usei.controllers.PlazoService;
import com.usei.usei.controllers.UsuarioService;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Plazo;
import com.usei.usei.repositories.EstadoEncuestaDAO;
import com.usei.usei.repositories.EstudianteDAO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@RestController
@RequestMapping("/plazo")
public class PlazoAPI {

    @Autowired
    private PlazoService plazoService;

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private EstudianteDAO estudianteDAO;

    @Autowired
    private EstadoEncuestaDAO estadoEncuestaDAO;


    // Endpoint to create a new Plazo
    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Plazo plazo) {
        try {
            if (usuarioService.findById(plazo.getUsuarioIdUsuario().getIdUsuario()).isEmpty()) {
                return new ResponseEntity<>(new MessageResponse("Usuario no encontrado"), HttpStatus.NOT_FOUND);
            }
            
            plazoService.save(plazo);
            return new ResponseEntity<>(new MessageResponse("Plazo registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Endpoint to retrieve all Plazos with pagination
    @GetMapping("/all")
    public ResponseEntity<?> readAll(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "5") int size,
        @RequestParam(defaultValue = "fechaModificacion") String sortBy,
        @RequestParam(defaultValue = "asc") String sortDirection
    ) {
        try {
            // Ajustar índice de la página
            int pageIndex = page - 1;
            if (pageIndex < 0) pageIndex = 0;

            // Configurar ordenamiento
            Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                        ? Sort.by(sortBy).ascending()
                        : Sort.by(sortBy).descending();

            // Configurar paginación
            Pageable pageable = PageRequest.of(pageIndex, size, sort);

            // Obtener datos paginados
            Page<Plazo> paginatedPlazos = plazoService.findAll(pageable);

            // Devolver respuesta
            return ResponseEntity.ok(paginatedPlazos);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Existing endpoint to fetch a specific Plazo by ID
    @GetMapping("/{id_plazo}")
    public ResponseEntity<?> readById(@PathVariable(value = "id_plazo") Long id) {
        try {
            Optional<Plazo> plazo = plazoService.findById(id);
            if (plazo.isPresent()) {
                return ResponseEntity.ok(plazo.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Plazo inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/recordatorio")
    public ResponseEntity<?> notificarEstudiantesPlazo() {
        try {
            // Buscar el plazo con estado "activo"
            Optional<Plazo> plazoOpt = plazoService.findPlazoActivo();
            if (plazoOpt.isEmpty()) {
                return new ResponseEntity<>(new MessageResponse("No hay plazos activos."), HttpStatus.NOT_FOUND);
            }

            Plazo plazo = plazoOpt.get();
            List<Estudiante> estudiantes = estudianteDAO.findAll();

            // Iterar sobre los estudiantes y verificar si han completado la encuesta
            for (Estudiante estudiante : estudiantes) {
                Optional<EstadoEncuesta> estadoEncuestaOpt = estadoEncuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(estudiante.getIdEstudiante());
                if (estadoEncuestaOpt.isEmpty() || !"Completado".equalsIgnoreCase(estadoEncuestaOpt.get().getEstado())) {
                    // El estudiante no ha completado la encuesta, enviar correo
                    try {
                        enviarCorreoAviso(estudiante.getCorreoPersonal(), plazo.getFechaFinalizacion());
                    } catch (MessagingException e) {
                        System.err.println("Error al enviar el correo a: " + estudiante.getCorreoPersonal() + " - " + e.getMessage());
                    }
                }
            }

            return new ResponseEntity<>(new MessageResponse("Correos enviados a los estudiantes que no han completado la encuesta."), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse("Error inesperado: " + e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Endpoint para obtener el último plazo activo
    @GetMapping("/activo")
    public ResponseEntity<?> obtenerPlazoActivo() {
        Optional<Plazo> plazoActivo = plazoService.findPlazoActivo();
        if (plazoActivo.isPresent()) {
            return ResponseEntity.ok(plazoActivo.get());
        } else {
            return new ResponseEntity<>(new MessageResponse("No hay plazos activos."), HttpStatus.NOT_FOUND);
        }
    }

    private void enviarCorreoAviso(String correo, Date fechaLimite) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, false);
        helper.setTo(correo);
        helper.setSubject("Recordatorio: Completa tu Encuesta");
        helper.setText("Estimado estudiante, te recordamos que debes completar tu encuesta antes del " + fechaLimite + ".");

        mailSender.send(message);
    }

}
