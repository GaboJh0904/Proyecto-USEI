package com.usei.usei.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.usei.usei.dto.request.EstadoEncuestaEstudianteDTO;
import com.usei.usei.models.EstadoEncuesta;

@Repository
public interface EstadoEncuestaDAO extends  JpaRepository<EstadoEncuesta, Long> {

    // Método para obtener encuestas con estado "Pendiente"
    List<EstadoEncuesta> findByEstado(String estado);

    @Query("SELECT new com.usei.usei.dto.request.EstadoEncuestaEstudianteDTO(e.idEstEncuesta, e.estado, e.fechaEstado, s.idEstudiante, s.nombre, s.apellido, s.ci, s.anio, s.telefono, s.correoInstitucional) " +
           "FROM EstadoEncuesta e JOIN e.estudianteIdEstudiante s WHERE e.estado = :estado")
    Page<EstadoEncuestaEstudianteDTO> findPendienteWithStudentDataAsDTO(@Param("estado") String estado, Pageable pageable);

    @Query("SELECT new com.usei.usei.dto.request.EstadoEncuestaEstudianteDTO(e.idEstEncuesta, e.estado, e.fechaEstado, s.idEstudiante, s.nombre, s.apellido, s.ci, s.anio, s.telefono, s.correoInstitucional) " +
           "FROM EstadoEncuesta e JOIN e.estudianteIdEstudiante s WHERE e.estado = :estado")
    List<EstadoEncuestaEstudianteDTO> findPendienteWithStudentDataAsDTOList(@Param("estado") String estado);

    Optional<EstadoEncuesta> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);

    @Query("SELECT ee FROM EstadoEncuesta ee WHERE ee.estado = 'Completado' " +
    "AND (:anio IS NULL OR ee.estudianteIdEstudiante.anio = :anio) " +
    "AND (:semestre IS NULL OR ee.estudianteIdEstudiante.semestre = :semestre)")
    List<EstadoEncuesta> findCompletadasByAnioAndSemestre(@Param("anio") Integer anio, @Param("semestre") Integer semestre);


}