package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.EncuestaGestion;

@Repository
public interface EncuestaGestionDAO extends JpaRepository <EncuestaGestion, Long> {

    
}
