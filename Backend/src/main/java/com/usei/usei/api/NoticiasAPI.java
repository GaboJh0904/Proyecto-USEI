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

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("/noticia")
public class NoticiasAPI {
    @Autowired
    private NoticiasService noticiasService;

    // Crear una nueva noticia:
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> create(@RequestParam("img") MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificado,
            @RequestParam("estado") String estado,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        try {
            Path directorioFormatos = Paths.get("src//main//resources//static//documents/imagenes");
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            // Convertir el archivo a byte[] para almacenar en la base de datos
            byte[] fileBytes = file.getBytes();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            Files.write(rutaCompleta, fileBytes);

            Noticias noticias = new Noticias();
            noticias.setImg(file.getOriginalFilename());
            noticias.setTitulo(titulo);
            noticias.setDescripcion(descripcion);
            noticias.setFechaModificado(fechaModificado);
            noticias.setEstado(estado);

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);

            noticias.setUsuarioIdUsuario(usuario);
            noticiasService.save(noticias);
            return new ResponseEntity<>(new MessageResponse("Noticia registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_noticia}")
    public ResponseEntity<?> read(@PathVariable(value = "id_noticia") Long id_noticias) {
        Optional<Noticias> oNoticias = noticiasService.findById(id_noticias);

        return oNoticias.map(noticias -> ResponseEntity.ok(noticias))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(noticiasService.findAll());
    }

    @PutMapping("/{id_noticia}")
    public ResponseEntity<?> update(@PathVariable(value = "id_noticia") Long id_noticias,
            @RequestParam("img") MultipartFile file,
            @RequestParam("titulo") String titulo,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("fechaModificado") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificado,
            @RequestParam("estado") String estado,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        Optional<Noticias> oNoticias = noticiasService.findById(id_noticias);
        if (oNoticias.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        try {
            Path directorioFormatos = Paths.get("src//main//resources//static//documents/imagenes");
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            // Convertir el archivo a byte[] para almacenar en la base de datos
            byte[] fileBytes = file.getBytes();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            Files.write(rutaCompleta, fileBytes);

            oNoticias.get().setImg(file.getOriginalFilename());
            oNoticias.get().setTitulo(titulo);
            oNoticias.get().setDescripcion(descripcion);
            oNoticias.get().setFechaModificado(fechaModificado);
            oNoticias.get().setEstado(estado);

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);

            oNoticias.get().setUsuarioIdUsuario(usuario);

            return ResponseEntity.status(HttpStatus.CREATED).body(noticiasService.save(oNoticias.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
