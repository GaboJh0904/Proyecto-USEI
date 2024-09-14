package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.UsuarioDAO;

@Service
public class UsuarioBL {

    private final UsuarioDAO usuarioDAO;

    @Autowired
    public UsuarioBL(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    @Transactional(readOnly = true)
    public Iterable<Usuario> findAll() {
        return usuarioDAO.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<Usuario> findById(Long id) {
        return usuarioDAO.findById(id);
    }

    @Transactional
    public Usuario save(Usuario usuario) {
        return usuarioDAO.save(usuario);
    }

    @Transactional
    public void update(Usuario usuario, Long id) {
        Optional<Usuario> existingUsuario = usuarioDAO.findById(id);
        if (existingUsuario.isPresent()) {
            Usuario usuarioToUpdate = existingUsuario.get();
            usuarioToUpdate.setNombre(usuario.getNombre());
            usuarioToUpdate.setCorreo(usuario.getCorreo());
            // Actualizar otros campos si es necesario

            usuarioDAO.save(usuarioToUpdate);
        } else {
            throw new RuntimeException("Usuario no encontrado con el id: " + id);
        }
    }
}
