package com.usei.usei.repositories;

//import org.hibernate.mapping.List;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Estudiante;

@Repository
public interface EstudianteDAO extends  JpaRepository<Estudiante, Long> {

    Optional<Estudiante> findByCiAndContrasena(int ci, String contrasena);

    List<Estudiante> findByCorreoInstitucionalIsNotNull();

    Estudiante findByCorreoInstitucional(String correoInstitucional);

    // Búsqueda por nombre usando LIKE, con paginación
    Page<Estudiante> findByNombreContainingIgnoreCase(String nombre, Pageable pageable);

    // Búsqueda exacta por CI, con paginación
    Page<Estudiante> findByCi(Integer ci, Pageable pageable);

    // @Query("SELECT e FROM Estudiante e WHERE e.idEstudiante NOT IN (SELECT ee.estudianteIdEstudiante.idEstudiante FROM EstadoEncuesta ee WHERE ee.estado = 'Completado')")
    // List<Estudiante> findEstudiantesNoCompletaronEncuesta();
    @Query("SELECT DISTINCT e.anio FROM Estudiante e ORDER BY e.anio")
    List<Integer> findDistinctAnios();
    
    @Query("SELECT DISTINCT e.semestre FROM Estudiante e ORDER BY e.semestre")
    List<Integer> findDistinctSemestres();
    
    @Query("SELECT e FROM Estudiante e WHERE e.idEstudiante NOT IN " +
       "(SELECT ee.estudianteIdEstudiante.idEstudiante FROM EstadoEncuesta ee WHERE ee.estado = 'Completado') " +
       "AND (:anio IS NULL OR e.anio = :anio) " +
       "AND (:semestre IS NULL OR e.semestre = :semestre)")
List<Estudiante> findNoCompletaronEncuestaByAnioAndSemestre(@Param("anio") Integer anio, @Param("semestre") Integer semestre);


}
 