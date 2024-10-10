package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Soporte;

public interface SoporteService {
    
    public Iterable<Soporte> findAll();

    public Optional<Soporte> findById(Long id);

    public Soporte save(Soporte newSoporte);

    public Soporte update (Soporte newSoporte, Long id);
    
}
