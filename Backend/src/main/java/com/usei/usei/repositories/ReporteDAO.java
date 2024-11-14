package com.usei.usei.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Reporte;

@Repository
public interface ReporteDAO extends  JpaRepository<Reporte, Long> {

    @Query("SELECT n FROM Reporte n WHERE n.titulo LIKE %:filter% OR n.descripcion LIKE %:filter%")
    Page<Reporte> findByFilter(@Param("filter") String filter, Pageable pageable);
    
}
