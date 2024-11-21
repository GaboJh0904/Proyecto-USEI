package com.usei.usei.controllers;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usei.usei.models.Certificado;
import com.usei.usei.models.EstadoCertificado;
import com.usei.usei.models.Estudiante;
import com.usei.usei.repositories.EstadoCertificadoDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@Service
public class EstadoCertificadoBL implements EstadoCertificadoService {

    private final EstadoCertificadoDAO estadoCertificadoDAO;
    private final CertificadoService certificadoService;
    private final EstudianteService estudianteService;

    @Autowired
    public EstadoCertificadoBL(EstadoCertificadoDAO estadoCertificadoDAO, CertificadoService certificadoService, EstudianteService estudianteService) {
        this.estadoCertificadoDAO = estadoCertificadoDAO;
        this.certificadoService = certificadoService;
        this.estudianteService = estudianteService;
    }

    @Override
    public Optional<EstadoCertificado> findByEstudianteId(Long idEstudiante) {
        return estadoCertificadoDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante);
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<EstadoCertificado> findAll() {
        return estadoCertificadoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<EstadoCertificado> findById(Long id) {
        return estadoCertificadoDAO.findById(id);
    }

    @Override
    @Transactional
    public EstadoCertificado save(EstadoCertificado estadoCertificado) {
        Certificado certificado = certificadoService.findById(estadoCertificado.getCertificadoIdCertificado().getIdCertificado())
                .orElseThrow(() -> new RuntimeException("certificado no encontrado con el id: " + estadoCertificado.getCertificadoIdCertificado().getIdCertificado()));
        Estudiante estudiante = estudianteService.findById(estadoCertificado.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoCertificado.getEstudianteIdEstudiante().getIdEstudiante()));

        estadoCertificado.setCertificadoIdCertificado(certificado);
        estadoCertificado.setEstudianteIdEstudiante(estudiante);

        return estadoCertificadoDAO.save(estadoCertificado);
    }

    @Override
    @Transactional
    public EstadoCertificado update(EstadoCertificado estadoCertificado, Long id) {
        Optional<EstadoCertificado> existingEstadoCertificado = estadoCertificadoDAO.findById(id);
        if (existingEstadoCertificado.isPresent()) {
            EstadoCertificado estadoCertificadoToUpdate = existingEstadoCertificado.get();

            Certificado certificado = certificadoService.findById(estadoCertificado.getCertificadoIdCertificado().getIdCertificado())
                    .orElseThrow(() -> new RuntimeException("certificado no encontrado con el id: " + estadoCertificado.getCertificadoIdCertificado().getIdCertificado()));
            Estudiante estudiante = estudianteService.findById(estadoCertificado.getEstudianteIdEstudiante().getIdEstudiante())
                    .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoCertificado.getEstudianteIdEstudiante().getIdEstudiante()));

            estadoCertificadoToUpdate.setArchivo(estadoCertificado.getArchivo());
            estadoCertificadoToUpdate.setEstado(estadoCertificado.getEstado());
            estadoCertificadoToUpdate.setFechaEstado(estadoCertificado.getFechaEstado());
            estadoCertificadoToUpdate.setCertificadoIdCertificado(certificado);
            estadoCertificadoToUpdate.setEstudianteIdEstudiante(estudiante);

            return estadoCertificadoDAO.save(estadoCertificadoToUpdate);
        } else {
            throw new RuntimeException("Estado_Encuesta no encontrado con el id: " + id);
        }
    }

    @Transactional(readOnly = true)
    public List<Map<String, Object>> getCertificadosEmitidosPorCarrera(Integer anio, Integer semestre) {
        List<Object[]> rawData;

        if (anio == null && semestre == null) {
            rawData = estadoCertificadoDAO.countCertificadosEmitidosByCarrera("enviado");
        } else if (anio != null && semestre == null) {
            rawData = estadoCertificadoDAO.countCertificadosEmitidosByCarreraAndAnio(anio, "enviado");
        } else if (anio == null && semestre != null) {
            rawData = estadoCertificadoDAO.countCertificadosEmitidosByCarreraAndSemestre(semestre, "enviado");
        } else {
            rawData = estadoCertificadoDAO.countCertificadosEmitidosByCarreraAnioAndSemestre(anio, semestre, "enviado");
        }

        List<Map<String, Object>> resultado = new ArrayList<>();
        for (Object[] row : rawData) {
            Map<String, Object> item = new HashMap<>();
            item.put("carrera", row[0]);
            item.put("cantidad", row[1]);
            resultado.add(item);
        }

        return resultado;
    }

    @Override
    public Page<EstadoCertificado> findByEstado(String estado, Pageable pageable) {
        return estadoCertificadoDAO.findByEstadoContainingIgnoreCase(estado, pageable);
    }

    @Override
    public Page<EstadoCertificado> findByNombreEstudiante(String nombre, Pageable pageable) {
        return null;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<EstadoCertificado> findByNombreCompletoEstudiante(String searchQuery, Pageable pageable) {
        return estadoCertificadoDAO.findByNombreCompletoEstudiante(searchQuery, pageable);
    }

    @Override
    public Page<EstadoCertificado> findByEstadoAndNombre(String estado, String nombre, Pageable pageable) {
        return estadoCertificadoDAO.findByNombreAndEstado(nombre, estado, pageable);
    }

    @Override
    public Page<EstadoCertificado> findAll(Pageable pageable) {
        return estadoCertificadoDAO.findAll(pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<EstadoCertificado> findByAsignatura(String asignatura, Pageable pageable) {
        return estadoCertificadoDAO.findByAsignatura(asignatura, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<EstadoCertificado> findByNombreYAsignatura(String searchQuery, String asignatura, Pageable pageable) {
        return estadoCertificadoDAO.findByNombreYAsignatura(searchQuery, asignatura, pageable);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<EstadoCertificado> findByEstadoYAsignatura(String estado, String asignatura, Pageable pageable) {
        return estadoCertificadoDAO.findByEstadoYAsignatura(estado, asignatura, pageable);
    }


    @Override
    @Transactional(readOnly = true)
    public Page<EstadoCertificado> findByEstadoNombreYAsignatura(String estado, String searchQuery, String asignatura, Pageable pageable) {
        return estadoCertificadoDAO.findByEstadoNombreYAsignatura(estado, searchQuery, asignatura, pageable);
    }
}
