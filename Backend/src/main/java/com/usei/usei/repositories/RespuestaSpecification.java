package com.usei.usei.repositories;

import org.springframework.data.jpa.domain.Specification;
import com.usei.usei.models.Respuesta;

public class RespuestaSpecification {

    // Filtrar por idEstudiante
    public static Specification<Respuesta> byEstudianteId(Long idEstudiante) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("estudianteIdEstudiante").get("idEstudiante"), idEstudiante);
    }

    // Filtrar por texto de respuesta
    public static Specification<Respuesta> byTextoRespuesta(String texto) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("respuesta"), "%" + texto + "%");
    }
}
