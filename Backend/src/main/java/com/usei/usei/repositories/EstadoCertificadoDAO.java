package com.usei.usei.repositories;
import java.util.Optional;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.Map;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.EstadoCertificado;

@Repository
public interface EstadoCertificadoDAO extends  JpaRepository<EstadoCertificado, Long> {
    Optional<EstadoCertificado> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);
    
    @Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE ec.estado = :estado GROUP BY e.carrera")
    List<Object[]> countCertificadosEmitidosByCarrera(@Param("estado") String estado);

    @Query("SELECT e.carrera, COUNT(ec) FROM EstadoCertificado ec JOIN ec.estudianteIdEstudiante e WHERE YEAR(ec.fechaEstado) = :year AND ec.estado = :estado GROUP BY e.carrera")
    List<Object[]> countCertificadosEmitidosByCarreraAndYear(@Param("year") Integer year, @Param("estado") String estado);


}

