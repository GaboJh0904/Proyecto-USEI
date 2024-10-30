package com.usei.usei.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.usei.usei.models.Noticias;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Repository
public interface NoticiasDAO extends JpaRepository<Noticias, Long> {

    List<Noticias> findByEstado(String estado);

    Page<Noticias> findAll(Pageable pageable);

    Page<Noticias> findByEstado(String estado, Pageable pageable);

    @Query("SELECT n FROM Noticias n WHERE n.titulo LIKE %:filter% OR n.descripcion LIKE %:filter%")
    Page<Noticias> findByFilter(@Param("filter") String filter, Pageable pageable);

    // Nuevo método para noticias archivadas filtradas
    Page<Noticias> findByEstadoAndTituloContainingIgnoreCaseOrDescripcionContainingIgnoreCase(String estado, String titulo, String descripcion, Pageable pageable);

    Page<Noticias> findByEstadoAndTituloContainingOrDescripcionContaining(String estado, String titulo, String descripcion, Pageable pageable);

    @Query("SELECT n FROM Noticias n WHERE n.estado != 'archivado' AND (n.titulo LIKE %:filter% OR n.descripcion LIKE %:filter%)")
    Page<Noticias> findNonArchivedByFilter(@Param("filter") String filter, Pageable pageable);

}
