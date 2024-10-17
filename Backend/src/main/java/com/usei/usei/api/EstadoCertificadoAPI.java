package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.controllers.EstadoCertificadoService;
import com.usei.usei.models.Certificado;
import com.usei.usei.models.EstadoCertificado;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;


@RestController
@RequestMapping("/estado_certificado")
public class EstadoCertificadoAPI {
    @Autowired
    private EstadoCertificadoService estadoCertificadoService;

    // Crear un nuevo certificado
    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> create(@RequestParam("archivo") MultipartFile file,
            @RequestParam("estado") String estado,
            @RequestParam("fechaEstado") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaEstado,
            @RequestParam("certificadoIdCertificado") Long certificadoId,
            @RequestParam("estudianteIdEstudiante") Long estudianteId) {

        // Registramos la direccion del documento
        try {
            Path directorioFormatos = Paths.get("src//main//resources//static//documents/formatos");
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            // Convertir el archivo a byte[] para almacenar en la base de datos
            byte[] fileBytes = file.getBytes();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            Files.write(rutaCompleta, fileBytes);

            // Crear el objeto Estudiante y asignar los valores
            EstadoCertificado estadoCertificado = new EstadoCertificado();
            estadoCertificado.setArchivo(file.getOriginalFilename());
            estadoCertificado.setEstado(estado);
            estadoCertificado.setFechaEstado(fechaEstado);

            // Crear el objeto Estudiante y asignar el id
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(estudianteId);
            estadoCertificado.setEstudianteIdEstudiante(estudiante);

            // Crear el objeto Certificado y asignar el id
            Certificado certificado = new Certificado();
            certificado.setIdCertificado(certificadoId);
            estadoCertificado.setCertificadoIdCertificado(certificado);

            // Guardar el certificado en la base de datos
            estadoCertificadoService.save(estadoCertificado);

            return new ResponseEntity<>(new MessageResponse("Estado de certificado registrado exitosamente"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_estado_certificado}")
    public ResponseEntity<?> read(@PathVariable(value = "id_estado_certificado") Long id_estado_certificado) {
        Optional<EstadoCertificado> oEstadocertificado = estadoCertificadoService.findById(id_estado_certificado);

        return oEstadocertificado.map(estadoCertificado -> ResponseEntity.ok(estadoCertificado))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(estadoCertificadoService.findAll());
    }

    @PutMapping("/{id_estado_certificado}")
    public ResponseEntity<?> update(@PathVariable(value = "id_estado_certificado") Long id_estado_certificado,
    @RequestParam("archivo") MultipartFile file,
    @RequestParam("estado") String estado,
    @RequestParam("fechaEstado") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaEstado,
    @RequestParam("certificadoIdCertificado") Long certificadoId,
    @RequestParam("estudianteIdEstudiante") Long estudianteId) {

        Optional<EstadoCertificado> oEstadoCertificado = estadoCertificadoService.findById(id_estado_certificado);
        if (oEstadoCertificado.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        try {
            Path directorioFormatos = Paths.get("src//main//resources//static//documents/formatos");
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            // Convertir el archivo a byte[] para almacenar en la base de datos
            byte[] fileBytes = file.getBytes();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            Files.write(rutaCompleta, fileBytes);

            oEstadoCertificado.get().setArchivo(file.getOriginalFilename());
            oEstadoCertificado.get().setEstado(estado);
            oEstadoCertificado.get().setFechaEstado(fechaEstado);

            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(estudianteId);
            oEstadoCertificado.get().setEstudianteIdEstudiante(estudiante);

            Certificado certificado = new Certificado();
            certificado.setIdCertificado(certificadoId);
            oEstadoCertificado.get().setCertificadoIdCertificado(certificado);

            return ResponseEntity.status(HttpStatus.CREATED).body(estadoCertificadoService.save(oEstadoCertificado.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
/*
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
*/

}

