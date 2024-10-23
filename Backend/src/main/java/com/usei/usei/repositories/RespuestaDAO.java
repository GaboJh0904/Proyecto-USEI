package com.usei.usei.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import com.usei.usei.models.Respuesta;

@Repository
public interface RespuestaDAO extends JpaRepository<Respuesta, Long>, JpaSpecificationExecutor<Respuesta> {
    boolean existsByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);

    // Paginación y ordenamiento para obtener respuestas de un estudiante
    Page<Respuesta> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante, PageRequest pageRequest);
}
