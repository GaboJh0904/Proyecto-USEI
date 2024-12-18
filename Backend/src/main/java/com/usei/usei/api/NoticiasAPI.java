package com.usei.usei.api;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
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

import com.usei.usei.controllers.NoticiasService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Noticias;
import com.usei.usei.models.Usuario;
@RestController
@RequestMapping("/noticia")
public class NoticiasAPI {
    @Autowired
    private NoticiasService noticiasService;

    // Crear una nueva noticia
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> creacion(
            @RequestParam("img") MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm") LocalDateTime fechaModificado,
            @RequestParam("estado") String estado,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Noticias noticias = new Noticias();
            noticias.setTitulo(titulo);
            noticias.setDescripcion(descripcion);
            noticias.setFechaModificado(fechaModificado);
            noticias.setEstado(estado);

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            noticias.setUsuarioIdUsuario(usuario);

            noticiasService.save(noticias, file);
            return new ResponseEntity<>(new MessageResponse("Noticia registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Actualizar una noticia
    @PutMapping("/{id_noticia}")
    public ResponseEntity<?> actualizacionNoticia(
            @PathVariable(value = "id_noticia") Long id_noticias,
            @RequestParam(value = "img", required = false) MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm") LocalDateTime fechaModificado,
            @RequestParam("estado") String estado,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Optional<Noticias> noticiasOpt = noticiasService.findById(id_noticias);
            if (!noticiasOpt.isPresent()) {
                return new ResponseEntity<>(new MessageResponse("Noticia no encontrada"), HttpStatus.NOT_FOUND);
            }

            Noticias noticias = noticiasOpt.get();
            noticias.setTitulo(titulo);
            noticias.setDescripcion(descripcion);
            noticias.setFechaModificado(fechaModificado);
            noticias.setEstado(estado);

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            noticias.setUsuarioIdUsuario(usuario);

            if (file != null && !file.isEmpty()) {
                noticiasService.save(noticias, file);  // Guardar con imagen nueva
            } else {
                noticiasService.save(noticias);  // Guardar sin cambiar la imagen
            }

            return ResponseEntity.ok(new MessageResponse("Noticia actualizada correctamente"));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Obtener una noticia por ID
    @GetMapping("/{id_noticia}")
    public ResponseEntity<?> noticiasObtenidas(@PathVariable(value = "id_noticia") Long id_noticias) {
        Optional<Noticias> oNoticias = noticiasService.findById(id_noticias);

        return oNoticias.map(noticias -> ResponseEntity.ok(noticias))
                .orElse(ResponseEntity.notFound().build());
    }

    // Obtener noticias para el carrusel
    @GetMapping("/carrusel")
    public ResponseEntity<?> noticiasObtenidasParaCarrusel() {
        try {
            // Filtramos solo las noticias con estado 'publicado'
            List<Noticias> noticiasPublicadas = noticiasService.findByEstado("publicado");
            if (noticiasPublicadas.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(noticiasPublicadas, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Endpoint para noticias existentes con paginación, ordenación y filtrado por título, descripción y estado
    @GetMapping
    public ResponseEntity<Page<Noticias>> readAll(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "titulo") String[] sortBy, // Permite múltiples criterios separados por coma
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) String filter,
            @RequestParam(required = false) String estado
    ) {
        int pageIndex = page - 1;
        if (pageIndex < 0) pageIndex = 0;

        // Construcción dinámica de criterios de ordenación
        Sort sort = Sort.unsorted();
        for (String field : sortBy) {
            Sort currentSort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                    ? Sort.by(field).ascending()
                    : Sort.by(field).descending();
            sort = sort.and(currentSort);
        }

        Pageable paging = PageRequest.of(pageIndex, size, sort);

        // Normalizar valores de estado y filtro
        if (estado != null) {
            estado = estado.trim().toLowerCase();
        }
        if (filter != null) {
            filter = filter.trim().toLowerCase();
        }

        Page<Noticias> pagedNoticias;
        if ((estado == null || estado.isEmpty()) && (filter == null || filter.isEmpty())) {
            // Sin filtros, devuelve todo
            pagedNoticias = noticiasService.findAll(paging);
        } else if (estado == null || estado.isEmpty()) {
            // Filtro solo por búsqueda (sin filtrar por estado)
            pagedNoticias = noticiasService.findByFilter(filter, paging);
        } else if (filter == null || filter.isEmpty()) {
            // Filtro solo por estado
            pagedNoticias = noticiasService.findByEstadoWithPagination(estado, paging);
        } else {
            // Filtro por estado y búsqueda
            pagedNoticias = noticiasService.findByEstadoAndFilter(estado, filter, paging);
        }


        return new ResponseEntity<>(pagedNoticias, HttpStatus.OK);
    }



    // Endpoint para noticias archivadas con paginación, ordenación y filtrado por título o descripción
    @GetMapping("/archivadas/paginadas")
    public ResponseEntity<Page<Noticias>> paginacionNoticiasArchivadas(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "titulo") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection,
            @RequestParam(required = false) String filter) {

        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();

        Pageable paging = PageRequest.of(page, size, sort);
        Page<Noticias> noticiasArchivadas;

        if (filter != null && !filter.isEmpty()) {
            noticiasArchivadas = noticiasService.findByEstadoWithFilter("archivado", filter, paging);
        } else {
            noticiasArchivadas = noticiasService.findByEstadoWithPagination("archivado", paging);
        }

        if (noticiasArchivadas.hasContent()) {
            return new ResponseEntity<>(noticiasArchivadas, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }


    // Eliminar noticia
    @DeleteMapping("/{id_noticia}")
    public ResponseEntity<?> eliminacionNoticias(@PathVariable(value = "id_noticia") Long id_noticias) {
        if (noticiasService.findById(id_noticias).isPresent()) {
            noticiasService.delete(id_noticias);
            return new ResponseEntity<>(new MessageResponse("Noticia eliminada"), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new MessageResponse("Noticia no encontrada"), HttpStatus.NOT_FOUND);
        }
    }

    // Archivar noticia
    @PutMapping("/archivado/{id_noticia}")
    public ResponseEntity<?> noticiasArchivadas(@PathVariable(value = "id_noticia") Long id_noticias) {
        try {
            Optional<Noticias> noticiasOpt = noticiasService.findById(id_noticias);
            if (!noticiasOpt.isPresent()) {
                return new ResponseEntity<>(new MessageResponse("Noticia no encontrada"), HttpStatus.NOT_FOUND);
            }

            Noticias noticias = noticiasOpt.get();
            noticias.setEstado("archivado");

            noticiasService.save(noticias);
            return ResponseEntity.ok(new MessageResponse("Noticia archivada correctamente"));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Obtener noticias archivadas
    @GetMapping("/archivadas")
    public ResponseEntity<?> obtencionNoticiasArchivadas() {
        List<Noticias> noticiasArchivadas = noticiasService.findByEstado("archivado");
        if (noticiasArchivadas.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(noticiasArchivadas, HttpStatus.OK);
    }

    // Desarchivar una noticia
    @PutMapping("/desarchivado/{id_noticia}")
    public ResponseEntity<?> noticiasDesarcchivadas(@PathVariable(value = "id_noticia") Long id_noticias) {
        try {
            Optional<Noticias> noticiasOpt = noticiasService.findById(id_noticias);
            if (!noticiasOpt.isPresent()) {
                return new ResponseEntity<>(new MessageResponse("Noticia no encontrada"), HttpStatus.NOT_FOUND);
            }

            Noticias noticias = noticiasOpt.get();
            noticias.setEstado("publicado"); // O el estado que desees restaurar

            noticiasService.save(noticias);
            return ResponseEntity.ok(new MessageResponse("Noticia desarchivada correctamente"));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Obtener noticias por estado
    @GetMapping("/estado/{estado}")
    public ResponseEntity<?> obtencionNoticiasPorEstado(@PathVariable String estado) {
        List<Noticias> noticias = noticiasService.findByEstado(estado);
        if (noticias.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(noticias, HttpStatus.OK);
    }

}