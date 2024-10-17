package com.usei.usei.repositories;

import com.usei.usei.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.usei.usei.models.Soporte;

import java.util.List;

@Repository
public interface SoporteDAO extends JpaRepository<Soporte, Long> {
    List<Soporte> findByUsuario(Usuario usuario);
}
