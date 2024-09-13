package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Usuario;

@Repository
public interface HUsuarioDAO extends  JpaRepository<Usuario, Long> {

    
}
