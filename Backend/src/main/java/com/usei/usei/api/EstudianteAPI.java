package com.usei.usei.api;

import java.util.HashMap;
import java.util.Optional;
import java.io.InputStreamReader;
import java.util.List;
import java.io.Reader;
import java.util.ArrayList;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;

import com.usei.usei.controllers.EstudianteService;
import com.usei.usei.dto.SuccessfulResponse;
import com.usei.usei.dto.UnsuccessfulResponse;
import com.usei.usei.dto.request.LoginRequestDTO;
import com.usei.usei.models.Estudiante;
//import com.usei.usei.models.MessageResponse;
import jakarta.mail.MessagingException;
import java.nio.charset.StandardCharsets;


@RestController
@RequestMapping("/estudiante")
public class EstudianteAPI {

    @Autowired
    private EstudianteService estudianteService;

    // Crear un nuevo estudiante
    @PostMapping
    public ResponseEntity<?> create(@RequestBody Estudiante estudiante) {
        estudiante.setEstadoInvitacion("No Completado");
        return ResponseEntity.status(HttpStatus.CREATED).body(estudianteService.save(estudiante));
    }

    // Obtener un estudiante por ID
    @GetMapping("/{id_estudiante}")
    public ResponseEntity<?> read(@PathVariable(value = "id_estudiante") Long id_estudiante) {
        Optional<Estudiante> oEstudiante = estudianteService.findById(id_estudiante);
        return oEstudiante.map(estudiante -> ResponseEntity.ok(estudiante))
                .orElse(ResponseEntity.notFound().build());
    }

    // Obtener todos los estudiantes
    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(estudianteService.findAll());
    }

    // Eliminar un estudiante por ID
    @DeleteMapping("/{id_estudiante}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_estudiante") Long id_estudiante) {
        Optional<Estudiante> oEstudiante = estudianteService.findById(id_estudiante);
        if (oEstudiante.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        estudianteService.deleteById(id_estudiante);
        return ResponseEntity.ok(oEstudiante);
    }

    // Actualizar un estudiante por ID
    @PutMapping("/{id_estudiante}")
    public ResponseEntity<?> update(@PathVariable(value = "id_estudiante") Long id_estudiante, @RequestBody Estudiante estudiante) {
        Optional<Estudiante> oEstudiante = estudianteService.findById(id_estudiante);
        if (oEstudiante.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Estudiante estudianteExistente = oEstudiante.get();

        // Actualizamos los campos necesarios
        estudianteExistente.setCi(estudiante.getCi());
        estudianteExistente.setNombre(estudiante.getNombre());

        if (estudiante.getApellido() == null || estudiante.getApellido().trim().isEmpty()) {
            estudianteExistente.setApellido("N/A");
        } else {
            estudianteExistente.setApellido(estudiante.getApellido());
        }

        if (estudiante.getCorreoInstitucional() == null || estudiante.getCorreoInstitucional().trim().isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("El campo correo institucional no puede estar vacío.");
        } else {
            estudianteExistente.setCorreoInstitucional(estudiante.getCorreoInstitucional());
        }

        estudianteExistente.setCorreoPersonal(estudiante.getCorreoPersonal());
        estudianteExistente.setCarrera(estudiante.getCarrera());
        estudianteExistente.setAsignatura(estudiante.getAsignatura());
        estudianteExistente.setTelefono(estudiante.getTelefono());
        estudianteExistente.setAnio(estudiante.getAnio());
        estudianteExistente.setSemestre(estudiante.getSemestre());

        // Asegurarse de que se está haciendo un "merge" y no una "insert"
        estudianteService.save(estudianteExistente);  // Hibernate debería detectar que es una actualización

        return ResponseEntity.ok(estudianteExistente);
    }




    // Inicio de sesión de estudiante
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequestDTO loginRequest) {
        Optional<Estudiante> estudiante = estudianteService.login(loginRequest.getCi(), loginRequest.getContrasena());

        if (estudiante.isPresent()) {
            Estudiante foundEstudiante = estudiante.get();
            

            // Crear la respuesta exitosa con los campos "ci", "correoInsitucional", "nombre" y "apellido"
            SuccessfulResponse response = new SuccessfulResponse(
                    "200 OK",
                    "Inicio de sesión correcto",
                    
                    new HashMap<String, Object>() {{
                        put("id_estudiante", foundEstudiante.getIdEstudiante()); // Incluyendo el id_estudiante en la respuesta
                        put("rol", "estudiante");
                        put("id_estudiante", estudiante.get().getIdEstudiante());
                        put("ci", estudiante.get().getCi());
                        put("correoInstitucional", estudiante.get().getCorreoInstitucional());
                        put("nombre", estudiante.get().getNombre());
                        put("apellido", estudiante.get().getApellido());
                        put("telefono", estudiante.get().getTelefono());
                    }}
                    

            );
            return ResponseEntity.ok(response);
        } else {
            // Crear la respuesta fallida en caso de credenciales incorrectas
            UnsuccessfulResponse response = new UnsuccessfulResponse(
                    "401 Unauthorized",
                    "Credenciales incorrectas",
                    "/estudiante/login"
            );
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }

    @PostMapping("/enviarEnlace")
    public ResponseEntity<?> enviarEnlaceCertificado() {
        try {
            // Llamamos al servicio para enviar los correos
            estudianteService.enviarCorreosEstudiantes();
            return new ResponseEntity<>("Correos enviados exitosamente", HttpStatus.OK);
        } catch (MessagingException e) {
            return new ResponseEntity<>("Error al enviar los correos: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            return new ResponseEntity<>("Error inesperado: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/upload-csv")
    public ResponseEntity<?> uploadEstudiantesCSV(@RequestParam("file") MultipartFile file) {
        try (
            Reader reader = new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8); // Asegúrate de leer en UTF-8
            CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withHeader());
        ) {
            List<Estudiante> estudiantes = new ArrayList<>();

            // Iterar sobre los registros del CSV
            for (CSVRecord csvRecord : csvParser) {
                Estudiante estudiante = new Estudiante();
                estudiante.setNombre(csvRecord.get("NOMBRE"));
                estudiante.setCi(Integer.parseInt(csvRecord.get("CI")));
                estudiante.setCarrera(csvRecord.get("CARRERA"));
                estudiante.setAsignatura(csvRecord.get("ASIGNATURA"));
                estudiante.setTelefono((int) Double.parseDouble(csvRecord.get("TELEFONO")));
                estudiante.setCorreoInstitucional(csvRecord.get("CORREOINSTITUCIONAL"));
                estudiante.setApellido("N/A"); // Valor predeterminado para apellido
                estudiante.setContrasena("123456"); // Valor predeterminado para la contraseña
                estudiante.setEstadoInvitacion("No Completado"); // Valor predeterminado para el estado de la invitación

                estudiantes.add(estudiante);
            }

            // Guardar todos los estudiantes en la base de datos
            List<Estudiante> savedEstudiantes = estudianteService.saveAll(estudiantes);

            // Retornar la lista de estudiantes guardados con sus IDs generados
            return ResponseEntity.status(HttpStatus.CREATED).body(savedEstudiantes);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Error al procesar el archivo CSV: " + e.getMessage());
        }
    }


}
