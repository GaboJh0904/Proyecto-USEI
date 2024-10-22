package com.usei.usei.controllers;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Notificacion;
import com.usei.usei.models.TipoNotificacion;
import com.usei.usei.repositories.NotificacionDAO;


@Service
public class NotificacionBL implements NotificacionService {

    private final NotificacionDAO notificacionDAO;
    private final TipoNotificacionService tipoNotificacionService;
    private final EstudianteService estudianteService;

    @Autowired
    public NotificacionBL(NotificacionDAO notificacionDAO, TipoNotificacionService tipoNotificacionService,
            EstudianteService estudianteService) {
        this.notificacionDAO = notificacionDAO;
        this.tipoNotificacionService = tipoNotificacionService;
        this.estudianteService = estudianteService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Notificacion> findAll() {
        return notificacionDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Notificacion> findById(Long id) {
        return notificacionDAO.findById(id);
    }

    @Override
    @Transactional
    public Notificacion save(Notificacion notificacion) {
        TipoNotificacion tipoNotificacion = tipoNotificacionService.findById(notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion())
                .orElseThrow(() -> new RuntimeException(
                        "Tipo notificacion no encontrada con el id: " + notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion()));

        Estudiante estudiante = estudianteService.findById(notificacion.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: "
                        + notificacion.getEstudianteIdEstudiante().getIdEstudiante()));

        notificacion.setTipoNotificacionIdNotificacion(tipoNotificacion);
        notificacion.setEstudianteIdEstudiante(estudiante);

        return notificacionDAO.save(notificacion);
    }

    @Override
    @Transactional
    public Notificacion update(Notificacion notificacion, Long id) {
        Optional<Notificacion> existingNotificacion = notificacionDAO.findById(id);
        if (existingNotificacion.isPresent()) {
            Notificacion notificacionToUpdate = existingNotificacion.get();

            TipoNotificacion tipoNotificacion = tipoNotificacionService.findById(notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion())
                    .orElseThrow(() -> new RuntimeException(
                            "Tipo de notificacion no encontrada con el id: " + notificacion.getTipoNotificacionIdNotificacion().getIdNotificacion()));

            Estudiante estudiante = estudianteService.findById(notificacion.getEstudianteIdEstudiante().getIdEstudiante())
                    .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: "
                            + notificacion.getEstudianteIdEstudiante().getIdEstudiante()));

            // Actualizar los campos de la respuesta con los valores correspondientes
            notificacionToUpdate.setTitulo(notificacion.getTitulo());
            notificacionToUpdate.setContenido(notificacion.getContenido());
            notificacionToUpdate.setFecha(notificacion.getFecha());
            notificacionToUpdate.setEstadoNotificacion(notificacion.getEstadoNotificacion());
            notificacionToUpdate.setTipoNotificacionIdNotificacion(tipoNotificacion);
            notificacionToUpdate.setEstudianteIdEstudiante(estudiante);

            return notificacionDAO.save(notificacionToUpdate);
        } else {
            throw new RuntimeException("Respuesta no encontrada con el id: " + id);
        }
    }

    @Override
    @Transactional
    public void marcarComoLeida(Long id) {
        Optional<Notificacion> notificacion = notificacionDAO.findById(id);
        if (notificacion.isPresent()) {
            notificacionDAO.marcarComoLeida(id);
        } else {
            throw new RuntimeException("Notificación no encontrada con el id: " + id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Notificacion> findByEstudiante(Long idEstudiante, Pageable pageable) {
        // Buscar la entidad Estudiante usando el id
        Estudiante estudiante = estudianteService.findById(idEstudiante)
                .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: " + idEstudiante));

        // Luego, pasar la entidad Estudiante a la consulta
        return notificacionDAO.findByEstudianteIdEstudiante(estudiante, pageable);
    }
 
}