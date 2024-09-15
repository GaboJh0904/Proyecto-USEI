package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.UsuarioService;
import com.usei.usei.models.Usuario;

import java.util.Optional;

@RestController
@RequestMapping("/usuario")
public class UsuarioAPI{

    @Autowired
    private UsuarioService usuarioService;

    //Crear un nuevo usuario:
    @PostMapping
    public ResponseEntity<?> create (@RequestBody Usuario usuario){
        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioService.save(usuario));
    }

    @GetMapping("/{id_usuario}")
    public ResponseEntity<?> read(@PathVariable(value = "id_usuario") Long id_usuario) {
    Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);
    
    return oUsuario.map(usuario -> ResponseEntity.ok(usuario))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(usuarioService.findAll());
    }

    @DeleteMapping("/{id_usuario}")
    public ResponseEntity<?> delete(@PathVariable(value = "id_usuario") Long id_usuario){
        Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);
        if(oUsuario.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        usuarioService.deleteById(id_usuario);
        return ResponseEntity.ok(oUsuario);
    }

    @PutMapping("/{id_usuario}")
    public ResponseEntity<?> update(@PathVariable(value = "id_usuario") Long id_usuario, @RequestBody Usuario usuario){
        Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);
        if(oUsuario.isEmpty()){
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



}
