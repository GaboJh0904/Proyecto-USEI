package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Pregunta;

@Repository
public interface PreguntaDAO extends  JpaRepository<Pregunta, Long> {

    
}
