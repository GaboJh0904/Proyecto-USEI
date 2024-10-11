package com.usei.usei.api;

import com.usei.usei.controllers.TipoNotificacionService;
import com.usei.usei.models.TipoNotificacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/tipo_notificacion")
public class TipoNotificacionAPI {

    @Autowired
    private TipoNotificacionService tipoNotificacionService;

    // Crear un nuevo tipo de Notificacion:
    @PostMapping
    public ResponseEntity<?> create(@RequestBody TipoNotificacion tipoNotificacion) {
        return ResponseEntity.status(HttpStatus.CREATED).body(tipoNotificacionService.save(tipoNotificacion));
    }

    @GetMapping("/{id_tipo_notificacion}")
    public ResponseEntity<?> read(@PathVariable(value = "id_tipo_notificacion") Long id_tipo_notificacion) {
        Optional<TipoNotificacion> oTipoNotificacion = tipoNotificacionService.findById(id_tipo_notificacion);

        return oTipoNotificacion.map(tipoNotificacion -> ResponseEntity.ok(tipoNotificacion))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(tipoNotificacionService.findAll());
    }

    @DeleteMapping("/{id_tipo_notificacion}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_tipo_notificacion") Long id_tipo_notificacion) {
        Optional<TipoNotificacion> oTipoNotificacion = tipoNotificacionService.findById(id_tipo_notificacion);
        if (oTipoNotificacion.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        tipoNotificacionService.deleteById(id_tipo_notificacion);
        return ResponseEntity.ok(oTipoNotificacion);
    }

    @PutMapping("/{id_tipo_notificacion}")
    public ResponseEntity<?> update(@PathVariable(value = "id_tipo_notificacion") Long id_tipo_notificacion, @RequestBody TipoNotificacion tipoNotificacion) {
        Optional<TipoNotificacion> oTipoNotificacion = tipoNotificacionService.findById(id_tipo_notificacion);
        if (oTipoNotificacion.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        oTipoNotificacion.get().setTipo(tipoNotificacion.getTipo());
        return ResponseEntity.status(HttpStatus.CREATED).body(tipoNotificacionService.save(oTipoNotificacion.get()));
    }

}
