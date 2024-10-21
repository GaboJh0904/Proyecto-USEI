package com.usei.usei.repositories;

//import org.hibernate.mapping.List;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Estudiante;

@Repository
public interface EstudianteDAO extends  JpaRepository<Estudiante, Long> {

    Optional<Estudiante> findByCiAndContrasena(int ci, String contrasena);
    List<Estudiante> findByCorreoInstitucionalIsNotNull();
    Estudiante findByCorreoInstitucional(String correoInstitucional);
}
 