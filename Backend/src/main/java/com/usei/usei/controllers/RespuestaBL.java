package com.usei.usei.controllers;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Pregunta;
import com.usei.usei.models.Respuesta;
import com.usei.usei.repositories.RespuestaDAO;
@Service
public class RespuestaBL implements RespuestaService {

    private final RespuestaDAO respuestaDAO;
    private final PreguntaService preguntaService;
    private final EstudianteService estudianteService;

    @Autowired
    public RespuestaBL(RespuestaDAO respuestaDAO, PreguntaService preguntaService,
            EstudianteService estudianteService) {
        this.respuestaDAO = respuestaDAO;
        this.preguntaService = preguntaService;
        this.estudianteService = estudianteService;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Respuesta> findAll() {
        return respuestaDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Respuesta> findById(Long id) {
        return respuestaDAO.findById(id);
    }

    @Override
    @Transactional
    public Respuesta save(Respuesta respuesta) {
        Pregunta pregunta = preguntaService.findById(respuesta.getPreguntaIdPregunta().getIdPregunta())
                .orElseThrow(() -> new RuntimeException(
                        "Pregunta no encontrada con el id: " + respuesta.getPreguntaIdPregunta().getIdPregunta()));

        Estudiante estudiante = estudianteService.findById(respuesta.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: "
                        + respuesta.getEstudianteIdEstudiante().getIdEstudiante()));

        respuesta.setPreguntaIdPregunta(pregunta);
        respuesta.setEstudianteIdEstudiante(estudiante);

        return respuestaDAO.save(respuesta);
    }

    @Override
    @Transactional
    public Respuesta update(Respuesta respuesta, Long id) {
        Optional<Respuesta> existingRespuesta = respuestaDAO.findById(id);
        if (existingRespuesta.isPresent()) {
            Respuesta respuestaToUpdate = existingRespuesta.get();

            Pregunta pregunta = preguntaService.findById(respuesta.getPreguntaIdPregunta().getIdPregunta())
                    .orElseThrow(() -> new RuntimeException(
                            "Pregunta no encontrada con el id: " + respuesta.getPreguntaIdPregunta().getIdPregunta()));

            Estudiante estudiante = estudianteService.findById(respuesta.getEstudianteIdEstudiante().getIdEstudiante())
                    .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el id: "
                            + respuesta.getEstudianteIdEstudiante().getIdEstudiante()));

            // Actualizar los campos de la respuesta con los valores correspondientes
            respuestaToUpdate.setRespuesta(respuesta.getRespuesta());
            respuestaToUpdate.setPreguntaIdPregunta(pregunta);
            respuestaToUpdate.setEstudianteIdEstudiante(estudiante);

            return respuestaDAO.save(respuestaToUpdate);
        } else {
            throw new RuntimeException("Respuesta no encontrada con el id: " + id);
        }
    }

     // no permitir doble llenado de encuesta
     @Override
     @Transactional(readOnly = true)
     public boolean hasFilledSurvey(Long idEstudiante) {
        return respuestaDAO.existsByEstudianteIdEstudiante_IdEstudiante(idEstudiante);
     }
 
    @Override
    @Transactional(readOnly = true)
    public Page<Respuesta> findRespuestasByEstudianteId(Long idEstudiante, String sortBy, String sortType, int page, int pageSize) {
        String sortField = switch (sortBy) {
            case "idPregunta" -> "preguntaIdPregunta.idPregunta";
            case "pregunta" -> "preguntaIdPregunta.pregunta";
            case "respuesta" -> "respuesta";
            default -> sortBy;
        };
        Sort sort = Sort.by(Sort.Direction.fromString(sortType), sortField);
        Pageable pageable = PageRequest.of(page, pageSize, sort);
        return respuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Respuesta> findRespuestasByEstudianteIdAndTipoPregunta(Long idEstudiante, String tipoPregunta, String sortBy, String sortType, int page, int pageSize) {
        String sortField = switch (sortBy) {
            case "idPregunta" -> "preguntaIdPregunta.idPregunta";
            case "pregunta" -> "preguntaIdPregunta.pregunta";
            case "respuesta" -> "respuesta";
            default -> sortBy;
        };
        Sort sort = Sort.by(Sort.Direction.fromString(sortType), sortField);
        Pageable pageable = PageRequest.of(page, pageSize, sort);
        return respuestaDAO.findRespuestasByEstudianteIdAndTipoPregunta(idEstudiante, tipoPregunta, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<Respuesta> findRespuestasByEstudianteIdAndSearchQuery(Long idEstudiante, String searchQuery, String sortBy, String sortType, int page, int pageSize) {
        String sortField = switch (sortBy) {
            case "idPregunta" -> "preguntaIdPregunta.idPregunta";
            case "pregunta" -> "preguntaIdPregunta.pregunta";
            case "respuesta" -> "respuesta";
            default -> sortBy;
        };
        Sort sort = Sort.by(Sort.Direction.fromString(sortType), sortField);
        Pageable pageable = PageRequest.of(page, pageSize, sort);
        
        // Realizar la búsqueda por pregunta o respuesta
        return respuestaDAO.findRespuestasByEstudianteIdAndSearchQuery(idEstudiante, searchQuery, pageable);
    }


///
    // @Override
    // @Transactional(readOnly = true)
    // public Page<Respuesta> findRespuestasByEstudianteId(Long idEstudiante, PageRequest pageRequest) {
    //     return respuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante, pageRequest);
    // }

    // @Override
    // @Transactional(readOnly = true)
    // public Page<Respuesta> findRespuestasConFiltro(Long idEstudiante, String respuestaFiltro, PageRequest pageRequest) {
    //     Specification<Respuesta> spec = RespuestaSpecification.byEstudianteId(idEstudiante);

    //     if (respuestaFiltro != null && !respuestaFiltro.isEmpty()) {
    //         spec = spec.and(RespuestaSpecification.byTextoRespuesta(respuestaFiltro));
    //     }

    //     return respuestaDAO.findAll(spec, pageRequest);
    // }
}
