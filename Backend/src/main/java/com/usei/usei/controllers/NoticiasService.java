package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.models.Noticias;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface NoticiasService {

    public Iterable<Noticias> findAll();

    public Optional<Noticias> findById(Long id);

    // Guardar noticia sin imagen
    public Noticias save(Noticias newNoticias);

    // Guardar noticia con imagen
    public Noticias save(Noticias newNoticias, MultipartFile file);

    public Noticias update(Noticias newNoticias, Long id, MultipartFile file);

    public void delete(Long id);

    List<Noticias> findByEstado(String estado);

    // Paginación de noticias existentes
    Page<Noticias> findAll(Pageable pageable);

    // Paginación noticias archivadas
    Page<Noticias> findByEstadoWithPagination(String estado, Pageable pageable);

    // Nuevo método para filtrar noticias por título o autor con paginación
    Page<Noticias> findByFilter(String filter, Pageable pageable);

    // Nuevo método para filtrar noticias archivadas con paginación
    Page<Noticias> findByEstadoWithFilter(String estado, String filter, Pageable pageable);
}
