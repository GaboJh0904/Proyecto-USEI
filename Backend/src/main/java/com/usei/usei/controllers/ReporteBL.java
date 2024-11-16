package com.usei.usei.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.usei.usei.models.Pregunta;
import com.usei.usei.models.Reporte;
import com.usei.usei.models.Respuesta;
import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.PreguntaDAO;
import com.usei.usei.repositories.ReporteDAO;
import com.usei.usei.repositories.RespuestaDAO;

@Service
public class ReporteBL implements ReporteService {

    private final ReporteDAO reporteDAO;
    private final UsuarioService usuarioService;
    private final PreguntaDAO preguntaDAO;
    private final RespuestaDAO respuestaDAO;

    @Autowired
    public ReporteBL(ReporteDAO reporteDAO, UsuarioService usuarioService, PreguntaDAO preguntaDAO, RespuestaDAO respuestaDAO) {
        this.reporteDAO = reporteDAO;
        this.usuarioService = usuarioService;
        this.preguntaDAO = preguntaDAO;
        this.respuestaDAO = respuestaDAO;
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

    @Override
    @Transactional
    public String generateDashboardPDF(Reporte reporte) {
        try {
            // Obtener datos de la base de datos (Preguntas, Respuestas, etc.)
            List<Pregunta> preguntas = preguntaDAO.findAll(); // Supongamos que tienes un DAO para Pregunta
            List<Respuesta> respuestas = respuestaDAO.findAll(); // Supongamos que tienes un DAO para Respuesta

            // Generar contenido del PDF
            String directory = "src/main/resources/static/documents/reportes/";
            String fileName = "dashboard_" + System.currentTimeMillis() + ".pdf";
            Path filePath = Paths.get(directory, fileName);

            Document document = new Document();
            PdfWriter.getInstance(document, Files.newOutputStream(filePath));
            document.open();

            document.add(new Paragraph("Título: " + reporte.getTitulo()));
            document.add(new Paragraph("Descripción: " + reporte.getDescripcion()));
            document.add(new Paragraph("Fecha: " + reporte.getFecha()));

            // Agregar información de las preguntas y respuestas
            document.add(new Paragraph("Preguntas y Respuestas:"));
            for (Pregunta pregunta : preguntas) {
                document.add(new Paragraph("Pregunta: " + pregunta.getPregunta()));
                for (Respuesta respuesta : respuestas) {
                    if (respuesta.getPreguntaIdPregunta().getIdPregunta().equals(pregunta.getIdPregunta())) {
                        document.add(new Paragraph(" - Respuesta: " + respuesta.getRespuesta()));
                    }
                }
            }

            document.close();

            return fileName;
        } catch (DocumentException | IOException e) {
            throw new RuntimeException("Error al generar el PDF", e);
        }
    }

}

