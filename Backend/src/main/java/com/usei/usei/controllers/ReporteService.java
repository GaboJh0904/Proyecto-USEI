package com.usei.usei.controllers;

// import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.models.Reporte;
import com.usei.usei.models.Usuario;

public interface ReporteService {
    
    public Iterable<Reporte> findAll();

    public Optional<Reporte> findById(Long id);

    // Guardar noticia sin imagen
    public Reporte save(Reporte newReporte);

    // Guardar noticia con imagen
    public Reporte save(Reporte newReporte, MultipartFile file);

    public Reporte actualizacionReporte(Reporte newReporte, Long id, MultipartFile file);

    public void delete(Long id);

    // Nuevo método para filtrar reporte por título o autor con paginación
    Page<Reporte> findByFilter(String filter, Pageable pageable);

    // Paginación de reporte existentes
    Page<Reporte> findAll(Pageable pageable);

    // Generar PDF de reporte
    public String generateDashboardPDF(Reporte reporte, String carrera);

    // Nuevo método para filtrar reporte por título o autor con paginación
    Page<Reporte> findByFilterFromUser(String filter, Pageable pageable, Usuario usuario);

    // Paginación de reporte existentes
    Page<Reporte> findAllFromUser(Pageable pageable, Usuario usuario);

}
