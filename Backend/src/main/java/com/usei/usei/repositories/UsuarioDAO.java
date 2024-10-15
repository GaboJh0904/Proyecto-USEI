package com.usei.usei.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Usuario;

@Repository
public interface UsuarioDAO extends  JpaRepository<Usuario, Long> {

    Optional<Usuario> findByCorreoAndContrasenia(String correo, String contrasenia);

    Usuario findByCorreo(String correo);

}
