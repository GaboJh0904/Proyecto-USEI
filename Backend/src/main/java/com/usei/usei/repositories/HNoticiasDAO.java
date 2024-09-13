package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.HNoticias;

@Repository
public interface HNoticiasDAO extends  JpaRepository<HNoticias, Long> {

    
}
