package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.Notificacion;

@Repository
public interface NotificacionDAO extends  JpaRepository<Notificacion, Long> {

    
}
