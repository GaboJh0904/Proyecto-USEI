package com.usei.usei.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
    @Transactional
    public Noticias save(Noticias noticias, MultipartFile file) {
        try {
            // Verifica si el archivo no está vacío
            if (file != null && !file.isEmpty()) {
                // Ruta donde se almacenará la imagen
                String directory = "src/main/resources/static/documents/imagenes/";
                String fileName = file.getOriginalFilename();

                // Guarda la imagen físicamente en la carpeta
                Path filePath = Paths.get(directory, fileName);
                Files.copy(file.getInputStream(), filePath);

                // Guarda solo el nombre del archivo en la base de datos
                noticias.setImg(fileName);
            }

            // Asocia el usuario
            Usuario usuario = usuarioService.findById(noticias.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + noticias.getUsuarioIdUsuario().getIdUsuario()));
            noticias.setUsuarioIdUsuario(usuario);

            // Guarda la noticia en la base de datos
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
}

