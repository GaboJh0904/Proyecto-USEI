package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.HEstudiante;

@Repository
public interface HEstudianteDAO extends  JpaRepository<HEstudiante, Long> {

    
}