package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.Usuario;

import jakarta.mail.MessagingException;

public interface UsuarioService {

    public Iterable<Usuario> findAll();

    public Optional<Usuario> findById(Long id);

    public Usuario save(Usuario newuUsuario);

    public void deleteById(Long id);

    public Usuario update (Usuario newUsuario, Long id);

    Optional<Usuario> login(String correo, String contrasenia);

    public Long findByMail(String correo) throws MessagingException;

    public void enviarCodigoVerificacion(String correo) throws MessagingException;

    public String obtenerCodigoVerificacion();
    
}
