package com.usei.usei.api;

import com.usei.usei.models.Soporte;
import com.usei.usei.models.TipoProblema;
import com.usei.usei.models.Usuario;
import com.usei.usei.controllers.SoporteService;
import com.usei.usei.repositories.TipoProblemaDAO;
import com.usei.usei.repositories.UsuarioDAO;
import com.usei.usei.models.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import java.time.format.DateTimeFormatter;



import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/soporte")
public class SoporteAPI {

    @Autowired
    private SoporteService soporteService;

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Autowired
    private TipoProblemaDAO tipoProblemaDAO;

    @Autowired
    private EmailService emailService;  // Servicio para enviar correos

    @PostMapping
    public ResponseEntity<Object> creacion(@RequestBody Soporte soporte) {
        try {
            // Validar tipo de problema
            Optional<TipoProblema> tipoProblema = tipoProblemaDAO.findById(soporte.getTipoProblema().getIdProblema());
            if (tipoProblema.isEmpty()) {
                return new ResponseEntity<>("Tipo de problema no encontrado", HttpStatus.BAD_REQUEST);
            }

            // Validar usuario
            Optional<Usuario> usuario = usuarioDAO.findById(soporte.getUsuario().getIdUsuario());
            if (usuario.isEmpty()) {
                return new ResponseEntity<>("Usuario no encontrado", HttpStatus.BAD_REQUEST);
            }

            // Establecer la fecha actual
            soporte.setFecha(LocalDateTime.now());

            // Guardar el soporte
            soporteService.save(soporte);

            // Obtener el tipo de problema seleccionado
            String problemaSeleccionado = tipoProblema.get().getProblema();

            // Formatear la fecha
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String fechaFormateada = soporte.getFecha().format(formatter);

            // Enviar correo de notificación (opcional)
            emailService.sendEmail(
                    "willy.vargas@ucb.edu.bo",  // Dirección del encargado de soporte
                    "Reporte de un nuevo problema",  // Asunto del correo
                    "Descripción del reporte del problema: \n\n" +
                            "Tipo de problema: " + problemaSeleccionado + "\n" +
                            "Mensaje: " + soporte.getMensaje() + "\n" +
                            "Fecha: " + fechaFormateada + "\n" +
                            "Usuario: " + usuario.get().getNombre()
            );

            return new ResponseEntity<>("Reporte de problema creado exitosamente", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Error: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @GetMapping
    public ResponseEntity<?> getAll() {
        try {
            return ResponseEntity.ok(soporteService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Nuevo endpoint: Obtener reportes de un usuario específico por su ID
    @GetMapping("/usuario/{idUsuario}")
    public ResponseEntity<?> getReportesPorUsuario(@PathVariable Long idUsuario) {
        try {
            Optional<Usuario> usuario = usuarioDAO.findById(idUsuario);
            if (usuario.isEmpty()) {
                return new ResponseEntity<>("Usuario no encontrado", HttpStatus.NOT_FOUND);
            }

            List<Soporte> reportes = soporteService.findByUsuarioId(idUsuario);
            return ResponseEntity.ok(reportes);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/paginado")
    public ResponseEntity<Page<Soporte>> getAllSoportesPaginado(
            @RequestParam(defaultValue = "1") int page,  // Cambia el valor predeterminado a 1
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "fecha") String sortBy,  // Ordenar por campo, por defecto 'fecha'
            @RequestParam(defaultValue = "asc") String sortDirection,  // Dirección de orden 'asc' o 'desc'
            @RequestParam(required = false) String filter,  // Filtro opcional para el mensaje
            @RequestParam(required = false) Long idUsuario  // Filtro opcional para filtrar por usuario
    ) {
        // Resta 1 a la página para que funcione con índices basados en 1
        int adjustedPage = page - 1;
        if (adjustedPage < 0) {
            adjustedPage = 0; // Asegúrate de que no sea negativo
        }

        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();

        Pageable paging = PageRequest.of(adjustedPage, size, sort);
        Page<Soporte> pagedSoportes;

        // Lógica de filtrado combinando idUsuario y filtro
        if (filter != null && !filter.isEmpty() && idUsuario != null) {
            // Filtrar por usuario y mensaje
            pagedSoportes = soporteService.findByUsuarioAndFilter(idUsuario, filter, paging);
        } else if (filter != null && !filter.isEmpty()) {
            // Filtrar solo por mensaje
            pagedSoportes = soporteService.findByFilter(filter, paging);
        } else if (idUsuario != null) {
            // Filtrar solo por usuario
            pagedSoportes = soporteService.findByUsuarioId(idUsuario, paging);
        } else {
            // Sin filtros, devolver todos los reportes
            pagedSoportes = soporteService.findAll(paging);
        }

        if (pagedSoportes.hasContent()) {
            return new ResponseEntity<>(pagedSoportes, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }

}
