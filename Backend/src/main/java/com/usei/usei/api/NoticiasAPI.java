package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
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

    // Crear una nueva noticia:
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> create(
            @RequestParam("img") MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificado,
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

    // Obtener una noticia por ID
    @GetMapping("/{id_noticia}")
    public ResponseEntity<?> read(@PathVariable(value = "id_noticia") Long id_noticias) {
        Optional<Noticias> oNoticias = noticiasService.findById(id_noticias);

        return oNoticias.map(noticias -> ResponseEntity.ok(noticias))
                .orElse(ResponseEntity.notFound().build());
    }

    // Obtener todas las noticias
    @GetMapping
    public ResponseEntity<Object> readAll() {
        List<Noticias> noticias = (List<Noticias>) noticiasService.findAll();
        return ResponseEntity.ok(noticias);
    }

    // Actualizar una noticia
    @PutMapping("/{id_noticia}")
    public ResponseEntity<?> update(
            @PathVariable(value = "id_noticia") Long id_noticias,
            @RequestParam(value = "img", required = false) MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificado,
            @RequestParam("estado") String estado,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Optional<Noticias> noticiasOpt = noticiasService.findById(id_noticias);
            if (!noticiasOpt.isPresent()) {
                return new ResponseEntity<>(new MessageResponse("Noticia no encontrada"), HttpStatus.NOT_FOUND);
            }

            Noticias noticias = noticiasOpt.get();

            // Actualizar los campos de la noticia
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

}
