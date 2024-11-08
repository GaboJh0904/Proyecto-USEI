package com.usei.usei.controllers;

import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
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
public class EstadoCertificadoBL implements EstadoCertificadoService{
    
    private final EstadoCertificadoDAO estadoCertificadoDAO;
    private final CertificadoService certificadoService;
    private final EstudianteService estudianteService;

    @Autowired
    public EstadoCertificadoBL(EstadoCertificadoDAO estadoCertificadoDAO, CertificadoService certificadoService, EstudianteService estudianteService){
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
    public Iterable<EstadoCertificado> findAll(){
        return estadoCertificadoDAO.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<EstadoCertificado> findById(Long id){
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

            // Obtener las alergias y el paciente existentes por sus ID
            Certificado certificado = certificadoService.findById(estadoCertificado.getCertificadoIdCertificado().getIdCertificado())
                .orElseThrow(() -> new RuntimeException("certificado no encontrado con el id: " + estadoCertificado.getCertificadoIdCertificado().getIdCertificado()));
            Estudiante estudiante = estudianteService.findById(estadoCertificado.getEstudianteIdEstudiante().getIdEstudiante())
                .orElseThrow(() -> new RuntimeException("estudiante no encontrado con el id: " + estadoCertificado.getEstudianteIdEstudiante().getIdEstudiante()));

            // Actualizar los campos de la estado_encuesta con los valores correspondientes
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
    public List<Map<String, Object>> getCertificadosEmitidosPorCarrera(Integer year) {
        List<Object[]> rawData;
        
        if (year == null) {
            rawData = estadoCertificadoDAO.countCertificadosEmitidosByCarrera("enviado");
        } else {
            rawData = estadoCertificadoDAO.countCertificadosEmitidosByCarreraAndYear(year, "enviado");
        }

        // Convertir List<Object[]> a List<Map<String, Object>>
        List<Map<String, Object>> resultado = new ArrayList<>();
        for (Object[] row : rawData) {
            Map<String, Object> item = new HashMap<>();
            item.put("carrera", row[0]);  // Carrera
            item.put("cantidad", row[1]); // Conteo
            resultado.add(item);
        }

        return resultado;
    }


/* 
    @Override
    @Transactional
    public List<EstadoEncuesta> findByEstadoPendiente() {
        return estadoEncuestaDAO.findByEstado("Pendiente");
    }

    // Implementación método encuestas completadas
    @Override
    @Transactional(readOnly = true)
    public List<EstadoEncuesta> findByEstadoCompletado() {
        return estadoEncuestaDAO.findByEstado("Completado");
    }
*/


}
