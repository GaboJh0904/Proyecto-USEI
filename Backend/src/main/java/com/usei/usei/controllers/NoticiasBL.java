package com.usei.usei.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.repositories.NoticiasDAO;
import com.usei.usei.models.Noticias;
import com.usei.usei.models.Usuario;

@Service
public class NoticiasBL implements NoticiasService {

    private final NoticiasDAO noticiasDAO;
    private final UsuarioService usuarioService;

    @Autowired
    public NoticiasBL(NoticiasDAO noticiasDAO, UsuarioService usuarioService) {
        this.noticiasDAO = noticiasDAO;
        this.usuarioService = usuarioService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Noticias> findAll() {
        return noticiasDAO.findAll();
    }


    @Override
    @Transactional(readOnly = true)
    public Optional<Noticias> findById(Long id) {
        return noticiasDAO.findById(id);
    }

    @Override
    public Noticias save(Noticias newNoticias) {
        return noticiasDAO.save(newNoticias);
    }

    @Override
    @Transactional
    public Noticias save(Noticias noticias, MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {
                String directory = "src/main/resources/static/documents/imagenes/";
                String fileName = file.getOriginalFilename();

                Path filePath = Paths.get(directory, fileName);
                Files.copy(file.getInputStream(), filePath);

                noticias.setImg(fileName);
            }
            Usuario usuario = usuarioService.findById(noticias.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + noticias.getUsuarioIdUsuario().getIdUsuario()));
            noticias.setUsuarioIdUsuario(usuario);

            return noticiasDAO.save(noticias);

        } catch (IOException e) {
            throw new RuntimeException("Error al guardar la imagen", e);
        }
    }


    @Override
    @Transactional
    public Noticias update(Noticias noticias, Long id, MultipartFile file) {
        Optional<Noticias> existingNoticias = noticiasDAO.findById(id);
        if (existingNoticias.isPresent()) {
            Noticias noticiasToUpdate = existingNoticias.get();

            try {
                if (file != null && !file.isEmpty()) {
                    String fileName = file.getOriginalFilename();
                    noticiasToUpdate.setImg(fileName); // Guardamos solo el nombre del archivo
                }
            } catch (Exception e) {
                throw new RuntimeException("Error al procesar la imagen", e);
            }

            Usuario usuario = usuarioService.findById(noticias.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + noticias.getUsuarioIdUsuario().getIdUsuario()));

            noticiasToUpdate.setTitulo(noticias.getTitulo());
            noticiasToUpdate.setDescripcion(noticias.getDescripcion());
            noticiasToUpdate.setFechaModificado(noticias.getFechaModificado());
            noticiasToUpdate.setEstado(noticias.getEstado());
            noticiasToUpdate.setUsuarioIdUsuario(usuario);

            return noticiasDAO.save(noticiasToUpdate);
        } else {
            throw new RuntimeException("Noticia no encontrada con el id: " + id);
        }
    }

    @Override
    public void delete(Long id) {
        Optional<Noticias> noticia = noticiasDAO.findById(id);
        if (noticia.isPresent()) {
            noticiasDAO.deleteById(id);
        } else {
            throw new RuntimeException("La noticia con el ID " + id + " no existe.");
        }
    }

    @Override
    public List<Noticias> findByEstado(String estado) {
        return noticiasDAO.findByEstado(estado);
    }
}

