package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Noticias;

import java.util.List;

@Repository
public interface NoticiasDAO extends JpaRepository<Noticias, Long> {
    List<Noticias> findByEstado(String estado);

}
