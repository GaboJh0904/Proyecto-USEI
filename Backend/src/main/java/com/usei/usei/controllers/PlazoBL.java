package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Plazo;
import com.usei.usei.repositories.PlazoDAO;

@Service
public class PlazoBL implements PlazoService {

    private final PlazoDAO plazoDAO;

    @Autowired
    public PlazoBL(PlazoDAO plazoDAO) {
        this.plazoDAO = plazoDAO;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Plazo> findAll() {
        return plazoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Plazo> findById(Long id) {
        return plazoDAO.findById(id);
    }

    @Override
    @Transactional
    public Plazo save(Plazo plazo) {
            // Verificar si existe un plazo en estado "activo"
        Optional<Plazo> activePlazo = plazoDAO.findByEstado("activo");
        
        // Si existe un plazo "activo", cambiar su estado a "antiguo"
        activePlazo.ifPresent(existingPlazo -> {
            existingPlazo.setEstado("antiguo");
            plazoDAO.save(existingPlazo); // Guardar el cambio de estado
        });
        return plazoDAO.save(plazo);
    }

    @Override
    @Transactional
    public Plazo update(Plazo plazo, Long id) {
        Optional<Plazo> existingPlazo = plazoDAO.findById(id);
        if (existingPlazo.isPresent()) {
            Plazo plazoToUpdate = existingPlazo.get();
            plazoToUpdate.setFechaFinalizacion(plazo.getFechaFinalizacion());
            plazoToUpdate.setFechaModificacion(plazo.getFechaModificacion());
            plazoToUpdate.setEstado(plazo.getEstado());
            plazoToUpdate.setUsuarioIdUsuario(plazo.getUsuarioIdUsuario());
            return plazoDAO.save(plazoToUpdate);
        } else {
            throw new RuntimeException("Plazo no encontrado con el id: " + id);
        }
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        plazoDAO.deleteById(id);
    }

    // Implement the new paginated findAll method
    @Override
    @Transactional(readOnly = true)
    public Page<Plazo> findAll(Pageable pageable) {
        return plazoDAO.findAll(pageable);
    }
}
