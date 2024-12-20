package com.usei.usei.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public Iterable<Certificado> findAll(){
        return certificadoDAO.findAll();
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

    // // Función para enviar el certificado solo si se cumplen las condiciones
    // public void enviarCertificadoConCondiciones(Long idEstudiante) throws MessagingException {

    //     // Verificar el estado de la encuesta
    //     EstadoEncuesta estadoEncuesta = estadoEncuestaDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante)
    //         .orElseThrow(() -> new RuntimeException("Estado de encuesta no encontrado para el estudiante con ID: " + idEstudiante));
        
    //     if (!"completado".equalsIgnoreCase(estadoEncuesta.getEstado())) {
    //         System.out.println("No se puede enviar el certificado. El estado de la encuesta no está completado.");
    //         return;
    //     }

    //     // Verificar el estado del certificado
    //     EstadoCertificado estadoCertificado = estadoCertificadoDAO.findByEstudianteIdEstudiante_IdEstudiante(idEstudiante)
    //         .orElseThrow(() -> new RuntimeException("Estado de certificado no encontrado para el estudiante con ID: " + idEstudiante));
        
    //     if (!"pendiente".equalsIgnoreCase(estadoCertificado.getEstado())) {
    //         System.out.println("No se puede enviar el certificado. Ya ha sido enviado anteriormente.");
    //         return;
    //     }

    //     // Obtener el correo del estudiante
    //     Estudiante estudiante = estudianteDAO.findById(idEstudiante)
    //         .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el ID: " + idEstudiante));

    //     String correo = estudiante.getCorreoInstitucional();  
    //     String asunto = "Certificado Académico";
    //     String mensaje = "Estimado " + estudiante.getNombre() + ", adjunto encontrarás tu certificado académico.";
    //     String attachmentPath = "C:\\Users\\paola qv\\Desktop\\usei\\Proyecto-USEI\\Backend\\src\\main\\resources\\static\\documents\\formatos\\Prueba1.pdf";

    //     // Enviar el correo con el certificado adjunto
    //     sendCertificadoEmail(correo, asunto, mensaje, attachmentPath);

    //     // Actualizar el estado del certificado a "enviado"
    //     estadoCertificado.setEstado("enviado");
    //     estadoCertificadoDAO.save(estadoCertificado);  // Guardar los cambios en la base de datos

    //     System.out.println("Certificado enviado a: " + correo);
    // }
     // Función para enviar el certificado solo si se cumplen las condiciones
     
     // Función para enviar el certificado que está en uso
     public void enviarCertificadoConCondiciones(Long idEstudiante) throws MessagingException {

        // Verificar el estado de la encuesta
        EstadoEncuesta estadoEncuesta = estadoEncuestaDAO
                .findByEstudianteIdEstudiante_IdEstudiante(idEstudiante)
                .orElseThrow(() -> new RuntimeException(
                        "Estado de encuesta no encontrado para el estudiante con ID: " + idEstudiante));

        if (!"completado".equalsIgnoreCase(estadoEncuesta.getEstado())) {
            System.out.println("No se puede enviar el certificado. El estado de la encuesta no está completado.");
            return;
        }

        // Verificar el estado del certificado
        EstadoCertificado estadoCertificado = estadoCertificadoDAO
                .findByEstudianteIdEstudiante_IdEstudiante(idEstudiante)
                .orElseThrow(() -> new RuntimeException(
                        "Estado de certificado no encontrado para el estudiante con ID: " + idEstudiante));

        if (!"pendiente".equalsIgnoreCase(estadoCertificado.getEstado())) {
            System.out.println("No se puede enviar el certificado. Ya ha sido enviado anteriormente.");
            return;
        }

        // Obtener el correo del estudiante
        Estudiante estudiante = estudianteDAO.findById(idEstudiante)
                .orElseThrow(() -> new RuntimeException("Estudiante no encontrado con el ID: " + idEstudiante));
        String correo = estudiante.getCorreoInstitucional();
        String asunto = "Certificado Académico";
        String mensaje = "Estimado " + estudiante.getNombre() + ", adjunto encontrarás tu certificado académico.";

        Optional<Certificado> certificadoEnUso = certificadoDAO.findByEstado("En uso");
        if (certificadoEnUso.isEmpty()) {
            System.out.println("No hay certificado en uso para enviar.");
            throw new RuntimeException("No hay certificado en uso para enviar.");
        }

        Certificado certificado = certificadoEnUso.get();
        String basePath = "src/main/resources/static/documents/formatos/";

        String attachmentPath = basePath + certificado.getFormato(); // Crear la ruta completa

         // Validar si el archivo existe
         java.nio.file.Path path = java.nio.file.Paths.get(attachmentPath);
         if (!path.toFile().exists()) {
             System.err.println("Error: El archivo de certificado no existe en la ruta: " + attachmentPath);
             throw new RuntimeException("El archivo de certificado no existe en la ruta especificada.");
         }
 
         String fileName = path.getFileName().toString(); // Obtener el nombre del archivo
 
        // Enviar el correo con el certificado adjunto
        sendCertificadoEmail(correo, asunto, mensaje, attachmentPath, fileName);

        // Actualizar el estado del certificado a "enviado"
        estadoCertificado.setEstado("enviado");
        estadoCertificadoDAO.save(estadoCertificado); // Guardar los cambios en la base de datos

        System.out.println("Certificado enviado a: " + correo);
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


    //  @Override
    // public void sendCertificadoEmail(String to, String subject, String body, String attachmentPath) throws MessagingException {
    //     MimeMessage message = mailSender.createMimeMessage();
    //     MimeMessageHelper helper = new MimeMessageHelper(message, true);
    //     helper.setTo(to);
    //     helper.setSubject(subject);
    //     helper.setText(body);

    //     if (attachmentPath != null) {
    //         java.nio.file.Path path = java.nio.file.FileSystems.getDefault().getPath(attachmentPath);
    //         helper.addAttachment("Certificado.pdf", path.toFile());
    //     }

    //     mailSender.send(message);
    // }


    @Override
    public int obtenerUltimaVersion() {
        return certificadoDAO.obtenerUltimaVersion().orElse(0);  // Retorna 0 si no hay registros
    }

   


}
