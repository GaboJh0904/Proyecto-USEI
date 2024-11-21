package com.usei.usei.api;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.OffsetDateTime;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.controllers.ReporteService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Reporte;
import com.usei.usei.models.Usuario;
@RestController
@RequestMapping("/reporte")
public class ReporteAPI {
    @Autowired
    private ReporteService reporteService;

    // Crear un nuevo reporte
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> creacion(
            @RequestParam("formato") MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fecha") @DateTimeFormat(pattern = "dd-MM-yyyy") Date fecha,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Reporte reporte = new Reporte();
            reporte.setTitulo(titulo);
            reporte.setDescripcion(descripcion);
            reporte.setFecha(fecha);
            
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            reporte.setUsuarioIdUsuario(usuario);

            reporteService.save(reporte, file);
            return new ResponseEntity<>(new MessageResponse("Reporte registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/generate-dashboard")
    public ResponseEntity<?> creacionDashboard(
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fecha") OffsetDateTime fecha,
            @RequestParam("carrera") String carrera,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Reporte reporte = new Reporte();
            reporte.setTitulo(titulo);
            reporte.setDescripcion(descripcion);
            // Convertir OffsetDateTime a LocalDateTime o Date según sea necesario
            reporte.setFecha(Date.from(fecha.toInstant()));

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            reporte.setUsuarioIdUsuario(usuario);

            // Llamar al servicio para generar el PDF y guardar el reporte
            String pdfPath = reporteService.generateDashboardPDF(reporte, carrera);
            reporte.setFormato(pdfPath);
            reporteService.save(reporte);

            return new ResponseEntity<>(new MessageResponse("Reporte y PDF generados con éxito"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse("Error: " + e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Actualizar una reporte
    @PutMapping("/{id_reporte}")
    public ResponseEntity<?> actualizacionReporte(
            @PathVariable(value = "id_reporte") Long id_reporte,
            @RequestParam(value = "formato", required = false) MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fecha") @DateTimeFormat(pattern = "dd-MM-yyyy") Date fecha,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Optional<Reporte> reporteOpt = reporteService.findById(id_reporte);
            if (!reporteOpt.isPresent()) {
                return new ResponseEntity<>(new MessageResponse("Reporte no encontrada"), HttpStatus.NOT_FOUND);
            }

            Reporte reporte = reporteOpt.get();
            reporte.setTitulo(titulo);
            reporte.setDescripcion(descripcion);
            reporte.setFecha(fecha);

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            reporte.setUsuarioIdUsuario(usuario);

            if (file != null && !file.isEmpty()) {
                reporteService.save(reporte, file);  // Guardar con imagen nueva
            } else {
                reporteService.save(reporte);  // Guardar sin cambiar la imagen
            }

            return ResponseEntity.ok(new MessageResponse("Reporte actualizada correctamente"));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Obtener una reporte por ID
    @GetMapping("/{id_reporte}")
    public ResponseEntity<?> reportesObtenidos(@PathVariable(value = "id_reporte") Long id_reporte) {
        Optional<Reporte> oReporte = reporteService.findById(id_reporte);

        return oReporte.map(reporte -> ResponseEntity.ok(reporte))
                .orElse(ResponseEntity.notFound().build());
    }

    // Endpoint para reportes existentes con paginación, ordenación y filtrado por título y descripción 
    @GetMapping
    public ResponseEntity<Page<Reporte>> readAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "titulo") String sortBy,  // Ordenar por campo, por defecto 'titulo'
            @RequestParam(defaultValue = "asc") String sortDirection, // Dirección de orden 'asc' o 'desc'
            @RequestParam(required = false) String filter // Filtro opcional
    ) {
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();

        Pageable paging = PageRequest.of(page, size, sort);
        Page<Reporte> pagedReporte;

        // Lógica de filtrado combinando estado y filtro
        if (filter != null && !filter.isEmpty()) {
            // Filtrar solo por título o descripción
            pagedReporte = reporteService.findByFilter(filter, paging);
        } else {
            // Sin filtros, devolver todas las reportes
            pagedReporte = reporteService.findAll(paging);
        }

        if (pagedReporte.hasContent()) {
            return new ResponseEntity<>(pagedReporte, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }

    // Eliminar reporte
    @DeleteMapping("/{id_reporte}")
    public ResponseEntity<?> eliminacionReporte(@PathVariable(value = "id_reporte") Long id_reporte) {
        if (reporteService.findById(id_reporte).isPresent()) {
            reporteService.delete(id_reporte);
            return new ResponseEntity<>(new MessageResponse("Reporte eliminada"), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new MessageResponse("Reporte no encontrada"), HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/download/{id_reporte}")
    public ResponseEntity<byte[]> descargarReporte(@PathVariable Long id_reporte) {
        try {
            Optional<Reporte> reporteOpt = reporteService.findById(id_reporte);
            if (!reporteOpt.isPresent()) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                    .body(null);
            }

            Reporte reporte = reporteOpt.get();

            // Ruta del archivo en el sistema
            //String filePath = "src/main/resources/static/documents/reportes/" + reporte.getFormato();
            File file = new File(reporte.getFormato());

            if (!file.exists()) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                    .body(null);
            }

            // Leer el archivo en bytes
            byte[] fileBytes = Files.readAllBytes(file.toPath());

            // Configurar headers para la respuesta
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDisposition(ContentDisposition.builder("attachment")
                                                            .filename(file.getName())
                                                            .build());

            return new ResponseEntity<>(fileBytes, headers, HttpStatus.OK);

        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                .body(null);
        }
    }

    @GetMapping("/historial/{id_usuario}")
    public ResponseEntity<Page<Reporte>> readAllFromUser(
            @PathVariable(value = "id_usuario") Long id_usuario,
            @RequestParam(defaultValue = "0") String page, // Recibir como String para validación inicial
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "titulo") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(value = "filter", required = false) String filter) {
        int pageNumber;

        // Validar que 'page' sea un entero válido
        try {
            pageNumber = Integer.parseInt(page);
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body(null); // Respuesta 400 si el parámetro es inválido
        }

        // Configurar ordenamiento
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();

        Pageable paging = PageRequest.of(pageNumber, size, sort);

        Page<Reporte> pagedReporte;

        Usuario UsuarioExistente = new Usuario();
        UsuarioExistente.setIdUsuario(id_usuario);

        // Lógica de filtrado combinando estado y filtro
        if (filter != null && !filter.isEmpty()) {
            // Filtrar solo por título o descripción
            pagedReporte = reporteService.findByFilterFromUser(filter, paging, UsuarioExistente);
        } else {
            // Sin filtros, devolver todas las reportes
            pagedReporte = reporteService.findAllFromUser(paging, UsuarioExistente);
        }

        if (pagedReporte.hasContent()) {
            return new ResponseEntity<>(pagedReporte, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }

}
