package com.usei.usei.repositories;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.usei.usei.models.EstadoCertificado;

@Repository
public interface EstadoCertificadoDAO extends  JpaRepository<EstadoCertificado, Long> {
    Optional<EstadoCertificado> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);
    
    @Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE ec.estado = :estado GROUP BY e.carrera")
    List<Object[]> countCertificadosEmitidosByCarrera(@Param("estado") String estado);

    // @Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE YEAR(ec.fechaEstado) = :year AND ec.estado = :estado GROUP BY e.carrera")
    // List<Object[]> countCertificadosEmitidosByCarreraAndYear(@Param("year") Integer year, @Param("estado") String estado);

// Método para filtrar solo por anio
@Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE e.anio = :anio AND ec.estado = :estado GROUP BY e.carrera")
List<Object[]> countCertificadosEmitidosByCarreraAndAnio(@Param("anio") Integer anio, @Param("estado") String estado);

// Método para filtrar solo por semestre
@Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE e.semestre = :semestre AND ec.estado = :estado GROUP BY e.carrera")
List<Object[]> countCertificadosEmitidosByCarreraAndSemestre(@Param("semestre") Integer semestre, @Param("estado") String estado);

// Método para filtrar por anio y semestre
@Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE e.anio = :anio AND e.semestre = :semestre AND ec.estado = :estado GROUP BY e.carrera")
List<Object[]> countCertificadosEmitidosByCarreraAnioAndSemestre(@Param("anio") Integer anio, @Param("semestre") Integer semestre, @Param("estado") String estado);

    // Buscar por estado
    Page<EstadoCertificado> findByEstadoContainingIgnoreCase(String estado, Pageable pageable);

    // Buscar por nombre del estudiante
    @Query("SELECT ec FROM EstadoCertificado ec WHERE LOWER(ec.estudianteIdEstudiante.nombre) LIKE LOWER(CONCAT('%', :nombre, '%'))")
    Page<EstadoCertificado> findByNombreEstudiante(@Param("nombre") String nombre, Pageable pageable);

    // Buscar por estado y nombre del estudiante
    @Query("SELECT ec FROM EstadoCertificado ec WHERE LOWER(ec.estado) LIKE LOWER(CONCAT('%', :estado, '%')) AND LOWER(ec.estudianteIdEstudiante.nombre) LIKE LOWER(CONCAT('%', :nombre, '%'))")
    Page<EstadoCertificado> findByEstadoAndNombre(@Param("estado") String estado, @Param("nombre") String nombre, Pageable pageable);

    // Todos los certificados (con paginación)
    Page<EstadoCertificado> findAll(Pageable pageable);

    @Query("SELECT e FROM EstadoCertificado e JOIN e.estudianteIdEstudiante est ORDER BY est.nombre ASC")
    Page<EstadoCertificado> findAllOrderByNombre(Pageable pageable);

}

