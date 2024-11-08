package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.usei.usei.dto.request.EstadoEncuestaEstudianteDTO;
import com.usei.usei.models.EstadoEncuesta;

import jakarta.mail.MessagingException;


public interface EstadoEncuestaService {
    
    public Iterable<EstadoEncuesta> findAll();

    public Optional<EstadoEncuesta> findById(Long id);

    public EstadoEncuesta save(EstadoEncuesta newEstadoEncuesta);

    public EstadoEncuesta update (EstadoEncuesta newEstadoEncuesta, Long id);

    // Método para obtener encuestas con estado "Pendiente"
    public List<EstadoEncuesta> findByEstadoPendiente();

    // método para obtener encuestas con estado "Completado"
    public List<EstadoEncuesta> findByEstadoCompletado();

    // Método para obtener encuestas con estado "Pendiente" de forma paginada
    Page<EstadoEncuestaEstudianteDTO> findByEstadoPendientePaginated(Pageable pageable);

    Optional<EstadoEncuesta> findByEstudianteIdEstudiante(Long idEstudiante);

    public void enviarCorreosEstudiantesPendientes() throws MessagingException;

    public void enviarCorreosEstudiantesPersonal(String correo, String cuerpo) throws MessagingException;

    List<EstadoEncuesta> findCompletadasByAnioAndSemestre(Integer anio, Integer semestre);


}
