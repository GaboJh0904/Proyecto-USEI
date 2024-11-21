package com.usei.usei.controllers;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Pregunta;
import com.usei.usei.models.Reporte;
import com.usei.usei.models.Respuesta;
import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.EstadoEncuestaDAO;
import com.usei.usei.repositories.PreguntaDAO;
import com.usei.usei.repositories.ReporteDAO;
import com.usei.usei.repositories.RespuestaDAO;

@Service
public class ReporteBL implements ReporteService {

    private final ReporteDAO reporteDAO;
    private final UsuarioService usuarioService;
    private final PreguntaDAO preguntaDAO;
    private final RespuestaDAO respuestaDAO;
    private final EstadoEncuestaDAO estadoEncuestaDAO;

    @Autowired
    public ReporteBL(ReporteDAO reporteDAO, UsuarioService usuarioService, PreguntaDAO preguntaDAO, RespuestaDAO respuestaDAO, EstadoEncuestaDAO estadoEncuestaDAO) {
        this.reporteDAO = reporteDAO;
        this.usuarioService = usuarioService;
        this.preguntaDAO = preguntaDAO;
        this.respuestaDAO = respuestaDAO;
        this.estadoEncuestaDAO = estadoEncuestaDAO;
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
    public String generateDashboardPDF(Reporte reporte, String carrera) {
        try {
            // Obtener datos de la base de datos (Preguntas, Respuestas, etc.)
            List<Pregunta> preguntas = preguntaDAO.findAll();
            List<Respuesta> respuestas = respuestaDAO.findByCarreraFromEstudiante(carrera);
            List<EstadoEncuesta> estadosEncuesta = estadoEncuestaDAO.findByEstadoFromEstudiante(carrera);

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

            // Crear un gráfico de torta para los estados de encuesta
            DefaultPieDataset pieDataset = new DefaultPieDataset();
            long pendientes = estadosEncuesta.stream().filter(e -> "Pendiente".equals(e.getEstado())).count();
            long completados = estadosEncuesta.stream().filter(e -> "Completado".equals(e.getEstado())).count();
            pieDataset.setValue("Pendiente", pendientes);
            pieDataset.setValue("Completado", completados);

            JFreeChart pieChart = ChartFactory.createPieChart(
                    "Estudiantes pendientes a completar la encuesta", 
                    pieDataset, 
                    true, 
                    true, 
                    false
            );

            PiePlot plot = (PiePlot) pieChart.getPlot();
            plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}: {1} ({2})"));

            BufferedImage pieChartImage = pieChart.createBufferedImage(500, 300);
            ByteArrayOutputStream pieChartBaos = new ByteArrayOutputStream();
            ChartUtils.writeBufferedImageAsPNG(pieChartBaos, pieChartImage);
            Image pieChartPdfImage = Image.getInstance(pieChartBaos.toByteArray());
            document.add(pieChartPdfImage);

            // Crear un gráfico de barras para cada pregunta
            for (Pregunta pregunta : preguntas) {
                DefaultCategoryDataset barDataset = new DefaultCategoryDataset();

                // Filtrar respuestas por pregunta y agrupar por respuesta
                Map<String, Long> respuestaCount = respuestas.stream()
                    .filter(r -> Objects.equals(r.getPreguntaIdPregunta().getIdPregunta(), pregunta.getIdPregunta()))
                    .collect(Collectors.groupingBy(Respuesta::getRespuesta, Collectors.counting()));

                // Agregar datos al dataset
                respuestaCount.forEach((respuesta, count) -> barDataset.addValue(count, "Respuestas", respuesta));

                // Crear el gráfico de barras
                JFreeChart barChart = ChartFactory.createBarChart(
                        pregunta.getPregunta(), // Título del gráfico
                        "Respuestas", // Etiqueta del eje X
                        "Cantidad", // Etiqueta del eje Y
                        barDataset, 
                        PlotOrientation.VERTICAL, 
                        true, 
                        true, 
                        false
                );

                BufferedImage barChartImage = barChart.createBufferedImage(500, 300);
                ByteArrayOutputStream barChartBaos = new ByteArrayOutputStream();
                ChartUtils.writeBufferedImageAsPNG(barChartBaos, barChartImage);
                Image barChartPdfImage = Image.getInstance(barChartBaos.toByteArray());
                document.add(barChartPdfImage);
            }

            document.close();
            return filePath.toString();
        } catch (DocumentException | IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Reporte> findByFilterFromUser(String filter, Pageable pageable, Usuario usuario) {
        return reporteDAO.findByFilterFromUser(filter, pageable, usuario);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Reporte> findAllFromUser(Pageable pageable, Usuario usuario) {
        return reporteDAO.findAllFromUser(pageable, usuario);
    }

}

