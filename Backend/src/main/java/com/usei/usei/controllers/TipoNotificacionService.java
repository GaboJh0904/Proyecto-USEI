package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import com.usei.usei.models.TipoNotificacion;

public interface TipoNotificacionService {
    
    public Iterable<TipoNotificacion> findAll();

    public Optional<TipoNotificacion> findById(Long id);

    public TipoNotificacion save(TipoNotificacion newTipoNotificacion);

    public TipoNotificacion update (TipoNotificacion newTipoNotificacion, Long id);

    public void deleteById(Long id);

    public TipoNotificacion findByTipoNotificacion(String tipo);

}
