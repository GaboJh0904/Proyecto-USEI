package com.usei.usei.api;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.usei.usei.controllers.UsuarioService;
import com.usei.usei.dto.SuccessfulResponse;
import com.usei.usei.dto.UnsuccessfulResponse;
import com.usei.usei.dto.request.LoginRequestUserDTO;
import com.usei.usei.models.LoginResponse;
import com.usei.usei.models.Usuario;
import com.usei.usei.util.TokenGenerator;

import jakarta.mail.MessagingException;

@RestController
@RequestMapping("/usuario")
public class UsuarioAPI {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private TokenGenerator tokenGenerator;

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
        oUsuario.get().setCarrera(usuario.getCarrera());
        oUsuario.get().setRol(usuario.getRol());
        oUsuario.get().setUsuario(usuario.getUsuario());
        oUsuario.get().setContrasenia(usuario.getContrasenia());
        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioService.save(oUsuario.get()));
    }

    /*
    @PutMapping("/new-password/{id_usuario}")
    public ResponseEntity<?> changePassword(@PathVariable(value = "id_usuario") Long id_usuario, @RequestBody HashMap<String, String> passwordData) {
        Optional<Usuario> oUsuario = usuarioService.findById(id_usuario);
        if (oUsuario.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        // Verificar si la contraseña actual coincide
        String currentPassword = passwordData.get("currentPassword");
        if (!oUsuario.get().getContrasenia().equals(currentPassword)) {
            // La contraseña actual no coincide
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("La contraseña actual es incorrecta.");
        }

        // Si la contraseña actual coincide, procedemos a actualizarla
        oUsuario.get().setContrasenia(passwordData.get("newPassword"));
        usuarioService.save(oUsuario.get());

        return ResponseEntity.status(HttpStatus.CREATED).body("Contraseña actualizada exitosamente.");
    }
   */
  
   @PutMapping("/change-password")
    public ResponseEntity<?> changePassword(@RequestParam Long idUsuario, @RequestBody HashMap<String, String> passwordData) {
        Optional<Usuario> oUsuario = usuarioService.findById(idUsuario);
        if (oUsuario.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        System.out.println("Llego hasta aqui");
        oUsuario.get().setContrasenia(passwordData.get("newPassword"));
        usuarioService.save(oUsuario.get());

        return ResponseEntity.ok("Contraseña actualizada exitosamente.");
    }

    // Nuevo endpoint de login con correo y contraseña
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequestUserDTO loginRequestUser) {
        try{
            Optional<Usuario> usuario = usuarioService.login(loginRequestUser.getCorreo(), loginRequestUser.getContrasena());
            if (usuario.isPresent()) {
                Usuario user = usuario.get();
                System.out.println("Usuario encontrado: " + user.getNombre());
                System.out.println("Carrera del usuario: " + user.getCarrera()); // Verifica si la carrera es nula
    
                usuario.get().setContrasenia(null); // No enviar la contraseña en la respuesta
                String token = tokenGenerator.generateToken(String.valueOf(usuario.get().getIdUsuario()), usuario.get().getRol(), usuario.get().getCorreo(), 60);

                //
                Map<String, Object> data = new HashMap<>();
                data.put("id_usuario", usuario.get().getIdUsuario());  // Incluir el id_usuario
                data.put("rol", usuario.get().getRol());
                data.put("correo", usuario.get().getCorreo());
                data.put("carrera", usuario.get().getCarrera());
                data.put("nombre", usuario.get().getNombre());
                data.put("usuario", usuario.get().getUsuario());

                // Crear la respuesta exitosa con el id_usuario y otros campos
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
                        "/usuario/login"
                );

                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(new LoginResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/enviarCodigoVerificacion/{correo}")
    public ResponseEntity<?> enviarCodigoVerificacion(@PathVariable(value = "correo") String correo) {
        try {
            Long idDirector = usuarioService.findByMail(correo);
            // Verificar si el idEstudiante es igual a 0 y devolver un error
            if (idDirector == 0) {
                return new ResponseEntity<>("No se encontró un Director con ese correo.", HttpStatus.NOT_FOUND);
            }

            // Llamamos al servicio para enviar el código de verificación
            usuarioService.enviarCodigoVerificacion(correo);

            // Devolver el código de verificación en la respuesta
            String codigoVerificacion = usuarioService.obtenerCodigoVerificacion(); // Método que obtiene el código

            // Enviar el código también al frontend
            return new ResponseEntity<>(new HashMap<String, Object>() {{
                put("mensaje", "Código de verificación enviado exitosamente");
                put("codigoVerificacion", codigoVerificacion); // Este es el código enviado al correo
                put("idDirector", idDirector);
            }}, HttpStatus.OK);
        } catch (MessagingException e) {
            return new ResponseEntity<>("Error al enviar el código de verificación: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception e) {
            return new ResponseEntity<>("Error inesperado: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
