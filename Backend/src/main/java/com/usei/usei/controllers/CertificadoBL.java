package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.repositories.CertificadoDAO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;



import com.usei.usei.models.Certificado;
import com.usei.usei.models.Usuario;

@Service
public class CertificadoBL implements CertificadoService{
    
    private final CertificadoDAO certificadoDAO;
    private final UsuarioService usuarioService;


    @Autowired
    private JavaMailSender mailSender;  // Inyecta JavaMailSender


    @Autowired
    public CertificadoBL(CertificadoDAO certificadoDAO, UsuarioService usuarioService, JavaMailSender mailSender){
        this.certificadoDAO = certificadoDAO;
        this.usuarioService = usuarioService;
        this.mailSender = mailSender;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Certificado> findAll(){
        return certificadoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Certificado> findById(Long id){
        return certificadoDAO.findById(id);
    }

    @Override
    @Transactional
    public Certificado save(Certificado certificado) {

        Usuario usuario = usuarioService.findById(certificado.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + certificado.getUsuarioIdUsuario().getIdUsuario()));

        certificado.setUsuarioIdUsuario(usuario);

        // Enviar el correo con el certificado adjunto
        String correo = "willy.vargas@ucb.edu.bo";
        String subject = "Certificado Registrado Correctamente";
        String body = "Estimado " + usuario.getNombre() + ", su certificado ha sido registrado correctamente.";
        String attachmentPath = "/ruta/al/certificado.pdf";  // Actualiza esta ruta al archivo del certificado

        try {
            sendCertificadoEmail(correo, subject, body, attachmentPath);
        } catch (MessagingException e) {
            // Manejar el error de envío de correo
            throw new RuntimeException("Error al enviar el correo: " + e.getMessage());
        }

        return certificadoDAO.save(certificado);
    }

    @Override
    @Transactional
    public Certificado update(Certificado certificado, Long id) {
        Optional<Certificado> existingCertificado = certificadoDAO.findById(id);
        if (existingCertificado.isPresent()) {
            Certificado certificadoToUpdate = existingCertificado.get();

            Usuario usuario = usuarioService.findById(certificado.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrada con el id: " + certificado.getUsuarioIdUsuario().getIdUsuario()));

            // Actualizar los campos del certificado con los valores correspondientes    
            certificadoToUpdate.setFormato(certificado.getFormato());
            certificadoToUpdate.setVersion(certificado.getVersion());
            certificadoToUpdate.setFechaModificacion(certificado.getFechaModificacion());
            certificadoToUpdate.setUsuarioIdUsuario(usuario);

            // Enviar el correo con el certificado actualizado
            String subject = "Certificado Actualizado";
            String body = "Estimado " + usuario.getNombre() + ", su certificado ha sido actualizado correctamente.";
            String attachmentPath = "/ruta/al/certificado_actualizado.pdf";  // Actualiza esta ruta al archivo del certificado

            try {
                sendCertificadoEmail(usuario.getCorreo(), subject, body, attachmentPath);
            } catch (MessagingException e) {
                throw new RuntimeException("Error al enviar el correo: " + e.getMessage());
            }


            return certificadoDAO.save(certificadoToUpdate);
        } else {
            throw new RuntimeException("Almacen no encontrado con el id: " + id);
        }
    }


    @Override
    public void sendCertificadoEmail(String to, String subject, String body, String attachmentPath) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body);

        // Adjuntar el archivo del certificado
        if (attachmentPath != null) {
            java.nio.file.Path path = java.nio.file.FileSystems.getDefault().getPath(attachmentPath);
            helper.addAttachment("Certificado.pdf", path.toFile());
        }

        mailSender.send(message);
    }

}
