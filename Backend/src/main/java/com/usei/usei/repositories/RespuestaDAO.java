package com.usei.usei.repositories;
//import org.hibernate.mapping.List;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Respuesta;


@Repository
public interface RespuestaDAO extends  JpaRepository<Respuesta, Long> {
//verificar si el estudiante ya lleno la encuesta
boolean existsByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);

 // Obtener lista de estudiantes que completaron la encuesta
    @Query("SELECT DISTINCT e FROM Respuesta r JOIN r.estudianteIdEstudiante e")
    List<Estudiante> findEstudiantesQueCompletaronEncuesta();

    // Obtener respuestas por estudiante con paginación y ordenación
    Page<Respuesta> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante, Pageable pageable);

    // Filtrado y ordenación por tipo de pregunta
    @Query("SELECT r FROM Respuesta r WHERE r.estudianteIdEstudiante.idEstudiante = :idEstudiante AND r.preguntaIdPregunta.tipoPregunta = :tipoPregunta")
    Page<Respuesta> findRespuestasByEstudianteIdAndTipoPregunta(@Param("idEstudiante") Long idEstudiante, @Param("tipoPregunta") String tipoPregunta, Pageable pageable);
}
