package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Notificacion;

public interface NotificacionService {
    
    public Iterable<Notificacion> findAll();

    public Optional<Notificacion> findById(Long id);

    public Notificacion save(Notificacion newNopNotificacion);

    public Notificacion update (Notificacion newNotificacion, Long id);

    void marcarComoLeida(Long id);
    
}
