package com.usei.usei.repositories;
//import org.hibernate.mapping.List;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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

    List<Respuesta> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);


}
