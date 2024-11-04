package com.usei.usei.controllers;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Plazo;
import com.usei.usei.models.Usuario;
import com.usei.usei.models.Encuesta;
import com.usei.usei.repositories.PlazoDAO;


@Service
public class PlazoBL implements PlazoService {

    private final PlazoDAO plazoDAO;
    private final UsuarioService usuarioService;
    private final EncuestaService encuestaService;

    @Autowired
    public PlazoBL(PlazoDAO plazoDAO, UsuarioService usuarioService, EncuestaService encuestaService) {
        this.plazoDAO = plazoDAO;
        this.usuarioService = usuarioService;
        this.encuestaService = encuestaService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Plazo> findAll() {
        return plazoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Plazo> findById(Long id) {
        return plazoDAO.findById(id);
    }

    @Override
    @Transactional
    public Plazo save(Plazo plazo) {
        Usuario usuario = usuarioService.findById(plazo.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException(
                        "Usuario no encontrada con el id: " + plazo.getUsuarioIdUsuario().getIdUsuario()));

        Encuesta encuesta = encuestaService.findById(plazo.getEncuestaIdEncuesta().getIdEncuesta())
                .orElseThrow(() -> new RuntimeException(
                        "Encuesta no encontrada con el id: " + plazo.getEncuestaIdEncuesta().getIdEncuesta()));

        plazo.setUsuarioIdUsuario(usuario);
        plazo.setEncuestaIdEncuesta(encuesta);

        return plazoDAO.save(plazo);
    }

    @Override
    @Transactional
    public Plazo update(Plazo plazo, Long id) {
        Optional<Plazo> existingPlazo = plazoDAO.findById(id);
        if (existingPlazo.isPresent()) {
            Plazo plazoToUpdate = existingPlazo.get();

            Usuario usuario = usuarioService.findById(plazo.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException(
                            "Usuario no encontrada con el id: " + plazo.getUsuarioIdUsuario().getIdUsuario()));

            Encuesta encuesta = encuestaService.findById(plazo.getEncuestaIdEncuesta().getIdEncuesta())
                    .orElseThrow(() -> new RuntimeException(
                            "Encuesta no encontrada con el id: " + plazo.getEncuestaIdEncuesta().getIdEncuesta()));

            // Actualizar los campos de la respuesta con los valores correspondientes
            plazoToUpdate.setFechaFinalizacion(plazo.getFechaFinalizacion());
            plazoToUpdate.setFechaModificacion(plazo.getFechaModificacion());
            plazoToUpdate.setEstado(plazo.getEstado());
            plazoToUpdate.setEncuestaIdEncuesta(encuesta);
            plazoToUpdate.setUsuarioIdUsuario(usuario);

            return plazoDAO.save(plazoToUpdate);
        } else {
            throw new RuntimeException("Respuesta no encontrada con el id: " + id);
        }
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        plazoDAO.deleteById(id);
    }
 
}