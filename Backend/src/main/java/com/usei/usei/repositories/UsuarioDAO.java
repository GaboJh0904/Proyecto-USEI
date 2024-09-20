package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Usuario;
import java.util.Optional;

@Repository
public interface UsuarioDAO extends  JpaRepository<Usuario, Long> {

    Optional<Usuario> findByCorreoAndContrasenia(String correo, String contrasenia);

}
