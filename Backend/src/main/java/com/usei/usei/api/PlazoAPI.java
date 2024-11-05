package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.PlazoService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Plazo;
import com.usei.usei.models.Usuario;
import com.usei.usei.controllers.UsuarioService;

import java.util.Optional;

@RestController
@RequestMapping("/plazo")
public class PlazoAPI {

    @Autowired
    private PlazoService plazoService;

    @Autowired
    private UsuarioService usuarioService;

    // Endpoint to create a new Plazo
    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Plazo plazo) {
        try {
            if (usuarioService.findById(plazo.getUsuarioIdUsuario().getIdUsuario()).isEmpty()) {
                return new ResponseEntity<>(new MessageResponse("Usuario no encontrado"), HttpStatus.NOT_FOUND);
            }
            
            plazoService.save(plazo);
            return new ResponseEntity<>(new MessageResponse("Plazo registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Endpoint to retrieve all Plazos with pagination
    @GetMapping("/all")
    public ResponseEntity<?> readAll(
        @RequestParam(defaultValue = "0") int page,
        @RequestParam(defaultValue = "5") int size,
        @RequestParam(defaultValue = "fechaModificacion") String sortBy,
        @RequestParam(defaultValue = "asc") String sortDirection
    ) {
        try {
            Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name())
                        ? Sort.by(sortBy).ascending()
                        : Sort.by(sortBy).descending();
            Pageable pageable = PageRequest.of(page, size, sort);
            Page<Plazo> paginatedPlazos = plazoService.findAll(pageable);

            return ResponseEntity.ok(paginatedPlazos);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Existing endpoint to fetch a specific Plazo by ID
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
}
