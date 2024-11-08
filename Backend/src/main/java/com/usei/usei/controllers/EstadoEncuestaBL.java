package com.usei.usei.controllers;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.dto.request.EstadoEncuestaEstudianteDTO;
import com.usei.usei.models.Encuesta;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.ParametrosAviso;
import com.usei.usei.repositories.EstadoEncuestaDAO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EstadoEncuestaBL implements EstadoEncuestaService{

    private final EstadoEncuestaDAO estadoEncuestaDAO;
    private final EncuestaService encuestaService;
    private final EstudianteService estudianteService;
    private final ParametrosAvisoService parametrosAvisoService;
    private final JavaMailSender mailSender;


    @Autowired
    public EstadoEncuestaBL(EstadoEncuestaDAO estadoEncuestaDAO, EncuestaService encuestaService, EstudianteService estudianteService, ParametrosAvisoService parametrosAvisoService, JavaMailSender mailSender) {
        this.estadoEncuestaDAO = estadoEncuestaDAO;
        this.encuestaService = encuestaService;
        this.estudianteService = estudianteService;
        this.parametrosAvisoService = parametrosAvisoService;
        this.mailSender = mailSender;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<EstadoEncuesta> findAll(){
        return estadoEncuestaDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<EstadoEncuesta> findById(Long id){
        return estadoEncuestaDAO.findById(id);
    }

    @Override
    @Transactional
    public EstadoEncuesta save(EstadoEncuesta estadoEncuesta) {

        Encuesta encuesta = encuestaService.findById(estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException("encuesta no encontrado con el id: " + estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta()));
        Estudiante estudiante = estudianteService.findById(estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante()));


        estadoEncuesta.setEncuestaIdEncuesta(encuesta);
        estadoEncuesta.setEstudianteIdEstudiante(estudiante);

        return estadoEncuestaDAO.save(estadoEncuesta);
    }



    @Override
    @Transactional
    public EstadoEncuesta update(EstadoEncuesta estadoEncuesta, Long id) {
        Optional<EstadoEncuesta> existingEstadoEncuesta = estadoEncuestaDAO.findById(id);
        if (existingEstadoEncuesta.isPresent()) {
            EstadoEncuesta estadoEncuestaToUpdate = existingEstadoEncuesta.get();

            // Obtener las alergias y el paciente existentes por sus ID
            Encuesta encuesta = encuestaService.findById(estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException("encuesta no encontrado con el id: " + estadoEncuesta.getEncuestaIdEncuesta().getIdEncuesta()));
            Estudiante estudiante = estudianteService.findById(estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoEncuesta.getEstudianteIdEstudiante().getIdEstudiante()));

            // Actualizar los campos de la estado_encuesta con los valores correspondientes
            estadoEncuestaToUpdate.setEstado(estadoEncuesta.getEstado());
            estadoEncuestaToUpdate.setFechaEstado(estadoEncuesta.getFechaEstado());
            estadoEncuestaToUpdate.setEncuestaIdEncuesta(encuesta);
            estadoEncuestaToUpdate.setEstudianteIdEstudiante(estudiante);

            return estadoEncuestaDAO.save(estadoEncuestaToUpdate);
        } else {
            throw new RuntimeException("Estado_Encuesta no encontrado con el id: " + id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Page<EstadoEncuestaEstudianteDTO> findByEstadoPendientePaginated(Pageable pageable) {
        return estadoEncuestaDAO.findPendienteWithStudentDataAsDTO("Pendiente", pageable);
    }

    @Override
    @Transactional
    public List<EstadoEncuesta> findByEstadoPendiente() {
        return estadoEncuestaDAO.findByEstado("Pendiente");
    }

    // Implementación método encuestas completadas
    @Override
    @Transactional(readOnly = true)
    public List<EstadoEncuesta> findByEstadoCompletado() {
        return estadoEncuestaDAO.findByEstado("Completado");
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<EstadoEncuesta> findByEstudianteIdEstudiante(Long idEstudiante) {
        return estadoEncuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante);
    }

    // Método que contiene la lógica completa para enviar correos recordatorio a estudiantes pendientes
    @Override
    public void enviarCorreosEstudiantesPendientes() throws MessagingException {

        List<EstadoEncuestaEstudianteDTO> estudiantes = estadoEncuestaDAO.findPendienteWithStudentDataAsDTOList("Pendiente");

        ParametrosAviso parametrosAviso = parametrosAvisoService.findById(1L)
                .orElseThrow(() -> new RuntimeException("No se encontraron los parametros de aviso"));

        String asunto = "Recordatorio de encuesta a tiempo de graduacion pendiente";
        String mensaje = parametrosAviso.getMensajePredeterminado();

        for (EstadoEncuestaEstudianteDTO estudiante : estudiantes) {
            String correo = estudiante.getCorreoInstitucional();
            enviarCorreo(correo, asunto, mensaje);
            System.out.println("Correo enviado a: " + estudiante.getNombre());
        }
    }

    
    @Override
    public void enviarCorreosEstudiantesPersonal(String correo, String cuerpo) throws MessagingException {

        ParametrosAviso parametrosAviso = parametrosAvisoService.findById(1L)
                .orElseThrow(() -> new RuntimeException("No se encontraron los parametros de aviso"));

        String asunto = "Recordatorio de encuesta a tiempo de graduacion pendiente";

        String cuerpoCorreo = cuerpo+ "\r\n" + parametrosAviso.getMensajePredeterminado();
        enviarCorreo(correo, asunto, cuerpoCorreo);
        System.out.println("Correo enviado a: " + correo);
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
    @Transactional(readOnly = true)
    public List<EstadoEncuesta> findCompletadasByAnioAndSemestre(Integer anio, Integer semestre) {
        return estadoEncuestaDAO.findCompletadasByAnioAndSemestre(anio, semestre);
    }
    


}
