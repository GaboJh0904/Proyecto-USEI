package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Plazo;

public interface PlazoService {
    
    public Iterable<Plazo> findAll();

    public Optional<Plazo> findById(Long id);

    public Plazo save(Plazo newPlazo);

    public Plazo update (Plazo newPlazo, Long id);

    public void deleteById(Long id);

}
