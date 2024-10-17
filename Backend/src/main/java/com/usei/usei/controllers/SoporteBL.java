package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.usei.usei.models.Soporte;
import com.usei.usei.repositories.SoporteDAO;
import com.usei.usei.repositories.UsuarioDAO;  // Importa el UsuarioDAO

@Service
public class SoporteBL implements SoporteService {

    @Autowired
    private SoporteDAO soporteDAO;

    @Autowired
    private UsuarioDAO usuarioDAO;  // Inyecta UsuarioDAO

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
    public List<Soporte> findByUsuarioId(Long idUsuario) {
        // Aquí se busca el usuario por su ID usando usuarioDAO
        Usuario usuario = usuarioDAO.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        return soporteDAO.findByUsuario(usuario);  // Busca por el objeto Usuario
    }
}
