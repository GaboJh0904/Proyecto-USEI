package com.usei.usei.api;

import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.controllers.EstadoCertificadoService;
import com.usei.usei.controllers.EstadoEncuestaService;
import com.usei.usei.controllers.EstudianteBL;
import com.usei.usei.controllers.EstudianteService;
import com.usei.usei.dto.SuccessfulResponse;
import com.usei.usei.dto.UnsuccessfulResponse;
import com.usei.usei.dto.request.LoginRequestDTO;
import com.usei.usei.models.EstadoCertificado;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.LoginResponse;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.util.TokenGenerator;

import jakarta.mail.MessagingException;


@RestController
@RequestMapping("/estudiante")
public class EstudianteAPI {
    @Autowired
private EstadoCertificadoService estadoCertificadoService;

@Autowired
private EstadoEncuestaService estadoEncuestaService;


    @Autowired
    private EstudianteService estudianteService;

    @Autowired
    private TokenGenerator tokenGenerator;


    @Autowired
    private EstudianteBL estudianteBL;

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

    @PutMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestParam Long idEstudiante, @RequestBody HashMap<String, String> passwordData) {
        Optional<Estudiante> oEstudiante = estudianteService.findById(idEstudiante);
        if (oEstudiante.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        oEstudiante.get().setContrasena(passwordData.get("newPassword"));
        estudianteService.save(oEstudiante.get());

        return ResponseEntity.ok("Contraseña actualizada exitosamente.");
    }

    //Verificacion de Estudiante existente
    @PostMapping("/existing-student")
    public ResponseEntity<?> existingStudent(@RequestBody HashMap<String, Integer> ci) {
        Optional<Estudiante> oEstudiante = estudianteService.existingStudent(ci.get("ci"));
        if (oEstudiante.isPresent()) {
            UnsuccessfulResponse response = new UnsuccessfulResponse(
                    "409 Conflict",
                    "Estudiante ya registrado",
                    "/estudiante/existing-student"
            );
            return ResponseEntity.status(HttpStatus.CONFLICT).body(response);
        } else {
            return ResponseEntity.ok("Estudiante no registrado");
        }
    }

    // Inicio de sesión de estudiante
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequestDTO loginRequest) {
        try{
            Optional<Estudiante> estudiante = estudianteService.login(loginRequest.getCi(), loginRequest.getContrasena());
            if (estudiante.isPresent()) {
                estudiante.get().setContrasena(null); // No enviar la contraseña en la respuesta
                Estudiante foundEstudiante = estudiante.get();
                String token = tokenGenerator.generateToken(String.valueOf(estudiante.get().getIdEstudiante()), "estudiante", estudiante.get().getCorreoInstitucional(), 60);

                // Crear un mapa con los datos específicos del estudiante
                Map<String, Object> data = new HashMap<>();
                data.put("id_estudiante", foundEstudiante.getIdEstudiante());
                data.put("rol", "estudiante");
                data.put("ci", estudiante.get().getCi());
                data.put("correoInstitucional", estudiante.get().getCorreoInstitucional());
                data.put("nombre", estudiante.get().getNombre());
                data.put("apellido", estudiante.get().getApellido());
                data.put("telefono", estudiante.get().getTelefono());

                // Crear la respuesta exitosa con los campos "ci", "correoInsitucional", "nombre" y "apellido"
                SuccessfulResponse response = new SuccessfulResponse(
                        "200 OK",
                        "Inicio de sesión correcto",
                        token,
                        60,
                        data
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
        } catch (Exception e) {
            return new ResponseEntity<>(new LoginResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
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
                Optional<Estudiante> oEstudiante = estudianteService.existingStudent(Integer.parseInt(csvRecord.get("ci")));
                if (oEstudiante.isEmpty()) {
                    Estudiante estudiante = new Estudiante();
                    estudiante.setCi(Integer.parseInt(csvRecord.get("ci")));
                    estudiante.setNombre(csvRecord.get("nombre"));
                    estudiante.setApellido(csvRecord.get("apellido"));
                    estudiante.setCorreoInstitucional(csvRecord.get("correo_institucional"));
                    estudiante.setCorreoPersonal(csvRecord.get("correo_personal"));
                    estudiante.setCarrera(csvRecord.get("carrera"));
                    estudiante.setAsignatura(csvRecord.get("asignatura"));
                    estudiante.setTelefono((int) Double.parseDouble(csvRecord.get("telefono")));
                    estudiante.setAnio(Integer.parseInt(csvRecord.get("anio")));
                    estudiante.setSemestre(Integer.parseInt(csvRecord.get("semestre")));
                    estudiante.setContrasena("123456"); // Valor predeterminado para la contraseña
                    estudiante.setEstadoInvitacion("No Completado"); // Valor predeterminado para el estado de la invitación

                    estudiantes.add(estudiante);
                }
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

    @PostMapping("/enviarCodigoVerificacion/{correo}")
    public ResponseEntity<?> enviarCodigoVerificacion(@PathVariable(value = "correo") String correo) {
        try {

            Long idEstudiante = estudianteService.findByCorreoInst(correo);
            // Verificar si el idEstudiante es igual a 0 y devolver un error
            if (idEstudiante == 0) {
                return new ResponseEntity<>("No se encontró un estudiante con ese correo.", HttpStatus.NOT_FOUND);
            }

            // Llamamos al servicio para enviar el código de verificación
            estudianteService.enviarCodigoVerificacion(correo);

            // Devolver el código de verificación en la respuesta
            String codigoVerificacion = estudianteService.obtenerCodigoVerificacion(); // Método que obtiene el código

            // Enviar el código también al frontend
            return new ResponseEntity<>(new HashMap<String, Object>() {{
                put("mensaje", "Código de verificación enviado exitosamente");
                put("codigoVerificacion", codigoVerificacion); // Este es el código enviado al correo
                put("idEstudiante", idEstudiante);
            }}, HttpStatus.OK);
        } catch (MessagingException e) {
            return new ResponseEntity<>("Error al enviar el código de verificación: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            return new ResponseEntity<>("Error inesperado: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping
    public ResponseEntity<org.springframework.data.domain.Page<Estudiante>> getEstudiantes(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String filter,
            @RequestParam(defaultValue = "nombre") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection) {

        // Configurar la dirección del orden (ascendente o descendente)
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();

        // Configurar la paginación con el tamaño de página y la dirección de ordenación
        Pageable pageable = PageRequest.of(page, size, sort);

        org.springframework.data.domain.Page<Estudiante> pagedEstudiantes;

        // Si el filtro no está vacío, decidir si buscar por nombre o por ci
        if (filter != null && !filter.isEmpty()) {
            try {
                // Intentar convertir el filtro a un número
                Integer ci = Integer.parseInt(filter);
                // Buscar por CI si el filtro es un número
                pagedEstudiantes = estudianteService.findByCi(ci, pageable);
            } catch (NumberFormatException e) {
                // Si no es un número, buscar por nombre
                pagedEstudiantes = estudianteService.findByNombre(filter, pageable);
            }
        } else {
            // Sin filtro, buscar todos los estudiantes
            pagedEstudiantes = estudianteService.findAll(pageable);
        }

        if (pagedEstudiantes.hasContent()) {
            return new ResponseEntity<>(pagedEstudiantes, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
    }

    @GetMapping("/no_completaron_encuesta")
    public ResponseEntity<?> getEstudiantesNoCompletaronEncuesta(
        @RequestParam(required = false) Integer anio,
        @RequestParam(required = false) Integer semestre) {
        try {
            List<Estudiante> estudiantes = estudianteService.findNoCompletaronEncuestaByAnioAndSemestre(anio, semestre);
            return ResponseEntity.ok(estudiantes);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/opciones_filtro")
public ResponseEntity<?> getOpcionesFiltro() {
    try {
        List<Integer> anios = estudianteService.findDistinctAnios();
        List<Integer> periodos = estudianteService.findDistinctSemestres();
        Map<String, List<Integer>> opciones = new HashMap<>();
        opciones.put("anios", anios);
        opciones.put("periodos", periodos);
        return ResponseEntity.ok(opciones);
    } catch (Exception e) {
        return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
    }
}


    // Obtener ci y correo institucional para estudiantes registrados
    @PutMapping("/update-ci-correo/{id_estudiante}")
    public ResponseEntity<?> updateCiAndCorreo(@PathVariable(value = "id_estudiante") Long idEstudiante,
                                               @RequestBody HashMap<String, Object> fields) {
        Optional<Estudiante> oEstudiante = estudianteService.findById(idEstudiante);
        if (oEstudiante.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Estudiante estudianteExistente = oEstudiante.get();

        // Validar y actualizar los campos ci y correoInstitucional
        if (fields.containsKey("ci") && fields.get("ci") instanceof Integer) {
            estudianteExistente.setCi((Integer) fields.get("ci"));
        }

        if (fields.containsKey("correoInstitucional") && fields.get("correoInstitucional") instanceof String) {
            estudianteExistente.setCorreoInstitucional((String) fields.get("correoInstitucional"));
        }

        // Guardar los cambios
        estudianteService.save(estudianteExistente);
        return ResponseEntity.ok(estudianteExistente);
    }

    @GetMapping("/countByGeneroAndAnio")
    public ResponseEntity<?> countByGeneroAndAnio(@RequestParam(required = false) Integer anio) {
        List<Object[]> results = estudianteService.getEstudiantesCompletaronEncuestaByGeneroAndAnio(anio);
        return ResponseEntity.ok(results);
    }    
    //filtrpo de anio en estado_encuesta para el reportes de dashboard
    @GetMapping("/anios_unicos")
    public ResponseEntity<List<Integer>> getUniqueYears() {
        List<Integer> uniqueYears = estudianteService.findUniqueYears();
        return ResponseEntity.ok(uniqueYears);
    }

    @GetMapping("/por-carrera")
public ResponseEntity<?> getEstudiantesPorCarrera(
        @RequestParam String carrera,
        @RequestParam(required = false) String estadoCertificado,
        @RequestParam(required = false) String estadoEncuesta,
        @RequestParam(required = false) String searchQuery) {

    try {
        List<Estudiante> estudiantes = estudianteService.findByCarrera(carrera);

        // Filtrar por estado del certificado si se proporciona
        if (estadoCertificado != null && !estadoCertificado.isEmpty()) {
            estudiantes = estudiantes.stream()
                    .filter(estudiante -> {
                        Optional<EstadoCertificado> estado = estadoCertificadoService.findByEstudianteId(estudiante.getIdEstudiante());
                        return estado.isPresent() && estado.get().getEstado().equalsIgnoreCase(estadoCertificado);
                    })
                    .toList();
        }

        // Filtrar por estado de la encuesta si se proporciona
        if (estadoEncuesta != null && !estadoEncuesta.isEmpty()) {
            estudiantes = estudiantes.stream()
                    .filter(estudiante -> {
                        Optional<EstadoEncuesta> estado = estadoEncuestaService.findByEstudianteIdEstudiante(estudiante.getIdEstudiante());
                        return estado.isPresent() && estado.get().getEstado().equalsIgnoreCase(estadoEncuesta);
                    })
                    .toList();
        }

        // Filtrar por búsqueda de nombre o apellido
        if (searchQuery != null && !searchQuery.isEmpty()) {
            estudiantes = estudiantes.stream()
                    .filter(estudiante -> estudiante.getNombre().toLowerCase().contains(searchQuery.toLowerCase()) ||
                            estudiante.getApellido().toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList();
        }

        if (!estudiantes.isEmpty()) {
            return ResponseEntity.ok(estudiantes);
        } else {
            return ResponseEntity.noContent().build();
        }
    } catch (Exception e) {
        e.printStackTrace();
        return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);


    }
  }
    


}