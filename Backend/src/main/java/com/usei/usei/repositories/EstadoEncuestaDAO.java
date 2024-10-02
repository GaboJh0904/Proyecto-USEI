package com.usei.usei.repositories;

import java.util.List;
import java.util.Optional;

//import org.apache.el.stream.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.EstadoEncuesta;

@Repository
public interface EstadoEncuestaDAO extends  JpaRepository<EstadoEncuesta, Long> {

    // Método para obtener encuestas con estado "Pendiente"
    List<EstadoEncuesta> findByEstado(String estado);

    Optional<EstadoEncuesta> findByEstudianteId(Long idEstudiante);


}