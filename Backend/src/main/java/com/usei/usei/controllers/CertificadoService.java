package com.usei.usei.controllers;
import java.util.Optional;

import org.springframework.data.domain.Sort;

import com.usei.usei.models.Certificado;

import jakarta.mail.MessagingException;

public interface CertificadoService {

    public Iterable<Certificado> findAll(); 
    public Iterable<Certificado> findAll(Sort sort); 


    public Optional<Certificado> findById(Long id);

    public Certificado save(Certificado newCertificado);

    public Certificado update(Certificado newCertificado, Long id);

    public void enviarCertificadoConCondiciones(Long idEstudiante) throws MessagingException;

    public void sendCertificadoEmail(String to, String subject, String body, String attachmentPath, String fileName) throws MessagingException;

    public int obtenerUltimaVersion();
    public Optional<Certificado> findCertificadoEnUso();

    
}
