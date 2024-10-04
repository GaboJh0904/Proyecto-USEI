package com.usei.usei.repositories;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.EstadoCertificado;

@Repository
public interface EstadoCertificadoDAO extends  JpaRepository<EstadoCertificado, Long> {
    Optional<EstadoCertificado> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);
    
}
