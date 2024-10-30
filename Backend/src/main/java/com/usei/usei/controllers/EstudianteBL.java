package com.usei.usei.controllers;

import java.security.SecureRandom;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Estudiante;
import com.usei.usei.repositories.EstudianteDAO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Service
public class EstudianteBL implements EstudianteService{

    private EstudianteDAO estudianteDAO;
    private JavaMailSender mailSender;

    private String codigoVerificacion;

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
        String link = "<a href='http://localhost:5173/'>Acceder al enlace</a>";

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

    // Método que contiene la lógica completa para enviar correos de invitacion a todos los estudiantes
    public void enviarCodigoVerificacion(String correo) throws MessagingException {

        Estudiante estudiante = estudianteDAO.findByCorreoInstitucional(correo);

        String asunto = "Codigo de Seguridad para cambio de contraseña";
        String mensaje = "Estimado estudiante, usted a solicitado un cambio de contraseña, por favor ingrese el siguiente codigo de seguridad: ";

        if (!correo.endsWith("@ucb.edu.bo")) {
            System.out.println("Correo inválido: " + correo);
        }else {
            // Generar el código y guardarlo en la variable de instancia
            codigoVerificacion = generarCodigoVerificacion();
            String cuerpoCorreo = mensaje + codigoVerificacion;
            enviarCorreo(correo, asunto, cuerpoCorreo);
            System.out.println("Correo enviado a: " + estudiante.getNombre());
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

    public Long findByCorreoInst(String correo){
        Estudiante estudiante = estudianteDAO.findByCorreoInstitucional(correo);
        if(estudiante == null){
            return 0L;
        }else{
            return estudiante.getIdEstudiante();
        }

    }

    @Override
    public Page<Estudiante> findByNombreContainingOrCiContaining(String nombre, String ci, Pageable pageable) {
        // Esta implementación ya no es necesaria; vamos a separar las búsquedas por nombre y CI
        throw new UnsupportedOperationException();
    }

    @Override
    public Page<Estudiante> findByNombre(String nombre, Pageable pageable) {
        return estudianteDAO.findByNombreContainingIgnoreCase(nombre, pageable);
    }

    @Override
    public Page<Estudiante> findByCi(Integer ci, Pageable pageable) {
        return estudianteDAO.findByCi(ci, pageable);
    }

    @Override
    public Page<Estudiante> findAll(Pageable pageable) {
        return estudianteDAO.findAll(pageable);
    }

}
