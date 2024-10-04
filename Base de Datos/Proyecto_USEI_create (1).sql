-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-10-04 15:05:10.452

-- tables
-- Table: Certificado
CREATE TABLE Certificado (
    id_certificado serial  NOT NULL,
    formato varchar(50)  NOT NULL,
    version int  NOT NULL,
    fecha_modificacion date  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    CONSTRAINT Certificado_pk PRIMARY KEY (id_certificado)
);

-- Table: Encuesta
CREATE TABLE Encuesta (
    id_encuesta serial  NOT NULL,
    titulo varchar(40)  NOT NULL,
    descripcion text  NOT NULL,
    fecha_modificado date  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    CONSTRAINT Encuesta_pk PRIMARY KEY (id_encuesta)
);

-- Table: Encuesta_Gestion
CREATE TABLE Encuesta_Gestion (
    id_encuesta_gestion serial  NOT NULL,
    Pregunta_id_pregunta int  NOT NULL,
    Encuesta_id_encuesta int  NOT NULL,
    anio int  NOT NULL,
    semestre int  NOT NULL,
    CONSTRAINT Encuesta_Gestion_pk PRIMARY KEY (id_encuesta_gestion)
);

-- Table: Estado_Certificado
CREATE TABLE Estado_Certificado (
    id_est_certificado serial  NOT NULL,
    archivo varchar(50)  NOT NULL,
    estado varchar(15)  NOT NULL,
    fecha_estado date  NOT NULL,
    Certificado_id_certificado int  NOT NULL,
    Estudiante_id_estudiante int  NOT NULL,
    CONSTRAINT Estado_Certificado_pk PRIMARY KEY (id_est_certificado)
);

-- Table: Estado_Encuesta
CREATE TABLE Estado_Encuesta (
    id_est_encuesta serial  NOT NULL,
    estado varchar(30)  NOT NULL,
    fecha_estado date  NOT NULL,
    Estudiante_id_estudiante int  NOT NULL,
    Encuesta_id_encuesta int  NOT NULL,
    CONSTRAINT Estado_Encuesta_pk PRIMARY KEY (id_est_encuesta)
);

-- Table: Estudiante
CREATE TABLE Estudiante (
    id_estudiante serial  NOT NULL,
    ci int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    correo_institucional varchar(50)  NOT NULL,
    correo_personal varchar(50)  NULL,
    carrera varchar(50)  NOT NULL,
    asignatura varchar(50)  NOT NULL,
    telefono int  NOT NULL,
    anio int  NOT NULL,
    semestre int  NOT NULL,
    estado_invitacion varchar(50)  NOT NULL,
    contrasena varchar(50)  NOT NULL,
    CONSTRAINT Estudiante_pk PRIMARY KEY (id_estudiante)
);

-- Table: H_Certificado
CREATE TABLE H_Certificado (
    id_certificado serial  NOT NULL,
    formato varchar(50)  NOT NULL,
    version int  NOT NULL,
    fecha_modificacion date  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    ver int  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user int  NOT NULL,
    CONSTRAINT H_Certificado_pk PRIMARY KEY (id_certificado)
);

-- Table: H_Estudiante
CREATE TABLE H_Estudiante (
    id_estudiante serial  NOT NULL,
    ci int  NOT NULL,
    nombre varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    correo_insitucional varchar(50)  NOT NULL,
    correo_personal varchar(50)  NULL,
    carrera varchar(40)  NOT NULL,
    asignatura varchar(30)  NOT NULL,
    telefono int  NOT NULL,
    anio int  NOT NULL,
    semestre int  NOT NULL,
    ver int  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user int  NOT NULL,
    CONSTRAINT H_Estudiante_pk PRIMARY KEY (id_estudiante)
);

-- Table: H_Noticias
CREATE TABLE H_Noticias (
    id_noticia serial  NOT NULL,
    titulo varchar(50)  NOT NULL,
    descripcion text  NOT NULL,
    img varchar(50)  NOT NULL,
    fecha_modificado date  NOT NULL,
    estado varchar(30)  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    ver int  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user int  NOT NULL,
    CONSTRAINT H_Noticias_pk PRIMARY KEY (id_noticia)
);

-- Table: H_Reporte
CREATE TABLE H_Reporte (
    id_reporte serial  NOT NULL,
    titulo varchar(30)  NOT NULL,
    descripcion text  NOT NULL,
    formato varchar(50)  NOT NULL,
    fecha date  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    ver int  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user int  NOT NULL,
    CONSTRAINT H_Reporte_pk PRIMARY KEY (id_reporte)
);

-- Table: H_Respuesta
CREATE TABLE H_Respuesta (
    id_respuesta serial  NOT NULL,
    respuesta text  NOT NULL,
    Pregunta_id_pregunta int  NOT NULL,
    Estudiante_id_estudiante int  NOT NULL,
    ver int  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user int  NOT NULL,
    CONSTRAINT H_Respuesta_pk PRIMARY KEY (id_respuesta)
);

-- Table: H_Usuario
CREATE TABLE H_Usuario (
    id_usuario serial  NOT NULL,
    nombre varchar(50)  NOT NULL,
    telefono int  NOT NULL,
    correo varchar(40)  NOT NULL,
    rol varchar(20)  NOT NULL,
    usuario varchar(30)  NOT NULL,
    contrasenia varchar(30)  NOT NULL,
    ver int  NOT NULL,
    tx_date timestamp  NOT NULL,
    tx_user int  NOT NULL,
    CONSTRAINT H_Usuario_pk PRIMARY KEY (id_usuario)
);

-- Table: Noticias
CREATE TABLE Noticias (
    id_noticia serial  NOT NULL,
    titulo varchar(50)  NOT NULL,
    descripcion text  NOT NULL,
    img varchar(50)  NOT NULL,
    fecha_modificado date  NOT NULL,
    estado varchar(30)  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    CONSTRAINT Noticias_pk PRIMARY KEY (id_noticia)
);

-- Table: Opciones_Pregunta
CREATE TABLE Opciones_Pregunta (
    id_opciones serial  NOT NULL,
    opcion varchar(30)  NOT NULL,
    Pregunta_id_pregunta int  NOT NULL,
    CONSTRAINT Opciones_Pregunta_pk PRIMARY KEY (id_opciones)
);

-- Table: Pregunta
CREATE TABLE Pregunta (
    id_pregunta serial  NOT NULL,
    num_pregunta int  NOT NULL,
    pregunta text  NOT NULL,
    tipo_pregunta varchar(15)  NOT NULL,
    estado varchar(15)  NOT NULL,
    CONSTRAINT Pregunta_pk PRIMARY KEY (id_pregunta)
);

-- Table: Reporte
CREATE TABLE Reporte (
    id_reporte serial  NOT NULL,
    titulo varchar(30)  NOT NULL,
    descripcion text  NOT NULL,
    formato varchar(50)  NOT NULL,
    fecha date  NOT NULL,
    Usuario_id_usuario int  NOT NULL,
    CONSTRAINT Reporte_pk PRIMARY KEY (id_reporte)
);

-- Table: Respuesta
CREATE TABLE Respuesta (
    id_respuesta serial  NOT NULL,
    respuesta text  NOT NULL,
    Pregunta_id_pregunta int  NOT NULL,
    Estudiante_id_estudiante int  NOT NULL,
    CONSTRAINT Respuesta_pk PRIMARY KEY (id_respuesta)
);

-- Table: Usuario
CREATE TABLE Usuario (
    id_usuario serial  NOT NULL,
    nombre varchar(50)  NOT NULL,
    telefono int  NOT NULL,
    correo varchar(40)  NOT NULL,
    rol varchar(20)  NOT NULL,
    usuario varchar(30)  NOT NULL,
    contrasenia varchar(30)  NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY (id_usuario)
);

-- foreign keys
-- Reference: Certificado_Usuario (table: Certificado)
ALTER TABLE Certificado ADD CONSTRAINT Certificado_Usuario
    FOREIGN KEY (Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Encuesta_Gestion_Encuesta (table: Encuesta_Gestion)
ALTER TABLE Encuesta_Gestion ADD CONSTRAINT Encuesta_Gestion_Encuesta
    FOREIGN KEY (Encuesta_id_encuesta)
    REFERENCES Encuesta (id_encuesta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Encuesta_Gestion_Pregunta (table: Encuesta_Gestion)
ALTER TABLE Encuesta_Gestion ADD CONSTRAINT Encuesta_Gestion_Pregunta
    FOREIGN KEY (Pregunta_id_pregunta)
    REFERENCES Pregunta (id_pregunta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Encuesta_Usuario (table: Encuesta)
ALTER TABLE Encuesta ADD CONSTRAINT Encuesta_Usuario
    FOREIGN KEY (Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Estado_Certificado_Certificado (table: Estado_Certificado)
ALTER TABLE Estado_Certificado ADD CONSTRAINT Estado_Certificado_Certificado
    FOREIGN KEY (Certificado_id_certificado)
    REFERENCES Certificado (id_certificado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Estado_Certificado_Estudiante (table: Estado_Certificado)
ALTER TABLE Estado_Certificado ADD CONSTRAINT Estado_Certificado_Estudiante
    FOREIGN KEY (Estudiante_id_estudiante)
    REFERENCES Estudiante (id_estudiante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Estado_Encuesta_Encuesta (table: Estado_Encuesta)
ALTER TABLE Estado_Encuesta ADD CONSTRAINT Estado_Encuesta_Encuesta
    FOREIGN KEY (Encuesta_id_encuesta)
    REFERENCES Encuesta (id_encuesta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Estado_Encuesta_Estudiante (table: Estado_Encuesta)
ALTER TABLE Estado_Encuesta ADD CONSTRAINT Estado_Encuesta_Estudiante
    FOREIGN KEY (Estudiante_id_estudiante)
    REFERENCES Estudiante (id_estudiante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Noticias_Usuario (table: Noticias)
ALTER TABLE Noticias ADD CONSTRAINT Noticias_Usuario
    FOREIGN KEY (Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Opciones_Pregunta_Pregunta (table: Opciones_Pregunta)
ALTER TABLE Opciones_Pregunta ADD CONSTRAINT Opciones_Pregunta_Pregunta
    FOREIGN KEY (Pregunta_id_pregunta)
    REFERENCES Pregunta (id_pregunta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Reporte_Usuario (table: Reporte)
ALTER TABLE Reporte ADD CONSTRAINT Reporte_Usuario
    FOREIGN KEY (Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Respuesta_Estudiante (table: Respuesta)
ALTER TABLE Respuesta ADD CONSTRAINT Respuesta_Estudiante
    FOREIGN KEY (Estudiante_id_estudiante)
    REFERENCES Estudiante (id_estudiante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Respuesta_Pregunta (table: Respuesta)
ALTER TABLE Respuesta ADD CONSTRAINT Respuesta_Pregunta
    FOREIGN KEY (Pregunta_id_pregunta)
    REFERENCES Pregunta (id_pregunta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

