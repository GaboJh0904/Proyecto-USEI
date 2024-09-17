package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.repositories.EncuestaDAO;
import com.usei.usei.models.Encuesta;
import com.usei.usei.models.Usuario;

@Service
public class EncuestaBL implements EncuestaService {

    private final EncuestaDAO encuestaDAO;
    private final UsuarioService usuarioService;

    @Autowired
    public EncuestaBL(EncuestaDAO encuestaDAO, UsuarioService usuarioService) {
        this.encuestaDAO = encuestaDAO;
        this.usuarioService = usuarioService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Encuesta> findAll() {
        return encuestaDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Encuesta> findById(Long id) {
        return encuestaDAO.findById(id);
    }

    @Override
    @Transactional
    public Encuesta save(Encuesta encuesta) {
        Usuario usuario = usuarioService.findById(encuesta.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException(
                        "Usuario no encontrado con el id: " + encuesta.getUsuarioIdUsuario().getIdUsuario()));

        encuesta.setUsuarioIdUsuario(usuario);

        return encuestaDAO.save(encuesta);
    }

    @Override
    @Transactional
    public Encuesta update(Encuesta encuesta, Long id) {
        Optional<Encuesta> existingEncuesta = encuestaDAO.findById(id);
        if (existingEncuesta.isPresent()) {
            Encuesta encuestaToUpdate = existingEncuesta.get();

            Usuario usuario = usuarioService.findById(encuesta.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException(
                            "Usuario no encontrado con el id: " + encuesta.getUsuarioIdUsuario().getIdUsuario()));

            // Actualizar los campos de la encuesta con los valores correspondientes
            encuestaToUpdate.setTitulo(encuesta.getTitulo());
            encuestaToUpdate.setDescripcion(encuesta.getDescripcion());
            encuestaToUpdate.setFechaModificado(encuesta.getFechaModificado());
            encuestaToUpdate.setUsuarioIdUsuario(usuario);

            return encuestaDAO.save(encuestaToUpdate);
        } else {
            throw new RuntimeException("Encuesta no encontrada con el id: " + id);
        }
    }
}