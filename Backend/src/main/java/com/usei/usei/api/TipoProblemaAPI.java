package com.usei.usei.api;

import com.usei.usei.controllers.TipoProblemaService;
import com.usei.usei.models.TipoProblema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/tipo_problema")
public class TipoProblemaAPI {

    @Autowired
    private TipoProblemaService tipoProblemaService;

    // Crear un nuevo tipo de Problema:
    @PostMapping
    public ResponseEntity<?> create(@RequestBody TipoProblema tipoProblema) {
        return ResponseEntity.status(HttpStatus.CREATED).body(tipoProblemaService.save(tipoProblema));
    }

    @GetMapping("/{id_tipo_problema}")
    public ResponseEntity<?> read(@PathVariable(value = "id_tipo_problema") Long id_tipo_problema) {
        Optional<TipoProblema> oTipoProblema = tipoProblemaService.findById(id_tipo_problema);

        return oTipoProblema.map(tipoProblema -> ResponseEntity.ok(tipoProblema))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(tipoProblemaService.findAll());
    }

    @DeleteMapping("/{id_tipo_problema}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_tipo_problema") Long id_tipo_problema) {
        Optional<TipoProblema> oTipoProblema = tipoProblemaService.findById(id_tipo_problema);
        if (oTipoProblema.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        tipoProblemaService.deleteById(id_tipo_problema);
        return ResponseEntity.ok(oTipoProblema);
    }

    @PutMapping("/{id_tipo_problema}")
    public ResponseEntity<?> update(@PathVariable(value = "id_tipo_problema") Long id_tipo_problema, @RequestBody TipoProblema tipoProblema) {
        Optional<TipoProblema> oTipoProblema = tipoProblemaService.findById(id_tipo_problema);
        if (oTipoProblema.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        oTipoProblema.get().setProblema(tipoProblema.getProblema());
        return ResponseEntity.status(HttpStatus.CREATED).body(tipoProblemaService.save(oTipoProblema.get()));
    }

}
