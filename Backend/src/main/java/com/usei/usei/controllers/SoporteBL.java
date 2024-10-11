package com.usei.usei.controllers;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Soporte;
import com.usei.usei.models.TipoProblema;
import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.SoporteDAO;

@Service
public class SoporteBL implements SoporteService {

    private final SoporteDAO soporteDAO;
    private final TipoProblemaService tipoProblemaService;
    private final UsuarioService usuarioService;

    @Autowired
    public SoporteBL(SoporteDAO soporteDAO, TipoProblemaService tipoProblemaService,
            UsuarioService usuarioService) {
        this.soporteDAO = soporteDAO;
        this.tipoProblemaService = tipoProblemaService;
        this.usuarioService = usuarioService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Soporte> findAll() {
        return soporteDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Soporte> findById(Long id) {
        return soporteDAO.findById(id);
    }

    @Override
    @Transactional
    public Soporte save(Soporte soporte) {
        TipoProblema tipoProblema = tipoProblemaService.findById(soporte.getTipoProblemaIdProblema().getIdProblema())
                .orElseThrow(() -> new RuntimeException(
                        "Tipo problema no encontrada con el id: " + soporte.getTipoProblemaIdProblema().getIdProblema()));

        Usuario usuario = usuarioService.findById(soporte.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: "
                        + soporte.getUsuarioIdUsuario().getIdUsuario()));

        soporte.setTipoProblemaIdProblema(tipoProblema);
        soporte.setUsuarioIdUsuario(usuario);

        return soporteDAO.save(soporte);
    }

    @Override
    @Transactional
    public Soporte update(Soporte soporte, Long id) {
        Optional<Soporte> existingSoporte = soporteDAO.findById(id);
        if (existingSoporte.isPresent()) {
            Soporte soporteToUpdate = existingSoporte.get();

            TipoProblema tipoProblema = tipoProblemaService.findById(soporte.getTipoProblemaIdProblema().getIdProblema())
                    .orElseThrow(() -> new RuntimeException(
                            "Tipo de problema no encontrada con el id: " + soporte.getTipoProblemaIdProblema().getIdProblema()));

            Usuario usuario = usuarioService.findById(soporte.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: "
                            + soporte.getUsuarioIdUsuario().getIdUsuario()));

            // Actualizar los campos de la respuesta con los valores correspondientes
            soporteToUpdate.setMensaje(soporte.getMensaje());
            soporteToUpdate.setFecha(soporte.getFecha());
            soporteToUpdate.setTipoProblemaIdProblema(tipoProblema);
            soporteToUpdate.setUsuarioIdUsuario(usuario);

            return soporteDAO.save(soporteToUpdate);
        } else {
            throw new RuntimeException("Respuesta no encontrada con el id: " + id);
        }
    }
 
}