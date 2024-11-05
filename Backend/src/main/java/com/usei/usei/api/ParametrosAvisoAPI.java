package com.usei.usei.api;

import com.usei.usei.controllers.ParametrosAvisoService;
import com.usei.usei.models.ParametrosAviso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/parametros_aviso")
public class ParametrosAvisoAPI {

    @Autowired
    private ParametrosAvisoService parametrosAvisoService;

    // Crear un nuevo parametro de aviso:
    @PostMapping
    public ResponseEntity<?> create(@RequestBody ParametrosAviso parametrosAviso) {
        return ResponseEntity.status(HttpStatus.CREATED).body(parametrosAvisoService.save(parametrosAviso));
    }

    @GetMapping("/{id_parametros_aviso}")
    public ResponseEntity<?> read(@PathVariable(value = "id_parametros_aviso") Long id_parametros_aviso) {
        Optional<ParametrosAviso> oParametrosAviso = parametrosAvisoService.findById(id_parametros_aviso);

        return oParametrosAviso.map(parametrosAviso -> ResponseEntity.ok(parametrosAviso))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(parametrosAvisoService.findAll());
    }

    @DeleteMapping("/{id_parametros_aviso}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_parametros_aviso") Long id_parametros_aviso) {
        Optional<ParametrosAviso> oParametrosAviso = parametrosAvisoService.findById(id_parametros_aviso);
        if (oParametrosAviso.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        parametrosAvisoService.deleteById(id_parametros_aviso);
        return ResponseEntity.ok(oParametrosAviso);
    }

    @PutMapping("/{id_parametros_aviso}")
    public ResponseEntity<?> update(@PathVariable(value = "id_parametros_aviso") Long id_parametros_aviso, @RequestBody ParametrosAviso parametrosAviso) {
        Optional<ParametrosAviso> oParametrosAviso = parametrosAvisoService.findById(id_parametros_aviso);
        if (oParametrosAviso.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        oParametrosAviso.get().setPorcentaje(parametrosAviso.getPorcentaje());
        oParametrosAviso.get().setFechaCambio(parametrosAviso.getFechaCambio());
        oParametrosAviso.get().setFechaNotificacion(parametrosAviso.getFechaNotificacion());
        oParametrosAviso.get().setMensajePredeterminado(parametrosAviso.getMensajePredeterminado());
        return ResponseEntity.status(HttpStatus.CREATED).body(parametrosAvisoService.save(oParametrosAviso.get()));
    }

}
