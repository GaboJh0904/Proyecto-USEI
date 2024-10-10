package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import com.usei.usei.models.TipoProblema;

public interface TipoProblemaService {
    
    public Iterable<TipoProblema> findAll();

    public Optional<TipoProblema> findById(Long id);

    public TipoProblema save(TipoProblema newTipoProblema);

    public TipoProblema update (TipoProblema newTipoProblema, Long id);

    public void deleteById(Long id);

}
