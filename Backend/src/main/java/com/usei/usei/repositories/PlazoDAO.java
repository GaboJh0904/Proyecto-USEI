package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Plazo;
import java.util.Optional;

@Repository
public interface PlazoDAO extends  JpaRepository<Plazo, Long> {

    Optional<Plazo> findByEstado(String estado);

}
