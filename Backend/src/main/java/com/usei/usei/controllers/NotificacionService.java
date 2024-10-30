package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.usei.usei.models.Notificacion;

public interface NotificacionService {
    
    public Iterable<Notificacion> findAll();

    public Optional<Notificacion> findById(Long id);

    public Notificacion save(Notificacion newNopNotificacion);

    public Notificacion update (Notificacion newNotificacion, Long id);

    void marcarComoLeida(Long id);

    public Page<Notificacion> findByEstudiante(Long idEstudiante, Pageable pageable); // Ahora retorna un Page en lugar de Iterable
    
}
