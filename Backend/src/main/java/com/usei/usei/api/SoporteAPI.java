package com.usei.usei.api;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.usei.usei.controllers.SoporteService;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Soporte;
import com.usei.usei.models.TipoProblema;

@RestController
@RequestMapping("/soporte")
public class SoporteAPI {

    @Autowired
    private SoporteService soporteService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Soporte soporte) {
        try {
            Soporte newSoporte = new Soporte();
            newSoporte.setMensaje(soporte.getMensaje());
            newSoporte.setFecha(soporte.getFecha());
            
            // Vincular a una tipo de problema
            TipoProblema tipoProblema = new TipoProblema();
            tipoProblema.setIdProblema(soporte.getTipoProblemaIdProblema().getIdProblema());
            newSoporte.setTipoProblemaIdProblema(tipoProblema);
            // Vincular a un estudiante
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(soporte.getEstudianteIdEstudiante().getIdEstudiante());
            newSoporte.setEstudianteIdEstudiante(estudiante);

            soporteService.save(newSoporte);

            return new ResponseEntity<>(new MessageResponse("Mensaje de Soporte registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping
    public ResponseEntity<?> readAll() {
        try {
            return ResponseEntity.ok(soporteService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_soporte}")
    public ResponseEntity<?> readById(@PathVariable(value = "id_soporte") Long id) {
        try {
            Optional<Soporte> soporte = soporteService.findById(id);
            if (soporte.isPresent()) {
                return ResponseEntity.ok(soporte.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Mensaje de Soporte inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_soporte}")
    public ResponseEntity<?> update(@PathVariable(value = "id_soporte") Long id, @RequestBody Soporte soporte) {

        Optional<Soporte> oSoporte = soporteService.findById(id);
        if (oSoporte.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        try {
            oSoporte.get().setMensaje(soporte.getMensaje());
            oSoporte.get().setFecha(soporte.getFecha());
            
            // Vincular a una tipo de problema
            TipoProblema tipoProblema = new TipoProblema();
            tipoProblema.setIdProblema(soporte.getTipoProblemaIdProblema().getIdProblema());
            oSoporte.get().setTipoProblemaIdProblema(tipoProblema);
            // Vincular a un estudiante
            Estudiante estudiante = new Estudiante();
            estudiante.setIdEstudiante(soporte.getEstudianteIdEstudiante().getIdEstudiante());
            oSoporte.get().setEstudianteIdEstudiante(estudiante);

            return ResponseEntity.status(HttpStatus.CREATED).body(soporteService.save(oSoporte.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
