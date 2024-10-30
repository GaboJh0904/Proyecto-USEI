package com.usei.usei.controllers;

import com.usei.usei.models.Soporte;
import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SoporteService {
    public Iterable<Soporte> findAll();
    public Optional<Soporte> findById(Long id);
    public Soporte save(Soporte soporte);
    public Soporte update(Soporte soporte, Long id);
    public List<Soporte> findByUsuarioId(Long idUsuario);
    Page<Soporte> findAll(Pageable pageable);
    Page<Soporte> findByUsuarioId(Long idUsuario, Pageable pageable);
    Page<Soporte> findByUsuarioAndFilter(Long idUsuario, String filter, Pageable pageable);
    Page<Soporte> findByFilter(String filter, Pageable pageable);
}
