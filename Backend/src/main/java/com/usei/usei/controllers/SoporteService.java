package com.usei.usei.controllers;

import com.usei.usei.models.Soporte;
import java.util.List;
import java.util.Optional;

public interface SoporteService {
    public Iterable<Soporte> findAll();
    public Optional<Soporte> findById(Long id);
    public Soporte save(Soporte soporte);
    public Soporte update(Soporte soporte, Long id);
    public List<Soporte> findByUsuarioId(Long idUsuario);  // Solo la declaración del método
}
