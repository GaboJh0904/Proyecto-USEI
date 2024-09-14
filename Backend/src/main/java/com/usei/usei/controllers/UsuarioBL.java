package com.usei.usei.controllers;

<<<<<<< HEAD
import java.util.Optional;

=======
>>>>>>> Backend-Branch
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.UsuarioDAO;

<<<<<<< HEAD
@Service
public class UsuarioBL {

    private final UsuarioDAO usuarioDAO;

    @Autowired
    public UsuarioBL(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

=======
import java.util.Optional;

@Service
public class UsuarioBL implements UsuarioService {

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Override
>>>>>>> Backend-Branch
    @Transactional(readOnly = true)
    public Iterable<Usuario> findAll() {
        return usuarioDAO.findAll();
    }

<<<<<<< HEAD
=======
    @Override
>>>>>>> Backend-Branch
    @Transactional(readOnly = true)
    public Optional<Usuario> findById(Long id) {
        return usuarioDAO.findById(id);
    }

<<<<<<< HEAD
=======
    @Override
>>>>>>> Backend-Branch
    @Transactional
    public Usuario save(Usuario usuario) {
        return usuarioDAO.save(usuario);
    }

<<<<<<< HEAD
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
=======
    @Override
    @Transactional
    public void deleteById(Long id) {
        usuarioDAO.deleteById(id);
    }

    @Override
    @Transactional
    public Usuario update(Usuario usuario, Long id) {
    Optional<Usuario> existingUsuario = usuarioDAO.findById(id);
    if (existingUsuario.isPresent()) {
        Usuario usuarioToUpdate = existingUsuario.get();
        usuarioToUpdate.setNombre(usuario.getNombre());
        usuarioToUpdate.setTelefono(usuario.getTelefono());
        usuarioToUpdate.setCorreo(usuario.getCorreo());
        usuarioToUpdate.setRol(usuario.getRol());
        usuarioToUpdate.setUsuario(usuario.getUsuario());
        usuarioToUpdate.setContrasenia(usuario.getContrasenia());

        return usuarioDAO.save(usuarioToUpdate);
    } else {
        throw new RuntimeException("Persona no encontrada con el id: " + id);
    }
}


}
>>>>>>> Backend-Branch
