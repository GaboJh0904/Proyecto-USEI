package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.usei.usei.models.TipoProblema;

@Repository
public interface TipoProblemaDAO extends JpaRepository<TipoProblema, Long> {
}
