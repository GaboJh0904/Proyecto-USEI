package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Encuesta;

@Repository
public interface EncuestaDAO extends  JpaRepository<Encuesta, Long> {

    
}
