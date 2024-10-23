package com.usei.usei.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Pregunta;

@Repository
public interface PreguntaDAO extends JpaRepository<Pregunta, Long> {

    // Método para obtener preguntas con filtrado
    @Query("SELECT p FROM Pregunta p WHERE LOWER(p.pregunta) LIKE LOWER(CONCAT('%', :filter, '%'))")
    Page<Pregunta> findByFilter(Pageable pageable, String filter);
}
