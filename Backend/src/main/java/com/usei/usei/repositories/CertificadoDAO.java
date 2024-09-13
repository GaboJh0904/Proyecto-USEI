package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Certificado;

@Repository
public interface CertificadoDAO extends JpaRepository <Certificado, Long> {

    
}
