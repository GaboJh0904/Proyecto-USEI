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

import com.usei.usei.controllers.PlazoService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Plazo;
import com.usei.usei.models.Usuario;

@RestController
@RequestMapping("/plazo")
public class PlazoAPI {

    @Autowired
    private PlazoService plazoService;

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Plazo plazo) {
        try {
            Plazo newPlazo = new Plazo();
            newPlazo.setFechaFinalizacion(plazo.getFechaFinalizacion());
            newPlazo.setFechaModificacion(plazo.getFechaModificacion());
            newPlazo.setEstado(plazo.getEstado());

            
            // Vincular a una usuario
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(plazo.getUsuarioIdUsuario().getIdUsuario());
            newPlazo.setUsuarioIdUsuario(usuario);
            // Vincular a un encuesta

            plazoService.save(newPlazo);

            return new ResponseEntity<>(new MessageResponse("Plazo registrada"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping
    public ResponseEntity<?> readAll() {
        try {
            return ResponseEntity.ok(plazoService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_plazo}")
    public ResponseEntity<?> readById(@PathVariable(value = "id_plazo") Long id) {
        try {
            Optional<Plazo> plazo = plazoService.findById(id);
            if (plazo.isPresent()) {
                return ResponseEntity.ok(plazo.get());
            } else {
                return new ResponseEntity<>(new MessageResponse("Plazo inexistente"), HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id_plazo}")
    public ResponseEntity<?> update(@PathVariable(value = "id_plazo") Long id, @RequestBody Plazo plazo) {

        Optional<Plazo> oPlazo = plazoService.findById(id);
        if (oPlazo.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        try {
            oPlazo.get().setFechaFinalizacion(plazo.getFechaFinalizacion());
            oPlazo.get().setFechaModificacion(plazo.getFechaModificacion());
            oPlazo.get().setEstado(plazo.getEstado());

            // Vincular a un usuario
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(plazo.getUsuarioIdUsuario().getIdUsuario());
            oPlazo.get().setUsuarioIdUsuario(usuario);

            return ResponseEntity.status(HttpStatus.CREATED).body(plazoService.save(oPlazo.get()));
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}