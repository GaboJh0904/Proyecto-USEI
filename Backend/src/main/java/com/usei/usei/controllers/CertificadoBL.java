package com.usei.usei.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Optional;
import org.springframework.data.domain.Sort;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import com.usei.usei.models.Certificado;
import com.usei.usei.models.EstadoCertificado;
import com.usei.usei.models.EstadoEncuesta;
import com.usei.usei.models.Estudiante;
import com.usei.usei.models.Usuario;
import com.usei.usei.repositories.CertificadoDAO;
import com.usei.usei.repositories.EstadoCertificadoDAO;
import com.usei.usei.repositories.EstadoEncuestaDAO;
import com.usei.usei.repositories.EstudianteDAO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class CertificadoBL implements CertificadoService{
    
    @Autowired
    private JavaMailSender mailSender;
    private final CertificadoDAO certificadoDAO;
    private final UsuarioService usuarioService;
    private final EstadoEncuestaDAO estadoEncuestaDAO;
    private final EstadoCertificadoDAO estadoCertificadoDAO;
    private final EstudianteDAO estudianteDAO;
    

    @Autowired
    public CertificadoBL(CertificadoDAO certificadoDAO, UsuarioService usuarioService, JavaMailSender mailSender, EstadoEncuestaDAO estadoEncuestaDAO, EstadoCertificadoDAO estadoCertificadoDAO, EstudianteDAO estudianteDAO){
        this.certificadoDAO = certificadoDAO;
        this.usuarioService = usuarioService;
        this.mailSender = mailSender;
        this.estadoEncuestaDAO = estadoEncuestaDAO;
        this.estadoCertificadoDAO = estadoCertificadoDAO;
        this.estudianteDAO = estudianteDAO;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<Certificado> findAll() {
        return certificadoDAO.findAll(); 
    }
    
    @Override
    @Transactional(readOnly = true)
    public Iterable<Certificado> findAll(Sort sort) {
        return certificadoDAO.findAll(sort); 
    }
    
    


    @Override
    @Transactional(readOnly = true)
    public Optional<Certificado> findById(Long id){
        return certificadoDAO.findById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Certificado> findCertificadoEnUso() {
        return certificadoDAO.findByEstado("En uso");
    }

    @Override
    @Transactional
    public Certificado save(Certificado certificado) {

        Usuario usuario = usuarioService.findById(certificado.getUsuarioIdUsuario().getIdUsuario())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado con el id: " + certificado.getUsuarioIdUsuario().getIdUsuario()));

        certificado.setUsuarioIdUsuario(usuario);

        

        return certificadoDAO.save(certificado);
    }

    @Override
    @Transactional
    public Certificado update(Certificado certificado, Long id) {
        Optional<Certificado> existingCertificado = certificadoDAO.findById(id);
        if (existingCertificado.isPresent()) {
            Certificado certificadoToUpdate = existingCertificado.get();

            Usuario usuario = usuarioService.findById(certificado.getUsuarioIdUsuario().getIdUsuario())
                    .orElseThrow(() -> new RuntimeException("Usuario no encontrada con el id: " + certificado.getUsuarioIdUsuario().getIdUsuario()));

            // Actualizar los campos del certificado con los valores correspondientes    
            certificadoToUpdate.setFormato(certificado.getFormato());
            certificadoToUpdate.setVersion(certificado.getVersion());
            certificadoToUpdate.setFechaModificacion(certificado.getFechaModificacion());
            certificadoToUpdate.setUsuarioIdUsuario(usuario);



            return certificadoDAO.save(certificadoToUpdate);
        } else {
            throw new RuntimeException("Almacen no encontrado con el id: " + id);
        }
    }
     
     // Función para enviar el certificado que está en uso
     public void enviarCertificadoConCondiciones(Long idEstudiante) throws MessagingException {
         // Verificar el estado de la encuesta
         EstadoEncuesta estadoEncuesta = estadoEncuestaDAO
                 .findByEstudianteIdEstudiante_IdEstudiante(idEstudiante)
                 .orElseThrow(() -> new RuntimeException(
                         "Estado de encuesta no encontrado para el estudiante con ID: " + idEstudiante));

         if (!"Completado".equalsIgnoreCase(estadoEncuesta.getEstado())) {
             throw new RuntimeException("No se puede enviar el certificado. El estado de la encuesta no está completado.");
         }

         // Verificar el estado del certificado
         EstadoCertificado estadoCertificado = estadoCertificadoDAO
                 .findByEstudianteIdEstudiante_IdEstudiante(idEstudiante)
                 .orElseThrow(() -> new RuntimeException(
                         "Estado de certificado no encontrado para el estudiante con ID: " + idEstudiante));

         Estudiante estudiante = estudianteDAO.findById(idEstudiante)
                 .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el ID: " + idEstudiante));

         String nuevoCorreo = estudiante.getCorreoInstitucional();
         String correoAnterior = estadoCertificado.getCorreoEnviado();

         // Permitir envío solo si no ha sido enviado o si el correo es nuevo
         if ("Enviado".equalsIgnoreCase(estadoCertificado.getEstado()) && nuevoCorreo.equals(correoAnterior)) {
             throw new RuntimeException("No se puede enviar el certificado. Ya ha sido enviado anteriormente al mismo correo.");
         }

         String asunto = "Certificado Académico";
         String mensaje = "Estimado " + estudiante.getNombre() + ", adjunto encontrarás tu certificado académico.";

         Optional<Certificado> certificadoEnUso = certificadoDAO.findByEstado("En uso");
         if (certificadoEnUso.isEmpty()) {
             System.out.println("No hay certificado en uso para enviar.");
             throw new RuntimeException("No hay certificado en uso para enviar.");
         }

         Certificado certificado = certificadoEnUso.get();
         String basePath = "src/main/resources/static/documents/formatos/";
         String inputPath  = basePath + certificado.getFormato();
         String outputPath = basePath + "certificado_" + estudiante.getNombre() + ".pdf";

         // Agregar el nombre del estudiante al PDF
        agregarNombreEnPDF(inputPath, outputPath, estudiante.getNombre(), estudiante.getApellido());

         String fileName = "certificado_" + estudiante.getNombre() + ".pdf";

         // Enviar el correo con el certificado adjunto
         sendCertificadoEmail(nuevoCorreo, asunto, mensaje, outputPath, fileName);

         // Actualizar el estado del certificado a "enviado"
         estadoCertificado.setEstado("Enviado");
         estadoCertificado.setArchivo(fileName);
         estadoCertificado.setCertificadoIdCertificado(certificado);
         estadoCertificado.setCorreoEnviado(nuevoCorreo); // Guardar el nuevo correo al que se envió
         estadoCertificadoDAO.save(estadoCertificado); // Guardar los cambios en la base de datos

         System.out.println("Certificado enviado a: " + nuevoCorreo);
     }


    @Override
    public void sendCertificadoEmail(String to, String subject, String body, String attachmentPath, String fileName)
            throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body);

        if (attachmentPath != null) {
            java.nio.file.Path path = java.nio.file.Paths.get(attachmentPath);  //obtener la ruta 
            if (!path.toFile().exists()) {
                throw new MessagingException("El archivo de certificado no existe: " + attachmentPath);
            }
            helper.addAttachment(fileName, path.toFile());  // Adjuntar el archivo 
        }


        mailSender.send(message);
    }

    // Nueva función para agregar el nombre del estudiante en el PDF
    public String agregarNombreEnPDF(String inputPath, String outputPath, String nombreEstudiante, String apellidoEstudiante) {
        try {
            // Cargar el documento PDF
            PDDocument document = PDDocument.load(new File(inputPath));
            PDPage page = document.getPage(0); // Primera página del documento

            // Obtener el tamaño de la página para calcular el centro
            PDRectangle pageSize = page.getMediaBox();
            float centerX = pageSize.getWidth() / 2 - 95; // Ajustar para centrar el texto
            float centerY = pageSize.getHeight() / 2 - 45;

            // Escribir el nombre en la posición especificada
            try (PDPageContentStream contentStream = new PDPageContentStream(document, page, PDPageContentStream.AppendMode.APPEND, true, true)) {
                contentStream.beginText();
                contentStream.setFont(PDType1Font.HELVETICA_BOLD, 20);
                contentStream.newLineAtOffset(centerX, centerY);
                contentStream.showText(nombreEstudiante.toUpperCase()+ " " + apellidoEstudiante.toUpperCase());
                contentStream.endText();
            }

            // Guardar el nuevo PDF con el nombre agregado
            document.save(outputPath);
            document.close();

            return outputPath;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al agregar el nombre en el PDF: " + e.getMessage());
        }
    }

    @Override
    public int obtenerUltimaVersion() {
        return certificadoDAO.obtenerUltimaVersion().orElse(0);  // Retorna 0 si no hay registros
    }

}
