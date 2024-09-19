package com.usei.usei.api;

import com.usei.usei.dto.request.LoginRequestDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.EstudianteService;
import com.usei.usei.models.Estudiante;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/estudiante")
public class EstudianteAPI{

    @Autowired
    private EstudianteService estudianteService;

    //Crear un nuevo estudiante:
    @PostMapping
    public ResponseEntity<?> create (@RequestBody Estudiante estudiante){
        return ResponseEntity.status(HttpStatus.CREATED).body(estudianteService.save(estudiante));
    }

    @GetMapping("/{id_estudiante}")
    public ResponseEntity<?> read(@PathVariable(value = "id_estudiante") Long id_estudiante) {
    Optional<Estudiante> oEstudiante = estudianteService.findById(id_estudiante);
    
    return oEstudiante.map(estudiante -> ResponseEntity.ok(estudiante))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(estudianteService.findAll());
    }

    @DeleteMapping("/{id_estudiante}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_estudiante") Long id_estudiante){
        Optional<Estudiante> oEstudiante = estudianteService.findById(id_estudiante);
        if(oEstudiante.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        estudianteService.deleteById(id_estudiante);
        return ResponseEntity.ok(oEstudiante);
    }

    @PutMapping("/{id_estudiante}")
    public ResponseEntity<?> update(@PathVariable(value = "id_estudiante") Long id_estudiante, @RequestBody Estudiante estudiante){
        Optional<Estudiante> oEstudiante = estudianteService.findById(id_estudiante);
        if(oEstudiante.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        oEstudiante.get().setCi(estudiante.getCi());
        oEstudiante.get().setNombre(estudiante.getNombre());
        oEstudiante.get().setApellido(estudiante.getApellido());
        oEstudiante.get().setCorreoInsitucional(estudiante.getCorreoInsitucional());
        oEstudiante.get().setCorreoPersonal(estudiante.getCorreoPersonal());
        oEstudiante.get().setCarrera(estudiante.getCarrera());
        oEstudiante.get().setAsignatura(estudiante.getAsignatura());
        oEstudiante.get().setTelefono(estudiante.getTelefono());
        oEstudiante.get().setAnio(estudiante.getAnio());
        oEstudiante.get().setSemestre(estudiante.getSemestre());
        return ResponseEntity.status(HttpStatus.CREATED).body(estudianteService.save(oEstudiante.get()));
    }


    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequestDTO loginRequest) {
        Optional<Estudiante> estudiante = estudianteService.login(loginRequest.getCi(), loginRequest.getContrasena());

        if (estudiante.isPresent()) {
            // Crear el objeto de respuesta con los campos "rol", "code" y "message"
            Map<String, Object> response = new HashMap<>();
            response.put("rol", "estudiante");
            response.put("code", 200); // Código HTTP 200 para éxito
            response.put("message", "Inicio de sesión correcto");

            // Devolver la respuesta con el código HTTP 200 OK
            return ResponseEntity.ok(response);
        } else {
            // Crear el objeto de respuesta para credenciales incorrectas
            Map<String, Object> response = new HashMap<>();
            response.put("code", 401); // Código HTTP 401 para no autorizado
            response.put("message", "Credenciales incorrectas");

            // Devolver la respuesta con el código HTTP 401 Unauthorized
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
    }

}
