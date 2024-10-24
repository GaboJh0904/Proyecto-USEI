package com.usei.usei.repositories;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Certificado;

@Repository
public interface CertificadoDAO extends JpaRepository <Certificado, Long> {

    @Query("SELECT MAX(c.version) FROM Certificado c")
    Optional<Integer> obtenerUltimaVersion();  // Obtener la última versión registrada

     // Método para buscar un certificado que esté "En uso"
     Optional<Certificado> findByEstado(String estado);
}
