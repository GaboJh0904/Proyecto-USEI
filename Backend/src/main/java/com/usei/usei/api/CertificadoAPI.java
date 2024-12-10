package com.usei.usei.api;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Optional;
import org.springframework.data.domain.Sort;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.controllers.CertificadoService;
import com.usei.usei.models.Certificado;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Usuario;

import jakarta.mail.MessagingException;

@RestController
@RequestMapping("/certificado")
public class CertificadoAPI {
    @Autowired
    private CertificadoService certificadoService;

    // Crear un nuevo certificado
    // @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    // public ResponseEntity<?> create(@RequestParam("formato") MultipartFile file,
    //         @RequestParam("version") int version,
    //         @RequestParam("fechaModificacion") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fechaModificacion,
    //         @RequestParam("UsuarioIdUsuario") Long usuarioId) {

    //     // Registramos la direccion del documento
    //     try {
    //         Path directorioFormatos = Paths.get("src//main//resources//static//documents/formatos");
    //         String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
    //         // Convertir el archivo a byte[] para almacenar en la base de datos
    //         byte[] fileBytes = file.getBytes();
    //         Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
    //         Files.write(rutaCompleta, fileBytes);

    //         // Crear el objeto Certificado y asignar los valores
    //         Certificado certificado = new Certificado();
    //         certificado.setFormato(file.getOriginalFilename());
    //         certificado.setVersion(version);
    //         certificado.setFechaModificacion(fechaModificacion);

    //         // Crear el objeto Usuario y asignar el id
    //         Usuario usuario = new Usuario();
    //         usuario.setIdUsuario(usuarioId);
    //         certificado.setUsuarioIdUsuario(usuario);

    //         // Guardar el certificado en la base de datos
    //         certificadoService.save(certificado);

    //         return new ResponseEntity<>(new MessageResponse("Certificado registrado exitosamente"), HttpStatus.CREATED);
    //     } catch (Exception e) {
    //         return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
    //     }
    // }

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> create(@RequestParam("formato") MultipartFile file,
                                    @RequestParam("UsuarioIdUsuario") Long usuarioId) {

        System.out.println("ID de usuario recibido: " + usuarioId);  // Depuración

        // Asegúrate de que usuarioId no sea null
        if (usuarioId == null) {
            return new ResponseEntity<>(new MessageResponse("El ID del usuario no puede ser nulo"), HttpStatus.BAD_REQUEST);
        }
    
        try {
            // Verificar si la carpeta /formatos existe, si no, crearla
            Path directorioFormatos = Paths.get("src/main/resources/static/documents/formatos");
            if (!Files.exists(directorioFormatos)) {
                Files.createDirectories(directorioFormatos);  // Crear directorio si no existe
            }
    
            // Obtener la ruta absoluta y guardar el archivo PDF
            String rutaAbsoluta = directorioFormatos.toFile().getAbsolutePath();
            Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + file.getOriginalFilename());
            
            System.out.println("Ruta completa del archivo: " + rutaCompleta.toString());  // <-- Depuración
            Files.write(rutaCompleta, file.getBytes());
    
            // Crear nuevo certificado
            Certificado certificado = new Certificado();
            certificado.setFormato(file.getOriginalFilename());  // Guardar solo el nombre del archivo
            certificado.setVersion(certificadoService.obtenerUltimaVersion() + 1);  // Autoincrementar versión
            certificado.setEstado("Suspendido");  // Estado predefinido
            certificado.setFechaModificacion(new Date());
    
            // Asignar el ID del usuario que hizo el registro
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(usuarioId);
            certificado.setUsuarioIdUsuario(usuario);
    
            // Guardar en la base de datos
            certificadoService.save(certificado);
    
            System.out.println("Certificado guardado con éxito");  // <-- Depuración
    
            return new ResponseEntity<>(new MessageResponse("Certificado registrado exitosamente"), HttpStatus.CREATED);
        } catch (Exception e) {
            System.err.println("Error al registrar el certificado: " + e.getMessage());  // <-- Depuración de errores
            return new ResponseEntity<>(new MessageResponse("Error al registrar el certificado: " + e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    


    @GetMapping("/{id_certificado}")
    public ResponseEntity<?> read(@PathVariable(value = "id_certificado") Long id_certificado) {
        Optional<Certificado> oCertificado = certificadoService.findById(id_certificado);

        return oCertificado.map(certificado -> ResponseEntity.ok(certificado))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
public ResponseEntity<?> readAll(
        @RequestParam(defaultValue = "idCertificado") String sortBy,
        @RequestParam(defaultValue = "ASC") String sortType) {

    Sort sort = sortType.equalsIgnoreCase("ASC")
            ? Sort.by(sortBy).ascending()
            : Sort.by(sortBy).descending();

    Iterable<Certificado> certificados = certificadoService.findAll(sort);

    return ResponseEntity.ok(certificados);
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

    @PostMapping("/remision")
    public ResponseEntity<?> enviarCertificado(@RequestParam("idEstudiante") Long idEstudiante) {
        System.out.println("idEstudiante recibido: " + idEstudiante);
        try {
            // Llamar a la función que gestiona el envío y verifica los estados
            certificadoService.enviarCertificadoConCondiciones(idEstudiante);

            return new ResponseEntity<>(new MessageResponse("Certificado enviado correctamente si se cumplieron las condiciones."), HttpStatus.OK);
        } catch (MessagingException e) {
            return new ResponseEntity<>(new MessageResponse("Error al enviar el certificado: " + e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse("Error inesperado: " + e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    // Actualizar el estado de un certificado
    @PutMapping("/{id_certificado}/estado")
    public ResponseEntity<?> updateCertificadoState(@PathVariable(value = "id_certificado") Long idCertificado,
                                                    @RequestBody Certificado certificado) {
        Optional<Certificado> existingCertificado = certificadoService.findById(idCertificado);

        if (existingCertificado.isPresent()) {
            Certificado certificadoToUpdate = existingCertificado.get();

            // Si el estado del certificado cambia a "En uso", verificar que no haya otro "En uso"
            if ("En uso".equals(certificado.getEstado())) {
                Optional<Certificado> certificadoEnUso = certificadoService.findCertificadoEnUso();
                if (certificadoEnUso.isPresent() && !certificadoEnUso.get().getIdCertificado().equals(idCertificado)) {
                    return new ResponseEntity<>(new MessageResponse("Ya hay otro archivo en uso."), HttpStatus.CONFLICT);
                }
            }

            // Actualizar el estado del certificado
            certificadoToUpdate.setEstado(certificado.getEstado());
            certificadoService.save(certificadoToUpdate);

            return new ResponseEntity<>(new MessageResponse("Estado actualizado correctamente"), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(new MessageResponse("Certificado no encontrado"), HttpStatus.NOT_FOUND);
        }
    }



    
}
