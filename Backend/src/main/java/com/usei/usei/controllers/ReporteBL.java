package com.usei.usei.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.usei.usei.models.Reporte;
import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.ReporteDAO;

@Service
public class ReporteBL implements ReporteService {

    private final ReporteDAO reporteDAO;
    private final UsuarioService usuarioService;

    @Autowired
    public ReporteBL(ReporteDAO reporteDAO, UsuarioService usuarioService) {
        this.reporteDAO = reporteDAO;
        this.usuarioService = usuarioService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Reporte> findAll() {
        return reporteDAO.findAll();
    }


    @Override
    @Transactional(readOnly = true)
    public Optional<Reporte> findById(Long id) {
        return reporteDAO.findById(id);
    }

    @Override
    public Reporte save(Reporte newReporte) {
        return reporteDAO.save(newReporte);
    }

    @Override
    @Transactional
    public Reporte save(Reporte reporte, MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {
                String directory = "src/main/resources/static/documents/reportes/";
                String fileName = file.getOriginalFilename();

                Path filePath = Paths.get(directory, fileName);
                Files.copy(file.getInputStream(), filePath);

                reporte.setFormato(fileName);
            }
            Usuario usuario = usuarioService.findById(reporte.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + reporte.getUsuarioIdUsuario().getIdUsuario()));
            reporte.setUsuarioIdUsuario(usuario);

            return reporteDAO.save(reporte);

        } catch (IOException e) {
            throw new RuntimeException("Error al guardar la imagen", e);
        }
    }


    @Override
    @Transactional
    public Reporte actualizacionReporte(Reporte reporte, Long id, MultipartFile file) {
        Optional<Reporte> existingReporte = reporteDAO.findById(id);
        if (existingReporte.isPresent()) {
            Reporte reporteToActualizacion = existingReporte.get();

            try {
                if (file != null && !file.isEmpty()) {
                    String fileName = file.getOriginalFilename();
                    reporteToActualizacion.setFormato(fileName);
                }
            } catch (Exception e) {
                throw new RuntimeException("Error al procesar la imagen", e);
            }

            Usuario usuario = usuarioService.findById(reporte.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + reporte.getUsuarioIdUsuario().getIdUsuario()));

            reporteToActualizacion.setTitulo(reporte.getTitulo());
            reporteToActualizacion.setDescripcion(reporte.getDescripcion());
            reporteToActualizacion.setFecha(reporte.getFecha());
            reporteToActualizacion.setUsuarioIdUsuario(usuario);

            return reporteDAO.save(reporteToActualizacion);
        } else {
            throw new RuntimeException("Noticia no encontrada con el id: " + id);
        }
    }

    @Override
    public void delete(Long id) {
        Optional<Reporte> reporte = reporteDAO.findById(id);
        if (reporte.isPresent()) {
            reporteDAO.deleteById(id);
        } else {
            throw new RuntimeException("La noticia con el ID " + id + " no existe.");
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Reporte> findByFilter(String filter, Pageable pageable) {
        return reporteDAO.findByFilter(filter, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Reporte> findAll(Pageable pageable) {
        return reporteDAO.findAll(pageable);
    }

}

