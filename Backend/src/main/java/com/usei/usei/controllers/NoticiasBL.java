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

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

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
    public Noticias actualizacionNoticia(Noticias noticias, Long id, MultipartFile file) {
        Optional<Noticias> existingNoticias = noticiasDAO.findById(id);
        if (existingNoticias.isPresent()) {
            Noticias noticiasToActualizacion = existingNoticias.get();

            try {
                if (file != null && !file.isEmpty()) {
                    String fileName = file.getOriginalFilename();
                    noticiasToActualizacion.setImg(fileName);
                }
            } catch (Exception e) {
                throw new RuntimeException("Error al procesar la imagen", e);
            }

            Usuario usuario = usuarioService.findById(noticias.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + noticias.getUsuarioIdUsuario().getIdUsuario()));

            noticiasToActualizacion.setTitulo(noticias.getTitulo());
            noticiasToActualizacion.setDescripcion(noticias.getDescripcion());
            noticiasToActualizacion.setFechaModificado(noticias.getFechaModificado());
            noticiasToActualizacion.setEstado(noticias.getEstado());
            noticiasToActualizacion.setUsuarioIdUsuario(usuario);

            return noticiasDAO.save(noticiasToActualizacion);
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

    @Override
    @Transactional(readOnly = true)
    public Page<Noticias> findAll(Pageable pageable) {
        return noticiasDAO.findAll(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Noticias> findByEstadoWithPagination(String estado, Pageable pageable) {
        return noticiasDAO.findByEstado(estado, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Noticias> findByFilter(String filter, Pageable pageable) {
        return noticiasDAO.findByFilter(filter, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Noticias> findByEstadoWithFilter(String estado, String filter, Pageable pageable) {
        return noticiasDAO.findByEstadoAndTituloContainingIgnoreCaseOrDescripcionContainingIgnoreCase(estado, filter, filter, pageable);
    }

    @Override
    public Page<Noticias> findByEstadoAndFilter(String estado, String filter, Pageable pageable) {
        return null;
    }

}

