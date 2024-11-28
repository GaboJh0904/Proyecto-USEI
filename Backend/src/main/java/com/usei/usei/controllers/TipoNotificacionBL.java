package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.TipoNotificacion;
import com.usei.usei.repositories.TipoNotificacionDAO;

@Service
public class TipoNotificacionBL implements TipoNotificacionService {

    @Autowired
    private TipoNotificacionDAO tipoNotificacionDAO;

    @Override
    @Transactional(readOnly = true)
    public Iterable<TipoNotificacion> findAll() {
        return tipoNotificacionDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<TipoNotificacion> findById(Long id) {
        return tipoNotificacionDAO.findById(id);
    }

    @Override
    @Transactional
    public TipoNotificacion save(TipoNotificacion tipoNotificacion) {
        return tipoNotificacionDAO.save(tipoNotificacion);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        tipoNotificacionDAO.deleteById(id);
    }

    @Override
    @Transactional
    public TipoNotificacion update(TipoNotificacion tipoNotificacion, Long id) {
        Optional<TipoNotificacion> existingTipoNotificacion = tipoNotificacionDAO.findById(id);
        if (existingTipoNotificacion.isPresent()) {
            TipoNotificacion tipoNotificacionToUpdate = existingTipoNotificacion.get();
            tipoNotificacionToUpdate.setTipo(tipoNotificacion.getTipo());

            return tipoNotificacionDAO.save(tipoNotificacionToUpdate);
        } else {
            throw new RuntimeException("Tipo Notificacion no encontrada con el id: " + id);
        }
    }

    @Override
    @Transactional(readOnly = true)
    public TipoNotificacion findByTipoNotificacion(String tipo) {
        return tipoNotificacionDAO.findByTipo(tipo);
    }

}
