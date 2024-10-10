package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.controllers.NoticiasService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Noticias;
import com.usei.usei.models.Usuario;

import java.util.Date;
import java.util.List;
import java.util.Optional;
@RestController
@RequestMapping("/noticia")
public class NoticiasAPI {
    @Autowired
    private NoticiasService noticiasService;

    // Crear una nueva noticia
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> create(
            @RequestParam("img") MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(pattern = "dd-MM-yyyy") Date fechaModificado,
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
    public ResponseEntity<?> update(
            @PathVariable(value = "id_noticia") Long id_noticias,
            @RequestParam(value = "img", required = false) MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(pattern = "dd-MM-yyyy") Date fechaModificado,
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
    public ResponseEntity<?> read(@PathVariable(value = "id_noticia") Long id_noticias) {
        Optional<Noticias> oNoticias = noticiasService.findById(id_noticias);

        return oNoticias.map(noticias -> ResponseEntity.ok(noticias))
                .orElse(ResponseEntity.notFound().build());
    }

    // Obtener noticias para el carrusel
    @GetMapping("/carrusel")
    public ResponseEntity<?> getNoticiasForCarrusel() {
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

    // Paginación para noticias existentes
    @GetMapping
    public ResponseEntity<Page<Noticias>> readAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {

        Pageable paging = PageRequest.of(page, size);
        Page<Noticias> pagedNoticias = noticiasService.findAll(paging);

        if (pagedNoticias.hasContent()) {
            return new ResponseEntity<>(pagedNoticias, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }

    // Paginación para noticias archivadas
    @GetMapping("/archivadas/paginadas")
    public ResponseEntity<Page<Noticias>> getArchivedNewsPaginated(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {

        try {
            Pageable paging = PageRequest.of(page, size);
            Page<Noticias> noticiasArchivadas = noticiasService.findByEstadoWithPagination("archivado", paging);

            if (noticiasArchivadas.hasContent()) {
                return new ResponseEntity<>(noticiasArchivadas, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
        } catch (Exception e) {
            // Cambia el bloque catch para devolver una respuesta vacía o un mensaje de error
            return new ResponseEntity<>(Page.empty(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Eliminar noticia
    @DeleteMapping("/{id_noticia}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_noticia") Long id_noticias) {
        if (noticiasService.findById(id_noticias).isPresent()) {
            noticiasService.delete(id_noticias);
            return new ResponseEntity<>(new MessageResponse("Noticia eliminada"), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new MessageResponse("Noticia no encontrada"), HttpStatus.NOT_FOUND);
        }
    }

    // Archivar noticia
    @PutMapping("/archivar/{id_noticia}")
    public ResponseEntity<?> archiveNoticia(@PathVariable(value = "id_noticia") Long id_noticias) {
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
    public ResponseEntity<?> getArchivedNews() {
        List<Noticias> noticiasArchivadas = noticiasService.findByEstado("archivado");
        if (noticiasArchivadas.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(noticiasArchivadas, HttpStatus.OK);
    }

    // Desarchivar una noticia
    @PutMapping("/desarchivar/{id_noticia}")
    public ResponseEntity<?> desarchivarNoticia(@PathVariable(value = "id_noticia") Long id_noticias) {
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
    public ResponseEntity<?> getByEstado(@PathVariable String estado) {
        List<Noticias> noticias = noticiasService.findByEstado(estado);
        if (noticias.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(noticias, HttpStatus.OK);
    }

}
