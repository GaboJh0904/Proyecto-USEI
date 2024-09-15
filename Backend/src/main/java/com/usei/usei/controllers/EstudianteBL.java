package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Estudiante;
import com.usei.usei.repositories.EstudianteDAO;

@Service
public class EstudianteBL implements EstudianteService{

    private EstudianteDAO estudianteDAO;

    @Autowired
    public EstudianteBL(EstudianteDAO estudianteDAO) {
        this.estudianteDAO = estudianteDAO;
    }

    @Transactional(readOnly = true)
    public Iterable<Estudiante> findAll() {
        return estudianteDAO.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<Estudiante> findById(Long id) {
        return estudianteDAO.findById(id);
    }

    @Transactional
    public Estudiante save(Estudiante estudiante) {
        return estudianteDAO.save(estudiante);
    }

    @Override
    @Transactional
    public void deleteById(Long id) {
        estudianteDAO.deleteById(id);
    }

    @Transactional
    public Estudiante update(Estudiante estudiante, Long id) {
        Optional<Estudiante> existingEstudiante = estudianteDAO.findById(id);
        if (existingEstudiante.isPresent()) {
            Estudiante estudianteToUpdate = existingEstudiante.get();
            estudianteToUpdate.setNombre(estudiante.getNombre());
            estudianteToUpdate.setApellido(estudiante.getApellido());
            // Actualizar otros campos si es necesario

            return estudianteDAO.save(estudianteToUpdate);
        } else {
            throw new RuntimeException("Estudiante no encontrado con el id: " + id);
        }
    }
}
