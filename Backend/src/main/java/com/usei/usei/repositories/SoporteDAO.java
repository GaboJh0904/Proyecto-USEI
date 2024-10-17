package com.usei.usei.repositories;

import com.usei.usei.models.Soporte;
import com.usei.usei.models.Usuario;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SoporteDAO extends JpaRepository<Soporte, Long> {

    // Método para buscar reportes por usuario sin paginación
    List<Soporte> findByUsuario(Usuario usuario);

    // Método para buscar reportes por usuario con paginación
    Page<Soporte> findByUsuario(Usuario usuario, Pageable pageable);

    // Método para buscar reportes por usuario y mensaje con paginación
    Page<Soporte> findByUsuarioAndMensajeContaining(Usuario usuario, String mensaje, Pageable pageable);

    // Método para buscar reportes por mensaje con paginación
    Page<Soporte> findByMensajeContaining(String mensaje, Pageable pageable);
}
