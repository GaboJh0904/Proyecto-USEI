package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Estudiante;

@Repository
public interface EstudianteDAO extends  JpaRepository<Estudiante, Long> {

    
}
