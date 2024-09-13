package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.HCertificado;

@Repository
public interface HCertificadoDAO extends  JpaRepository<HCertificado, Long> {

    
}
