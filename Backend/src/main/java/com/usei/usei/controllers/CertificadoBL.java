package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.repositories.CertificadoDAO;


import com.usei.usei.models.Certificado;
import com.usei.usei.models.Usuario;

@Service
public class CertificadoBL implements CertificadoService{
    
    private final CertificadoDAO certificadoDAO;
    private final UsuarioService usuarioService;


    @Autowired
    public CertificadoBL(CertificadoDAO certificadoDAO, UsuarioService usuarioService){
        this.certificadoDAO = certificadoDAO;
        this.usuarioService = usuarioService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Certificado> findAll(){
        return certificadoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Certificado> findById(Long id){
        return certificadoDAO.findById(id);
    }

    @Override
    @Transactional
    public Certificado save(Certificado certificado) {

        Usuario usuario = usuarioService.findById(certificado.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + certificado.getUsuarioIdUsuario().getIdUsuario()));

        certificado.setUsuarioIdUsuario(usuario);

        return certificadoDAO.save(certificado);
    }

    @Override
    @Transactional
    public Certificado update(Certificado certificado, Long id) {
        Optional<Certificado> existingCertificado = certificadoDAO.findById(id);
        if (existingCertificado.isPresent()) {
            Certificado certificadoToUpdate = existingCertificado.get();

            Usuario usuario = usuarioService.findById(certificado.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrada con el id: " + certificado.getUsuarioIdUsuario().getIdUsuario()));

            // Actualizar los campos del certificado con los valores correspondientes    
            certificadoToUpdate.setFormato(certificado.getFormato());
            certificadoToUpdate.setVersion(certificado.getVersion());
            certificadoToUpdate.setFechaModificacion(certificado.getFechaModificacion());
            certificadoToUpdate.setUsuarioIdUsuario(usuario);

            return certificadoDAO.save(certificadoToUpdate);
        } else {
            throw new RuntimeException("Almacen no encontrado con el id: " + id);
        }
    }

}
