package com.usei.usei.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;

import com.usei.usei.models.Respuesta;
import com.usei.usei.models.Estudiante;

@Repository
public interface RespuestaDAO extends  JpaRepository<Respuesta, Long> {
    //verificar si el estudiante ya lleno la encuesta
    List<Respuesta> findByEstudianteIdEstudiante_IdEstudiante(Long idEstudiante);
    //estudiantes completaron encuesta
    @Query("SELECT DISTINCT new com.usei.usei.models.Estudiante(e.idEstudiante, e.nombre, e.apellido) FROM Respuesta r JOIN r.estudianteIdEstudiante e")
    List<Estudiante> findEstudiantesQueCompletaronEncuesta();
    
}
