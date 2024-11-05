package com.usei.usei.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.ParametrosAviso;
import com.usei.usei.repositories.ParametrosAvisoDAO;

import java.util.Optional;

@Service
public class ParametrosAvisoBL implements ParametrosAvisoService {

    @Autowired
    private ParametrosAvisoDAO parametrosAvisoDAO;

    @Override
    @Transactional(readOnly = true)
    public Iterable<ParametrosAviso> findAll() {
        return parametrosAvisoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<ParametrosAviso> findById(Long id) {
        return parametrosAvisoDAO.findById(id);
    }

    @Override
    @Transactional
    public ParametrosAviso save(ParametrosAviso parametrosAviso) {
        return parametrosAvisoDAO.save(parametrosAviso);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        parametrosAvisoDAO.deleteById(id);
    }

    @Override
    @Transactional
    public ParametrosAviso update(ParametrosAviso parametrosAviso, Long id) {
    Optional<ParametrosAviso> existingParametrosAviso = parametrosAvisoDAO.findById(id);
    if (existingParametrosAviso.isPresent()) {
        ParametrosAviso parametrosAvisoToUpdate = existingParametrosAviso.get();
        parametrosAvisoToUpdate.setPorcentaje(parametrosAviso.getPorcentaje());
        parametrosAvisoToUpdate.setFechaCambio(parametrosAviso.getFechaCambio());
        parametrosAvisoToUpdate.setFechaNotificacion(parametrosAviso.getFechaNotificacion());
        parametrosAvisoToUpdate.setMensajePredeterminado(parametrosAviso.getMensajePredeterminado());

        return parametrosAvisoDAO.save(parametrosAvisoToUpdate);
    } else {
        throw new RuntimeException("Parametros de Avisos no encontrada con el id: " + id);
    }
}

}
