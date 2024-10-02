package com.usei.usei.controllers;

import java.util.Optional;

//import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.usei.usei.models.Estudiante;
import com.usei.usei.repositories.EstudianteDAO;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.util.List;

@Service
public class EstudianteBL implements EstudianteService{

    private EstudianteDAO estudianteDAO;
    private JavaMailSender mailSender;

    //Listado-estudiantes
    @Override
    @Transactional
    public List<Estudiante> saveAll(List<Estudiante> estudiantes) {
        return estudianteDAO.saveAll(estudiantes);  // Devuelve la lista de estudiantes guardados
    }

    @Autowired
    public EstudianteBL(EstudianteDAO estudianteDAO, JavaMailSender mailSender) {
        this.estudianteDAO = estudianteDAO;
        this.mailSender = mailSender;  // Inyección de mailSender
    }

    @Transactional(readOnly = true)
    public Iterable<Estudiante> findAll() {
        return estudianteDAO.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<Estudiante> findById(Long id) {
        return estudianteDAO.findById(id);
    }

    @Transactional
    public Estudiante save(Estudiante estudiante) {
        return estudianteDAO.save(estudiante);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        estudianteDAO.deleteById(id);
    }

    @Transactional
    public Estudiante update(Estudiante estudiante, Long id) {
        Optional<Estudiante> existingEstudiante = estudianteDAO.findById(id);
            if (existingEstudiante.isPresent()) {
            Estudiante estudianteToUpdate = existingEstudiante.get();
            estudianteToUpdate.setNombre(estudiante.getNombre());
            estudianteToUpdate.setApellido(estudiante.getApellido());
            // Actualizar otros campos si es necesario

            return estudianteDAO.save(estudianteToUpdate);
        } else {
            throw new RuntimeException("Estudiante no encontrado con el id: " + id);
        }
    }


    @Override
    @Transactional(readOnly = true)
    public Optional<Estudiante> login(int ci, String contrasena) {
        return estudianteDAO.findByCiAndContrasena(ci, contrasena);
    }


    // Método que contiene la lógica completa para enviar correos de invitacion a todos los estudiantes
    public void enviarCorreosEstudiantes() throws MessagingException {

        List<Estudiante> estudiantes = estudianteDAO.findByCorreoInstitucionalIsNotNull();

        String asunto = "Informacion sobre Alumni UCB ";
        String mensaje = "Estimado estudiante, usted esta apunto de salir y porlo tanto puede accedere a el custionario para ser parte de Alumni UCB por favor revisa el siguiente enlace importante: ";
        String link = "<a href='https://youtu.be/SRXH9AbT280?si=enZDOY7skMNZyGOV'>Acceder al enlace</a>";

        for (Estudiante estudiante : estudiantes) {
            String correo = estudiante.getCorreoInstitucional();  
            if (!correo.endsWith("@ucb.edu.bo")) {
                System.out.println("Correo inválido: " + correo);
                continue; 
            }
            if ("completo".equalsIgnoreCase(estudiante.getEstadoInvitacion())) {
                System.out.println("Correo no enviado, estado de invitación completo para: " + estudiante.getNombre());
                continue; // No enviar correo si el estado es "completo"
            }

            String cuerpoCorreo = mensaje + link;
            enviarCorreo(correo, asunto, cuerpoCorreo);
            System.out.println("Correo enviado a: " + estudiante.getNombre());
            estudiante.setEstadoInvitacion("completo");
            estudianteDAO.save(estudiante); // Guardar los cambios en la base de datos
        }
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
        



}
