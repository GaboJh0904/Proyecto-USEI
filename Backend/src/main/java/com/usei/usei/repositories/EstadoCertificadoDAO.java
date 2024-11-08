package com.usei.usei.repositories;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

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

}

