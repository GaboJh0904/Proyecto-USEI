package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.usei.usei.models.Soporte;
import com.usei.usei.repositories.SoporteDAO;
import com.usei.usei.repositories.UsuarioDAO;

@Service
public class SoporteBL implements SoporteService {

    @Autowired
    private SoporteDAO soporteDAO;

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Override
    @Transactional(readOnly = true)
    public Iterable<Soporte> findAll() {
        return soporteDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Soporte> findAll(Pageable pageable) {
        return soporteDAO.findAll(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Soporte> findById(Long id) {
        return soporteDAO.findById(id);
    }

    @Override
    @Transactional
    public Soporte save(Soporte soporte) {
        return soporteDAO.save(soporte);
    }

    @Override
    @Transactional
    public Soporte update(Soporte soporte, Long id) {
        Optional<Soporte> soporteExistente = soporteDAO.findById(id);
        if (soporteExistente.isPresent()) {
            Soporte soporteToUpdate = soporteExistente.get();
            soporteToUpdate.setMensaje(soporte.getMensaje());
            soporteToUpdate.setFecha(soporte.getFecha());
            soporteToUpdate.setTipoProblema(soporte.getTipoProblema());
            soporteToUpdate.setUsuario(soporte.getUsuario());
            return soporteDAO.save(soporteToUpdate);
        } else {
            throw new RuntimeException("Soporte no encontrado con id: " + id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Soporte> findByUsuarioId(Long idUsuario, Pageable pageable) {
        Usuario usuario = usuarioDAO.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        return soporteDAO.findByUsuario(usuario, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Soporte> findByUsuarioAndFilter(Long idUsuario, String filter, Pageable pageable) {
        Usuario usuario = usuarioDAO.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        return soporteDAO.findByUsuarioAndMensajeContaining(usuario, filter, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Soporte> findByFilter(String filter, Pageable pageable) {
        return soporteDAO.findByMensajeContaining(filter, pageable);
    }

    @Override
    public List<Soporte> findByUsuarioId(Long idUsuario) {
        Usuario usuario = usuarioDAO.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        return soporteDAO.findByUsuario(usuario);
    }
}
