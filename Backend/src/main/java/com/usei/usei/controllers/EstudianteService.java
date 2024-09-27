package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Estudiante;
import org.springframework.transaction.annotation.Transactional;

public interface EstudianteService {

    public Iterable<Estudiante> findAll();

    public Optional<Estudiante> findById(Long id);

    public Estudiante save(Estudiante newEstudiante);

    public void deleteById(Long id);

    public Estudiante update (Estudiante newEstudiante, Long id);

    public Optional<Estudiante> login(int ci, String contrasena);

    public void saveAll(List<Estudiante> estudiantes);

}
