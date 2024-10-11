package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Soporte;

@Repository
public interface SoporteDAO extends  JpaRepository<Soporte, Long> {

    
}
