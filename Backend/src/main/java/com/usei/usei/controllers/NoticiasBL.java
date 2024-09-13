package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.repositories.NoticiasDAO;
import com.usei.usei.models.Noticias;
import com.usei.usei.models.Usuario;

@Service
public class NoticiasBL implements NoticiasService{
    
    private final NoticiasDAO noticiasDAO;
    private final UsuarioService usuarioService;

    @Autowired
    public NoticiasBL(NoticiasDAO noticiasDAO, UsuarioService usuarioService){
        this.noticiasDAO = noticiasDAO;
        this.usuarioService = usuarioService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Noticias> findAll(){
        return noticiasDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Noticias> findById(Long id){
        return noticiasDAO.findById(id);
    }

    @Override
    @Transactional
    public Noticias save(Noticias noticias) {

        Usuario usuario = usuarioService.findById(noticias.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + noticias.getUsuarioIdUsuario().getIdUsuario()));


        noticias.setUsuarioIdUsuario(usuario);

        return noticiasDAO.save(noticias);
    }

    @Override
    @Transactional
    public void update(Noticias noticias, Long id) {
        Optional<Noticias> existingNoticias = noticiasDAO.findById(id);
        if (existingNoticias.isPresent()) {
            Noticias noticiasToUpdate = existingNoticias.get();

            Usuario usuario = usuarioService.findById(noticias.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrada con el id: " + noticias.getUsuarioIdUsuario().getIdUsuario()));

            noticiasToUpdate.setUsuarioIdUsuario(usuario);

            noticiasDAO.save(noticiasToUpdate);
        } else {
            throw new RuntimeException("Almacen no encontrado con el id: " + id);
        }
    }

}
