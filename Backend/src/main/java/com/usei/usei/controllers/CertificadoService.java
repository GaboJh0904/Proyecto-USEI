package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.Certificado;

public interface CertificadoService {
    
public Iterable<Certificado> findAll();

    public Optional<Certificado> findById(Long id);

    public Certificado save(Certificado newCertificado);

    public void update (Certificado newCertificado, Long id);

}
