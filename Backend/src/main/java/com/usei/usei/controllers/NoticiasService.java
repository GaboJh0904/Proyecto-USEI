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

    public Noticias save(Noticias newNoticias);

    public Noticias save(Noticias newNoticias, MultipartFile file);

    public Noticias actualizacionNoticia(Noticias newNoticias, Long id, MultipartFile file);

    public void delete(Long id);

    List<Noticias> findByEstado(String estado);

    Page<Noticias> findAll(Pageable pageable);


    Page<Noticias> findByEstadoWithPagination(String estado, Pageable paging);

    Page<Noticias> findByFilter(String filter, Pageable paging);

    Page<Noticias> findByEstadoWithFilter(String estado, String filter, Pageable pageable);

    Page<Noticias> findByEstadoAndFilter(String estado, String filter, Pageable paging);
}
