package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Plazo;

@Repository
public interface PlazoDAO extends  JpaRepository<Plazo, Long> {

    
}
