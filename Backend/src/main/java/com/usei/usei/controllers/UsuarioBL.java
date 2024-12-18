package com.usei.usei.controllers;

import java.security.SecureRandom;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.UsuarioDAO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class UsuarioBL implements UsuarioService {

    @Autowired
    private UsuarioDAO usuarioDAO;
    private JavaMailSender mailSender;

    private String codigoVerificacion;

    @Override
    @Transactional(readOnly = true)
    public Iterable<Usuario> findAll() {
        return usuarioDAO.findAll();
    }

    @Autowired
    public UsuarioBL(UsuarioDAO usuarioDAO, JavaMailSender mailSender) {
        this.usuarioDAO = usuarioDAO;
        this.mailSender = mailSender;  // Inyección de mailSender
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Usuario> findById(Long id) {
        return usuarioDAO.findById(id);
    }

    @Override
    @Transactional
    public Usuario save(Usuario usuario) {
        return usuarioDAO.save(usuario);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        usuarioDAO.deleteById(id);
    }

    @Override
    @Transactional
    public Usuario update(Usuario usuario, Long id) {
        Optional<Usuario> existingUsuario = usuarioDAO.findById(id);
        if (existingUsuario.isPresent()) {
            Usuario usuarioToUpdate = existingUsuario.get();
            usuarioToUpdate.setNombre(usuario.getNombre());
            usuarioToUpdate.setTelefono(usuario.getTelefono());
            usuarioToUpdate.setCorreo(usuario.getCorreo());
            usuarioToUpdate.setCarrera(usuario.getCarrera());
            usuarioToUpdate.setRol(usuario.getRol());
            usuarioToUpdate.setUsuario(usuario.getUsuario());
            usuarioToUpdate.setContrasenia(usuario.getContrasenia());

            return usuarioDAO.save(usuarioToUpdate);
        } else {
            throw new RuntimeException("Persona no encontrada con el id: " + id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Usuario> login(String correo, String contrasenia) {
        return usuarioDAO.findByCorreoAndContrasenia(correo, contrasenia);
    }

    @Override
    public void enviarCodigoVerificacion(String correo) throws MessagingException {

        Usuario usuario = usuarioDAO.findByCorreo(correo);

        String asunto = "Codigo de Seguridad para cambio de contraseña";
        String mensaje = "Estimado Director, usted a solicitado un cambio de contraseña, por favor ingrese el siguiente codigo de seguridad: ";

        // if (!correo.endsWith("@ucb.edu.bo")) {
        //     System.out.println("Correo inválido: " + correo);
        // }else {
            // Generar el código y guardarlo en la variable de instancia
            codigoVerificacion = generarCodigoVerificacion();
            String cuerpoCorreo = mensaje + codigoVerificacion;
            enviarCorreo(correo, asunto, cuerpoCorreo);
            System.out.println("Correo enviado a: " + usuario.getNombre());
        // }
    }

    private String generarCodigoVerificacion() {
        String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        SecureRandom random = new SecureRandom();
        StringBuilder codigo = new StringBuilder(6);
        
        for (int i = 0; i < 6; i++) {
            int index = random.nextInt(caracteres.length());
            codigo.append(caracteres.charAt(index));
        }
        
        return codigo.toString();
    }

    // Método para usar el código de verificación guardado en otra función
    public String obtenerCodigoVerificacion() {
        return codigoVerificacion;
    }

    // Método para enviar un correo de invitacion
    private void enviarCorreo(String to, String subject, String body) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body, true);

        mailSender.send(message);  // Enviar el correo
    }

    @Override
    public Long findByMail(String correo){
        Usuario usuario = usuarioDAO.findByCorreo(correo);
        if(usuario == null){
            return 0L;
        }else{
            return usuario.getIdUsuario();
        }

    }

}
