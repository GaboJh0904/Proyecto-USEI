package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.controllers.CertificadoService;
import com.usei.usei.models.Certificado;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Usuario;
import jakarta.mail.MessagingException;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;

@RestController
@RequestMapping("/certificado")
public class CertificadoAPI {
    @Autowired
    private CertificadoService certificadoService;

    // Crear un nuevo certificado
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> create(@RequestParam("formato") MultipartFile file,
            @RequestParam("version") int version,
            @RequestParam("fechaModificacion") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificacion,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        // Registramos la direccion del documento
        try {
            Path directorioFormatos = Paths.get("src//main//resources//static//documents/formatos");
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            // Convertir el archivo a byte[] para almacenar en la base de datos
            byte[] fileBytes = file.getBytes();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            Files.write(rutaCompleta, fileBytes);

            // Crear el objeto Certificado y asignar los valores
            Certificado certificado = new Certificado();
            certificado.setFormato(file.getOriginalFilename());
            certificado.setVersion(version);
            certificado.setFechaModificacion(fechaModificacion);

            // Crear el objeto Usuario y asignar el id
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            certificado.setUsuarioIdUsuario(usuario);

            // Guardar el certificado en la base de datos
            certificadoService.save(certificado);

            return new ResponseEntity<>(new MessageResponse("Certificado registrado exitosamente"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_certificado}")
    public ResponseEntity<?> read(@PathVariable(value = "id_certificado") Long id_certificado) {
        Optional<Certificado> oCertificado = certificadoService.findById(id_certificado);

        return oCertificado.map(certificado -> ResponseEntity.ok(certificado))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(certificadoService.findAll());
    }

    @PutMapping("/{id_certificado}")
    public ResponseEntity<?> update(@PathVariable(value = "id_certificado") Long id_certificado,
            @RequestParam("formato") MultipartFile file,
            @RequestParam("version") int version,
            @RequestParam("fechaModificacion") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificacion,
            @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        Optional<Certificado> oCertificado = certificadoService.findById(id_certificado);
        if (oCertificado.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        try {
            Path directorioFormatos = Paths.get("src//main//resources//static//documents/formatos");
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            // Convertir el archivo a byte[] para almacenar en la base de datos
            byte[] fileBytes = file.getBytes();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            Files.write(rutaCompleta, fileBytes);

            oCertificado.get().setFormato(file.getOriginalFilename());
            oCertificado.get().setVersion(version);
            oCertificado.get().setFechaModificacion(fechaModificacion);

            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            oCertificado.get().setUsuarioIdUsuario(usuario);

            return ResponseEntity.status(HttpStatus.CREATED).body(certificadoService.save(oCertificado.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/enviar")
    public ResponseEntity<?> enviarCertificado() {
        try {
    
            String asunto = "Certificado Académico";
            String mensaje = "Estimado estudiante, adjunto encontrarás tu certificado académico.";
            String attachmentPath = "C:\\Users\\Usuario\\taller_soft\\Proyecto-USEI\\Backend\\src\\main\\resources\\static\\documents\\formatos\\Prueba1.pdf";
            String correo = "willy.vargas@ucb.edu.bo"; 
            certificadoService.sendCertificadoEmail(correo, asunto, mensaje, attachmentPath);

            return new ResponseEntity<>(new MessageResponse("Certificado enviado exitosamente a " + correo), HttpStatus.OK);
        } catch (MessagingException e) {
            return new ResponseEntity<>(new MessageResponse("Error al enviar el certificado: " + e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    
}
