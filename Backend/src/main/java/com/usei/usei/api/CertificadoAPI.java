package com.usei.usei.api;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.CertificadoService;
import com.usei.usei.models.Certificado;
import com.usei.usei.models.MessageResponse;

import java.beans.FeatureDescriptor;
import java.util.Optional;
import java.util.stream.Stream;

@RestController
@RequestMapping("/certificado")
public class CertificadoAPI {
    @Autowired
    private CertificadoService certificadoService;

    //Crear una nuevo certificado:
    @PostMapping
    public ResponseEntity<?> create (@RequestBody Certificado certificado){
        try {
            certificadoService.save(certificado);
            return new ResponseEntity<>(new MessageResponse("certigicado registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_certificado}")
    public ResponseEntity<?> read(@PathVariable(value = "id_certificado") Long id_certificado) {
    Optional<Certificado> oCertificado = certificadoService.findById(id_certificado);
    
    return oCertificado.map(certificado -> ResponseEntity.ok(certificado))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(certificadoService.findAll());
    }

    

    @PutMapping("/{id_certificado}")
    public ResponseEntity<?> update(@PathVariable(value = "id_certificado") Long id_certificado, @RequestBody Certificado certificado){

        try {
            Certificado updatedCertificado = certificadoService.update( certificado, id_certificado);
            return ResponseEntity.ok(updatedCertificado);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        
    }

    
}
