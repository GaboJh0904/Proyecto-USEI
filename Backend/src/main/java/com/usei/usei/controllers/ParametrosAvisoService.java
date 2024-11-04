package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import com.usei.usei.models.ParametrosAviso;

public interface ParametrosAvisoService {
    
    public Iterable<ParametrosAviso> findAll();

    public Optional<ParametrosAviso> findById(Long id);

    public ParametrosAviso save(ParametrosAviso newParametrosAviso);

    public ParametrosAviso update (ParametrosAviso newParametrosAviso, Long id);

    public void deleteById(Long id);

}
