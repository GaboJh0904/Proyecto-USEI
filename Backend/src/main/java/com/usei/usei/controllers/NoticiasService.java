package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.models.Noticias;

public interface NoticiasService {

    public Iterable<Noticias> findAll();

    public Optional<Noticias> findById(Long id);

    public Noticias save(Noticias newNoticias, MultipartFile file);

    public Noticias update(Noticias newNoticias, Long id, MultipartFile file);

}
