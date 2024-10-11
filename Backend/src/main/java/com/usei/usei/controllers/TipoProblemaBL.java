package com.usei.usei.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.TipoProblema;
import com.usei.usei.repositories.TipoProblemaDAO;

import java.util.Optional;

@Service
public class TipoProblemaBL implements TipoProblemaService {

    @Autowired
    private TipoProblemaDAO tipoProblemaDAO;

    @Override
    @Transactional(readOnly = true)
    public Iterable<TipoProblema> findAll() {
        return tipoProblemaDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<TipoProblema> findById(Long id) {
        return tipoProblemaDAO.findById(id);
    }

    @Override
    @Transactional
    public TipoProblema save(TipoProblema tipoProblema) {
        return tipoProblemaDAO.save(tipoProblema);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        tipoProblemaDAO.deleteById(id);
    }

    @Override
    @Transactional
    public TipoProblema update(TipoProblema tipoProblema, Long id) {
    Optional<TipoProblema> existingTipoProblema = tipoProblemaDAO.findById(id);
    if (existingTipoProblema.isPresent()) {
        TipoProblema tipoProblemaToUpdate = existingTipoProblema.get();
        tipoProblemaToUpdate.setProblema(tipoProblema.getProblema());

        return tipoProblemaDAO.save(tipoProblemaToUpdate);
    } else {
        throw new RuntimeException("Tipo Problema no encontrada con el id: " + id);
    }
}

}
