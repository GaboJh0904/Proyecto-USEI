package com.usei.usei.api;

import com.usei.usei.models.Soporte;
import com.usei.usei.models.TipoProblema;
import com.usei.usei.models.Usuario;
import com.usei.usei.controllers.SoporteService;
import com.usei.usei.repositories.TipoProblemaDAO;
import com.usei.usei.repositories.UsuarioDAO;
import com.usei.usei.models.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@RestController
@RequestMapping("/soporte")
public class SoporteAPI {

    @Autowired
    private SoporteService soporteService;

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Autowired
    private TipoProblemaDAO tipoProblemaDAO;

    @Autowired
    private EmailService emailService;  // Servicio para enviar correos

    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Soporte soporte) {
        try {
            // Validar tipo de problema
            Optional<TipoProblema> tipoProblema = tipoProblemaDAO.findById(soporte.getTipoProblema().getIdProblema());
            if (tipoProblema.isEmpty()) {
                return new ResponseEntity<>("Tipo de problema no encontrado", HttpStatus.BAD_REQUEST);
            }

            // Validar usuario
            Optional<Usuario> usuario = usuarioDAO.findById(soporte.getUsuario().getIdUsuario());
            if (usuario.isEmpty()) {
                return new ResponseEntity<>("Usuario no encontrado", HttpStatus.BAD_REQUEST);
            }

            // Establecer la fecha actual
            soporte.setFecha(LocalDateTime.now());

            // Guardar el soporte
            soporteService.save(soporte);

            // Obtener el tipo de problema seleccionado
            String problemaSeleccionado = tipoProblema.get().getProblema();

            // Enviar correo de notificación (opcional)
            emailService.sendEmail(
                    "misa26amane@gmail.com",  // Dirección del administrador
                    "Reporte de un nuevo problema",  // Asunto del correo
                    "Descripción del reporte del problema: \n\n" +
                            "Tipo de problema: " + problemaSeleccionado + "\n" +
                            "Mensaje: " + soporte.getMensaje() + "\n" +
                            "Fecha: " + soporte.getFecha() + "\n" +
                            "Usuario: " + usuario.get().getNombre()
            );

            return new ResponseEntity<>("Reporte de problema creado exitosamente", HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



    @GetMapping
    public ResponseEntity<?> getAll() {
        try {
            return ResponseEntity.ok(soporteService.findAll());
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
