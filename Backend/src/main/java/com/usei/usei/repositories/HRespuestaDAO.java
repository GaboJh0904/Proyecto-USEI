package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Respuesta;

@Repository
public interface HRespuestaDAO extends  JpaRepository<Respuesta, Long> {

    
}
