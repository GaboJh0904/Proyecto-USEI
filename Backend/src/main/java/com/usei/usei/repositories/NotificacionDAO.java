package com.usei.usei.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Notificacion;

@Repository
public interface NotificacionDAO extends  JpaRepository<Notificacion, Long> {

    @Modifying
    @Query("UPDATE Notificacion n SET n.estadoNotificacion = true WHERE n.id = :id")
    void marcarComoLeida(@Param("id") Long id);

    // Modificamos este método para usar paginación
    Page<Notificacion> findByEstudianteIdEstudiante(Estudiante estudiante, Pageable pageable);
    
}
