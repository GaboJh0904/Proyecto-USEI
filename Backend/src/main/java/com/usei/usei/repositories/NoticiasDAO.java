package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.usei.usei.models.Noticias;

import java.util.List;

@Repository
public interface NoticiasDAO extends JpaRepository<Noticias, Long> {
    List<Noticias> findByEstado(String estado);
    Page<Noticias> findAll(Pageable pageable);
    Page<Noticias> findByEstado(String estado, Pageable pageable);

}
