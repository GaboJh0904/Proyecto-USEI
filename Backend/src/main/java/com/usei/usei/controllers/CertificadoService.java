package com.usei.usei.controllers;

import java.util.Optional;

import com.usei.usei.models.Certificado;

import jakarta.mail.MessagingException;

public interface CertificadoService {

    public Iterable<Certificado> findAll();

    public Optional<Certificado> findById(Long id);

    public Certificado save(Certificado newCertificado);

    public Certificado update(Certificado newCertificado, Long id);

    public void enviarCertificadoConCondiciones(Long idEstudiante) throws MessagingException;

    public void sendCertificadoEmail(String to, String subject, String body, String attachmentPath) throws MessagingException;

    
    
}
