package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.ParametrosAviso;

@Repository
public interface ParametrosAvisoDAO extends  JpaRepository<ParametrosAviso, Long> {

}
