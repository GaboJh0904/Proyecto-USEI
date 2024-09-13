package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.EstadoEncuesta;

@Repository
public interface EstadoEncuestaDAO extends  JpaRepository<EstadoEncuesta, Long> {

    
}
