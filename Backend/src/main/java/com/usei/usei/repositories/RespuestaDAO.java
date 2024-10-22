package com.usei.usei.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.usei.usei.models.Respuesta;

@Repository
public interface RespuestaDAO extends JpaRepository<Respuesta, Long> {
    boolean existsByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);

    // Paginación y ordenamiento para obtener respuestas de un estudiante
    Page<Respuesta> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante, PageRequest pageRequest);

    // Paginación, filtrado y ordenamiento para respuestas de un estudiante por tipo de pregunta
    @Query("SELECT r FROM Respuesta r WHERE r.estudianteIdEstudiante.idEstudiante = :idEstudiante AND r.preguntaIdPregunta.tipoPregunta = :tipoPregunta")
    Page<Respuesta> findRespuestasByEstudianteIdAndTipoPregunta(Long idEstudiante, String tipoPregunta, PageRequest pageRequest);
}
