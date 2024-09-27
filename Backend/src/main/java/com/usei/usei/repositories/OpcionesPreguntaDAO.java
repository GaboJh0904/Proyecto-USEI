package com.usei.usei.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.OpcionesPregunta;

@Repository
public interface OpcionesPreguntaDAO extends  JpaRepository<OpcionesPregunta, Long> {

    List<OpcionesPregunta> findByPreguntaIdPregunta_IdPregunta(Long idPregunta);
}
