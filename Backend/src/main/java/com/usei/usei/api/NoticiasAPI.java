package com.usei.usei.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.usei.usei.controllers.NoticiasService;
import com.usei.usei.models.MessageResponse;
import com.usei.usei.models.Noticias;

import java.util.Optional;

@RestController
@RequestMapping("/noticia")
public class NoticiasAPI {
    @Autowired
    private NoticiasService noticiasService;

    //Crear una nueva noticia:
    @PostMapping
    public ResponseEntity<?> create (@RequestBody Noticias noticias){
        try {
            noticiasService.save(noticias);
            return new ResponseEntity<>(new MessageResponse("Noticia registrado"), HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{id_noticia}")
    public ResponseEntity<?> read(@PathVariable(value = "id_noticia") Long id_noticias) {
    Optional<Noticias> oNoticias = noticiasService.findById(id_noticias);
    
    return oNoticias.map(noticias -> ResponseEntity.ok(noticias))
        .orElse(ResponseEntity.notFound().build());
}


    @GetMapping
    public ResponseEntity<?> readAll(){
        return ResponseEntity.ok(noticiasService.findAll());
    }

    

    @PutMapping("/{id_noticia}")
    public ResponseEntity<?> update(@PathVariable(value = "id_noticia") Long id_noticias, @RequestBody Noticias noticias){

        try {
            Noticias updatedNoticias = noticiasService.update( noticias, id_noticias);
            return ResponseEntity.ok(updatedNoticias);
        } catch (Exception e) {
            return new ResponseEntity<>(new MessageResponse(e.getMessage()), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        
    }

    
}
