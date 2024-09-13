package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Reporte;

@Repository
public interface ReporteDAO extends  JpaRepository<Reporte, Long> {

    
}
