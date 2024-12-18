package com.usei.usei.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.usei.usei.models.TipoNotificacion;

@Repository
public interface TipoNotificacionDAO extends  JpaRepository<TipoNotificacion, Long> {

    TipoNotificacion findByTipo(String tipo);
}
