package com.usei.usei.controllers;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Plazo;
import com.usei.usei.repositories.PlazoDAO;

import com.usei.usei.repositories.EstadoEncuestaDAO;
import com.usei.usei.repositories.EstudianteDAO;

@Service
public class PlazoBL implements PlazoService {

    private final PlazoDAO plazoDAO;
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private EstudianteDAO estudianteDAO;
    @Autowired
    private EstadoEncuestaDAO estadoEncuestaDAO;

    @Autowired
    public PlazoBL(PlazoDAO plazoDAO) {
        this.plazoDAO = plazoDAO;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Plazo> findAll() {
        return plazoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Plazo> findById(Long id) {
        return plazoDAO.findById(id);
    }

    @Override
    @Transactional
    public Plazo save(Plazo plazo) {
            // Verificar si existe un plazo en estado "activo"
        Optional<Plazo> activePlazo = plazoDAO.findByEstado("activo");
        
        // Si existe un plazo "activo", cambiar su estado a "antiguo"
        activePlazo.ifPresent(existingPlazo -> {
            existingPlazo.setEstado("antiguo");
            plazoDAO.save(existingPlazo); // Guardar el cambio de estado
        });
        // Ajustar las fechas del plazo recibido
        if (plazo.getFechaFinalizacion() != null) {
            // Convertir Date a LocalDate
            LocalDate fechaFinalizacion = plazo.getFechaFinalizacion().toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate()
                    .plusDays(1);
            // Volver a convertir LocalDate a Date
            plazo.setFechaFinalizacion(Date.from(fechaFinalizacion.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        }

        if (plazo.getFechaModificacion() != null) {
            LocalDate fechaModificacion = plazo.getFechaModificacion().toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate()
                    .plusDays(1);
            plazo.setFechaModificacion(Date.from(fechaModificacion.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        }


        return plazoDAO.save(plazo);
    }

    @Override
    @Transactional
    public Plazo update(Plazo plazo, Long id) {
        Optional<Plazo> existingPlazo = plazoDAO.findById(id);
        if (existingPlazo.isPresent()) {
            Plazo plazoToUpdate = existingPlazo.get();
            plazoToUpdate.setFechaFinalizacion(plazo.getFechaFinalizacion());
            plazoToUpdate.setFechaModificacion(plazo.getFechaModificacion());
            plazoToUpdate.setEstado(plazo.getEstado());
            plazoToUpdate.setUsuarioIdUsuario(plazo.getUsuarioIdUsuario());
            return plazoDAO.save(plazoToUpdate);
        } else {
            throw new RuntimeException("Plazo no encontrado con el id: " + id);
        }
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        plazoDAO.deleteById(id);
    }

    // Implement the new paginated findAll method
    @Override
    @Transactional(readOnly = true)
    public Page<Plazo> findAll(Pageable pageable) {
        return plazoDAO.findAll(pageable);
    }

    //Notificación de plazo
    @Transactional
    @Override
    public void notificarEstudiantesPlazo(Long idPlazo){
        Optional<Plazo> plazoOpt = plazoDAO.findById(idPlazo);
        if(plazoOpt.isEmpty()){
            throw new RuntimeException("Plazo no encontrado con el id: "+idPlazo);
        }
        Plazo plazo = plazoOpt.get();
        List<Estudiante> estudiantes = estudianteDAO.findAll();

        for(Estudiante estudiante : estudiantes){
            Optional<EstadoEncuesta> estadoEncuestaOpt = estadoEncuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(estudiante.getIdEstudiante());
            if (estadoEncuestaOpt.isEmpty() || !"completado".equalsIgnoreCase(estadoEncuestaOpt.get().getEstado())) {
                //No se completó la encuesta
                try{
                    enviarCorreoAviso(estudiante.getCorreoPersonal(), plazo.getFechaFinalizacion());

                }catch(MessagingException e){
                    throw new RuntimeException("Error al enviar el correo a: "+estudiante.getCorreoPersonal());
                }
            }
        }
    }
    //Envio de correo
    public void enviarCorreoAviso(String correo, Date fechaLimite) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, false); // 'false' indica que no hay adjuntos
        helper.setTo(correo);
        helper.setSubject("¡No olvides completar tu encuesta!");
        helper.setText("Hola, esperamos que estés teniendo un gran día. Te recordamos amablemente que tienes hasta el " + fechaLimite + " para completar tu encuesta. ¡Tu opinión es muy importante para nosotros!");        

        mailSender.send(message);
    }

    @Override
    public Optional<Plazo> findPlazoActivo() {
        return plazoDAO.findByEstado("activo");
    }
}
