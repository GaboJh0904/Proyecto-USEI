package com.usei.usei.api;

import com.usei.usei.controllers.UsuarioService;
import com.usei.usei.dto.request.LoginRequestUserDTO;
import com.usei.usei.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/usuario")
public class UsuarioAPI {

    @Autowired
    private UsuarioService usuarioService;

    // Crear un nuevo usuario:
    @PostMapping
    public ResponseEntity<?> create(@RequestBody Usuario usuario) {
        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioService.save(usuario));
    }

    @GetMapping("/{id_usuario}")
    public ResponseEntity<?> read(@PathVariable(value = "id_usuario") Long id_usuario) {
        Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);

        return oUsuario.map(usuario -> ResponseEntity.ok(usuario))
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping
    public ResponseEntity<?> readAll() {
        return ResponseEntity.ok(usuarioService.findAll());
    }

    @DeleteMapping("/{id_usuario}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_usuario") Long id_usuario) {
        Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);
        if (oUsuario.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        usuarioService.deleteById(id_usuario);
        return ResponseEntity.ok(oUsuario);
    }

    @PutMapping("/{id_usuario}")
    public ResponseEntity<?> update(@PathVariable(value = "id_usuario") Long id_usuario, @RequestBody Usuario usuario) {
        Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);
        if (oUsuario.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        oUsuario.get().setNombre(usuario.getNombre());
        oUsuario.get().setTelefono(usuario.getTelefono());
        oUsuario.get().setCorreo(usuario.getCorreo());
        oUsuario.get().setRol(usuario.getRol());
        oUsuario.get().setUsuario(usuario.getUsuario());
        oUsuario.get().setContrasenia(usuario.getContrasenia());
        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioService.save(oUsuario.get()));
    }

    // Nuevo endpoint de login con correo y contraseña
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequestUserDTO loginRequestUser) {
        Optional<Usuario> usuario = usuarioService.login(loginRequestUser.getCorreo(), loginRequestUser.getContrasena());

        if (usuario.isPresent()) {
            // Crear el objeto de respuesta con los campos "rol", "code" y "message"
            Map<String, Object> response = new HashMap<>();
            response.put("rol", usuario.get().getRol());
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
