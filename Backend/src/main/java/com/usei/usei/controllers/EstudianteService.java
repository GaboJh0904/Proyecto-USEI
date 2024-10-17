package com.usei.usei.controllers;

import java.util.List;
import java.util.Optional;

import com.usei.usei.models.Estudiante;

import jakarta.mail.MessagingException;

public interface EstudianteService {

    public Iterable<Estudiante> findAll();

    public Optional<Estudiante> findById(Long id);

    public Estudiante save(Estudiante newEstudiante);

    public void deleteById(Long id);

    public Estudiante update (Estudiante newEstudiante, Long id);

    public Optional<Estudiante> login(int ci, String contrasena);

    // Método para enviar el correo
    public void enviarCorreosEstudiantes() throws MessagingException;

    public void enviarCodigoVerificacion(String correo) throws MessagingException;

    public String obtenerCodigoVerificacion();
    
    public List<Estudiante> saveAll(List<Estudiante> estudiantes);


}
