package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.HReporte;

@Repository
public interface HReporteDAO extends  JpaRepository<HReporte, Long> {

    
}