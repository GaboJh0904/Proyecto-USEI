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

-- Datos prueba
-- Tabla de Usuarios 1000 datos 
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '65918962', 'jorgemartínez@gmail.com', 'Administrador', 
        'jorge_martínez', 'fuymrmQmulEaBbkyPCZBTi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '68969918', 'carmensánchez@gmail.com', 'Director', 
        'carmen_sánchez', 'WE1UkLkj8w');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '73150362', 'pedrolópez@hotmail.com', 'Administrador', 
        'pedro_lópez', 'cvDMmYR0r7xVUNlkZem5I1lI0zlU9r');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '78778064', 'luislópez@yahoo.com', 'Administrador', 
        'luis_lópez', 'wKwwfSdZjOamWtl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '62024309', 'carmenmartínez@hotmail.com', 'Administrador', 
        'carmen_martínez', 'dxvpQYHDCDPpEyiLDAQ3i0Jd5yZyn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '69138559', 'juanmartínez@gmail.com', 'Administrador', 
        'juan_martínez', 'w3MlRYI4OvCacK9Vya6ze');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '66851593', 'jorgepérez@gmail.com', 'Director', 
        'jorge_pérez', 'lAYPuWlAk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '70004965', 'maríapérez@gmail.com', 'Director', 
        'maría_pérez', 'GLui3C3vd0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '68132129', 'carlosrodríguez@yahoo.com', 'Director', 
        'carlos_rodríguez', 'oTEq1eBk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María González', '71155908', 'maríagonzález@hotmail.com', 'Administrador', 
        'maría_gonzález', 'egSYWWgL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '69255512', 'anapérez@hotmail.com', 'Administrador', 
        'ana_pérez', 'wz6Cz6hJkliZ9nB1u106iTU6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '61002868', 'luismartínez@hotmail.com', 'Administrador', 
        'luis_martínez', 'R6nAn676KPk2r8CS3RJ11DJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '64426223', 'maríalópez@gmail.com', 'Director', 
        'maría_lópez', 'cKfhduHJZIpaLe7t4Swfnh5piwk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '66893195', 'carlosramírez@gmail.com', 'Director', 
        'carlos_ramírez', 'IqD6K3jH7eV3Y5FL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '75430119', 'laurarodríguez@hotmail.com', 'Administrador', 
        'laura_rodríguez', '4ptWmbz7gxHARd9iSyGgcL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '61402785', 'pedropérez@hotmail.com', 'Director', 
        'pedro_pérez', '9xrMnJC3YUH3OMS23Fv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '70714053', 'pedropérez@yahoo.com', 'Director', 
        'pedro_pérez', 'I1hFX4FjXixmFHGx9THm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '67528651', 'pedrosánchez@gmail.com', 'Director', 
        'pedro_sánchez', 'F6sab3X66n');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '71003542', 'pedromartínez@gmail.com', 'Director', 
        'pedro_martínez', 'Wn3BpUtQOrVdlazAO1ly8EL1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '70213220', 'jorgelópez@gmail.com', 'Director', 
        'jorge_lópez', 'dbN0A2OtBmVj8ni0OSVII5WSViE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '76087596', 'maríamartínez@hotmail.com', 'Director', 
        'maría_martínez', '3wofhFeqbUuYZJqagSN8FZk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '74906233', 'sofíarodríguez@gmail.com', 'Administrador', 
        'sofía_rodríguez', 'xzosOMETDp0q9HratCn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '69397538', 'sofíaflores@hotmail.com', 'Administrador', 
        'sofía_flores', 'GYbciCThNoqz6rVJj3Ee');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '79616715', 'pedroflores@hotmail.com', 'Administrador', 
        'pedro_flores', 'D3Mg5W5CxwO9NTQN7iE3s2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '65148869', 'maríalópez@hotmail.com', 'Director', 
        'maría_lópez', 'LKVnSSA5D');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '75881349', 'luissánchez@yahoo.com', 'Director', 
        'luis_sánchez', 'WHOYXoJ62');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '63083971', 'anaramírez@hotmail.com', 'Director', 
        'ana_ramírez', 'vgFq2BjJPKAGAIofRcFjlK6xQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '71732775', 'pedrorodríguez@hotmail.com', 'Administrador', 
        'pedro_rodríguez', '1gXJhOQ1UsSc2Eeth36EJw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '60985509', 'maríarodríguez@gmail.com', 'Administrador', 
        'maría_rodríguez', 'LTNQKGOQBIMnahxAagcc3y8OH3eN8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '62529296', 'anasánchez@hotmail.com', 'Administrador', 
        'ana_sánchez', 'eMrUZBcyRVpsM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '70762492', 'sofíarodríguez@hotmail.com', 'Director', 
        'sofía_rodríguez', 'tGIGznlWXi56CdjGXItau2hLL06');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '70878096', 'laurasánchez@gmail.com', 'Director', 
        'laura_sánchez', 'Kgfh7sH8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '61478929', 'luismartínez@hotmail.com', 'Director', 
        'luis_martínez', 'moSRkt3T');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '62639124', 'luisramírez@hotmail.com', 'Director', 
        'luis_ramírez', '7Qd9fvoMs4VR30FWO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '60594327', 'luismartínez@yahoo.com', 'Administrador', 
        'luis_martínez', '5uL7SJd1NldTWR9X');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '77981397', 'juangonzález@yahoo.com', 'Administrador', 
        'juan_gonzález', 'qwwjVDPl9Wf3oDs04DJ2jRE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '70897439', 'jorgeflores@yahoo.com', 'Director', 
        'jorge_flores', '1xWhvZL0hMPqmx6D5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '71377378', 'sofíaramírez@hotmail.com', 'Director', 
        'sofía_ramírez', 'IoxnNYCJj2sCB1Tus0QObUoyEXE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '77439356', 'pedroramírez@yahoo.com', 'Administrador', 
        'pedro_ramírez', '7VsvUUKeyeQO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '79691797', 'maríarodríguez@gmail.com', 'Administrador', 
        'maría_rodríguez', '4F2TmWS9txqXEbTjb8Ln3mMXkmHZ1U');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '68571398', 'lauralópez@yahoo.com', 'Director', 
        'laura_lópez', 'A6VZGvEO9EqTwq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '76598045', 'pedromartínez@gmail.com', 'Administrador', 
        'pedro_martínez', 'e0HgOLFDpRgSIRT88Ah');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '75112806', 'juanlópez@gmail.com', 'Director', 
        'juan_lópez', 'BKUMTV9kb00jrQtJRVqOBGsge');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '65575156', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', 'Hktx18WZPjYf11ymaq6Tauh3ogLjw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Rodríguez', '65344340', 'carmenrodríguez@hotmail.com', 'Administrador', 
        'carmen_rodríguez', 'MHhYAPMqCaA7Hct');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '68357437', 'anarodríguez@hotmail.com', 'Director', 
        'ana_rodríguez', 'iURIWjQrxHm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '66255146', 'carlosrodríguez@gmail.com', 'Administrador', 
        'carlos_rodríguez', 'maM3acyq2A9Qfum');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '79584003', 'carmenpérez@gmail.com', 'Administrador', 
        'carmen_pérez', 'GcGpJNFnhBNLGamd4Mp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '64044767', 'carmenlópez@hotmail.com', 'Administrador', 
        'carmen_lópez', 'C5SLogxL4ndBTQVz3Y5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '61269523', 'laurasánchez@gmail.com', 'Director', 
        'laura_sánchez', 'HGathqY1whRQh6VeWt56zh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '78549020', 'juanpérez@gmail.com', 'Director', 
        'juan_pérez', '5clGIcvUAhtVHwjBSu9adPp6G');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '64658178', 'carmenlópez@hotmail.com', 'Administrador', 
        'carmen_lópez', 'fZC31M137O');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '68123770', 'sofíalópez@yahoo.com', 'Administrador', 
        'sofía_lópez', '95nsu93mAVDlrGjTjK3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '60552222', 'carmenmartínez@yahoo.com', 'Administrador', 
        'carmen_martínez', '3ALZMQNPJUkmZjKTlREjWXooznTxL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '63860543', 'pedrogonzález@gmail.com', 'Administrador', 
        'pedro_gonzález', 'lJjFvkQ5XulRKQ29');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '68450296', 'carmenramírez@gmail.com', 'Administrador', 
        'carmen_ramírez', 'X2b3jFYF0TkcTFY3NQ9V7co7Bis');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '68938626', 'carlossánchez@gmail.com', 'Director', 
        'carlos_sánchez', 'yN3NV88MSZ7ACRo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '77162209', 'sofíaflores@hotmail.com', 'Director', 
        'sofía_flores', 'LDRIBnk5PminXib7WTlfj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '63368699', 'sofíarodríguez@yahoo.com', 'Administrador', 
        'sofía_rodríguez', 'y0GJpgt7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '77281381', 'laurasánchez@yahoo.com', 'Director', 
        'laura_sánchez', 'zmHkokTxzP6Vu1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '66648011', 'laurarodríguez@gmail.com', 'Administrador', 
        'laura_rodríguez', '9lfdO5HF4xQ6yR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '66114606', 'luispérez@hotmail.com', 'Director', 
        'luis_pérez', 'aO3dQWz9Uq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María González', '78260043', 'maríagonzález@gmail.com', 'Director', 
        'maría_gonzález', 'bRzSksHCHhbcgnY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '74012098', 'carloslópez@gmail.com', 'Director', 
        'carlos_lópez', 'rjSTa5JJ24pnu8Sacw1jua1L');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '62221412', 'carlossánchez@yahoo.com', 'Director', 
        'carlos_sánchez', '5V9jEdxOODvCMfwY7b70HCrJCRnS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '72834761', 'luissánchez@hotmail.com', 'Administrador', 
        'luis_sánchez', 'm13Zu6sNjxCLVvtQQXxP3e');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '75440332', 'laurarodríguez@hotmail.com', 'Director', 
        'laura_rodríguez', '88yYlw4vU2MP9mCxsv2sp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '72249404', 'juanpérez@yahoo.com', 'Director', 
        'juan_pérez', 'NB8aTWBOpD9hN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '60008317', 'juanrodríguez@hotmail.com', 'Administrador', 
        'juan_rodríguez', '8PIzEdeiNUbr6AjpkVQckJ3bF5s');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '63148319', 'juanlópez@hotmail.com', 'Director', 
        'juan_lópez', 'aS21BfMrVd8OTWrNAE42UyoV1ZZJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '60088905', 'analópez@hotmail.com', 'Director', 
        'ana_lópez', 'xBX3lLWHzGCdMBxKX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '61484094', 'jorgeflores@yahoo.com', 'Administrador', 
        'jorge_flores', 'xUw0co2eP9eXPzlfn1YM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '76737060', 'analópez@yahoo.com', 'Director', 
        'ana_lópez', 'VcIvHsu39WbMl7EnPQ5n27pBOk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '65954351', 'lauramartínez@gmail.com', 'Director', 
        'laura_martínez', 'mchuSC4qXhMW5hVe1DE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '61319766', 'sofíaramírez@yahoo.com', 'Administrador', 
        'sofía_ramírez', 'JvErgdRGOEgQ4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '73725074', 'lauraramírez@hotmail.com', 'Administrador', 
        'laura_ramírez', 'iET2K86pZdKEGakcEyF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '72799008', 'carmenmartínez@yahoo.com', 'Administrador', 
        'carmen_martínez', 'bPnkJlE2Mf8Bcm7GMa99W3DoxhWUx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '69804522', 'pedrogonzález@gmail.com', 'Administrador', 
        'pedro_gonzález', 'MxsqZ9x7EjmNZz9fYfSmNkt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '78913890', 'juanpérez@yahoo.com', 'Administrador', 
        'juan_pérez', 'qK41GAWuX4KDPFuG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Ramírez', '74426249', 'maríaramírez@yahoo.com', 'Director', 
        'maría_ramírez', 'SrMvon9Hfm0b4mT2Iq5y4yQ8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '68711167', 'jorgeramírez@gmail.com', 'Director', 
        'jorge_ramírez', 'Sg39x4uN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '63482558', 'pedrorodríguez@yahoo.com', 'Director', 
        'pedro_rodríguez', 'VbqpPD1UB8f');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '63473862', 'anaflores@gmail.com', 'Administrador', 
        'ana_flores', '09nGtFQmAsMcdOW7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '68416022', 'anagonzález@hotmail.com', 'Director', 
        'ana_gonzález', 'iXvjNpLsktH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '63294083', 'pedrolópez@yahoo.com', 'Director', 
        'pedro_lópez', 'lkWYj09DXJHBbROTYA5O26K');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '73624464', 'pedroramírez@yahoo.com', 'Director', 
        'pedro_ramírez', 'FnJPJMNXfof9EjKt8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '68832248', 'pedrolópez@hotmail.com', 'Director', 
        'pedro_lópez', 'ClTcnJTXmjJe3T');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '76826224', 'anaflores@yahoo.com', 'Administrador', 
        'ana_flores', 'B8C6dnnF9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '70721023', 'sofíarodríguez@yahoo.com', 'Administrador', 
        'sofía_rodríguez', 'mpeKEKc6gkdlJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '71082567', 'maríapérez@yahoo.com', 'Administrador', 
        'maría_pérez', 'KO4nmM5nSni1G');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '77725421', 'carlossánchez@gmail.com', 'Director', 
        'carlos_sánchez', 'uZ5YbO6lNwd8Qb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '63931468', 'pedrolópez@yahoo.com', 'Administrador', 
        'pedro_lópez', 'wasBBgMGXFhRhmTse386PZHiQbo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '68333617', 'carlossánchez@hotmail.com', 'Administrador', 
        'carlos_sánchez', 'K1IzFVSNSt26q');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '74663660', 'maríaflores@gmail.com', 'Administrador', 
        'maría_flores', '3GJeOSFJ0uzbpMzlgq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '79612905', 'luisramírez@hotmail.com', 'Director', 
        'luis_ramírez', 'DqsKrSzuv7IJZwTHlcGsx2MYr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '64652751', 'pedromartínez@yahoo.com', 'Director', 
        'pedro_martínez', 'qAPH8jBudS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '62964847', 'luisrodríguez@hotmail.com', 'Administrador', 
        'luis_rodríguez', 'X0Fbzg2On');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '76317975', 'luisflores@yahoo.com', 'Director', 
        'luis_flores', 'F1MEO5Sq78nBNG0Sb0m2elYkWf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '66657692', 'maríalópez@yahoo.com', 'Administrador', 
        'maría_lópez', 'Z9uWxu3O');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '71640658', 'laurasánchez@hotmail.com', 'Administrador', 
        'laura_sánchez', 'eRkxCMJTGTiAqmEdxFaWT6UoHgN9vR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '61804234', 'anaflores@hotmail.com', 'Director', 
        'ana_flores', 'dpKndcxigkry');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '69485509', 'luisramírez@gmail.com', 'Administrador', 
        'luis_ramírez', '4imgbKHJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '61535244', 'carlosramírez@yahoo.com', 'Director', 
        'carlos_ramírez', 'yXDiVjmE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '72636742', 'juansánchez@gmail.com', 'Director', 
        'juan_sánchez', 'KyAzwtiLFsgMSCIuEh1RETfAQ4q');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '69562896', 'anaramírez@gmail.com', 'Director', 
        'ana_ramírez', 'keYMHmNxwNyTyZJM3G6mS5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '76932340', 'maríalópez@yahoo.com', 'Administrador', 
        'maría_lópez', 'UYa0hrBuepbsssFn9lZUnSmQV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '67349310', 'anamartínez@gmail.com', 'Director', 
        'ana_martínez', '56NMdQ6ormg8j6Gby1Sbx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '79947212', 'jorgeramírez@hotmail.com', 'Administrador', 
        'jorge_ramírez', 'qTtTCK4I8Lo6Fr3aQWJltH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '72253321', 'carlosflores@yahoo.com', 'Administrador', 
        'carlos_flores', 'yGSLbqfbuuw62IGqFUdWQWBOpbyKm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '68903466', 'lauragonzález@gmail.com', 'Administrador', 
        'laura_gonzález', '3T30B1aPH440Gdw5SHOtmEOpVhdJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '70438092', 'jorgeramírez@gmail.com', 'Administrador', 
        'jorge_ramírez', 'vJMrWgW9PeYOoVqatX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '74150406', 'pedrorodríguez@hotmail.com', 'Administrador', 
        'pedro_rodríguez', 'jg5xjkELXCCAiGYL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '65562253', 'sofíarodríguez@yahoo.com', 'Director', 
        'sofía_rodríguez', 'pVLLj8NAocw2H2X6TmsbvESuGBvA1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '60909694', 'sofíalópez@yahoo.com', 'Administrador', 
        'sofía_lópez', 'ntg8ic1vPLYpu7wMcy2e1lgti');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '72603430', 'pedrorodríguez@yahoo.com', 'Director', 
        'pedro_rodríguez', 'BrRk4RWwxzfiaOX5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '68580800', 'maríapérez@yahoo.com', 'Administrador', 
        'maría_pérez', 'lqsr3x8WA9QoatTpm0RalZD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '63149401', 'carloslópez@hotmail.com', 'Director', 
        'carlos_lópez', 'H5yMSRocA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '67211811', 'juanlópez@hotmail.com', 'Director', 
        'juan_lópez', 'bcXy0jv3tyny0bmwFqbn1NLlJpKc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '73537372', 'sofíagonzález@yahoo.com', 'Director', 
        'sofía_gonzález', 'gGdP4wkTKezHVW0den2NG6TjAz5Zqy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '73727243', 'anarodríguez@yahoo.com', 'Director', 
        'ana_rodríguez', 'q7VT09MsDRAn5f8kpn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '78259063', 'carmenramírez@hotmail.com', 'Administrador', 
        'carmen_ramírez', 'hgWzwP6mo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '62122312', 'anarodríguez@yahoo.com', 'Director', 
        'ana_rodríguez', 'i3x4XRvtRp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '69712225', 'juanrodríguez@gmail.com', 'Administrador', 
        'juan_rodríguez', 'cKaXEUrGdu9B1iK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '70953988', 'juangonzález@hotmail.com', 'Director', 
        'juan_gonzález', 'Ggf2Ef2tgw2LkehAXypP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '60799103', 'luissánchez@gmail.com', 'Director', 
        'luis_sánchez', 'gvj8Z5j6ams23iuqb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '63219072', 'anapérez@yahoo.com', 'Administrador', 
        'ana_pérez', 's1nxBnzr41OskZSpAAUqa9THJMY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '64794467', 'carmengonzález@gmail.com', 'Director', 
        'carmen_gonzález', 'w62Y1XDC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '75325508', 'pedropérez@yahoo.com', 'Administrador', 
        'pedro_pérez', 'FAd5rrVj7Rgc5FZrbNkAVN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '79583319', 'anamartínez@gmail.com', 'Director', 
        'ana_martínez', '1UqxuP9kdaFOzFKE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '61444596', 'pedrolópez@gmail.com', 'Administrador', 
        'pedro_lópez', 'VMHP5rtb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '69860430', 'carmengonzález@hotmail.com', 'Director', 
        'carmen_gonzález', 'wRevvSVWES');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '70618183', 'carlossánchez@gmail.com', 'Director', 
        'carlos_sánchez', 'mdsouShla6NzhwnwpEB183NQfm2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '63804942', 'jorgepérez@gmail.com', 'Administrador', 
        'jorge_pérez', '21UfEM1mmgSw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '71573590', 'anagonzález@hotmail.com', 'Director', 
        'ana_gonzález', 'NPbYEAFnaHwUXp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '66347097', 'maríarodríguez@gmail.com', 'Director', 
        'maría_rodríguez', 'XaSYHolqlgUKMuOrV1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Rodríguez', '76388214', 'carmenrodríguez@gmail.com', 'Administrador', 
        'carmen_rodríguez', 'KWtIAPmLJm8AA3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '77466843', 'luislópez@hotmail.com', 'Administrador', 
        'luis_lópez', 'q0sqYquJUezI97ekt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '62762434', 'carlosgonzález@yahoo.com', 'Director', 
        'carlos_gonzález', 'Zb2agC26aBsCF1J9Id5osoism8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '62675062', 'luismartínez@gmail.com', 'Director', 
        'luis_martínez', 'oOWPyyYPs7ynA1DK4sbumcDSlKKSaI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '67522990', 'jorgemartínez@gmail.com', 'Administrador', 
        'jorge_martínez', 'e8nJh3bPTQu2GtVvbYJpF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '78285964', 'luispérez@yahoo.com', 'Administrador', 
        'luis_pérez', 'Yzdj9TH6eO9dQwiKyHjR9DpFurT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '65520670', 'analópez@yahoo.com', 'Director', 
        'ana_lópez', '1ajy34qbukHqSfqeifr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '73380159', 'lauraflores@hotmail.com', 'Director', 
        'laura_flores', 'KPLshjWOiEUmiq8GZXAjMcgr1chPVW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '65509889', 'sofíalópez@gmail.com', 'Director', 
        'sofía_lópez', '9PbR1pTbhgmfA5DGui73QXjkieGjKe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '63492334', 'sofíagonzález@hotmail.com', 'Director', 
        'sofía_gonzález', 'ddizd2MEZuj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '78329556', 'carmengonzález@hotmail.com', 'Administrador', 
        'carmen_gonzález', 'x1twUcKz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '64007500', 'lauraflores@gmail.com', 'Director', 
        'laura_flores', 'SfaIicKmYnjdRzq8pSHD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '71432488', 'jorgesánchez@hotmail.com', 'Administrador', 
        'jorge_sánchez', 'BE5rWhlwDH2r3AeyAKn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '73590975', 'juangonzález@gmail.com', 'Administrador', 
        'juan_gonzález', 'gCjTh06qfpe7gtkBLXx4hplT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '78866855', 'carlosrodríguez@hotmail.com', 'Administrador', 
        'carlos_rodríguez', 'l1h0qg3s');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '67689156', 'carmenflores@hotmail.com', 'Administrador', 
        'carmen_flores', '8THrd6zxz1ww6u0boY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '75061662', 'carmenlópez@gmail.com', 'Director', 
        'carmen_lópez', 'LuYa7f3DByc5qDnbro8eAgj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '72434984', 'jorgemartínez@hotmail.com', 'Administrador', 
        'jorge_martínez', '5xt4WRJCxWqk5gmYYb954e');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '76061829', 'jorgesánchez@hotmail.com', 'Director', 
        'jorge_sánchez', 'bFGbQ1V0iFqJbR9g1Uqq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '72962883', 'carlosmartínez@hotmail.com', 'Administrador', 
        'carlos_martínez', 'SgkCvcry3vXvAkeIOo5gyFs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '68217855', 'analópez@yahoo.com', 'Director', 
        'ana_lópez', '0dxTQ8h39YONrxUy2Y59chQQat');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '64933759', 'lauramartínez@yahoo.com', 'Director', 
        'laura_martínez', 'lk9vhCN1pmBQy5k01l');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '74405146', 'pedropérez@yahoo.com', 'Director', 
        'pedro_pérez', 'zI9y8N9r4WIbTLi4Y3xI8eFv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '75821293', 'carmenlópez@hotmail.com', 'Director', 
        'carmen_lópez', 'GaqNPMDBeq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '71569116', 'laurapérez@hotmail.com', 'Director', 
        'laura_pérez', 'PT1qWXDIMOwLwa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '64971139', 'carmengonzález@hotmail.com', 'Director', 
        'carmen_gonzález', 'eqiMqIvIH6HqfBgtZYez2DkgI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '60053299', 'analópez@hotmail.com', 'Director', 
        'ana_lópez', '0SMQ5LNhd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '71647899', 'juanmartínez@hotmail.com', 'Director', 
        'juan_martínez', 'HzsmiEYy210');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '63256443', 'analópez@gmail.com', 'Director', 
        'ana_lópez', 'mpn4Rn6WOPJd1vVaoyfSXHsV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '63291543', 'maríaflores@hotmail.com', 'Director', 
        'maría_flores', 'UvG1DeCXpKqWj1CQmI4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '76249149', 'maríalópez@yahoo.com', 'Administrador', 
        'maría_lópez', 'qdqqlbx6ddZI0tWah2L');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '65958556', 'jorgeflores@hotmail.com', 'Administrador', 
        'jorge_flores', '1FyL7QoY5s3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '78902711', 'carmengonzález@yahoo.com', 'Director', 
        'carmen_gonzález', 'cF5OrlwgDofHSop9OYa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '61554483', 'laurapérez@hotmail.com', 'Administrador', 
        'laura_pérez', 'ujBIRTDrl15dR9NP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '73102204', 'maríasánchez@gmail.com', 'Director', 
        'maría_sánchez', 'p7F0pCq13ZvnS1VmTRf5ZPXLDmJp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '79124054', 'lauralópez@gmail.com', 'Administrador', 
        'laura_lópez', 'JhozwM1GYUUIr3U3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '65411998', 'maríapérez@yahoo.com', 'Administrador', 
        'maría_pérez', 'v3RlajAYdZAIA8f6OeqMOOzgYxZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '73152882', 'carlosgonzález@gmail.com', 'Director', 
        'carlos_gonzález', 'Aliu6V96RxmAeGHv8DOHv33BIA9C');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '68049829', 'carlossánchez@hotmail.com', 'Director', 
        'carlos_sánchez', 'EkW52eLE74bBtNnWee00tKzbMxj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '70440464', 'juanramírez@gmail.com', 'Administrador', 
        'juan_ramírez', 'B1ALCBKG6JklksA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '61890354', 'maríarodríguez@gmail.com', 'Director', 
        'maría_rodríguez', 'zOsQ6L5MSxz43FwaOh6AnjcA8k6Px');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '65476662', 'pedrorodríguez@hotmail.com', 'Administrador', 
        'pedro_rodríguez', 'sjUhiawZutBzux3hDQYtP8ULe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '60498159', 'anagonzález@hotmail.com', 'Director', 
        'ana_gonzález', 'ktvLazcwxjaIa0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '71453987', 'laurarodríguez@yahoo.com', 'Director', 
        'laura_rodríguez', '5x6MWl5d4bRHygyuHDHhvYf44AlY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '64231166', 'juanmartínez@hotmail.com', 'Director', 
        'juan_martínez', 'mj7tEGDc0iT48gdQsgOxq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '77066441', 'juanmartínez@yahoo.com', 'Director', 
        'juan_martínez', 'MSJ2ErGZA8VQXoHXyQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '63231228', 'maríamartínez@hotmail.com', 'Director', 
        'maría_martínez', 'vtaOU7lhuARdM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '75155635', 'carlospérez@gmail.com', 'Administrador', 
        'carlos_pérez', 'ZFYkV3kJcQ6NVwlyT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '75334328', 'juanrodríguez@yahoo.com', 'Administrador', 
        'juan_rodríguez', 'WILOBJRcYzympJXsz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '66601160', 'jorgeflores@yahoo.com', 'Administrador', 
        'jorge_flores', 'NAljcN4QVNT9c1oujlMpbBlc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '79734460', 'carlosgonzález@hotmail.com', 'Director', 
        'carlos_gonzález', 'uJHAv5e1lntPPwY2iKCycQJPvPW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '66885104', 'sofíarodríguez@yahoo.com', 'Administrador', 
        'sofía_rodríguez', '9DlpkMs3Lh1zNrGbT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '69505461', 'luismartínez@yahoo.com', 'Administrador', 
        'luis_martínez', '9gWBB16Ej3jYA2QB9K6Gl2xpG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '72602082', 'luisramírez@hotmail.com', 'Director', 
        'luis_ramírez', 'IMUHgkXHd1s2sxG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '66945407', 'carmenlópez@hotmail.com', 'Director', 
        'carmen_lópez', 'oo4nrs9Qzke4rwNWYntsvDxDgSHe9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '72851260', 'juanmartínez@gmail.com', 'Director', 
        'juan_martínez', 'PBkWMcSZkpQXWAuLC6I9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Ramírez', '65141623', 'maríaramírez@yahoo.com', 'Director', 
        'maría_ramírez', 'HRPmiLIVN1oYfmuve8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '76832115', 'carloslópez@yahoo.com', 'Administrador', 
        'carlos_lópez', 'tOXxt7dFWi2W2DgGo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '79346906', 'maríaflores@hotmail.com', 'Administrador', 
        'maría_flores', 'WtOOact3l2vn4hN2aqX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '60279572', 'carlosramírez@gmail.com', 'Administrador', 
        'carlos_ramírez', 'DLa6YPZu6LuS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '65473688', 'jorgesánchez@hotmail.com', 'Administrador', 
        'jorge_sánchez', 'SwCtLpDdBZxkcFxuF0q6rCJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '69479395', 'analópez@yahoo.com', 'Director', 
        'ana_lópez', 'Snr9ajFCahgjQqX2F7Q');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '74930120', 'anarodríguez@hotmail.com', 'Director', 
        'ana_rodríguez', 'QlJZitpLMMYP7GhQX4V0bQZUMG9Yo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '73358305', 'laurarodríguez@hotmail.com', 'Director', 
        'laura_rodríguez', 'e8QAIx3gc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '65576195', 'carlosmartínez@hotmail.com', 'Director', 
        'carlos_martínez', 'GKG34oG1ZbIGHEM8yrc6iU4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '64997417', 'maríalópez@hotmail.com', 'Administrador', 
        'maría_lópez', 'S3Uyqz3cL9zXXHeZUXH0yQjlMM6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '75138882', 'juanmartínez@yahoo.com', 'Administrador', 
        'juan_martínez', 's8Q8x9d3M');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '69297754', 'jorgeramírez@gmail.com', 'Administrador', 
        'jorge_ramírez', 'rjhcEPUnZJlQgWCxSWYEs8b42f');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '60559009', 'sofíaflores@yahoo.com', 'Administrador', 
        'sofía_flores', 'aazMR7vm8LIH8wlncXxGuj5f0Ii');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '72898918', 'juansánchez@yahoo.com', 'Director', 
        'juan_sánchez', 'euEXNDs5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Rodríguez', '75247600', 'carmenrodríguez@gmail.com', 'Director', 
        'carmen_rodríguez', 'aSjxeux2s0LX1h');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '67065913', 'carlosrodríguez@yahoo.com', 'Director', 
        'carlos_rodríguez', 'dsHv3DmpV2zdOoSPZaD3Cqfd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '66623936', 'anaflores@hotmail.com', 'Director', 
        'ana_flores', 'XmtmAWH7mPYKzJ7mfynDfjk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '62377393', 'luisflores@gmail.com', 'Administrador', 
        'luis_flores', 'EY91oWhl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '74212787', 'carloslópez@yahoo.com', 'Director', 
        'carlos_lópez', 'DbjaBMyGu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '68604063', 'jorgeflores@gmail.com', 'Director', 
        'jorge_flores', 'R0YQYX9A115zhx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '70532304', 'pedrosánchez@hotmail.com', 'Director', 
        'pedro_sánchez', 'eJbKOAK6Zj2JuLzGzzMT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '76021177', 'jorgemartínez@hotmail.com', 'Administrador', 
        'jorge_martínez', 'i3Mqfty1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '72665787', 'sofíaramírez@yahoo.com', 'Administrador', 
        'sofía_ramírez', 'UhNXzsQC4fw36VRUzl6uOXm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '73434902', 'lauraflores@hotmail.com', 'Administrador', 
        'laura_flores', 'c2Rw4yHq3BV4AXn9sgS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '67352965', 'carlosrodríguez@gmail.com', 'Director', 
        'carlos_rodríguez', 'Zk65VKdtC2isgWqhzpfuWSsaSne');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '65748142', 'maríamartínez@hotmail.com', 'Director', 
        'maría_martínez', 'RHYfYu2PwYI0fRQvx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '79947205', 'anamartínez@yahoo.com', 'Administrador', 
        'ana_martínez', 'vUa59wmfNIMffO01Uvn4ms7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '70312627', 'jorgemartínez@gmail.com', 'Director', 
        'jorge_martínez', 'HbsbDXPge1ePWDpGG1YSQn557');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '78063634', 'juangonzález@hotmail.com', 'Administrador', 
        'juan_gonzález', 't9LU0cv61t8wp36qCgA04w');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '70476229', 'sofíagonzález@yahoo.com', 'Director', 
        'sofía_gonzález', 'X0Fy2GzWFA8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '71714766', 'juangonzález@gmail.com', 'Director', 
        'juan_gonzález', 'rHU3VSFQ63cnRJKGzb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '62868821', 'analópez@yahoo.com', 'Director', 
        'ana_lópez', 'ef2GtIKWOBbYwUsYG7SNqxnHD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '64738374', 'pedromartínez@yahoo.com', 'Administrador', 
        'pedro_martínez', 'Vq8Qra4jdGngePTKLfHimulhUVS6nB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '65950915', 'luislópez@yahoo.com', 'Director', 
        'luis_lópez', 'XO8lkWAbttIcDxqFKzBKEuM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '75978638', 'luisflores@hotmail.com', 'Director', 
        'luis_flores', 'zypLivTtRR1BWHLuQBmj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '63302485', 'carmenlópez@hotmail.com', 'Administrador', 
        'carmen_lópez', 'rwguEquYBKTG8niMa0gw7DeB3RW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '63839631', 'juansánchez@yahoo.com', 'Director', 
        'juan_sánchez', '73luVzalO95Hd5jLiVlkO9yFzCd9b');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '65275021', 'juanrodríguez@yahoo.com', 'Administrador', 
        'juan_rodríguez', 'pKgnuIlyn6FPMMhlpGYtvvfaV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '68853963', 'luismartínez@gmail.com', 'Director', 
        'luis_martínez', 'D0Voa6711Xkye9sWzFiL0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '76638480', 'maríarodríguez@hotmail.com', 'Director', 
        'maría_rodríguez', 'g5AGJqiIe5rycO2VI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '64790052', 'carlosramírez@hotmail.com', 'Director', 
        'carlos_ramírez', '2KrghAzEL9uI67IQWnItCPTo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '68703697', 'sofíamartínez@hotmail.com', 'Administrador', 
        'sofía_martínez', 'AAeb408VNdwae');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '68028383', 'juanflores@gmail.com', 'Administrador', 
        'juan_flores', 'y7Mmkh4zvUCgH7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '71945303', 'carmengonzález@hotmail.com', 'Administrador', 
        'carmen_gonzález', 'O8MZWoZ5Jw7Z1IiYY5WUPBKXmx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '69267802', 'carmenflores@yahoo.com', 'Administrador', 
        'carmen_flores', '8129ALXR1IRjR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '63664403', 'lauraflores@gmail.com', 'Director', 
        'laura_flores', '8YTjjXZrU6p9MuPrkZWi4O1R7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '71098904', 'jorgeflores@gmail.com', 'Administrador', 
        'jorge_flores', 'RvEBlpp12DKDM9jyDNI1M');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '78163531', 'sofíaramírez@hotmail.com', 'Director', 
        'sofía_ramírez', 'JARtrbKiovGVHKf3tWFhjr0b');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '72051651', 'juanflores@yahoo.com', 'Administrador', 
        'juan_flores', 'Yxjr8HS9a3t0LRskLhR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '69451059', 'pedrogonzález@hotmail.com', 'Director', 
        'pedro_gonzález', '4cunwiH4AwQth');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '77116136', 'laurasánchez@hotmail.com', 'Administrador', 
        'laura_sánchez', 'tAkYI19w6t0AdmZldE1mCYBi2nw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '75187576', 'maríasánchez@gmail.com', 'Administrador', 
        'maría_sánchez', 'jqjWJqKpKgRFHy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '65550270', 'jorgegonzález@yahoo.com', 'Director', 
        'jorge_gonzález', 'GdV8nIvXjULPoSzDE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '74422113', 'luispérez@yahoo.com', 'Director', 
        'luis_pérez', 'rrADtox6WhE1tgJQO3V2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '65060942', 'anaramírez@yahoo.com', 'Administrador', 
        'ana_ramírez', 'O5coSGZiGxBcizsh6eIRTwKxyg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '72843812', 'carloslópez@yahoo.com', 'Director', 
        'carlos_lópez', 'cZqAdcAl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '73891532', 'luispérez@gmail.com', 'Director', 
        'luis_pérez', 'nS92SXHlQ7NbCd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '77262363', 'analópez@hotmail.com', 'Administrador', 
        'ana_lópez', 'G3i1tSphOVb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '60365168', 'pedrosánchez@hotmail.com', 'Administrador', 
        'pedro_sánchez', 'DUpZNInd7wXB1dF4F4FLFhVj52');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '71970682', 'jorgeflores@hotmail.com', 'Director', 
        'jorge_flores', 'B5uWXnaSTIzMSyObp4tGetaTZ4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '71701328', 'sofíagonzález@hotmail.com', 'Director', 
        'sofía_gonzález', 'a5ds7kcAMlAQ1szA71D1z7kIfa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '78127928', 'carmensánchez@hotmail.com', 'Administrador', 
        'carmen_sánchez', 'H5mtJZIsg69zxjKj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '70846637', 'luismartínez@yahoo.com', 'Administrador', 
        'luis_martínez', 'lldDFqaLYYI1J49IcKzOcZyI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '77010776', 'laurarodríguez@gmail.com', 'Director', 
        'laura_rodríguez', 'yPM7jdWUZ6D');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '62129106', 'laurasánchez@hotmail.com', 'Administrador', 
        'laura_sánchez', 'fwAkkdIvkLONuXtaZeS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '65577236', 'laurarodríguez@gmail.com', 'Director', 
        'laura_rodríguez', 'UhNmndXS90ejPY1bOYcxLQW3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '79920116', 'sofíaflores@yahoo.com', 'Director', 
        'sofía_flores', '71Jf4DRUXBXvHu65Jwcjrr3cwgb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '60137401', 'jorgemartínez@hotmail.com', 'Director', 
        'jorge_martínez', 'qICdtEKGlgt5ncuCSlfMOLvC2FvTy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '67006935', 'pedropérez@yahoo.com', 'Director', 
        'pedro_pérez', 'h5mIklFihSZ1Js4pS6CJi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '60248828', 'sofíamartínez@yahoo.com', 'Director', 
        'sofía_martínez', 'neSSbFWYbP8tHdP50gzlZu3P');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '71203183', 'juanflores@yahoo.com', 'Director', 
        'juan_flores', 'jXtb6WiczFtq33ScEWk5riO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '68794141', 'lauralópez@gmail.com', 'Director', 
        'laura_lópez', '9vJt3yHYDmaAS5C');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '72589874', 'carmengonzález@hotmail.com', 'Administrador', 
        'carmen_gonzález', '9PRavyYm9SlTVcWVIKIw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '72379879', 'jorgelópez@yahoo.com', 'Administrador', 
        'jorge_lópez', 'l8IyF468LNv2vJb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '77662269', 'sofíamartínez@hotmail.com', 'Administrador', 
        'sofía_martínez', '7E7yVpsqKT5hLAubFBqnoXGCMIaXDB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Ramírez', '71545246', 'maríaramírez@hotmail.com', 'Director', 
        'maría_ramírez', 'PviSfhUotGonyF1Ki');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '61796917', 'luisgonzález@yahoo.com', 'Administrador', 
        'luis_gonzález', 'fjRTW2PjlP56WN83KiM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '64147708', 'maríapérez@yahoo.com', 'Administrador', 
        'maría_pérez', 'mn2zEgQcKwo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '70696058', 'jorgesánchez@yahoo.com', 'Administrador', 
        'jorge_sánchez', '1sl1xWRUJlYRkeEG0gi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '64217649', 'lauragonzález@hotmail.com', 'Director', 
        'laura_gonzález', 'mEnwvwbQ58DxhXPSQ5xC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Rodríguez', '67743294', 'carmenrodríguez@hotmail.com', 'Director', 
        'carmen_rodríguez', 'HHmJCvcgJMWOwn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '60174038', 'anaflores@hotmail.com', 'Director', 
        'ana_flores', 'iDo4kA6OEDx2dVR2jMpQy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '64418034', 'anaflores@hotmail.com', 'Director', 
        'ana_flores', 'f5FupnLKx8imiK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '69957238', 'sofíagonzález@gmail.com', 'Administrador', 
        'sofía_gonzález', 'oU5OvCbB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '79318801', 'sofíarodríguez@hotmail.com', 'Administrador', 
        'sofía_rodríguez', 'ASzLMUZICUM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '67539219', 'sofíamartínez@hotmail.com', 'Director', 
        'sofía_martínez', 'XbE1NM0Vmx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '74905315', 'analópez@hotmail.com', 'Administrador', 
        'ana_lópez', 'A2WHq0brHEhlLPy7qeo4lULTInzsP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '73902256', 'carmensánchez@hotmail.com', 'Director', 
        'carmen_sánchez', 'UAKMOUBI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '69125680', 'maríarodríguez@gmail.com', 'Administrador', 
        'maría_rodríguez', '7Owu5i416zltGmRjbTexvt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '75834117', 'luislópez@yahoo.com', 'Administrador', 
        'luis_lópez', 'hfNrQcVhIXOG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '64167250', 'pedrolópez@yahoo.com', 'Administrador', 
        'pedro_lópez', 'qnD8MfnKDvV2z');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '67631310', 'maríapérez@yahoo.com', 'Administrador', 
        'maría_pérez', '3tQdSQV4YzPL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '78330332', 'sofíalópez@gmail.com', 'Director', 
        'sofía_lópez', 'V1psneAmO89fkrwRlSl6bGWSyksj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '68127988', 'carlosgonzález@gmail.com', 'Director', 
        'carlos_gonzález', '70otTd0kO1Kv725WofbDZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '77312178', 'jorgesánchez@yahoo.com', 'Director', 
        'jorge_sánchez', 'Nb0mbN3hbp7Nqg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '67555638', 'juanrodríguez@yahoo.com', 'Director', 
        'juan_rodríguez', 'SFgkkadBLPQ9EvAcwKO0y2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '63153035', 'carlossánchez@gmail.com', 'Administrador', 
        'carlos_sánchez', 'tW0CTtKuEShYO70hZE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '68512098', 'pedrosánchez@yahoo.com', 'Director', 
        'pedro_sánchez', 'iaG19aNDv6MeL8anPPDKPdA4Zlq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '67832524', 'pedrosánchez@gmail.com', 'Administrador', 
        'pedro_sánchez', 'e4pUrgQp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '77220906', 'maríamartínez@hotmail.com', 'Director', 
        'maría_martínez', 'BhSWYhOdz5wvBsPUcxHt6qHQxy1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '70828907', 'lauramartínez@gmail.com', 'Administrador', 
        'laura_martínez', 'EnCvKOwlDMyos');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '60237995', 'laurasánchez@yahoo.com', 'Administrador', 
        'laura_sánchez', 'eMkIuprJn6sP6RfKkXyzkf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '77327431', 'laurapérez@yahoo.com', 'Director', 
        'laura_pérez', 'IHqZjjQP4cAw3z9ZuErs79U');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '75263217', 'sofíamartínez@yahoo.com', 'Administrador', 
        'sofía_martínez', 'KEgW7pQD8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '69797288', 'sofíagonzález@yahoo.com', 'Administrador', 
        'sofía_gonzález', 'Kzv0ltpmrAIFzgyN7ujwvLPaWIi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '66679199', 'laurasánchez@yahoo.com', 'Director', 
        'laura_sánchez', 'LTtYWzanYUnoS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '72211480', 'maríaflores@yahoo.com', 'Administrador', 
        'maría_flores', '1HklIVPF32sQgX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '75093492', 'sofíasánchez@hotmail.com', 'Administrador', 
        'sofía_sánchez', 'aVuze8yEY3REV7hD5uQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '70970420', 'carlosflores@gmail.com', 'Administrador', 
        'carlos_flores', 'PEXmThzp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '79268402', 'sofíaramírez@yahoo.com', 'Administrador', 
        'sofía_ramírez', 'ViQhVsqYx9Zy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '73578284', 'carmenflores@gmail.com', 'Director', 
        'carmen_flores', 'o1HBLWD4wEfrkrWEahxs8Xk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '60268511', 'anapérez@yahoo.com', 'Director', 
        'ana_pérez', 'Oioo1LBS0z8C3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '78291711', 'lauraflores@yahoo.com', 'Administrador', 
        'laura_flores', 'MUFRWZGL7hLx6SpzXWA7oxOnDP2wyc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '65185822', 'carlosmartínez@yahoo.com', 'Administrador', 
        'carlos_martínez', 'tjaf1JtBb4F0flTfUTUrpI34F1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '63297860', 'maríapérez@gmail.com', 'Director', 
        'maría_pérez', 'WZGfIfgjFq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '79428705', 'juanlópez@yahoo.com', 'Director', 
        'juan_lópez', '4HIHEfWG9frYZy9fbzL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '62211282', 'carmensánchez@hotmail.com', 'Director', 
        'carmen_sánchez', '6BqV0QGtu2C');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '65137298', 'carlospérez@hotmail.com', 'Director', 
        'carlos_pérez', 'KuV6LlvIYyyKfSOBmfpBkWyV91v');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '73420038', 'lauramartínez@yahoo.com', 'Director', 
        'laura_martínez', 'f638ZAUAoQyXr3A5AHvORROwa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '79658132', 'sofíagonzález@yahoo.com', 'Director', 
        'sofía_gonzález', 'rOGXk8R5wexn3XLN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '62183001', 'maríalópez@hotmail.com', 'Administrador', 
        'maría_lópez', 'myKRUC5RBFWAhf5AKfN42EglG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '77045954', 'jorgegonzález@yahoo.com', 'Administrador', 
        'jorge_gonzález', 'KFfXHXhC0byWJULQvV39Pd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '61603195', 'juanmartínez@gmail.com', 'Director', 
        'juan_martínez', 'Cb99Io4rX5DHyySASAKeuio05p');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '75434614', 'anarodríguez@hotmail.com', 'Administrador', 
        'ana_rodríguez', 'UDwPbHcSKBuWRWmPI9yl8QhG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '61567626', 'carlosmartínez@hotmail.com', 'Director', 
        'carlos_martínez', 'QzqKZM5zNSfKZmEtd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '78089515', 'carlosrodríguez@gmail.com', 'Administrador', 
        'carlos_rodríguez', '4gcAnc4E5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '60925871', 'luispérez@gmail.com', 'Director', 
        'luis_pérez', 'wBJORqmagMMGuAntYI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '67549445', 'lauraflores@yahoo.com', 'Director', 
        'laura_flores', 'HUNXBPBWKlJ9yUW5BrHiBO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '74735901', 'lauragonzález@hotmail.com', 'Director', 
        'laura_gonzález', 'rvVBdvlK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '67839369', 'maríasánchez@hotmail.com', 'Director', 
        'maría_sánchez', 'YxmaJ1rA5N7RJi5cvrn8z3Lp1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '73363813', 'maríapérez@yahoo.com', 'Director', 
        'maría_pérez', 'zbLqQd1Xe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '68728504', 'jorgeflores@hotmail.com', 'Director', 
        'jorge_flores', 'RkqLAyUqEogTxTX24HewII');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '77281166', 'pedropérez@gmail.com', 'Director', 
        'pedro_pérez', 'AgGrV1ZZ6eIWB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '63233170', 'carlosgonzález@hotmail.com', 'Director', 
        'carlos_gonzález', 'iiwM4LRc12YFUU56RqZSfEt0mh2MW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '70794529', 'pedrogonzález@gmail.com', 'Director', 
        'pedro_gonzález', 'svMGc4p5EkGfegotHA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '71866165', 'carlosmartínez@hotmail.com', 'Administrador', 
        'carlos_martínez', '2CAMTayc4mhsoa9bN2RnnRpQoRh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '60989930', 'jorgeramírez@gmail.com', 'Administrador', 
        'jorge_ramírez', '5ltzAcWoDL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '62782482', 'carlosgonzález@yahoo.com', 'Director', 
        'carlos_gonzález', 'ODAhpLtYpIStaXlaI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '66110955', 'jorgepérez@hotmail.com', 'Director', 
        'jorge_pérez', 'huyVGrnH6fOfD3LwQ29U');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '65575511', 'anaramírez@hotmail.com', 'Administrador', 
        'ana_ramírez', 'BS0Bu14xjFlF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '68066794', 'lauraflores@hotmail.com', 'Administrador', 
        'laura_flores', '6RtdQc8lrZqc8jW4JlLrY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '78261396', 'analópez@hotmail.com', 'Director', 
        'ana_lópez', 'xP3IMkNzmU9xN4Aj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '64681726', 'juanmartínez@hotmail.com', 'Director', 
        'juan_martínez', 'ACbMhpuHTTfQVhilNSia6LGk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '72486390', 'anaflores@yahoo.com', 'Administrador', 
        'ana_flores', 'S7uAEhSXM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '66654140', 'carmenmartínez@yahoo.com', 'Administrador', 
        'carmen_martínez', 'KvgK7XEJxuy9YreCf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '68798664', 'sofíasánchez@yahoo.com', 'Director', 
        'sofía_sánchez', 'ft2innGklPozdIAh28AeqJs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '69782972', 'anagonzález@gmail.com', 'Administrador', 
        'ana_gonzález', 'N9k5gzBrzv2Dciw8S9SJLu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '71517008', 'juanrodríguez@gmail.com', 'Administrador', 
        'juan_rodríguez', 'hE8W3SzW0Dbxve9X2uQnpXF8COxU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '63646789', 'luisramírez@yahoo.com', 'Administrador', 
        'luis_ramírez', 'bSWrq7bKfpd1PKcX17N1WIqo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '78915944', 'anarodríguez@gmail.com', 'Director', 
        'ana_rodríguez', '4bmZWUWjvSbomoKS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '64580714', 'sofíarodríguez@yahoo.com', 'Administrador', 
        'sofía_rodríguez', 'LClCLDhMNLj3LhEfGd2K9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '62465182', 'carmenpérez@gmail.com', 'Director', 
        'carmen_pérez', 'XGZW7caEcJY20zCRZUR8Kh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '63190042', 'carlosmartínez@hotmail.com', 'Director', 
        'carlos_martínez', 'O9ymSRjYgkherPfSL35q');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '74571998', 'lauraflores@yahoo.com', 'Director', 
        'laura_flores', '5I0pwUCO4Iye');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '70125394', 'maríasánchez@hotmail.com', 'Director', 
        'maría_sánchez', 'EFOO2oOKX1W64rhPAv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '60603877', 'anamartínez@hotmail.com', 'Administrador', 
        'ana_martínez', 'HmoWDE2A85URJ47lEHAcattkYp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '68546287', 'carmenramírez@hotmail.com', 'Director', 
        'carmen_ramírez', 'M55bXZHljF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '65671354', 'juanramírez@hotmail.com', 'Director', 
        'juan_ramírez', 'DWiYSxf9PPFV1cfr2PTkpZD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '74325831', 'maríarodríguez@gmail.com', 'Director', 
        'maría_rodríguez', 'kTHe1QcG9OTf7pKS3xPH5FcHjHtdt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '79011699', 'carmenramírez@hotmail.com', 'Administrador', 
        'carmen_ramírez', 'gFrFfFJLAISvCMsfNjzg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '68549411', 'carlosrodríguez@gmail.com', 'Director', 
        'carlos_rodríguez', 'zTsdPVzUJVGmtY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '67221493', 'anamartínez@yahoo.com', 'Administrador', 
        'ana_martínez', 'F86wQeV0MsupupK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '69198410', 'jorgesánchez@yahoo.com', 'Director', 
        'jorge_sánchez', 'HcEgLVYl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '61173188', 'juanlópez@yahoo.com', 'Director', 
        'juan_lópez', 'SFmD8JljGb1lTv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '60399616', 'sofíaramírez@gmail.com', 'Director', 
        'sofía_ramírez', '6EmL779IbBruexHA9yvevn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '64768849', 'luisrodríguez@hotmail.com', 'Director', 
        'luis_rodríguez', 'exrutdKHcwZIwe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '68758286', 'sofíaflores@gmail.com', 'Director', 
        'sofía_flores', 'uWvwqSHcG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '70964423', 'anapérez@hotmail.com', 'Director', 
        'ana_pérez', 'UdKwLWVkIJb2jbCfc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '79066768', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', 'bXHcwmVS7M');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '68244465', 'laurarodríguez@gmail.com', 'Administrador', 
        'laura_rodríguez', 'J6XDXluD5e5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '70728746', 'lauralópez@gmail.com', 'Administrador', 
        'laura_lópez', 'G2bUhbawi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '66262319', 'pedrosánchez@gmail.com', 'Director', 
        'pedro_sánchez', 'm4fFxEhVdbzHFLN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '60652245', 'luissánchez@hotmail.com', 'Director', 
        'luis_sánchez', 'zsqFGVbkod6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '77885816', 'pedroramírez@gmail.com', 'Director', 
        'pedro_ramírez', 'tytA40AD2yxK5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '65056160', 'juansánchez@gmail.com', 'Director', 
        'juan_sánchez', 'UUaszCq9UQYeUVBF3JllsIIXkn7S21');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '67863253', 'pedrogonzález@hotmail.com', 'Administrador', 
        'pedro_gonzález', 'e1Je29W6NooXraT7ephRW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '79401533', 'anaramírez@gmail.com', 'Director', 
        'ana_ramírez', 'rBOpgTJPuw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '63128806', 'sofíasánchez@yahoo.com', 'Administrador', 
        'sofía_sánchez', 'rSk5uNFpIEEOi6eJnwcH6kUoI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '63735722', 'carmenmartínez@gmail.com', 'Director', 
        'carmen_martínez', 'gSW4WRJVNhqwv2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '69204532', 'pedroflores@gmail.com', 'Director', 
        'pedro_flores', 'wtASNycybcB7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '61914640', 'pedrolópez@yahoo.com', 'Director', 
        'pedro_lópez', '8yiKFkz6P4xDTBPcyNFp0G5fmXPHat');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '69299368', 'maríapérez@yahoo.com', 'Director', 
        'maría_pérez', '09cSt9AOCMvcgeDzEmIeqsq4jnTSjm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '67471318', 'juanpérez@hotmail.com', 'Administrador', 
        'juan_pérez', 'tnGk2d3lITC02hcLqe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '65319314', 'analópez@hotmail.com', 'Administrador', 
        'ana_lópez', 'kgjCX4DiZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '65038690', 'pedrogonzález@yahoo.com', 'Director', 
        'pedro_gonzález', '5MeQwiYg45cBIJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '62707718', 'sofíarodríguez@hotmail.com', 'Administrador', 
        'sofía_rodríguez', 'JoHwMAEjluQB9EuTleC62AW1zf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '69087041', 'carlosmartínez@gmail.com', 'Director', 
        'carlos_martínez', 'lQwBtWtNguKnUwLj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '79861865', 'luissánchez@yahoo.com', 'Administrador', 
        'luis_sánchez', 'MnzuqdSaWz19uCnGCu6rlZoKR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '71778943', 'luispérez@hotmail.com', 'Administrador', 
        'luis_pérez', '5B3cyyh984MY5OXBUU5K');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '77424404', 'sofíaramírez@yahoo.com', 'Administrador', 
        'sofía_ramírez', 'Lwt8CxgxOEKLn01Fl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '68495146', 'luisramírez@hotmail.com', 'Administrador', 
        'luis_ramírez', 'w7J8RrKlMLIe7sjOB8xfEdvZZCvC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '78117242', 'pedroramírez@gmail.com', 'Administrador', 
        'pedro_ramírez', 'cnVu0d3BftjZ8tNu6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '61226612', 'anarodríguez@hotmail.com', 'Administrador', 
        'ana_rodríguez', 'ScRby8HbkPAaYnml48bKnP1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '60569490', 'juanflores@hotmail.com', 'Administrador', 
        'juan_flores', '5zcNhi2eg5VmvMCIZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '63377043', 'carmenpérez@yahoo.com', 'Administrador', 
        'carmen_pérez', 'TB5ahlexlP27iO4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '68433745', 'maríapérez@yahoo.com', 'Director', 
        'maría_pérez', 'da4ZtIRT4i8X7pXkf5a');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '67710599', 'juanlópez@yahoo.com', 'Director', 
        'juan_lópez', 'W2ES4Vx4mZF2PVhFlNGALeLt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '74787576', 'carmengonzález@hotmail.com', 'Administrador', 
        'carmen_gonzález', 'pxHjsLZAw7S3hh0kx4b1xFinuT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '79941990', 'jorgepérez@yahoo.com', 'Director', 
        'jorge_pérez', 'M8bVWD6zQNYNXJL568Et5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '68295016', 'lauramartínez@yahoo.com', 'Administrador', 
        'laura_martínez', 'TSS4EdWc5iAigGhbKG5QvND23');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '62971879', 'juanrodríguez@yahoo.com', 'Director', 
        'juan_rodríguez', 'PRKS7Mw8NkObSahT1cxIEANpy1pT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '62037334', 'laurapérez@yahoo.com', 'Administrador', 
        'laura_pérez', 'QXC5otoNcasDTEqXE3qbChTrInHzUz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '79424293', 'carmengonzález@yahoo.com', 'Administrador', 
        'carmen_gonzález', 'Lao3SWu2fCXY3VgvXrxGhY0cm08EM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '61427151', 'juanrodríguez@hotmail.com', 'Director', 
        'juan_rodríguez', 'MAdbyx7WwpNsU0c8fvu60');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '61202280', 'anagonzález@yahoo.com', 'Director', 
        'ana_gonzález', 'SfrkuKTxV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '66578100', 'carlosrodríguez@gmail.com', 'Administrador', 
        'carlos_rodríguez', 'I0A00u4i5GqIU1wGDz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '73103001', 'carmenlópez@hotmail.com', 'Director', 
        'carmen_lópez', '37I3CNVmKfq6yvs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '62368617', 'juanflores@hotmail.com', 'Director', 
        'juan_flores', 'jw5oxSNU8vo8JeT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '72181540', 'sofíagonzález@yahoo.com', 'Administrador', 
        'sofía_gonzález', 'iVYy4GzuAS6BvJPtIGoJFznSFplCg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '77424896', 'juanmartínez@yahoo.com', 'Director', 
        'juan_martínez', 'YyXDOrHQAetwlr5WAoV2s5qrf1Hhn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '68557984', 'sofíasánchez@gmail.com', 'Administrador', 
        'sofía_sánchez', 'MAdVTkEBQBEdxYJl3lZSeBkfm1ATn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '77754669', 'pedromartínez@yahoo.com', 'Director', 
        'pedro_martínez', 'Q0l7V8AngC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '60009172', 'maríarodríguez@gmail.com', 'Director', 
        'maría_rodríguez', 'AA7959JlEY7MR1VI9D2WoGg9Xia');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '77155911', 'sofíaramírez@gmail.com', 'Administrador', 
        'sofía_ramírez', 'V67E0qH24khgAp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '74721793', 'lauraflores@gmail.com', 'Administrador', 
        'laura_flores', 'xp6tsS4M8rdoDs23B');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '71096389', 'lauramartínez@gmail.com', 'Administrador', 
        'laura_martínez', 'jCQksrYCGfpYo9HP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '67006084', 'pedrolópez@gmail.com', 'Director', 
        'pedro_lópez', 'KObWoVDuVHPEagofs4W1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '61116068', 'laurasánchez@gmail.com', 'Director', 
        'laura_sánchez', 'ADFvZya68iduy4I');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '73166818', 'carmenlópez@hotmail.com', 'Director', 
        'carmen_lópez', '41WzwzL9cuFvu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '64060990', 'anasánchez@yahoo.com', 'Director', 
        'ana_sánchez', 'Pd7rRmSoZFxxGm8EYE70dm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '78866197', 'carmensánchez@yahoo.com', 'Administrador', 
        'carmen_sánchez', '8Z6ADXzNViq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '69270861', 'sofíalópez@gmail.com', 'Administrador', 
        'sofía_lópez', 'imyh7zMg4vVrfT3RleIhp3EOdHaZJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '77568446', 'anasánchez@gmail.com', 'Administrador', 
        'ana_sánchez', 'oroQGZcFZy8pNOzS9wUwSGkCxq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '77808446', 'carmengonzález@gmail.com', 'Director', 
        'carmen_gonzález', '1KGaJPGzmdYbYd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '73414539', 'luislópez@hotmail.com', 'Director', 
        'luis_lópez', '0UlAIIkgS8UEBDIt3MxYAB8oE3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '73951593', 'juansánchez@gmail.com', 'Director', 
        'juan_sánchez', 'lutHkHJ1q');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '72035012', 'sofíagonzález@gmail.com', 'Director', 
        'sofía_gonzález', 'ymjkIpz5uVqu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '74542379', 'carmenpérez@yahoo.com', 'Administrador', 
        'carmen_pérez', '2giDE2X4t7nwHWGJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '66818163', 'carmenpérez@gmail.com', 'Director', 
        'carmen_pérez', 'XYfle1DPEdkoi7NUfX7yC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '62765238', 'laurasánchez@yahoo.com', 'Director', 
        'laura_sánchez', '1Ndp9lDSyo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '79380900', 'juanrodríguez@yahoo.com', 'Administrador', 
        'juan_rodríguez', 'jugcLrTS5PYao6whZkHX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '70196623', 'jorgegonzález@gmail.com', 'Administrador', 
        'jorge_gonzález', 'MI335IvgMfoVUmKnSkI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '72064415', 'lauralópez@hotmail.com', 'Director', 
        'laura_lópez', 'nzu7UMf1jjd3GpbLqIamj4un');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '71616826', 'laurasánchez@gmail.com', 'Administrador', 
        'laura_sánchez', 'Obk8VCnVPniuKyEZeqmx3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '79693404', 'pedrorodríguez@yahoo.com', 'Director', 
        'pedro_rodríguez', 'qojEaKdlac');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '66538250', 'luisrodríguez@hotmail.com', 'Administrador', 
        'luis_rodríguez', 'zqhyZFojIdZuwGi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '72221594', 'maríasánchez@yahoo.com', 'Administrador', 
        'maría_sánchez', 'OIA5tXaY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '63805358', 'maríamartínez@yahoo.com', 'Administrador', 
        'maría_martínez', 'MsZMAinnmqi1Qcr9bXhHELZONKyLV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '67453585', 'maríasánchez@yahoo.com', 'Director', 
        'maría_sánchez', 'OsQGIOmMundqBJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '70702855', 'anaflores@gmail.com', 'Administrador', 
        'ana_flores', '0dsT2o6Jw56ZHbg130b');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '62135840', 'luislópez@hotmail.com', 'Director', 
        'luis_lópez', '1ph8VPRmIokWWl2WxH9TV2b7gOeia');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '75823416', 'jorgerodríguez@yahoo.com', 'Administrador', 
        'jorge_rodríguez', 'n3sL9mn0whWs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '64598767', 'carmenmartínez@yahoo.com', 'Administrador', 
        'carmen_martínez', '74ht7zrLGVgk6L5pp4e');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '78402795', 'luissánchez@hotmail.com', 'Director', 
        'luis_sánchez', 'WLQOoTpZlqfYSgxw7Swo9b1BAS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '62898491', 'pedrolópez@yahoo.com', 'Administrador', 
        'pedro_lópez', 'yBCOPdP5B237P0WB5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '79938610', 'maríamartínez@gmail.com', 'Administrador', 
        'maría_martínez', 'HIIK0vYB1bqMl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '78947613', 'anaramírez@yahoo.com', 'Director', 
        'ana_ramírez', 'grzCTwX3oos3xrO9IT6yIyHYM4k');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '74241849', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', 'IGGnnlBhoZYk5xiksF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '72727150', 'jorgeramírez@yahoo.com', 'Director', 
        'jorge_ramírez', 'T0EIjojpddCQ0ROBXWxOYxRWHGU43W');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '69292031', 'lauragonzález@gmail.com', 'Administrador', 
        'laura_gonzález', 'Inde5GGtYR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '77567671', 'carloslópez@hotmail.com', 'Director', 
        'carlos_lópez', 'a80b9hId9LaE3T0ma');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '77450805', 'carmenpérez@hotmail.com', 'Director', 
        'carmen_pérez', 'h9YtEWribPvxvP0LTFH5vr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '73911701', 'luislópez@hotmail.com', 'Administrador', 
        'luis_lópez', '04WTVYTVILx48NDr5N49Ygw7d');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '66580295', 'carmensánchez@hotmail.com', 'Administrador', 
        'carmen_sánchez', 'qHEieOSxgkDzTxfDbtFC34vA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '79426252', 'juanrodríguez@yahoo.com', 'Administrador', 
        'juan_rodríguez', 'ulfkjyNLv8TKuOIfS82LPVhwC53');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '74348352', 'jorgesánchez@hotmail.com', 'Director', 
        'jorge_sánchez', '8Q8Rl5pbh5xLnFHh43Sl6TQ9Opu0N');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '63660000', 'carlosrodríguez@yahoo.com', 'Director', 
        'carlos_rodríguez', 'pN9gw92PJFYSamMa409AYFYN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Ramírez', '71928822', 'maríaramírez@yahoo.com', 'Administrador', 
        'maría_ramírez', 'pcAD2r13YsWWRvzfaRsZhRSJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '67463962', 'carmengonzález@gmail.com', 'Administrador', 
        'carmen_gonzález', '0SfDHGLL5iuyFbCzx6ZJHv5GCZl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '69075968', 'laurasánchez@yahoo.com', 'Administrador', 
        'laura_sánchez', '50rNVFoiGcsqHa24r68CTfEKd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '70892085', 'juanmartínez@hotmail.com', 'Administrador', 
        'juan_martínez', 'hmbdrkkgmUYUb46wVMQrEOza5CT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '66043164', 'juanflores@hotmail.com', 'Director', 
        'juan_flores', 'n23nTcWaf0S9F89IdIk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '63700983', 'luismartínez@hotmail.com', 'Director', 
        'luis_martínez', '7DkPCxosQBYUaALguaUG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '66959446', 'laurapérez@hotmail.com', 'Administrador', 
        'laura_pérez', 'ni5miSKlvB13BC50ZBy5Q9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '75089978', 'luissánchez@gmail.com', 'Director', 
        'luis_sánchez', '5L8qEtzsZtfHdcDlXjRjxgNJJrG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '72072036', 'carmenramírez@hotmail.com', 'Director', 
        'carmen_ramírez', 'nKBBsh3x36ZZsyOT9inXsJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '68860103', 'luisrodríguez@hotmail.com', 'Director', 
        'luis_rodríguez', 'QjoaBajdwjqUgRt6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '65216872', 'lauraflores@hotmail.com', 'Director', 
        'laura_flores', '4miNX8HQcSG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '73216190', 'sofíarodríguez@yahoo.com', 'Director', 
        'sofía_rodríguez', 'WwCPckiOfTF8WjL3Um');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '61370298', 'carmenlópez@gmail.com', 'Director', 
        'carmen_lópez', 'krz2JQsN77nJkPGTJPfz2w7z');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '64824512', 'juanrodríguez@yahoo.com', 'Administrador', 
        'juan_rodríguez', 'AxkFwjoCS4ORo0PsNklv3in2h');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '70904166', 'jorgerodríguez@hotmail.com', 'Administrador', 
        'jorge_rodríguez', 'kRY5z7U365zR3v60EJBBKJyj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '70395004', 'lauraflores@gmail.com', 'Director', 
        'laura_flores', 'k0hoGkjK7Im4jQJNrF1JXoKMt9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '64549795', 'jorgepérez@hotmail.com', 'Administrador', 
        'jorge_pérez', 'wAxjM64XktfSv8OcaTjkB5DGUqp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '70173179', 'luissánchez@gmail.com', 'Administrador', 
        'luis_sánchez', 'GQd3otDOIeRb3ZrHUG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '62564673', 'luisramírez@gmail.com', 'Director', 
        'luis_ramírez', 'rCYV5l8PuzNfgeo1lzNKc5t');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '70245315', 'luisrodríguez@yahoo.com', 'Director', 
        'luis_rodríguez', 'aMmenkj8pbs5YesnFh5En5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '71956466', 'luispérez@hotmail.com', 'Administrador', 
        'luis_pérez', 'TByeyM7LPuYQ4PdI4Vu1TPlgxpD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '70596328', 'juanpérez@hotmail.com', 'Administrador', 
        'juan_pérez', 'uyFUv40xFL2f7oGgwbYfK1rJ5ryL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '72108145', 'sofíamartínez@hotmail.com', 'Director', 
        'sofía_martínez', 'Pk3L6RV9vosPW3uEshvsZIx2E');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '72192234', 'pedropérez@gmail.com', 'Director', 
        'pedro_pérez', 'gkQEgoTSSQZtYLBdDoQ5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '72448650', 'luispérez@hotmail.com', 'Director', 
        'luis_pérez', 'xWlMdbuszx0WlPwgt62bRe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '70791040', 'carlospérez@gmail.com', 'Administrador', 
        'carlos_pérez', '9FtQKjQslvWHouvbSmWXi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '74306921', 'carlosrodríguez@hotmail.com', 'Director', 
        'carlos_rodríguez', 'yRxRPKx12fiXhnsOWh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '79208268', 'carlosrodríguez@yahoo.com', 'Director', 
        'carlos_rodríguez', 'zqIxoVcjp0m5ySi97');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '71809399', 'maríaflores@yahoo.com', 'Director', 
        'maría_flores', 'thtxogfjlD0zIz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '75310903', 'laurarodríguez@yahoo.com', 'Director', 
        'laura_rodríguez', 'ouXm0ey1eMLRQTkPhw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '73264438', 'lauraramírez@gmail.com', 'Director', 
        'laura_ramírez', 'IgeYwTF4adD1REOEOya');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '79915315', 'carlospérez@gmail.com', 'Administrador', 
        'carlos_pérez', 'zcnvXj8gTJ7Gb80l3B57fnj9LkUdu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '70717592', 'jorgemartínez@gmail.com', 'Administrador', 
        'jorge_martínez', 'OPTkDlkk5iG2KBDPqlw8YpAH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '63520195', 'carmenpérez@yahoo.com', 'Administrador', 
        'carmen_pérez', 'l14vggj5krvSsbjutNve');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '64066402', 'luisrodríguez@hotmail.com', 'Director', 
        'luis_rodríguez', 'dejfdz56dLtz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '69514216', 'maríalópez@gmail.com', 'Director', 
        'maría_lópez', 'EFQJaDfx57CsmbjL0JzmzC8bFv5g');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '74436591', 'maríarodríguez@yahoo.com', 'Director', 
        'maría_rodríguez', '6G5Q55jTd6tzkTyh0eFi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '76153571', 'maríaflores@hotmail.com', 'Administrador', 
        'maría_flores', '7F1KhOyD52ElQ7OXLCdrK6f');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '78819768', 'carmensánchez@hotmail.com', 'Director', 
        'carmen_sánchez', 'mlLCnEOlTmBOae3jweymsuFMqVV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '73113737', 'carloslópez@gmail.com', 'Director', 
        'carlos_lópez', 'RHXz0ZFC2hEmxIXdLCZmS1ur4gY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '70199628', 'juanpérez@yahoo.com', 'Administrador', 
        'juan_pérez', 'rABA7RU3HloyNih10VFew');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '64947300', 'sofíapérez@yahoo.com', 'Director', 
        'sofía_pérez', 'vwU1KfcfQuui94WmKmPNEEB9gcf7j');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '70570156', 'sofíamartínez@gmail.com', 'Administrador', 
        'sofía_martínez', 'odcpDJp3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '76778576', 'lauraramírez@gmail.com', 'Administrador', 
        'laura_ramírez', 'HTobOpqC71enVPG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '65020853', 'juanrodríguez@gmail.com', 'Director', 
        'juan_rodríguez', 'nJyXdl6O5f89o8ktSo9tNyrWh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '76437080', 'carlosramírez@yahoo.com', 'Director', 
        'carlos_ramírez', 'Ec7inPJ2ks4rX6NIZgaU8gCePJT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '72681037', 'lauraramírez@gmail.com', 'Director', 
        'laura_ramírez', 's21udMsVP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '73397223', 'lauraflores@yahoo.com', 'Administrador', 
        'laura_flores', 'OpPfEsM0Rjr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '79859866', 'sofíaramírez@hotmail.com', 'Director', 
        'sofía_ramírez', 'QdwFhTFxgrd9t');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '79737715', 'anapérez@hotmail.com', 'Administrador', 
        'ana_pérez', 'yBXLRilQa1YdmCWUqJz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '67937449', 'jorgerodríguez@gmail.com', 'Director', 
        'jorge_rodríguez', 'ZYkK57JQLl1JfQP2X2l9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '73868657', 'juanrodríguez@yahoo.com', 'Director', 
        'juan_rodríguez', 'a32tpO4DZFg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '79859417', 'luislópez@yahoo.com', 'Administrador', 
        'luis_lópez', 'BfinwOSPiHhBw4yC3am9LS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '66782675', 'maríapérez@gmail.com', 'Director', 
        'maría_pérez', 'vLELtO7bLYPOD9oWhMXiFxsdIJOK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '76383085', 'carlosflores@gmail.com', 'Director', 
        'carlos_flores', 'qoNGblHmIi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '75578293', 'juanmartínez@gmail.com', 'Administrador', 
        'juan_martínez', 'ihDwbEmY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '68222718', 'carloslópez@yahoo.com', 'Administrador', 
        'carlos_lópez', 'DLSPeFbpyzfb2yruQxw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '60768511', 'juanflores@hotmail.com', 'Director', 
        'juan_flores', 'MnqLtioXIy0r');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '68835512', 'carmenlópez@yahoo.com', 'Director', 
        'carmen_lópez', 'tmerqIVgjdoHa3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '79621672', 'juanmartínez@yahoo.com', 'Director', 
        'juan_martínez', 'kPsLopNqolp0oBdB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '74817401', 'carlosflores@yahoo.com', 'Administrador', 
        'carlos_flores', 'jg5biWqK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '64378993', 'luisgonzález@hotmail.com', 'Administrador', 
        'luis_gonzález', 'eExvgBke3VAB5SZXqN70mS8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '78002840', 'carlosflores@hotmail.com', 'Director', 
        'carlos_flores', 'QSsEltg4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '60405189', 'carmensánchez@gmail.com', 'Director', 
        'carmen_sánchez', '0nHeBvXYzsPJFclmMORUP5Ga9BtvhJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '70519842', 'maríasánchez@hotmail.com', 'Administrador', 
        'maría_sánchez', 'pE9mAHEd1rIFn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '79476776', 'juanpérez@yahoo.com', 'Director', 
        'juan_pérez', 'sW1TmKf4l0MdujTKWl1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '60508863', 'luisramírez@yahoo.com', 'Director', 
        'luis_ramírez', 'a0YujdPepu11bS2K5E');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '75603115', 'juangonzález@gmail.com', 'Director', 
        'juan_gonzález', '47uVJtdGygQmXglrAzd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '61226538', 'maríalópez@gmail.com', 'Director', 
        'maría_lópez', '2HKJMnvJUonPTvuINbVo5MFZZkv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '78333239', 'carmenpérez@gmail.com', 'Director', 
        'carmen_pérez', 'YoomnpUdMwpMWGJ18l84xftklAu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '63480585', 'jorgerodríguez@hotmail.com', 'Administrador', 
        'jorge_rodríguez', 'S37nfhS6CIUr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '60561582', 'luismartínez@gmail.com', 'Director', 
        'luis_martínez', '9cMwia6qX2RVuTIIjJT2C');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '78328078', 'lauraramírez@gmail.com', 'Director', 
        'laura_ramírez', 'RBmqol4N1hNJNH0y2u40Bu5sBsbC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '64463877', 'anaflores@gmail.com', 'Administrador', 
        'ana_flores', '7CN99bEJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '63002538', 'carmenramírez@gmail.com', 'Administrador', 
        'carmen_ramírez', 'JL2nx84OYKxzVla3uIPwNF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '63471720', 'juanmartínez@hotmail.com', 'Administrador', 
        'juan_martínez', 'HZcfRS2y3YMGfaVJQmrh1mslMJW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '68176773', 'maríapérez@hotmail.com', 'Administrador', 
        'maría_pérez', 'PR6BuTqMEZK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '72466649', 'laurapérez@yahoo.com', 'Administrador', 
        'laura_pérez', '7qd6iglmmXzD95AhUKfJC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '67491318', 'maríamartínez@hotmail.com', 'Director', 
        'maría_martínez', '56LhMVP47OAyQGi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '75690900', 'carlosmartínez@yahoo.com', 'Director', 
        'carlos_martínez', 'cncR1vZXRcme0gyeAatDzf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '63048226', 'luisgonzález@yahoo.com', 'Administrador', 
        'luis_gonzález', 'a7NxRX9rnQ3zqEujJf1HxLKQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '71001284', 'pedrolópez@hotmail.com', 'Director', 
        'pedro_lópez', 'nbgN0IBvSPzdsm3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '76333807', 'luisramírez@gmail.com', 'Director', 
        'luis_ramírez', 'VPpU9lOuOtrG0QcA3d46x');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '73114572', 'pedroflores@gmail.com', 'Director', 
        'pedro_flores', 'K1HdJdhuLirmIH5p');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '71280697', 'jorgegonzález@yahoo.com', 'Administrador', 
        'jorge_gonzález', 'ah4Mgmz19UgnmobnU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '62123619', 'carlosmartínez@hotmail.com', 'Director', 
        'carlos_martínez', 'RIwqWbsT8APCZS1EC8KABaOSuvNryC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '68041562', 'pedroramírez@hotmail.com', 'Director', 
        'pedro_ramírez', 'vplhT5JGj0NG0tBHLvCU1u');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '79744899', 'laurasánchez@yahoo.com', 'Administrador', 
        'laura_sánchez', 'oZldJV9kF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '70275023', 'pedromartínez@hotmail.com', 'Director', 
        'pedro_martínez', 'tH4EmfmkqGzta5r');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '65600306', 'carlosramírez@gmail.com', 'Administrador', 
        'carlos_ramírez', 'gnGFYgwwvISMUyg9KV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '69265526', 'carmenpérez@gmail.com', 'Director', 
        'carmen_pérez', 'z3s565uN0Yplk0yfhQ0dJV9ta');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '61342243', 'anapérez@yahoo.com', 'Director', 
        'ana_pérez', 'BkgsSZtgqdz2tK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '79281050', 'carlospérez@yahoo.com', 'Director', 
        'carlos_pérez', '0dWHy8yh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '71456989', 'analópez@yahoo.com', 'Administrador', 
        'ana_lópez', 'HHQfG5OTLAfm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '71706650', 'sofíasánchez@hotmail.com', 'Administrador', 
        'sofía_sánchez', 'xibrGbjnC8Rf0f20Z2nXkU6qNwu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '60384161', 'carmenlópez@hotmail.com', 'Administrador', 
        'carmen_lópez', 'GoY4Nw0KJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '71236139', 'maríasánchez@gmail.com', 'Administrador', 
        'maría_sánchez', 'Uab800UrqUiBeYmUNhJ3k');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '69040149', 'juanrodríguez@gmail.com', 'Administrador', 
        'juan_rodríguez', 'L90Quh1IeDtv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '68337795', 'lauramartínez@yahoo.com', 'Director', 
        'laura_martínez', '4IVJxBwccOsIhIkJW6F2qMONnG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '65979837', 'pedropérez@hotmail.com', 'Director', 
        'pedro_pérez', 'SfjxaIm5S');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '64874478', 'anaflores@gmail.com', 'Administrador', 
        'ana_flores', '46VTpA8BCacSI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '70919844', 'anamartínez@yahoo.com', 'Director', 
        'ana_martínez', 'giu2Mb6GbVt3hVueZmCY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María González', '72004194', 'maríagonzález@gmail.com', 'Administrador', 
        'maría_gonzález', 'mSH7UetBAGoD3ca');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '72899190', 'maríamartínez@hotmail.com', 'Director', 
        'maría_martínez', 'BaJLFSuYC8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '60892260', 'juansánchez@gmail.com', 'Administrador', 
        'juan_sánchez', '96tkVECV4gKTK0scQnMkE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '72653211', 'laurarodríguez@yahoo.com', 'Administrador', 
        'laura_rodríguez', 'oIjUCdsp8A');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '60335386', 'luisramírez@hotmail.com', 'Director', 
        'luis_ramírez', '03WsJdT2uMtWKxBK6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '65414542', 'carlospérez@hotmail.com', 'Director', 
        'carlos_pérez', 'T4shQxDa0H7oiCSzxJY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '78615785', 'carmenmartínez@yahoo.com', 'Administrador', 
        'carmen_martínez', 'gqh00CcAatFpcYWP2vvwtyGTb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '60565918', 'anamartínez@gmail.com', 'Director', 
        'ana_martínez', 'HtrKN0j1nVv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '75958164', 'luisgonzález@gmail.com', 'Administrador', 
        'luis_gonzález', 'h2u7HrsUXpPWnpthBft89D9PYyj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '60318215', 'anapérez@gmail.com', 'Administrador', 
        'ana_pérez', 'Oiusr2XSCYqtok');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '73771068', 'sofíarodríguez@gmail.com', 'Administrador', 
        'sofía_rodríguez', 'EapgXx06Gx04vYNppSL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '66156188', 'jorgemartínez@yahoo.com', 'Director', 
        'jorge_martínez', 'Mp7ryWIIqRDHMxRhv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '78833152', 'jorgeramírez@hotmail.com', 'Director', 
        'jorge_ramírez', '8jMg1gZufI48DkaV16wNSm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '74791575', 'luissánchez@gmail.com', 'Director', 
        'luis_sánchez', '1PfveZy4R0WTCgmQUbhN4kCszj0mS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '64546185', 'maríamartínez@yahoo.com', 'Administrador', 
        'maría_martínez', 'Pwjn1R3i9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '65684043', 'carmengonzález@yahoo.com', 'Director', 
        'carmen_gonzález', 'f0c3GXxo11HmgMWAPHv5E');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '64572973', 'carlossánchez@yahoo.com', 'Director', 
        'carlos_sánchez', 'Fa4b96G21daXspJCV7O');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '67267900', 'carmensánchez@yahoo.com', 'Administrador', 
        'carmen_sánchez', '0tDTZb1LXACRw9ySGzSGxHgPA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '65735565', 'pedroramírez@gmail.com', 'Administrador', 
        'pedro_ramírez', 'zUydSaQ2vfoVryA8qBPH0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '76538643', 'carmensánchez@hotmail.com', 'Director', 
        'carmen_sánchez', 'LhDdtZyF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '76319193', 'jorgelópez@yahoo.com', 'Administrador', 
        'jorge_lópez', 'GX4Z5y6zTSGQZl3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '61214346', 'anaflores@hotmail.com', 'Director', 
        'ana_flores', 'ertK3C2wUWJkJydlT8H06');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '78807480', 'sofíamartínez@gmail.com', 'Administrador', 
        'sofía_martínez', 'FzrZqGaJ9Cg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '61569943', 'pedromartínez@hotmail.com', 'Director', 
        'pedro_martínez', 'iDbpO1OhRkGj8elD80Uwu9rnrjWd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '69369506', 'juanramírez@gmail.com', 'Director', 
        'juan_ramírez', 'TvNA0Tj73YrtCxD6qowr9BsmtQWPj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '72636787', 'anagonzález@hotmail.com', 'Administrador', 
        'ana_gonzález', 'lgxir9Q4lZMrnGxSUGFvLcTmul');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '66631989', 'carlospérez@gmail.com', 'Director', 
        'carlos_pérez', 'qdtjWmAu4w');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '74247107', 'maríamartínez@yahoo.com', 'Director', 
        'maría_martínez', 'xjG60EtvjhJY15nBtuDixDb1r');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '65896797', 'anapérez@hotmail.com', 'Director', 
        'ana_pérez', 'vSfNMtSLIZf2SXCuwxT3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '78083627', 'laurasánchez@gmail.com', 'Administrador', 
        'laura_sánchez', 'eZGruWJcXmr8de7QgmKpeReqn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '68775742', 'sofíapérez@hotmail.com', 'Director', 
        'sofía_pérez', 'NmZv9t8bNXyWI5ItJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '67132605', 'luislópez@yahoo.com', 'Director', 
        'luis_lópez', 'zzgGmKzbwKhP8ugQJ9pGrsPJ2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '74987774', 'juanramírez@yahoo.com', 'Director', 
        'juan_ramírez', 'r59n4klSrz6nATpwQQXMTUq2tk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '70993231', 'carmenmartínez@gmail.com', 'Director', 
        'carmen_martínez', '2KoIU0fcZvvRzwO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '65472030', 'sofíasánchez@gmail.com', 'Administrador', 
        'sofía_sánchez', 'Le56eP7VoR6gvQALAEbASt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '78765873', 'carlosgonzález@yahoo.com', 'Administrador', 
        'carlos_gonzález', 'jad1IQgJD2FXFWz6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '63097906', 'sofíaflores@yahoo.com', 'Administrador', 
        'sofía_flores', 'PAOSgE9k8myiAx0p3eoIHcZiK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '78408524', 'juanflores@gmail.com', 'Administrador', 
        'juan_flores', 'wxrovrfeN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '76171043', 'luissánchez@yahoo.com', 'Director', 
        'luis_sánchez', 'LaPWCVaQMeG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '61391356', 'sofíaflores@gmail.com', 'Administrador', 
        'sofía_flores', '4fGmHYtUnHdi1l4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '68901977', 'maríamartínez@gmail.com', 'Director', 
        'maría_martínez', 'P6LUlO0mXHgljVLnx8YDZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '76227156', 'sofíalópez@gmail.com', 'Administrador', 
        'sofía_lópez', 'ALiLTngfeP66VIElXuzIqa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '68466552', 'anarodríguez@yahoo.com', 'Director', 
        'ana_rodríguez', 'TCXHi3bMKgSucWe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '71998205', 'sofíasánchez@gmail.com', 'Administrador', 
        'sofía_sánchez', '4oFr9D1PMY8VCuiWk85Zk0pz2p9rEe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '79343657', 'lauragonzález@hotmail.com', 'Administrador', 
        'laura_gonzález', 'dezgHD5YeNgQluI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '74602835', 'luisrodríguez@hotmail.com', 'Director', 
        'luis_rodríguez', 'JaofTeglTX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '72418738', 'pedrosánchez@yahoo.com', 'Director', 
        'pedro_sánchez', 'jw8vyTPO7inInVZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '67174604', 'pedrolópez@gmail.com', 'Director', 
        'pedro_lópez', 'JAGcbkXIxKC5ypYtZFdJaxa95yK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '64317421', 'carmenramírez@gmail.com', 'Administrador', 
        'carmen_ramírez', '48O8ASsrsp8m');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '62876919', 'jorgemartínez@hotmail.com', 'Director', 
        'jorge_martínez', '70Tul34DA1nm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '73940789', 'sofíalópez@gmail.com', 'Director', 
        'sofía_lópez', 'Wmrc0MrUQnY3Znab1gjGqaLFXD7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '73498205', 'sofíaramírez@yahoo.com', 'Administrador', 
        'sofía_ramírez', 'jngQpLg5k3JYAhUEmRZ9f7W2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '66190814', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', 'N5suIwwXAKm2ZTap3ink5iUi1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '74230182', 'carlosramírez@hotmail.com', 'Director', 
        'carlos_ramírez', 'Ccil5eQ4dwgY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '78421675', 'jorgeramírez@gmail.com', 'Director', 
        'jorge_ramírez', 'wj5ROeepUnWBvfEOb9KfC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '79759270', 'carmengonzález@yahoo.com', 'Director', 
        'carmen_gonzález', 'S4VQOgyCBvTDtuWQCFlv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '66328977', 'maríapérez@gmail.com', 'Administrador', 
        'maría_pérez', 'ig2wN3rfpBBWvXXF2GfI6V5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Ramírez', '75482322', 'maríaramírez@yahoo.com', 'Administrador', 
        'maría_ramírez', 'WOWuqVGQK14ntpzoMW7kZ1jvQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '60772017', 'pedrolópez@hotmail.com', 'Director', 
        'pedro_lópez', 'kL6DZuoRrP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '66849233', 'carmengonzález@gmail.com', 'Director', 
        'carmen_gonzález', 'tuSmXzOcx6uW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '77589681', 'carlospérez@hotmail.com', 'Administrador', 
        'carlos_pérez', 'SgXHbUL3QRlMxAgut8fLiKx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '69890455', 'luispérez@yahoo.com', 'Director', 
        'luis_pérez', 'YmNQPqucJsfJkMAFnO7z');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '75626719', 'lauramartínez@gmail.com', 'Director', 
        'laura_martínez', '1Vin8mQz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '71685370', 'jorgeramírez@yahoo.com', 'Administrador', 
        'jorge_ramírez', 'red8Hcj0LHwNQm5jFlkN0TWvcl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '69032264', 'pedromartínez@hotmail.com', 'Administrador', 
        'pedro_martínez', 'QtwtbHnKhYkHkZHvUSuaU3AhKjT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '77056198', 'maríamartínez@hotmail.com', 'Administrador', 
        'maría_martínez', 'QTrILwGbUAY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '67593325', 'lauraflores@gmail.com', 'Director', 
        'laura_flores', 'wKoOFoMPgNmueapSJt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '78936615', 'anapérez@yahoo.com', 'Administrador', 
        'ana_pérez', 'DtPPyFEfiIredIfGCLK27OZgxZS3SP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '62530852', 'luispérez@yahoo.com', 'Director', 
        'luis_pérez', 'SH7rrHU5idjz8lHKqgtJjAm72');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '79086761', 'carmenflores@hotmail.com', 'Director', 
        'carmen_flores', 'H2u0Cm0e7YGP0fVLN731lI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '66575020', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', 'XttJjU4o1KUSQX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '63798606', 'pedrosánchez@yahoo.com', 'Administrador', 
        'pedro_sánchez', 'RmNLWweLC2u');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '70527492', 'carlosgonzález@hotmail.com', 'Administrador', 
        'carlos_gonzález', 'c7AbcuUj402XnEPjU0h');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '77984720', 'juansánchez@yahoo.com', 'Director', 
        'juan_sánchez', 'ePLoaevnbdfkIvtRrAHL0EGZP');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '68570185', 'carmenlópez@yahoo.com', 'Administrador', 
        'carmen_lópez', 'fM17si3SUCHV7ag1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '74045922', 'carlosgonzález@hotmail.com', 'Administrador', 
        'carlos_gonzález', 'hLTaL8j99');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '69117606', 'laurasánchez@yahoo.com', 'Administrador', 
        'laura_sánchez', 'lHQa4gPmwfcXQ6v4LD1d');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '67105100', 'pedroramírez@yahoo.com', 'Administrador', 
        'pedro_ramírez', '97KS6eCzzhYv6i');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '74039857', 'pedrogonzález@gmail.com', 'Director', 
        'pedro_gonzález', 'NnIM8Pd6HuNIJi40PE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '71284866', 'carlossánchez@hotmail.com', 'Director', 
        'carlos_sánchez', 'dA4LuP0YllYPMEAmwOLHGF1ces');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '64723160', 'carlospérez@gmail.com', 'Administrador', 
        'carlos_pérez', 'woxd6ObuCny0rKlJrG2vkcvhtct');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '73025671', 'anaflores@yahoo.com', 'Director', 
        'ana_flores', 'qCWzFoEseDm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '61387524', 'pedrogonzález@yahoo.com', 'Administrador', 
        'pedro_gonzález', 'FTiO0W2r3uciJBzTdHjLnIT8kE3Dy6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '63736760', 'laurasánchez@hotmail.com', 'Director', 
        'laura_sánchez', 'abcU0Pxn3mpBeRRK62TokKMg1RmpR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '72985349', 'lauraflores@gmail.com', 'Administrador', 
        'laura_flores', 'dPyExOjuoKV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '65201067', 'analópez@gmail.com', 'Director', 
        'ana_lópez', 'td88qwWfqcrMxHXO8eGl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '64892048', 'lauralópez@yahoo.com', 'Director', 
        'laura_lópez', '7Z8rFcpgn1fuRwxyyUz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '71542401', 'luissánchez@hotmail.com', 'Director', 
        'luis_sánchez', 'szXdZx24oFeIbWHJ1H');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '68893030', 'juanmartínez@yahoo.com', 'Administrador', 
        'juan_martínez', 'zSET2c7EanTEKqJfMaPPHdJU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '74408791', 'carlossánchez@hotmail.com', 'Director', 
        'carlos_sánchez', 'MTPiPNUh1DJ4BdDUowVR5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '70394121', 'anagonzález@gmail.com', 'Administrador', 
        'ana_gonzález', 'pNU7EJ5gwrA96OmvHosT8DsTm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '67207889', 'pedrogonzález@yahoo.com', 'Administrador', 
        'pedro_gonzález', '7ah491lI2pzTDEjeRSoJ6BffdIUn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '71294705', 'juanrodríguez@hotmail.com', 'Administrador', 
        'juan_rodríguez', 'xZ3rDYg5ZRQ6SFw6k');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '73940887', 'jorgesánchez@gmail.com', 'Director', 
        'jorge_sánchez', 'havxAtcOJ7b5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '76428879', 'anarodríguez@hotmail.com', 'Administrador', 
        'ana_rodríguez', 'lWAxbXs2TYlaFAUNbhm8UE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '75621515', 'pedrogonzález@gmail.com', 'Director', 
        'pedro_gonzález', 'YNIS688dKdM6kpBJdeLkk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '78956138', 'carlossánchez@yahoo.com', 'Administrador', 
        'carlos_sánchez', 'dIPGCwoPmpy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '67497252', 'carlosramírez@gmail.com', 'Director', 
        'carlos_ramírez', 'LtF76SSeDMhrNPbB6Ipld7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '75597307', 'anarodríguez@gmail.com', 'Administrador', 
        'ana_rodríguez', '1KOJvPrL9sxqANi6ZajvyQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '64679280', 'pedromartínez@gmail.com', 'Administrador', 
        'pedro_martínez', 'Egdq5C5zYwPHEjdTd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '72460358', 'carmengonzález@hotmail.com', 'Administrador', 
        'carmen_gonzález', 'zbDmpX7p16tQ7iOW36wT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '70020765', 'luisrodríguez@gmail.com', 'Administrador', 
        'luis_rodríguez', 'hEg2UazITGd6gV7phY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '65495741', 'sofíaflores@yahoo.com', 'Administrador', 
        'sofía_flores', 'FpPez1dyfyZoYO5AZy9zF2x');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '70372394', 'lauraramírez@gmail.com', 'Director', 
        'laura_ramírez', 'fJP18ERaJ7FC05bhscUcauU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '75321722', 'pedromartínez@yahoo.com', 'Administrador', 
        'pedro_martínez', 'sPvFpcX6JbD6wtAve');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '71548425', 'carlosramírez@hotmail.com', 'Administrador', 
        'carlos_ramírez', 'lV2gGeMjyR2CMS6btzMgcVq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '72415262', 'lauraflores@gmail.com', 'Director', 
        'laura_flores', '0oVWs7aUU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '74271401', 'jorgepérez@gmail.com', 'Director', 
        'jorge_pérez', 'S2tB9tb6gPSawdXbCLWCd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '78683585', 'lauramartínez@yahoo.com', 'Director', 
        'laura_martínez', 'Kr0ameOGC6foNI5g5HACOkzLOGUxY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '62064291', 'maríamartínez@yahoo.com', 'Director', 
        'maría_martínez', 'ztb4yrR0KjbCexp8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '65943666', 'sofíapérez@gmail.com', 'Administrador', 
        'sofía_pérez', 'kSrDTgs9uMv7h');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '72079388', 'jorgesánchez@hotmail.com', 'Director', 
        'jorge_sánchez', 'unuRiSrOZe3E0ZHBkTgDW69');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '61208424', 'sofíasánchez@gmail.com', 'Director', 
        'sofía_sánchez', 'Xhg3SOMHMfiLsFo5N0B0D');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '71543817', 'juanlópez@gmail.com', 'Administrador', 
        'juan_lópez', 'QLRzKpw0D');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '66923654', 'luisflores@gmail.com', 'Director', 
        'luis_flores', 'FrBWM8mV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '61787026', 'carlosgonzález@hotmail.com', 'Administrador', 
        'carlos_gonzález', 'RHjKgjmHfA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '67552559', 'sofíapérez@hotmail.com', 'Director', 
        'sofía_pérez', 'EaGmmZQ93rkKd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '63391844', 'sofíaramírez@gmail.com', 'Administrador', 
        'sofía_ramírez', '8fIorgUVE4WEga26yVv6a7Yb7e7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '64462791', 'carmensánchez@hotmail.com', 'Administrador', 
        'carmen_sánchez', 'YcoJr5rLdG2uy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '71812702', 'sofíagonzález@hotmail.com', 'Director', 
        'sofía_gonzález', 'Dqqx7iSViYlxRuLpWmKMKvbXst');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '78462382', 'sofíaramírez@gmail.com', 'Administrador', 
        'sofía_ramírez', 'Xi45Pb74Kb9v2wU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '69635569', 'pedroflores@hotmail.com', 'Administrador', 
        'pedro_flores', 'hl3rgB0OBKwXvkM7MizI20K');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '60902078', 'maríasánchez@hotmail.com', 'Administrador', 
        'maría_sánchez', 'tsOWipfmjVu7eekvib9NAtn2mReo55');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '71269397', 'jorgelópez@gmail.com', 'Administrador', 
        'jorge_lópez', 'qxMsqBJiA01dSyAI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '79105010', 'luisramírez@hotmail.com', 'Director', 
        'luis_ramírez', '7QPPmSuUzzdxDdn9Gcgt3vwJuEn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '65462640', 'carlosrodríguez@yahoo.com', 'Administrador', 
        'carlos_rodríguez', 'OjtwJy8rhUt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '78405816', 'juanmartínez@gmail.com', 'Director', 
        'juan_martínez', 'MjFrdoQ74127Fy6TX9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '71602854', 'maríalópez@gmail.com', 'Director', 
        'maría_lópez', 'uPj076OAgi431Quno4QvYSgVXvsHZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '70355879', 'laurapérez@yahoo.com', 'Director', 
        'laura_pérez', '0ZBGnzawBkrF4vs2jb8FN7Jwq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '71514185', 'sofíaramírez@hotmail.com', 'Administrador', 
        'sofía_ramírez', 'IapIhS73bxpjX95MC22');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '62821968', 'lauragonzález@gmail.com', 'Director', 
        'laura_gonzález', 'O8lSABy3cZzP629');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '68918449', 'carlosmartínez@hotmail.com', 'Director', 
        'carlos_martínez', 'mqgUoAHn7lyPKtZ1Rx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '60863091', 'lauraramírez@gmail.com', 'Administrador', 
        'laura_ramírez', 'mroHx9ZOZK9GTu34r3eav3o0aWBM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '67594672', 'anaramírez@gmail.com', 'Director', 
        'ana_ramírez', 'IEpB3prWyEXymSfpDzHjf1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '75859931', 'jorgegonzález@yahoo.com', 'Administrador', 
        'jorge_gonzález', '6h7Ihtk6D7EVXxap7YNDyFJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '76328399', 'maríaflores@yahoo.com', 'Director', 
        'maría_flores', 'WbaexqIZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '72379650', 'sofíarodríguez@yahoo.com', 'Administrador', 
        'sofía_rodríguez', 'BSf6qw83');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos González', '74913833', 'carlosgonzález@yahoo.com', 'Administrador', 
        'carlos_gonzález', 'YhcyywGXG5K9EPBgu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '65447421', 'juanpérez@gmail.com', 'Administrador', 
        'juan_pérez', 'okBx3B45OlkX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '64018113', 'jorgegonzález@yahoo.com', 'Director', 
        'jorge_gonzález', 'QRxRWkFYT2uIW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '67804773', 'jorgerodríguez@yahoo.com', 'Administrador', 
        'jorge_rodríguez', 'k3aNH2G5lioya');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '66344536', 'maríarodríguez@yahoo.com', 'Administrador', 
        'maría_rodríguez', 'A59pCzYMpdFFGt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '71586093', 'carmenflores@hotmail.com', 'Administrador', 
        'carmen_flores', 'FmF6GfPNdCmZaVeFAq7K13iIiHr5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '78459406', 'anaramírez@hotmail.com', 'Administrador', 
        'ana_ramírez', 'DGFh7jCnSrlKLBx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '73173238', 'sofíamartínez@yahoo.com', 'Director', 
        'sofía_martínez', 'AsIqhL75McMTkJX1S');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '66341620', 'juanrodríguez@hotmail.com', 'Administrador', 
        'juan_rodríguez', 'HhDow8QdtJyeSaZmKQHoC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '67794984', 'luispérez@hotmail.com', 'Administrador', 
        'luis_pérez', 'HD3wffLPvof8rwf6Mc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '73041313', 'luispérez@yahoo.com', 'Director', 
        'luis_pérez', 'DptgIT72cFu3oDi3a2AIha3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '79159500', 'luislópez@gmail.com', 'Director', 
        'luis_lópez', 'IsWV6o0kGm8uNZOX0lSKQfM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '76234991', 'carmenflores@gmail.com', 'Director', 
        'carmen_flores', 'pzcqT8kei4JVUbLYO3K');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '77813928', 'lauramartínez@hotmail.com', 'Director', 
        'laura_martínez', 'Ir7n1hXQaDy8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '61880854', 'carmengonzález@gmail.com', 'Administrador', 
        'carmen_gonzález', 'C1dZTQdyBOvJLpy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '72782044', 'lauraramírez@yahoo.com', 'Director', 
        'laura_ramírez', '5LH2HCrVG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '61927055', 'carlosmartínez@yahoo.com', 'Administrador', 
        'carlos_martínez', 'h5DJ42HzDrT7K6jWapDVOh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '70467130', 'sofíarodríguez@yahoo.com', 'Director', 
        'sofía_rodríguez', '65tN0d6OOnvj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '74001522', 'jorgegonzález@gmail.com', 'Administrador', 
        'jorge_gonzález', 'sf4HanTIdQbfB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '61450742', 'luisramírez@hotmail.com', 'Administrador', 
        'luis_ramírez', 'GFjPdzFZYPg0kBOv1Th');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '63483533', 'jorgeflores@gmail.com', 'Administrador', 
        'jorge_flores', 'bH1vhR2205TH3mNW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '74852347', 'pedroramírez@yahoo.com', 'Administrador', 
        'pedro_ramírez', 'Rj9gdLQsJuhr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '64320816', 'carloslópez@yahoo.com', 'Director', 
        'carlos_lópez', 'lJUfbIiHUJ3tXuSrsPECupQk6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '68604877', 'pedrolópez@gmail.com', 'Administrador', 
        'pedro_lópez', 'jGZauej8lJctwwaNer7T2zRuhyN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '65338422', 'pedromartínez@hotmail.com', 'Director', 
        'pedro_martínez', 'nRzYUCzQdGh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '76605929', 'jorgegonzález@yahoo.com', 'Director', 
        'jorge_gonzález', 'gtBnxF1J');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '64280328', 'carlossánchez@yahoo.com', 'Administrador', 
        'carlos_sánchez', 'GddJqTgaiyxo6WHnQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '62410014', 'luisflores@hotmail.com', 'Director', 
        'luis_flores', 'Z5QzZeIWsZ8vQnHPYnsPheyaU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '66413299', 'sofíasánchez@yahoo.com', 'Administrador', 
        'sofía_sánchez', 'KmV0T27nplfo7U218');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '75925306', 'maríapérez@gmail.com', 'Director', 
        'maría_pérez', 'srJm7CvvaMRQ5UsaoKqxPc9F');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '77427985', 'sofíarodríguez@gmail.com', 'Administrador', 
        'sofía_rodríguez', '4Z7qLrns5NqNNqtTOi6pSk30rBv90t');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '77845982', 'carlossánchez@gmail.com', 'Administrador', 
        'carlos_sánchez', 'nW0d7QZnG3P');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '69256034', 'lauraramírez@hotmail.com', 'Director', 
        'laura_ramírez', 'ZRxC0lth');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '60825820', 'jorgemartínez@yahoo.com', 'Director', 
        'jorge_martínez', 'jJA1pgKAyO2mgT1Ddw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '73389301', 'jorgelópez@yahoo.com', 'Director', 
        'jorge_lópez', 'XddV0eQflLtzfOHH5soc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '70986768', 'carmengonzález@hotmail.com', 'Director', 
        'carmen_gonzález', 'QmM7oIijX3DwbDSCcSxvzwKHuqdoF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '69910852', 'anagonzález@gmail.com', 'Administrador', 
        'ana_gonzález', 'Tl7nXKwotRB2MyXvRAXUpYz8crI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '74892230', 'sofíagonzález@yahoo.com', 'Director', 
        'sofía_gonzález', 'KHWVHiR0gU1h56UKbpXo8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '78501058', 'maríarodríguez@yahoo.com', 'Director', 
        'maría_rodríguez', 'nCWJfAnOVlNnJW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '64208606', 'pedrosánchez@hotmail.com', 'Director', 
        'pedro_sánchez', 'GwoJYhijYdc1H3U8p2ztGesf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '64692858', 'anaflores@hotmail.com', 'Administrador', 
        'ana_flores', 'DXvUtQbUOomi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Rodríguez', '75036643', 'carmenrodríguez@gmail.com', 'Administrador', 
        'carmen_rodríguez', 'tRcRIaniPhpgA8G');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '71268698', 'pedroramírez@gmail.com', 'Director', 
        'pedro_ramírez', 'vjV2bmtPL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '78022485', 'jorgepérez@yahoo.com', 'Administrador', 
        'jorge_pérez', 'zXS0Yg0cTOCaMTrFt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '73281025', 'carmenmartínez@yahoo.com', 'Director', 
        'carmen_martínez', 'N9qrKqvX0AtA3Smi5J0YLhjsYx4y');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '71021577', 'carmenpérez@yahoo.com', 'Administrador', 
        'carmen_pérez', 'JPxy8N4S7oxsETuBKcf26nzXQjOi');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '79316787', 'lauraramírez@gmail.com', 'Administrador', 
        'laura_ramírez', 'RNfZJYkfwkekEKcUmgEDLbSTt8zw6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '67980256', 'luisflores@gmail.com', 'Administrador', 
        'luis_flores', 'UCuC1Y2xQPjq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '79390972', 'juanflores@hotmail.com', 'Director', 
        'juan_flores', 'cVl54oCASSLBUKhD8GGjIJqp9rHBTg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '62938965', 'carlosflores@hotmail.com', 'Administrador', 
        'carlos_flores', 'SXB6aZQ2K5AWCfjfFPHlBxcljnN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '60538946', 'sofíasánchez@gmail.com', 'Director', 
        'sofía_sánchez', 'oNkGysboohFqX8Mw8iLjqS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '70968252', 'pedroramírez@hotmail.com', 'Director', 
        'pedro_ramírez', '8ifLYwoVm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '69214985', 'sofíaramírez@hotmail.com', 'Administrador', 
        'sofía_ramírez', '4X6PCgOtVL9Mw4dPy2ET0GmiYR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '67134849', 'carlospérez@yahoo.com', 'Administrador', 
        'carlos_pérez', 'KHbyQpwtafrPYeUUf0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '60578910', 'carmenlópez@hotmail.com', 'Administrador', 
        'carmen_lópez', '7FERwQ8C3OhD0Mdz1xFNx7xm2iiS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '71606687', 'anasánchez@hotmail.com', 'Director', 
        'ana_sánchez', 'SYrT31bSbmeszTVjmlQYU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '72025070', 'pedrorodríguez@gmail.com', 'Director', 
        'pedro_rodríguez', 'e98Mv8IEMtj1Bt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '78598022', 'laurasánchez@hotmail.com', 'Director', 
        'laura_sánchez', 'm58QPFStKZx2smESb8OmcLFB2C');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '66430579', 'jorgerodríguez@hotmail.com', 'Administrador', 
        'jorge_rodríguez', 'ZTBAPrgkEdrHcOIK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '65896947', 'maríapérez@gmail.com', 'Director', 
        'maría_pérez', 'cDSEsaFaII');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '64541726', 'pedroflores@yahoo.com', 'Director', 
        'pedro_flores', 'oaZspMZ9Ym3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '76104307', 'juanramírez@hotmail.com', 'Administrador', 
        'juan_ramírez', '1q9DnSPmW4GTmmvLRnLYh1S2n');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '63197955', 'sofíalópez@hotmail.com', 'Director', 
        'sofía_lópez', '2JbgstaGhMwp8D08qHKAOvFw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '74941973', 'pedroflores@yahoo.com', 'Administrador', 
        'pedro_flores', 'Bsf3x8AwXe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '78332344', 'carmenpérez@yahoo.com', 'Director', 
        'carmen_pérez', '98cXVvkZZWgeTf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '62247557', 'pedrorodríguez@gmail.com', 'Director', 
        'pedro_rodríguez', 'iw15I3SRs6Y4X');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '69303147', 'sofíaflores@hotmail.com', 'Administrador', 
        'sofía_flores', 'xXit6PnOk2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '64213452', 'luisflores@yahoo.com', 'Administrador', 
        'luis_flores', 'N4Dh4oM1tlowJtt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '60996562', 'jorgesánchez@gmail.com', 'Administrador', 
        'jorge_sánchez', 'cYTZSWWsFoOW2HdYUi71wiVHhwThnO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '61361281', 'luisflores@hotmail.com', 'Director', 
        'luis_flores', 'FoM5GaGjGBuYul');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '77955472', 'anarodríguez@yahoo.com', 'Administrador', 
        'ana_rodríguez', 'IdDS7Tt9UUI2886cPOhaf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '78011264', 'carmenmartínez@gmail.com', 'Administrador', 
        'carmen_martínez', 'CcQp5WZoshFwV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Flores', '60241613', 'sofíaflores@hotmail.com', 'Administrador', 
        'sofía_flores', 'W4kELfH8g6y5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '76272119', 'jorgerodríguez@gmail.com', 'Director', 
        'jorge_rodríguez', 'K65amlKvc8OV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '78052119', 'luissánchez@gmail.com', 'Administrador', 
        'luis_sánchez', 'DUbUJRtPt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '75574199', 'carlosrodríguez@gmail.com', 'Administrador', 
        'carlos_rodríguez', 'dk5PBlSiHi534');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '76048656', 'juanlópez@yahoo.com', 'Director', 
        'juan_lópez', 'Ngy7KNUxko89Qqiz0KEL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '78865273', 'luisrodríguez@yahoo.com', 'Director', 
        'luis_rodríguez', 'Gsm5IlTkh8KfGe2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '70563710', 'jorgelópez@gmail.com', 'Director', 
        'jorge_lópez', 'Niw8WC7oAGB4YDv2hi3ihX9Ic4ru');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '61438707', 'jorgepérez@gmail.com', 'Administrador', 
        'jorge_pérez', '7a0zLcdqGIkhUVaQEfiI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '67777407', 'maríasánchez@yahoo.com', 'Director', 
        'maría_sánchez', 'PQrR9p1U7x');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '77794648', 'carmenflores@gmail.com', 'Director', 
        'carmen_flores', 'GbpSpGN36kN0569SauhXg09VNj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '63875255', 'carmenpérez@gmail.com', 'Director', 
        'carmen_pérez', 'o85mf6fhYml3U7Rvay7wrHt5JAM5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '77741621', 'carlosrodríguez@yahoo.com', 'Administrador', 
        'carlos_rodríguez', 'dNBAOGwSPCS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '76756664', 'lauragonzález@hotmail.com', 'Administrador', 
        'laura_gonzález', 'uLKY35Ck1EpOuOtcl7V7U');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '69069161', 'luismartínez@yahoo.com', 'Administrador', 
        'luis_martínez', 'ruLSzBQz6zoOKX2c3se7Ea');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '62164979', 'maríaflores@yahoo.com', 'Director', 
        'maría_flores', 'AowXdcimu6i1VnA8FVLY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '72334594', 'jorgerodríguez@hotmail.com', 'Director', 
        'jorge_rodríguez', 'JcJyIKQl7hm0nqzGRTBmyiKT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '77731902', 'carlosramírez@hotmail.com', 'Administrador', 
        'carlos_ramírez', '6Cd0JLSQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '64309426', 'carmengonzález@hotmail.com', 'Administrador', 
        'carmen_gonzález', 'Gjv7vEScOghvC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '76776771', 'sofíapérez@yahoo.com', 'Director', 
        'sofía_pérez', '4Udp5xS9JQ6b6eXS60glHk0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '72390004', 'pedropérez@yahoo.com', 'Director', 
        'pedro_pérez', 'b6Bw7amlJP5valBq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Rodríguez', '71997348', 'pedrorodríguez@yahoo.com', 'Director', 
        'pedro_rodríguez', 'ZcG09JwpN12Iixaj5rEOOoo4dh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '67074016', 'carlosflores@gmail.com', 'Administrador', 
        'carlos_flores', 'oK68LjPefLaDB01KNGrd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '72166086', 'luisgonzález@yahoo.com', 'Director', 
        'luis_gonzález', 'ZTDCW7WtXbiNVqk9iRM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '79825739', 'laurasánchez@hotmail.com', 'Administrador', 
        'laura_sánchez', 'njuJqaUpsJ1juH5z6OoPK0opad');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '63928683', 'carmenpérez@yahoo.com', 'Director', 
        'carmen_pérez', 'kp0s3rYQ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '70631087', 'pedromartínez@gmail.com', 'Administrador', 
        'pedro_martínez', 'fllezAsxdMaN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Rodríguez', '73705175', 'maríarodríguez@gmail.com', 'Director', 
        'maría_rodríguez', 'tRRmEilBSYjyjqXPw0YwIJHS6ssf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '67082742', 'anapérez@hotmail.com', 'Director', 
        'ana_pérez', 'V0oDVN9QTVaExAOQ4cNv1iRfg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '66452606', 'carmenramírez@gmail.com', 'Administrador', 
        'carmen_ramírez', 'mU2cxT0ltYaspAP0wYVVPPi3fv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '76944284', 'pedroflores@gmail.com', 'Administrador', 
        'pedro_flores', 'JIkwVn3yr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '62955713', 'pedroflores@gmail.com', 'Director', 
        'pedro_flores', 'NThszoXX8f');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Pérez', '74294283', 'laurapérez@hotmail.com', 'Administrador', 
        'laura_pérez', 'Zd3n6tysfHwJxRCu9xwUqlv1rSrB6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '79826353', 'jorgeflores@yahoo.com', 'Administrador', 
        'jorge_flores', 'Pnr1j9xvlF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '68077526', 'maríasánchez@hotmail.com', 'Director', 
        'maría_sánchez', 'lkgmSPRuYdlos');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María González', '70303002', 'maríagonzález@yahoo.com', 'Director', 
        'maría_gonzález', 'nYrWX5sww86TrPUmN0YD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '77242546', 'pedrosánchez@hotmail.com', 'Administrador', 
        'pedro_sánchez', 'IsSCtXKzGK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '72489221', 'luisramírez@gmail.com', 'Director', 
        'luis_ramírez', '1MxSzZvZEfNFIAAp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '60028602', 'carlossánchez@hotmail.com', 'Administrador', 
        'carlos_sánchez', 'lzPFSsolGW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '70569155', 'jorgesánchez@gmail.com', 'Administrador', 
        'jorge_sánchez', 'MsvVy9eGavs5kbNnrNlhLtIso8M');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '63963050', 'carmengonzález@gmail.com', 'Director', 
        'carmen_gonzález', 'V9DexaDJZg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '64275851', 'carmenmartínez@gmail.com', 'Director', 
        'carmen_martínez', 'DuGA72gVtV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '72656184', 'juanmartínez@gmail.com', 'Director', 
        'juan_martínez', '7r2GvxWilqqwz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '65768396', 'carmengonzález@gmail.com', 'Administrador', 
        'carmen_gonzález', 'ZsOv9nKBURgIfP5Zq5UmADxy5yNx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '73398524', 'sofíapérez@yahoo.com', 'Administrador', 
        'sofía_pérez', 'g361wa6hgCVchIVhn4Wow');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '76344415', 'anasánchez@hotmail.com', 'Director', 
        'ana_sánchez', 'hA1BTU7imidRst');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía González', '63992267', 'sofíagonzález@hotmail.com', 'Director', 
        'sofía_gonzález', 'ZPiQUK0Saiu2W10bvb2uQbNm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María González', '60000480', 'maríagonzález@hotmail.com', 'Director', 
        'maría_gonzález', 'VIqa3QRrdnJw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '69633211', 'jorgerodríguez@yahoo.com', 'Director', 
        'jorge_rodríguez', '8s3CGStd3xEh30');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '69670064', 'carmenmartínez@gmail.com', 'Director', 
        'carmen_martínez', 'ivqmcqHQQdikGq1xTpHj17HYMnp6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '67056614', 'carlosrodríguez@gmail.com', 'Director', 
        'carlos_rodríguez', 'nThvFBqJlN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '64984424', 'anasánchez@hotmail.com', 'Director', 
        'ana_sánchez', 'c60XniR6b86kw1IcBau6nHiiYPnbRc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía López', '74156594', 'sofíalópez@yahoo.com', 'Administrador', 
        'sofía_lópez', 'TjSbFQwL0gf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '66245437', 'anaflores@yahoo.com', 'Administrador', 
        'ana_flores', 'T1HqZ17UiIk');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '65905418', 'sofíarodríguez@gmail.com', 'Director', 
        'sofía_rodríguez', 'VSxiGqfFWaSDwZ7vZ5SmOprVr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '73484933', 'jorgemartínez@hotmail.com', 'Administrador', 
        'jorge_martínez', 'a9Ct2zN3ybqSDEfLIUg40UVo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '70020890', 'jorgeflores@yahoo.com', 'Administrador', 
        'jorge_flores', 'RCtzcN0C');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '76518952', 'juanlópez@hotmail.com', 'Administrador', 
        'juan_lópez', 'eYHxLcorLtciHP4hyZTLPFfO54');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '69467715', 'pedromartínez@yahoo.com', 'Administrador', 
        'pedro_martínez', 'CgKCfoyVT8yYlWRfMZn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '79872065', 'carmenlópez@gmail.com', 'Administrador', 
        'carmen_lópez', 'OZrub8hTMr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '62868807', 'anarodríguez@hotmail.com', 'Director', 
        'ana_rodríguez', 'MznalfpEJVD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Martínez', '77925922', 'carlosmartínez@yahoo.com', 'Administrador', 
        'carlos_martínez', 'pgba0hJKHF01vEuAFa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Ramírez', '78100812', 'maríaramírez@yahoo.com', 'Administrador', 
        'maría_ramírez', '9NFiEz4Wg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '72244303', 'jorgerodríguez@yahoo.com', 'Administrador', 
        'jorge_rodríguez', '2CAHZZrGrWVP6a1Q5bA8Per');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '69875273', 'maríalópez@yahoo.com', 'Director', 
        'maría_lópez', 'QXcUXaZgi2fElAj1w0cavpeea');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '70110512', 'carmenramírez@hotmail.com', 'Director', 
        'carmen_ramírez', 'rJ3HcrYcp5JhxnEoi579plqyZ2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '65483065', 'jorgerodríguez@gmail.com', 'Director', 
        'jorge_rodríguez', 'N54ueKV6IBCVIQqp9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '62240427', 'anaramírez@yahoo.com', 'Administrador', 
        'ana_ramírez', 'PZvI9PHSY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '72728098', 'carloslópez@gmail.com', 'Administrador', 
        'carlos_lópez', 'MtO6kODy46K');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '64313932', 'luisflores@hotmail.com', 'Administrador', 
        'luis_flores', '0wenhe0Hxab8EKBpv');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '60504728', 'carmensánchez@yahoo.com', 'Director', 
        'carmen_sánchez', 'ZswYQ7c8Z1uq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '67972959', 'pedropérez@yahoo.com', 'Administrador', 
        'pedro_pérez', 'gSGAPzmkc8iG7u79820P4y0jV0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '78424998', 'pedrosánchez@gmail.com', 'Administrador', 
        'pedro_sánchez', '45Sjfce7Y7yea0DboVSQmaqHrq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Flores', '74390295', 'pedroflores@gmail.com', 'Administrador', 
        'pedro_flores', 'AiBi3l8ehOuaDe6GMBB74NT1xfl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '60893805', 'lauralópez@gmail.com', 'Administrador', 
        'laura_lópez', 'oWKldqEJXoFMrv5JHCCMu1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '60575038', 'maríamartínez@gmail.com', 'Administrador', 
        'maría_martínez', 'p2KVmSgRzcMKkzSvE6KNi3ur');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '63815153', 'carlossánchez@yahoo.com', 'Administrador', 
        'carlos_sánchez', 'AmX8SQVKid2JwVhKU');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '69018638', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', '17HIQJU30psjk8r2T6c8gE2L0Etbf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '78007674', 'jorgeflores@hotmail.com', 'Administrador', 
        'jorge_flores', 'v28DkHpL5mlvYenDI9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '72850856', 'carlossánchez@gmail.com', 'Administrador', 
        'carlos_sánchez', 'qN8VTuDL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Pérez', '64702390', 'sofíapérez@hotmail.com', 'Administrador', 
        'sofía_pérez', 'rgelgvXjVDX1O4I');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '73610168', 'lauraramírez@yahoo.com', 'Director', 
        'laura_ramírez', 'DMnw7D8qZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '68015523', 'pedropérez@hotmail.com', 'Administrador', 
        'pedro_pérez', '34bm8tPyZIMoD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '64882451', 'lauragonzález@gmail.com', 'Administrador', 
        'laura_gonzález', 'qLww2007uVQJfJ1F6c4dC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Sánchez', '60933970', 'carmensánchez@hotmail.com', 'Administrador', 
        'carmen_sánchez', 'KkLZOuxYETscQUhWoGXkn5F');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '69973730', 'laurasánchez@gmail.com', 'Director', 
        'laura_sánchez', 'JIVUrdNCIZN7yKHTY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Pérez', '66934342', 'luispérez@gmail.com', 'Administrador', 
        'luis_pérez', 'uacU1mEKZure9fl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '69306210', 'luissánchez@hotmail.com', 'Director', 
        'luis_sánchez', 'u4n522GhRpbvs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '68922966', 'sofíamartínez@gmail.com', 'Administrador', 
        'sofía_martínez', 'orxzO9HgmKUFtsrp98c');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '60141883', 'maríamartínez@yahoo.com', 'Director', 
        'maría_martínez', 'iA4JP7QxgodSJASb42jceVkEiMUpq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '63609796', 'luisflores@hotmail.com', 'Director', 
        'luis_flores', 'VLVt56zgeg7qAniNjQmldfj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '61673825', 'anapérez@gmail.com', 'Administrador', 
        'ana_pérez', 'XjVyaUwPot');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '73763423', 'carlosrodríguez@gmail.com', 'Director', 
        'carlos_rodríguez', 'GvzdX3I95l30fR4MhVweNsOT9Edool');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María López', '79970991', 'maríalópez@gmail.com', 'Administrador', 
        'maría_lópez', 'CBjudSKPR6GE4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '63384339', 'sofíasánchez@gmail.com', 'Administrador', 
        'sofía_sánchez', 'Eul021dVSVf0TulEHgwTse5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '68064990', 'luisflores@gmail.com', 'Administrador', 
        'luis_flores', 'r47v9i4aydGNN9YVH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '63687132', 'anarodríguez@hotmail.com', 'Director', 
        'ana_rodríguez', 'iYTQ6XxmcmN035DMQFxC24lT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '77747955', 'laurasánchez@gmail.com', 'Administrador', 
        'laura_sánchez', 'wba5br0du');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Flores', '64963824', 'carmenflores@yahoo.com', 'Director', 
        'carmen_flores', 'gYpTWrWXYv6IQvQYcykJin6YeR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '69126399', 'pedrolópez@hotmail.com', 'Director', 
        'pedro_lópez', 'Rs6jWXFkE15ACD4xH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '79078768', 'laurarodríguez@yahoo.com', 'Director', 
        'laura_rodríguez', 'KzZtGNkyiMHOnrZIKghHTunbz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '63060342', 'juangonzález@gmail.com', 'Administrador', 
        'juan_gonzález', 'Vu2MQ7H6Ehhh6jIKBE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '77468710', 'pedrosánchez@yahoo.com', 'Director', 
        'pedro_sánchez', 'ufo6cAF8BomAXxC3ObaAsqavE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '72184183', 'maríaflores@yahoo.com', 'Director', 
        'maría_flores', 'ldr1wP4e63QzkH90djHzti');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '67443300', 'pedrogonzález@hotmail.com', 'Director', 
        'pedro_gonzález', '4Bu00Qwe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '62589511', 'lauraramírez@hotmail.com', 'Director', 
        'laura_ramírez', '3qPZ9Rc8');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '72251800', 'pedroramírez@hotmail.com', 'Director', 
        'pedro_ramírez', 'qKwh6XUIn9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '68343393', 'luisramírez@gmail.com', 'Director', 
        'luis_ramírez', 'mcULpfxOTuWR1sKO6znUOUT4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '64052701', 'carlospérez@yahoo.com', 'Director', 
        'carlos_pérez', 'lYkRjnBs9Q6NhwV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '66432683', 'luismartínez@hotmail.com', 'Director', 
        'luis_martínez', '2ybqTkaAoQH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '78332835', 'pedrosánchez@yahoo.com', 'Director', 
        'pedro_sánchez', 'mnLvMOrhrj7AcNP8zGCOIX');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '65889767', 'luisflores@hotmail.com', 'Administrador', 
        'luis_flores', '41NFi4sybsF4Isj7JwrMsSmo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '60136734', 'anaramírez@yahoo.com', 'Director', 
        'ana_ramírez', '4tI6ruJrNZ0YSJlE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '68596409', 'juanpérez@hotmail.com', 'Director', 
        'juan_pérez', 'E01haKvVjnJRgVaVQfjsPw2OsM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '70094933', 'anaflores@hotmail.com', 'Director', 
        'ana_flores', '7VWrB3SpFkoUCPYuToQi0tu5JmGfA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '71251380', 'carlossánchez@gmail.com', 'Administrador', 
        'carlos_sánchez', 'GaYZxLu5XXlvKjzrwA9cPkFMp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '64096091', 'carmenmartínez@hotmail.com', 'Director', 
        'carmen_martínez', 'mVkXRh2YcMEMsveoWBcCAh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '63736025', 'carmenramírez@yahoo.com', 'Director', 
        'carmen_ramírez', '2YaB7FmBe9Go8bt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '66411681', 'jorgepérez@gmail.com', 'Director', 
        'jorge_pérez', 'KlsQeeD8mEw64Vx6TIMPBXC9V3d');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '63379977', 'luisflores@yahoo.com', 'Director', 
        'luis_flores', 'LkCSgXg5FDwhAPp');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '71246832', 'jorgeramírez@yahoo.com', 'Director', 
        'jorge_ramírez', 'A07ljMtenYgOhwI');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '64313913', 'anaramírez@gmail.com', 'Director', 
        'ana_ramírez', 'Tjbr7IjobA26TYEE3TQin5my');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '68355826', 'anasánchez@hotmail.com', 'Administrador', 
        'ana_sánchez', 'dDUDXPH0GqzsggaCxozX6oW0cRia');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '73465553', 'anaflores@yahoo.com', 'Administrador', 
        'ana_flores', 'N5W3HCF2jPWLCyjk5RNVTcfhq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '71311374', 'anaramírez@gmail.com', 'Administrador', 
        'ana_ramírez', '8vUuTAn2VI0GmOjzIE4gcID1Or46');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '66130221', 'carmengonzález@hotmail.com', 'Director', 
        'carmen_gonzález', 'L2lFFB9q0qNDkP8wGcDq8jfK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '77019120', 'juanrodríguez@gmail.com', 'Administrador', 
        'juan_rodríguez', 'YwfBVcC37szMxg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Sánchez', '67064017', 'maríasánchez@hotmail.com', 'Director', 
        'maría_sánchez', 'WStLJ2t0WWwyqPhF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '61517804', 'sofíaramírez@gmail.com', 'Administrador', 
        'sofía_ramírez', 'HqZnOrSNmcBr7v27DEHQta6X');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '62059677', 'maríamartínez@gmail.com', 'Director', 
        'maría_martínez', '924fbGR70AzvOLlekyVqsy');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '60871544', 'pedrosánchez@gmail.com', 'Director', 
        'pedro_sánchez', 'aqqdToZ3LLMe5NK9ylyW1sjqBQc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '72549673', 'luisrodríguez@hotmail.com', 'Administrador', 
        'luis_rodríguez', 'tAAQzn1gA');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Martínez', '65307583', 'pedromartínez@yahoo.com', 'Director', 
        'pedro_martínez', 'YW8RUN65pZpN8k');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '63937887', 'sofíarodríguez@yahoo.com', 'Director', 
        'sofía_rodríguez', 'VWzmgURjeyuGFfcz05E9');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Ramírez', '67556177', 'lauraramírez@gmail.com', 'Director', 
        'laura_ramírez', 'B68vuZhE7AEDptvIUkOzbmkn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '65815808', 'juanrodríguez@yahoo.com', 'Director', 
        'juan_rodríguez', 'hhlhPuLq76JSdhi4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Rodríguez', '71804186', 'laurarodríguez@hotmail.com', 'Director', 
        'laura_rodríguez', 'W7ahBpGQgPWt89VEcJ6x3Ilw');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Ramírez', '62844821', 'sofíaramírez@gmail.com', 'Administrador', 
        'sofía_ramírez', 'g7SMPgICQDITdbYW8JY');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '69723282', 'carmenramírez@gmail.com', 'Administrador', 
        'carmen_ramírez', '3fUX2JLQpksKE0qubSe');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Sánchez', '79588773', 'juansánchez@hotmail.com', 'Director', 
        'juan_sánchez', 'D6sgZZPgrrbPOwcfr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge González', '69850181', 'jorgegonzález@hotmail.com', 'Administrador', 
        'jorge_gonzález', 'cZcaCEj7WL5vkOzfZRkGMl2wqhoLb');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '75952399', 'anamartínez@yahoo.com', 'Director', 
        'ana_martínez', 'xfQUAVERe6aceIb0pon5nv3VFDs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '64953767', 'luisflores@yahoo.com', 'Administrador', 
        'luis_flores', 'y8yCNiz8j1UTkpEMWS9JkDc');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Ramírez', '72299291', 'jorgeramírez@hotmail.com', 'Administrador', 
        'jorge_ramírez', 'h8v1eFF84g8vR');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '76906178', 'jorgeflores@hotmail.com', 'Administrador', 
        'jorge_flores', 'xk2V7blsDXt23w');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Flores', '77589975', 'juanflores@hotmail.com', 'Director', 
        'juan_flores', '39J9Otl5IOonEqgz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Sánchez', '79771101', 'luissánchez@yahoo.com', 'Administrador', 
        'luis_sánchez', 'ft6tfsUPix6MmATqxUYXgGoUdn6ak5');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '65254550', 'luislópez@gmail.com', 'Administrador', 
        'luis_lópez', 'ZpGPkKj0');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro López', '78481314', 'pedrolópez@gmail.com', 'Administrador', 
        'pedro_lópez', 'x2LB4bUEFnKkEK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Pérez', '60422648', 'carmenpérez@gmail.com', 'Director', 
        'carmen_pérez', '0sZrDrnPkYJ9LenYVbq');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '65796451', 'lauramartínez@gmail.com', 'Director', 
        'laura_martínez', 'CczPCkqog06AgH53Qg23T');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '68642851', 'juanpérez@hotmail.com', 'Administrador', 
        'juan_pérez', '6ye0WH9ys');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '74575055', 'juanrodríguez@yahoo.com', 'Administrador', 
        'juan_rodríguez', '70Jj7JR0rXLn5rlQl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Sánchez', '78030258', 'jorgesánchez@hotmail.com', 'Director', 
        'jorge_sánchez', 'kSeTFCZJcpvu5SObhghzt');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '73244677', 'juanmartínez@gmail.com', 'Director', 
        'juan_martínez', 'xdQysDdd6wz3Gt8ziCsKyBajG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Ramírez', '68606883', 'carlosramírez@gmail.com', 'Administrador', 
        'carlos_ramírez', 'p0M3T7EvtBVk8P2');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '65854537', 'anaramírez@hotmail.com', 'Administrador', 
        'ana_ramírez', 'vFCz0YWIzDcneloTzUz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Sánchez', '66738054', 'carlossánchez@hotmail.com', 'Director', 
        'carlos_sánchez', 'SiZHrfw8BycURY1Vf7BcV');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '74992530', 'juanrodríguez@gmail.com', 'Director', 
        'juan_rodríguez', 'aiyBSz93FaY7eacRcinNif1x');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '79917393', 'sofíarodríguez@gmail.com', 'Director', 
        'sofía_rodríguez', 'KLHyJQp04cpa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '77760061', 'juanmartínez@gmail.com', 'Administrador', 
        'juan_martínez', 'GdjtnBp5U');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Martínez', '63130436', 'anamartínez@hotmail.com', 'Director', 
        'ana_martínez', 'Cj4I7GRyES7OEjNTX46OAadl5X');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Martínez', '60091565', 'maríamartínez@gmail.com', 'Director', 
        'maría_martínez', 'PqSmYX7Nm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Pérez', '68323866', 'juanpérez@yahoo.com', 'Director', 
        'juan_pérez', 'eJ7DbUcrT9p3ufmN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '69592088', 'sofíarodríguez@hotmail.com', 'Director', 
        'sofía_rodríguez', 'WqrQpkCL7CWeqwLZArmmAY91Pg4Q');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María González', '69949189', 'maríagonzález@yahoo.com', 'Director', 
        'maría_gonzález', '7T27O36QdaOmFz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '60842564', 'anagonzález@yahoo.com', 'Administrador', 
        'ana_gonzález', 'LKxcjaeZdgEKWN');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Flores', '70028322', 'lauraflores@hotmail.com', 'Administrador', 
        'laura_flores', 'gaobqbm7WccgIXk6hRu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '64633031', 'anaflores@hotmail.com', 'Administrador', 
        'ana_flores', 'K3Ctmsd1cXqEOPZY0ELytt1kx');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '63606751', 'anasánchez@hotmail.com', 'Director', 
        'ana_sánchez', 'pYj6sIEyUwhYJo5qj1Vty');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Sánchez', '77542204', 'laurasánchez@yahoo.com', 'Administrador', 
        'laura_sánchez', '37WbiTVrC8fIOK7FPYBvV53N');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '68351622', 'jorgemartínez@gmail.com', 'Administrador', 
        'jorge_martínez', 'DpJ6iuXYNovf');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '60979032', 'pedropérez@yahoo.com', 'Director', 
        'pedro_pérez', 'xJdwxbklISNBr7r8js9SfZuVg8VzW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Pérez', '76386583', 'jorgepérez@yahoo.com', 'Director', 
        'jorge_pérez', 'SL5qv4E8NdWBSwt4j0quEuqm');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Pérez', '64194616', 'carlospérez@yahoo.com', 'Administrador', 
        'carlos_pérez', 'JtXQjVuyRkcoTOL1EF401nu');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana López', '77627709', 'analópez@gmail.com', 'Administrador', 
        'ana_lópez', '8hwm26aK');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '75402752', 'anaflores@hotmail.com', 'Administrador', 
        'ana_flores', 't0SR1OwFo6rEBb6oFAVRL1');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '70927938', 'juanramírez@hotmail.com', 'Administrador', 
        'juan_ramírez', 'INoPqzFuAXTDvSp3gKPWmyyJ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '69394880', 'juanlópez@gmail.com', 'Administrador', 
        'juan_lópez', '2sZO0p6VU7gi0G');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '69430683', 'luisflores@hotmail.com', 'Administrador', 
        'luis_flores', '7Zm5NPFWrTKtKhLCKs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '78101299', 'carloslópez@yahoo.com', 'Director', 
        'carlos_lópez', 'tqrYT63Oi83f5vtoZGX8VfDqpFdn');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Rodríguez', '79739149', 'jorgerodríguez@hotmail.com', 'Administrador', 
        'jorge_rodríguez', 'EB2ilX59ja');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura Martínez', '65662236', 'lauramartínez@yahoo.com', 'Director', 
        'laura_martínez', 'OxreByV16AZBQQKVmSfsu3sjW');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Martínez', '75246724', 'carmenmartínez@hotmail.com', 'Director', 
        'carmen_martínez', '92MPBE23vXBF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '77213874', 'juanramírez@yahoo.com', 'Director', 
        'juan_ramírez', 'GNq5E5og2M5skb2kTC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '66693390', 'juanmartínez@gmail.com', 'Administrador', 
        'juan_martínez', 'EcprCPBY2ttIo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '64441518', 'pedropérez@gmail.com', 'Director', 
        'pedro_pérez', 'ueiCuWqG');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '69581226', 'pedrogonzález@gmail.com', 'Administrador', 
        'pedro_gonzález', '5NnP1cCQynelmWwT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Rodríguez', '72900343', 'sofíarodríguez@hotmail.com', 'Director', 
        'sofía_rodríguez', 'adPztLqIpZE52SBfRyGWa8AOL');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Pérez', '78518559', 'pedropérez@hotmail.com', 'Administrador', 
        'pedro_pérez', 'OtgZK8CtQce1jT');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen López', '68288547', 'carmenlópez@yahoo.com', 'Administrador', 
        'carmen_lópez', 'cPXqhfeMrkpmKD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '71794949', 'luisflores@hotmail.com', 'Director', 
        'luis_flores', 'Ql3WCADoB4nfBgNz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Rodríguez', '73157392', 'anarodríguez@hotmail.com', 'Administrador', 
        'ana_rodríguez', 'N9jiEt6x82oVhU0GdR14DRhYrPoDXF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '71648123', 'luisrodríguez@hotmail.com', 'Administrador', 
        'luis_rodríguez', 'xPrkdR63WAkYot39z7rSiZ5793Nc7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Martínez', '69611411', 'juanmartínez@yahoo.com', 'Director', 
        'juan_martínez', 'pdCs4GREwaSDPaBRYr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '71591005', 'carlosrodríguez@hotmail.com', 'Administrador', 
        'carlos_rodríguez', '4vC9CgSMdoKvaWro');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '75155803', 'luismartínez@gmail.com', 'Director', 
        'luis_martínez', 'Tc3BCXIpgCpRYsewhnQRlSkyqla');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '73668425', 'luismartínez@gmail.com', 'Director', 
        'luis_martínez', 'cNf9nrVhm6OD5Ry4nno');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '74854806', 'anagonzález@hotmail.com', 'Administrador', 
        'ana_gonzález', 'LVBNjL1UgPnD');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Ramírez', '64574064', 'anaramírez@hotmail.com', 'Administrador', 
        'ana_ramírez', '7MLQcpLR7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Flores', '75701297', 'luisflores@hotmail.com', 'Administrador', 
        'luis_flores', 'SEmQrflDOj');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Martínez', '69890369', 'jorgemartínez@gmail.com', 'Director', 
        'jorge_martínez', 'RprxXpwccSkxlKEHluDHszlHRH');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Flores', '75725401', 'maríaflores@yahoo.com', 'Administrador', 
        'maría_flores', 'k8IFOd7TXBRvwr');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen González', '63304338', 'carmengonzález@gmail.com', 'Administrador', 
        'carmen_gonzález', 'DntZQLKFnIL1gUVMzF6bJfMmpdJXM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan González', '68719473', 'juangonzález@gmail.com', 'Director', 
        'juan_gonzález', 'VGZrPse5qs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Ramírez', '73518902', 'pedroramírez@gmail.com', 'Director', 
        'pedro_ramírez', 'CIwwqopw97yqB');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '73834355', 'sofíamartínez@hotmail.com', 'Director', 
        'sofía_martínez', 'g9jM64824PiJMN1AiMI7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Pérez', '62477867', 'anapérez@yahoo.com', 'Administrador', 
        'ana_pérez', 'gHCvCMsIRCHIExQqDeW7pDV7pBOUwE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Martínez', '78005397', 'sofíamartínez@gmail.com', 'Administrador', 
        'sofía_martínez', 'PgaDGKLpUp3oNcpPJqk7YeLMd');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos López', '69662722', 'carloslópez@yahoo.com', 'Administrador', 
        'carlos_lópez', 'XDZtE16iQiLtrMwi78cS4nzXJMS9OO');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '78562281', 'anasánchez@gmail.com', 'Director', 
        'ana_sánchez', 'WKLLxbx0QVEE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '62329706', 'pedrosánchez@hotmail.com', 'Administrador', 
        'pedro_sánchez', 'wSYljltny3ncqPvTCe4');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Sofía Sánchez', '67312684', 'sofíasánchez@gmail.com', 'Director', 
        'sofía_sánchez', 'oGeaZ6DXMmJj57I');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '77308765', 'pedrogonzález@yahoo.com', 'Administrador', 
        'pedro_gonzález', 'vmGwVU725HOVvissVknvQfs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '63398214', 'luisrodríguez@gmail.com', 'Administrador', 
        'luis_rodríguez', 'yXCqULarPNq8CoF6D');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '70185018', 'juanrodríguez@hotmail.com', 'Director', 
        'juan_rodríguez', 'IYKLLIzzVIk2uq4vn5JKvosZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Ramírez', '67934946', 'juanramírez@gmail.com', 'Director', 
        'juan_ramírez', 'VrJHXUGYFHZ1eIke06R8fBtTcl');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura López', '73892678', 'lauralópez@hotmail.com', 'Administrador', 
        'laura_lópez', 'vly4wtb8l23J94RaZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan Rodríguez', '73332675', 'juanrodríguez@gmail.com', 'Administrador', 
        'juan_rodríguez', 'bwHLdK4JuOtkdz');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '71669419', 'maríapérez@yahoo.com', 'Director', 
        'maría_pérez', 'usTRtPWwRvGa');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis López', '79180900', 'luislópez@gmail.com', 'Administrador', 
        'luis_lópez', 'wm7tbTBFyklbIqOs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Laura González', '66086126', 'lauragonzález@hotmail.com', 'Administrador', 
        'laura_gonzález', 'Jh5uuoo3e2VdXnP263fNl7LGwvCP3');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Sánchez', '77072628', 'anasánchez@hotmail.com', 'Director', 
        'ana_sánchez', 'OLpmVPdzi6');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Rodríguez', '72752972', 'luisrodríguez@gmail.com', 'Administrador', 
        'luis_rodríguez', 'ueG3tH3CaSHfC8GjS5cZckBoomku');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '72720360', 'luisgonzález@hotmail.com', 'Director', 
        'luis_gonzález', 'DopgMr7fNJyCo7VLrg');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '67095346', 'jorgeflores@hotmail.com', 'Director', 
        'jorge_flores', 'qb1cqqKCZS');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '63967408', 'anagonzález@yahoo.com', 'Director', 
        'ana_gonzález', 'RqRB5VSM3BWo2jQZkIUF');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('María Pérez', '75302705', 'maríapérez@yahoo.com', 'Director', 
        'maría_pérez', 'OPzx77oXk6ay2MM3YZhjJ3fs');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge López', '73267858', 'jorgelópez@hotmail.com', 'Administrador', 
        'jorge_lópez', 'CJgJCQMzGOpCGbGaUnzJE');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '66217121', 'carlosrodríguez@hotmail.com', 'Administrador', 
        'carlos_rodríguez', 'eodtCavUr6dPKo');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis González', '73131728', 'luisgonzález@gmail.com', 'Director', 
        'luis_gonzález', '7A1zpDjiNZujI7');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Juan López', '73695002', 'juanlópez@yahoo.com', 'Administrador', 
        'juan_lópez', '84WYh9Z0y');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Martínez', '61888430', 'luismartínez@yahoo.com', 'Director', 
        'luis_martínez', 'uuKai0Uyx3jdZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Rodríguez', '70969492', 'carlosrodríguez@hotmail.com', 'Administrador', 
        'carlos_rodríguez', 'WMgJfsqvBnwy6o26aaXx42s6GC');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro Sánchez', '66748513', 'pedrosánchez@yahoo.com', 'Director', 
        'pedro_sánchez', '3AoyhsXxAkbD0PUhxM');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana González', '62597073', 'anagonzález@gmail.com', 'Administrador', 
        'ana_gonzález', 'N6JCIkX8oCWNMlpEZ');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Ana Flores', '73434492', 'anaflores@yahoo.com', 'Director', 
        'ana_flores', 'rkNpqQb8W');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Jorge Flores', '75410913', 'jorgeflores@hotmail.com', 'Director', 
        'jorge_flores', 'KOZWPubp4S94Rh4BXKJV8p');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Pedro González', '79269216', 'pedrogonzález@yahoo.com', 'Administrador', 
        'pedro_gonzález', 'P8AE288W');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Luis Ramírez', '66320984', 'luisramírez@gmail.com', 'Administrador', 
        'luis_ramírez', 'Z5hGpJpGikWOivN4xtXqMZauh');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carlos Flores', '71525895', 'carlosflores@hotmail.com', 'Administrador', 
        'carlos_flores', 'njODoOg1RqU9XVB1QwgzSWCO75');
INSERT INTO usuarios (nombre, telefono, correo, rol, usuario, contrasena) 
        VALUES ('Carmen Ramírez', '62083860', 'carmenramírez@yahoo.com', 'Administrador', 
        'carmen_ramírez', 'fqEyVWAx');
-- fin tabla de usuarios 1000 datos

-- inicio tabla de estudiante   1000 datos

INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7534226, 'Juan', 'Flores', 'maría@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'petae', '65660076', 
        2024, 2, 'No Completo', 'ft2n6bJyrh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3832567, 'Juan', 'González', 'carmen@ucb.edu.bo', 
        'carlos@yahoo.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '77075074', 
        2020, 2, 'Completo', 'Vyv2CRgQsA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3976848, 'Ana', 'Martínez', 'laura@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'petae', '64065910', 
        2024, 1, 'No Completo', 'D2xr4Uae');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4873540, 'Juan', 'Rodríguez', 'ana@ucb.edu.bo', 
        'juan@yahoo.com', 'Arquitectura', 'tesis de grado', '74943532', 
        2023, 2, 'Completo', 'b10WYH2w');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6771724, 'Luis', 'Flores', 'pedro@ucb.edu.bo', 
        'sofía@yahoo.com', 'Derecho', 'examen de grado', '75772979', 
        2023, 2, 'No Completo', '38BIJtlhBhXF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8933587, 'Ana', 'González', 'carlos@ucb.edu.bo', 
        'jorge@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '65384869', 
        2022, 1, 'No Completo', 'Fpc9cM59fFQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6632636, 'Carlos', 'Flores', 'maría@ucb.edu.bo', 
        'jorge@gmail.com', 'Medicina', 'trabajo de grado', '66250548', 
        2020, 2, 'No Completo', 'hUfJKzxh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8795090, 'Ana', 'Sánchez', 'maría@ucb.edu.bo', 
        'maría@yahoo.com', 'Comunicación', 'graduación por diplomado', '69682162', 
        2024, 1, 'No Completo', '2qBaRE1i');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3824805, 'Carmen', 'González', 'jorge@ucb.edu.bo', 
        'sofía@gmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '75605874', 
        2023, 2, 'Completo', 'GP46R9kZ80ON');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4562539, 'Carmen', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'jorge@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '64410885', 
        2024, 1, 'Completo', 'P3yLnPTv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8350099, 'Juan', 'López', 'laura@ucb.edu.bo', 
        'carmen@gmail.com', 'Medicina', 'petae', '78136174', 
        2021, 1, 'No Completo', 'o4MRSjCoiv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2211547, 'Pedro', 'Ramírez', 'ana@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'proyecto dirigido', '70974267', 
        2024, 2, 'No Completo', 'Oio6YfLsNlt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2365828, 'Carlos', 'Rodríguez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Arquitectura', 'examen de grado', '60345859', 
        2023, 1, 'No Completo', '1Gb6GGWEn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2709397, 'Juan', 'Sánchez', 'ana@ucb.edu.bo', 
        'carmen@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '66344537', 
        2022, 2, 'Completo', 'wu1grd5U');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8270246, 'María', 'Pérez', 'carmen@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'taller de grado 1 y 2', '72556492', 
        2021, 1, 'Completo', '9QAun9bphg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9008051, 'Carlos', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'proyecto dirigido', '73084764', 
        2021, 1, 'No Completo', 'ZtVBpAQqp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5163992, 'Carmen', 'Pérez', 'ana@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '79241357', 
        2024, 2, 'No Completo', 'MKj7SibePTed');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7087761, 'Sofía', 'Martínez', 'maría@ucb.edu.bo', 
        'nan', 'Comunicación', 'examen de grado', '65321438', 
        2022, 2, 'No Completo', '8pCNha6biuWV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5387836, 'Pedro', 'Ramírez', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '70692812', 
        2022, 1, 'Completo', 'm8CRV7px');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1458108, 'María', 'González', 'pedro@ucb.edu.bo', 
        'ana@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '65482282', 
        2022, 2, 'Completo', 'ipHqhdlpoor');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6485187, 'Jorge', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'nan', 'Psicología', 'proyecto dirigido', '79570770', 
        2021, 1, 'No Completo', 'DQO6SSZzsUT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9024014, 'Juan', 'Rodríguez', 'ana@ucb.edu.bo', 
        'luis@gmail.com', 'Arquitectura', 'proyecto dirigido', '65380986', 
        2023, 1, 'Completo', '8MM3lZDDmpC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4842778, 'Carlos', 'Sánchez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'taller de grado 1 y 2', '75083688', 
        2024, 1, 'Completo', 'WUzCyJWYqZF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8766799, 'Pedro', 'Sánchez', 'pedro@ucb.edu.bo', 
        'ana@yahoo.com', 'Psicología', 'tesis de grado', '74811675', 
        2020, 1, 'Completo', 'xPgoyIPCHMV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8388741, 'Carlos', 'González', 'juan@ucb.edu.bo', 
        'ana@yahoo.com', 'Ingeniería de Sistemas', 'examen de grado', '75226077', 
        2024, 2, 'No Completo', 'J60FzvBbg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4981147, 'Laura', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'pedro@gmail.com', 'Medicina', 'petae', '71429941', 
        2022, 1, 'Completo', '372TwHu1ciN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9621709, 'Juan', 'Rodríguez', 'juan@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'graduación por diplomado', '61396803', 
        2024, 2, 'No Completo', 'g1M1Qztz14ib');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2208616, 'Carlos', 'Martínez', 'maría@ucb.edu.bo', 
        'jorge@gmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '61311704', 
        2020, 2, 'No Completo', 'Q2JVNuPAP6b');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5131493, 'Laura', 'Pérez', 'carmen@ucb.edu.bo', 
        'nan', 'Comunicación', 'petae', '78345101', 
        2024, 1, 'No Completo', 'MtL1OL16AGqa');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9754194, 'Luis', 'López', 'juan@ucb.edu.bo', 
        'jorge@gmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '64713649', 
        2021, 1, 'No Completo', '9SJRomBCNj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1101851, 'Carmen', 'Martínez', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'petae', '64397116', 
        2021, 2, 'Completo', 'Fb9YpHBrhm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8855324, 'Ana', 'Martínez', 'sofía@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'examen de grado', '74630320', 
        2024, 2, 'No Completo', 'W8dfIKgS8u');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3313126, 'Sofía', 'Sánchez', 'jorge@ucb.edu.bo', 
        'luis@hotmail.com', 'Medicina', 'trabajo de grado', '73805859', 
        2022, 1, 'No Completo', 'ULGrb1hLo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3989253, 'María', 'Ramírez', 'sofía@ucb.edu.bo', 
        'carlos@hotmail.com', 'Medicina', 'examen de grado', '67304465', 
        2020, 1, 'Completo', 'EVCiOFNIsh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8710776, 'Carlos', 'González', 'luis@ucb.edu.bo', 
        'sofía@yahoo.com', 'Arquitectura', 'graduación por diplomado', '65018483', 
        2024, 2, 'Completo', 'r0m8Zo8FXWL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4990861, 'Carmen', 'Pérez', 'carlos@ucb.edu.bo', 
        'sofía@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '61728324', 
        2024, 2, 'No Completo', 'otJavSzKpdl');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5249942, 'Luis', 'Flores', 'maría@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'graduación por diplomado', '79226458', 
        2021, 2, 'Completo', 'UAmGlJto3SHw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8864471, 'Sofía', 'Martínez', 'pedro@ucb.edu.bo', 
        'carmen@hotmail.com', 'Comunicación', 'trabajo de grado', '79329579', 
        2023, 2, 'No Completo', 'n4zkKk8Hh7J');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6607274, 'Juan', 'Rodríguez', 'ana@ucb.edu.bo', 
        'maría@hotmail.com', 'Derecho', 'proyecto dirigido', '68185800', 
        2020, 1, 'Completo', 'RRLRmEVoFV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8895991, 'Carmen', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '70633766', 
        2021, 2, 'No Completo', 'KSw2oOQOSyjJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1475427, 'Jorge', 'Martínez', 'carlos@ucb.edu.bo', 
        'carlos@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '60586763', 
        2021, 1, 'Completo', '5hdpVfg5JTuZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7356130, 'Pedro', 'Pérez', 'carmen@ucb.edu.bo', 
        'sofía@hotmail.com', 'Psicología', 'tesis de grado', '70041311', 
        2023, 2, 'Completo', 'N1z47etcS0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7954029, 'Jorge', 'Pérez', 'maría@ucb.edu.bo', 
        'carlos@gmail.com', 'Psicología', 'examen de grado', '73164014', 
        2023, 1, 'Completo', 'BNbjLwkS2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3722731, 'Luis', 'López', 'ana@ucb.edu.bo', 
        'nan', 'Psicología', 'trabajo de grado', '73210864', 
        2024, 2, 'No Completo', 'HO9x3OEVTSn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3792096, 'Carmen', 'Flores', 'sofía@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '74932328', 
        2023, 1, 'Completo', 'jTaVG2LpXpvX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9361386, 'Carmen', 'Pérez', 'ana@ucb.edu.bo', 
        'ana@hotmail.com', 'Psicología', 'examen de grado', '70914131', 
        2022, 1, 'Completo', 'giz4qD0JjhC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8114022, 'Sofía', 'Sánchez', 'maría@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'graduación por diplomado', '73008145', 
        2020, 1, 'Completo', 'DAxZERx9teB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2928899, 'María', 'González', 'juan@ucb.edu.bo', 
        'sofía@gmail.com', 'Derecho', 'tesis de grado', '71471577', 
        2022, 2, 'No Completo', 'pqN0KKDhIW2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3580567, 'Juan', 'Ramírez', 'sofía@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '79739269', 
        2020, 2, 'No Completo', 'wJvdJtWuYqe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9166948, 'María', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'carmen@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '73854186', 
        2023, 1, 'Completo', '2138ewEuTmZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5052495, 'María', 'López', 'juan@ucb.edu.bo', 
        'ana@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '73770567', 
        2024, 2, 'Completo', 'L36XyTbaweD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6662528, 'Juan', 'Sánchez', 'juan@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '74612106', 
        2024, 2, 'No Completo', 'pJKOx7JOM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6991847, 'Carmen', 'Flores', 'laura@ucb.edu.bo', 
        'juan@yahoo.com', 'Arquitectura', 'examen de grado', '78050994', 
        2021, 2, 'Completo', 'jKZCmg6ElilT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3876682, 'Juan', 'Ramírez', 'carlos@ucb.edu.bo', 
        'ana@hotmail.com', 'Arquitectura', 'graduación por diplomado', '65326800', 
        2024, 2, 'Completo', '117WwdHqki');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7595290, 'Pedro', 'González', 'laura@ucb.edu.bo', 
        'carmen@yahoo.com', 'Arquitectura', 'petae', '74199993', 
        2021, 2, 'Completo', 'CP3tLkGz8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5646727, 'Juan', 'Martínez', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Ingeniería de Sistemas', 'petae', '63502459', 
        2020, 2, 'No Completo', 'Zzq6rtxWt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5477802, 'Pedro', 'Ramírez', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Derecho', 'taller de grado 1 y 2', '78523014', 
        2023, 1, 'Completo', 'PnpK1TiphCk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4408472, 'Luis', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'laura@yahoo.com', 'Arquitectura', 'examen de grado', '77369236', 
        2021, 1, 'No Completo', 'ko6wAAmq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7191537, 'Pedro', 'Sánchez', 'laura@ucb.edu.bo', 
        'ana@gmail.com', 'Derecho', 'examen de grado', '78756679', 
        2021, 1, 'Completo', 'sS0bvUvtyHRv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5022303, 'Carmen', 'López', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'graduación por diplomado', '72799091', 
        2022, 1, 'Completo', 'ca5A1lx2SRmX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6576338, 'Luis', 'Rodríguez', 'laura@ucb.edu.bo', 
        'ana@gmail.com', 'Medicina', 'proyecto dirigido', '78413988', 
        2023, 1, 'Completo', 'JzMewfG1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5848581, 'Jorge', 'Pérez', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Comunicación', 'tesis de grado', '76900350', 
        2020, 2, 'Completo', 'DCkQMia2ETPK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6918821, 'Carmen', 'Pérez', 'ana@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'petae', '69722517', 
        2023, 1, 'No Completo', 'xYm3jr8Bpcqg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4323632, 'Luis', 'Pérez', 'laura@ucb.edu.bo', 
        'sofía@gmail.com', 'Medicina', 'proyecto dirigido', '70832552', 
        2023, 1, 'No Completo', 'des5WTox');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6114910, 'María', 'Ramírez', 'juan@ucb.edu.bo', 
        'nan', 'Arquitectura', 'proyecto dirigido', '75648507', 
        2023, 1, 'No Completo', 'Xb2ZlKsUt4E');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4702834, 'Jorge', 'Martínez', 'juan@ucb.edu.bo', 
        'carlos@yahoo.com', 'Arquitectura', 'proyecto dirigido', '79684961', 
        2022, 2, 'Completo', 'VP4KybKmc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9253826, 'Luis', 'Martínez', 'carlos@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'examen de grado', '61105128', 
        2023, 2, 'Completo', 'EKD0YMTBmdPd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4645864, 'Laura', 'Pérez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Psicología', 'taller de grado 1 y 2', '77358049', 
        2020, 1, 'Completo', '8oF4tD1QX1M0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7155329, 'Ana', 'Sánchez', 'carmen@ucb.edu.bo', 
        'sofía@gmail.com', 'Comunicación', 'proyecto dirigido', '60429262', 
        2023, 1, 'No Completo', 'vpQGSi6jWf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6462947, 'Carlos', 'Flores', 'luis@ucb.edu.bo', 
        'jorge@yahoo.com', 'Medicina', 'taller de grado 1 y 2', '61228369', 
        2024, 2, 'Completo', 'C4avCztY0g10');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4007599, 'Sofía', 'Ramírez', 'laura@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'petae', '72351880', 
        2023, 1, 'Completo', 'Mt6bZGVFr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8501481, 'Laura', 'Martínez', 'ana@ucb.edu.bo', 
        'carlos@hotmail.com', 'Medicina', 'trabajo de grado', '77672253', 
        2020, 2, 'Completo', 'hWdjaqOaiP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4982472, 'María', 'Pérez', 'ana@ucb.edu.bo', 
        'laura@hotmail.com', 'Psicología', 'examen de grado', '73266127', 
        2024, 2, 'No Completo', 'WiwNpxAmdshY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9678001, 'Pedro', 'Pérez', 'sofía@ucb.edu.bo', 
        'carlos@hotmail.com', 'Arquitectura', 'proyecto dirigido', '71656313', 
        2020, 1, 'No Completo', 'aN1PUzE2DE8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3386428, 'Juan', 'Martínez', 'juan@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'petae', '67650004', 
        2024, 1, 'No Completo', 'vUlYFnWR7zUH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4866352, 'Pedro', 'Sánchez', 'juan@ucb.edu.bo', 
        'juan@yahoo.com', 'Comunicación', 'tesis de grado', '64932292', 
        2021, 1, 'No Completo', 'PKxLNt5Vwmj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9701993, 'Luis', 'Martínez', 'juan@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'examen de grado', '79412991', 
        2020, 1, 'Completo', 'lVt4amZH668');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7776769, 'Sofía', 'Pérez', 'ana@ucb.edu.bo', 
        'carlos@hotmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '76725760', 
        2023, 2, 'No Completo', 'CUDugBSI2N');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7566846, 'Carlos', 'Pérez', 'juan@ucb.edu.bo', 
        'nan', 'Comunicación', 'taller de grado 1 y 2', '71810041', 
        2024, 2, 'No Completo', 'ie4AmeLKGw0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5261417, 'Luis', 'Ramírez', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Psicología', 'proyecto dirigido', '69500406', 
        2020, 1, 'No Completo', 'jokHK34laPw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9227871, 'Luis', 'Martínez', 'ana@ucb.edu.bo', 
        'carmen@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '67782503', 
        2021, 1, 'No Completo', 'VraoQltQhebd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3971530, 'Carlos', 'Martínez', 'ana@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '71066890', 
        2021, 1, 'No Completo', 'i9XmOzaPw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2346792, 'Laura', 'Flores', 'maría@ucb.edu.bo', 
        'jorge@hotmail.com', 'Psicología', 'examen de grado', '69594480', 
        2020, 2, 'No Completo', 'tvUE2YiNi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4988224, 'Carmen', 'Rodríguez', 'luis@ucb.edu.bo', 
        'sofía@yahoo.com', 'Medicina', 'taller de grado 1 y 2', '79146427', 
        2024, 1, 'No Completo', 'G7Ui5Upo5H7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9468283, 'Ana', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '70013552', 
        2021, 1, 'No Completo', 'huSmVUIY2w2G');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5105774, 'Juan', 'Sánchez', 'jorge@ucb.edu.bo', 
        'juan@yahoo.com', 'Comunicación', 'examen de grado', '68805065', 
        2022, 1, 'Completo', 'AafeEjOaAVI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8053321, 'Sofía', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'carlos@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '75237722', 
        2023, 2, 'Completo', 'VLZhQxLYdQi3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5372991, 'Juan', 'Pérez', 'carlos@ucb.edu.bo', 
        'jorge@yahoo.com', 'Comunicación', 'graduación por diplomado', '78767229', 
        2020, 1, 'Completo', 'A37EZK2E2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4507889, 'Carmen', 'Flores', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '71054957', 
        2020, 1, 'Completo', 'WOMK0QZZ310');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5905151, 'Laura', 'González', 'ana@ucb.edu.bo', 
        'sofía@hotmail.com', 'Arquitectura', 'trabajo de grado', '78079626', 
        2023, 2, 'Completo', 'WQWn6aIVpzx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9408253, 'Carlos', 'Ramírez', 'carlos@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'trabajo de grado', '67613293', 
        2020, 2, 'No Completo', '7NMNOok5DZEw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4315333, 'Carlos', 'López', 'maría@ucb.edu.bo', 
        'luis@hotmail.com', 'Ingeniería de Sistemas', 'petae', '65023786', 
        2022, 2, 'Completo', 'cn8ytZqDMa0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6309365, 'Ana', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'nan', 'Arquitectura', 'tesis de grado', '77223203', 
        2024, 2, 'No Completo', 'vgnwuNxn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8966485, 'Jorge', 'Martínez', 'sofía@ucb.edu.bo', 
        'luis@hotmail.com', 'Comunicación', 'graduación por diplomado', '78064311', 
        2020, 2, 'No Completo', 'xNlJCKtg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3916464, 'Jorge', 'González', 'laura@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'proyecto dirigido', '63842105', 
        2023, 1, 'Completo', '2Wnu0HsYmSxM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5684541, 'Jorge', 'Rodríguez', 'laura@ucb.edu.bo', 
        'luis@hotmail.com', 'Derecho', 'trabajo de grado', '62922711', 
        2023, 1, 'Completo', 'BXHOlJSh6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2014375, 'Juan', 'Ramírez', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Derecho', 'graduación por diplomado', '69119506', 
        2020, 2, 'Completo', 'sKVjzmasJp4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7352108, 'Luis', 'Pérez', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'tesis de grado', '75622409', 
        2021, 2, 'No Completo', 'WWJbsQ9bTU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1335721, 'María', 'González', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'proyecto dirigido', '68279622', 
        2021, 1, 'No Completo', '2gFQ6DPKaHF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9923984, 'Laura', 'Sánchez', 'sofía@ucb.edu.bo', 
        'juan@gmail.com', 'Comunicación', 'taller de grado 1 y 2', '61555575', 
        2021, 2, 'No Completo', 'cVv0YxH9K');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9573637, 'Ana', 'Rodríguez', 'laura@ucb.edu.bo', 
        'nan', 'Psicología', 'graduación por diplomado', '74082776', 
        2023, 1, 'Completo', 'yECp3eF1Lr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9588128, 'Ana', 'Ramírez', 'carlos@ucb.edu.bo', 
        'maría@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '69295868', 
        2021, 2, 'No Completo', 'zgqY1l0soIP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5968356, 'Luis', 'González', 'jorge@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '61265814', 
        2023, 2, 'No Completo', 'qrPZLv8FD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8623307, 'Pedro', 'Rodríguez', 'juan@ucb.edu.bo', 
        'pedro@yahoo.com', 'Medicina', 'examen de grado', '71245729', 
        2022, 1, 'Completo', 'kBgXCmM6TAIP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4676683, 'Carlos', 'López', 'maría@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'proyecto dirigido', '76839311', 
        2021, 1, 'Completo', 'ey1gRHnM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4383692, 'Jorge', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'nan', 'Arquitectura', 'tesis de grado', '69861664', 
        2023, 1, 'No Completo', 'gqLf9Sb5ms');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7289703, 'Juan', 'López', 'maría@ucb.edu.bo', 
        'carlos@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '78791786', 
        2020, 2, 'Completo', 'MkP5q8VVX3I');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2008686, 'Carlos', 'Sánchez', 'luis@ucb.edu.bo', 
        'nan', 'Medicina', 'examen de grado', '78301408', 
        2021, 2, 'No Completo', 'tugxh3dGzXc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9330868, 'Juan', 'González', 'sofía@ucb.edu.bo', 
        'carlos@gmail.com', 'Psicología', 'graduación por diplomado', '65761208', 
        2020, 2, 'No Completo', 'DA03yaNymFq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3634784, 'Pedro', 'Flores', 'pedro@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'graduación por diplomado', '78884201', 
        2022, 2, 'Completo', 'BtOxDTxY7dYV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3866336, 'Juan', 'Martínez', 'maría@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'proyecto dirigido', '60288057', 
        2021, 1, 'No Completo', 'eVIUZCnW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1145409, 'Sofía', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'proyecto dirigido', '68795698', 
        2021, 2, 'Completo', 'keSYbixM9t');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5403813, 'Juan', 'González', 'ana@ucb.edu.bo', 
        'maría@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '60413300', 
        2020, 2, 'No Completo', 'ZFN2QCWflw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6236352, 'Sofía', 'Pérez', 'jorge@ucb.edu.bo', 
        'laura@yahoo.com', 'Comunicación', 'tesis de grado', '63148544', 
        2020, 2, 'Completo', 'jYGKjzpJCH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2774461, 'Ana', 'González', 'carmen@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'proyecto dirigido', '72430274', 
        2024, 2, 'No Completo', 'AgGA03qrZ3C');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1509367, 'Laura', 'Rodríguez', 'juan@ucb.edu.bo', 
        'laura@hotmail.com', 'Comunicación', 'graduación por diplomado', '65558686', 
        2020, 2, 'No Completo', 'DfbpQWAl7xR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6296528, 'Carmen', 'Pérez', 'sofía@ucb.edu.bo', 
        'luis@yahoo.com', 'Medicina', 'proyecto dirigido', '62933884', 
        2023, 1, 'No Completo', 'JG7p1qtP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5222225, 'Laura', 'Ramírez', 'carlos@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '79098734', 
        2022, 2, 'No Completo', 'TaOd3iOz5jc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1836942, 'Carlos', 'Rodríguez', 'juan@ucb.edu.bo', 
        'nan', 'Arquitectura', 'graduación por diplomado', '69744165', 
        2023, 2, 'Completo', 'X27OA74zoxfN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2245621, 'Carmen', 'Flores', 'sofía@ucb.edu.bo', 
        'laura@hotmail.com', 'Comunicación', 'proyecto dirigido', '63186149', 
        2021, 1, 'Completo', 'ZpNkfef0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5144068, 'Juan', 'Sánchez', 'juan@ucb.edu.bo', 
        'jorge@yahoo.com', 'Derecho', 'tesis de grado', '75092308', 
        2020, 2, 'Completo', 'hl3RKoSis');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5482129, 'Jorge', 'Flores', 'carlos@ucb.edu.bo', 
        'pedro@hotmail.com', 'Comunicación', 'graduación por diplomado', '67389372', 
        2023, 2, 'No Completo', 'PuMgPh4z0s');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2274395, 'Sofía', 'Sánchez', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Derecho', 'tesis de grado', '75388608', 
        2021, 2, 'Completo', 'QnDFId2ZA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6863620, 'María', 'López', 'sofía@ucb.edu.bo', 
        'sofía@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '75488367', 
        2024, 2, 'Completo', 'JJuUvEWF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7891649, 'Laura', 'López', 'ana@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'petae', '65083291', 
        2022, 1, 'No Completo', 'gLv0LjjX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5327278, 'Ana', 'Flores', 'ana@ucb.edu.bo', 
        'nan', 'Comunicación', 'trabajo de grado', '76751266', 
        2024, 2, 'No Completo', 'PxMpOYqdOX4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4395370, 'Juan', 'Ramírez', 'sofía@ucb.edu.bo', 
        'carmen@yahoo.com', 'Medicina', 'graduación por diplomado', '73979101', 
        2021, 1, 'No Completo', 'wHBL4trQfD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4038604, 'Carmen', 'Martínez', 'laura@ucb.edu.bo', 
        'sofía@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '62498454', 
        2023, 2, 'No Completo', 'uYbG9JWh7J');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6046882, 'Juan', 'Flores', 'sofía@ucb.edu.bo', 
        'juan@hotmail.com', 'Arquitectura', 'petae', '76318253', 
        2023, 2, 'Completo', 'vhzb309fS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5397399, 'María', 'Pérez', 'luis@ucb.edu.bo', 
        'carlos@hotmail.com', 'Ingeniería de Sistemas', 'petae', '61380377', 
        2023, 2, 'No Completo', 'c8I5cPwCMG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2892777, 'Pedro', 'González', 'sofía@ucb.edu.bo', 
        'maría@gmail.com', 'Comunicación', 'tesis de grado', '76009334', 
        2022, 1, 'Completo', 'rPydKRm4EQ3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5719408, 'Luis', 'Ramírez', 'carmen@ucb.edu.bo', 
        'sofía@gmail.com', 'Derecho', 'proyecto dirigido', '62684942', 
        2021, 1, 'No Completo', 'rnBsgdVcG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4326282, 'Pedro', 'Ramírez', 'laura@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '65732705', 
        2022, 2, 'Completo', 'O4WppTV1j');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7768957, 'Sofía', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'luis@gmail.com', 'Comunicación', 'trabajo de grado', '63415630', 
        2023, 2, 'No Completo', '5SrP6JHA7WD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6253515, 'Sofía', 'Rodríguez', 'laura@ucb.edu.bo', 
        'laura@yahoo.com', 'Arquitectura', 'petae', '64650048', 
        2021, 2, 'Completo', 'gjSLgwEzPAe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8078812, 'Jorge', 'González', 'carmen@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'examen de grado', '61418709', 
        2024, 2, 'No Completo', 'zEhkxYSX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9969927, 'Juan', 'Martínez', 'carmen@ucb.edu.bo', 
        'carlos@yahoo.com', 'Comunicación', 'tesis de grado', '73676563', 
        2021, 2, 'Completo', 'Jq6aiQ4bV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8037479, 'Pedro', 'Ramírez', 'carmen@ucb.edu.bo', 
        'ana@yahoo.com', 'Comunicación', 'tesis de grado', '70197202', 
        2024, 1, 'No Completo', 't7oIOmzT4lXx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8264805, 'Carlos', 'Pérez', 'maría@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '67432563', 
        2024, 1, 'No Completo', 'XhfJj3zoZl');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6506770, 'Laura', 'Sánchez', 'carlos@ucb.edu.bo', 
        'nan', 'Comunicación', 'proyecto dirigido', '64265462', 
        2022, 1, 'No Completo', 'dHbLGwW3t');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3635135, 'Carlos', 'Pérez', 'sofía@ucb.edu.bo', 
        'juan@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '72895945', 
        2020, 2, 'Completo', '26XGi3yDI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5202143, 'Carlos', 'López', 'jorge@ucb.edu.bo', 
        'maría@hotmail.com', 'Arquitectura', 'graduación por diplomado', '61460838', 
        2023, 2, 'No Completo', 'qgxiGgnm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3081937, 'Sofía', 'Flores', 'laura@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'petae', '65685399', 
        2022, 1, 'Completo', '2LEmWj2S');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5526489, 'Sofía', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'laura@yahoo.com', 'Comunicación', 'trabajo de grado', '78143967', 
        2022, 2, 'Completo', '5pFlbcS4B1Z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5640034, 'Laura', 'López', 'pedro@ucb.edu.bo', 
        'maría@gmail.com', 'Arquitectura', 'trabajo de grado', '76757797', 
        2020, 2, 'Completo', 'uERXubaqNlI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6849877, 'Laura', 'Sánchez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'proyecto dirigido', '65696303', 
        2022, 1, 'No Completo', 'xyEdHKm1LoV9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7994434, 'Ana', 'Flores', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'examen de grado', '79462086', 
        2022, 2, 'No Completo', 's0XNsHSy9K');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6447937, 'Laura', 'Ramírez', 'sofía@ucb.edu.bo', 
        'maría@yahoo.com', 'Arquitectura', 'petae', '62936525', 
        2023, 1, 'Completo', '3hoxerVFw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3374295, 'Carmen', 'Pérez', 'sofía@ucb.edu.bo', 
        'laura@hotmail.com', 'Psicología', 'examen de grado', '71309160', 
        2024, 2, 'No Completo', '1MVl8wluSVY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3774162, 'Juan', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '76690125', 
        2022, 1, 'No Completo', 't7JPDMap5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1294902, 'Carlos', 'Rodríguez', 'juan@ucb.edu.bo', 
        'nan', 'Comunicación', 'taller de grado 1 y 2', '74178812', 
        2020, 2, 'No Completo', '2gAOx1HgtcjC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7065731, 'Luis', 'Sánchez', 'carlos@ucb.edu.bo', 
        'maría@hotmail.com', 'Arquitectura', 'tesis de grado', '76216552', 
        2024, 1, 'No Completo', 'pT0Rlw4k');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6019490, 'Carlos', 'Ramírez', 'carlos@ucb.edu.bo', 
        'carmen@hotmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '74511771', 
        2021, 2, 'No Completo', 'TbiHwluxr5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8571235, 'Jorge', 'Pérez', 'pedro@ucb.edu.bo', 
        'sofía@gmail.com', 'Psicología', 'proyecto dirigido', '74210297', 
        2024, 2, 'Completo', 'Eu7eFNGy5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2538490, 'Carlos', 'López', 'maría@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'trabajo de grado', '78303414', 
        2023, 1, 'Completo', 'qrspji1C');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8266940, 'Laura', 'Sánchez', 'ana@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '67114137', 
        2024, 2, 'No Completo', 'MPgk7ana0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4521528, 'Luis', 'López', 'jorge@ucb.edu.bo', 
        'nan', 'Arquitectura', 'graduación por diplomado', '64599014', 
        2020, 2, 'Completo', '5BTVL2JAQv3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1886546, 'Pedro', 'Sánchez', 'pedro@ucb.edu.bo', 
        'carlos@hotmail.com', 'Medicina', 'graduación por diplomado', '65403438', 
        2022, 2, 'Completo', 'V7lE2NuUDnJp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8637436, 'María', 'Rodríguez', 'ana@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '71764122', 
        2020, 2, 'No Completo', '8sw98NFrnj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5491245, 'Pedro', 'Sánchez', 'ana@ucb.edu.bo', 
        'carlos@hotmail.com', 'Arquitectura', 'graduación por diplomado', '64221454', 
        2022, 2, 'No Completo', 'Agzgn5Oux4KA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2352373, 'Juan', 'Ramírez', 'carlos@ucb.edu.bo', 
        'sofía@yahoo.com', 'Derecho', 'proyecto dirigido', '76702639', 
        2021, 2, 'No Completo', 'PSwDCHQQ3gOa');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4907104, 'Laura', 'Sánchez', 'sofía@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'graduación por diplomado', '74322058', 
        2022, 1, 'No Completo', 'kgeBUCYL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4774223, 'Ana', 'Ramírez', 'maría@ucb.edu.bo', 
        'pedro@yahoo.com', 'Medicina', 'proyecto dirigido', '73568386', 
        2022, 1, 'No Completo', '1MBuopKD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3344983, 'María', 'Pérez', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '76258788', 
        2023, 1, 'Completo', 'Y6P0994oOjP3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3670798, 'Carmen', 'González', 'carlos@ucb.edu.bo', 
        'nan', 'Medicina', 'graduación por diplomado', '74014831', 
        2022, 2, 'Completo', 'ldFD9188n4h');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6480439, 'Ana', 'Flores', 'carlos@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'examen de grado', '69628074', 
        2020, 1, 'Completo', 'cENIUIqk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1256588, 'Jorge', 'Pérez', 'pedro@ucb.edu.bo', 
        'carmen@hotmail.com', 'Psicología', 'graduación por diplomado', '78707629', 
        2020, 2, 'Completo', '0DJcoy0IGh2V');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1487603, 'Jorge', 'Sánchez', 'jorge@ucb.edu.bo', 
        'jorge@yahoo.com', 'Arquitectura', 'petae', '78049634', 
        2021, 1, 'No Completo', 'yzakFanpmu3P');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7955734, 'Ana', 'Flores', 'laura@ucb.edu.bo', 
        'carlos@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '64598243', 
        2024, 2, 'No Completo', '26PDYw4O');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7004565, 'Ana', 'Sánchez', 'juan@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'proyecto dirigido', '75540954', 
        2020, 2, 'Completo', 'ut1JBJcCmm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9646626, 'Ana', 'Flores', 'luis@ucb.edu.bo', 
        'carmen@yahoo.com', 'Ingeniería de Sistemas', 'examen de grado', '75341802', 
        2024, 1, 'No Completo', '2vBCY6tV94Eh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3798369, 'Carmen', 'López', 'luis@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'trabajo de grado', '72001465', 
        2022, 2, 'No Completo', 'F1LFNbI9sk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4402155, 'Ana', 'González', 'carmen@ucb.edu.bo', 
        'luis@hotmail.com', 'Comunicación', 'proyecto dirigido', '72988303', 
        2021, 1, 'Completo', 'dp2DLpf59');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4940696, 'Luis', 'López', 'jorge@ucb.edu.bo', 
        'laura@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '72153448', 
        2024, 2, 'No Completo', 'Gz04v7aKo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4390245, 'Sofía', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'petae', '71982953', 
        2021, 2, 'Completo', 'MvDnTrOLD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5932443, 'Laura', 'López', 'jorge@ucb.edu.bo', 
        'maría@hotmail.com', 'Arquitectura', 'examen de grado', '61958549', 
        2021, 1, 'No Completo', '0HWzfVZ79J2J');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6956250, 'Luis', 'Flores', 'luis@ucb.edu.bo', 
        'nan', 'Comunicación', 'taller de grado 1 y 2', '60920627', 
        2023, 1, 'Completo', '7I2TZXSuD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2348237, 'Laura', 'López', 'carmen@ucb.edu.bo', 
        'sofía@yahoo.com', 'Derecho', 'trabajo de grado', '79894244', 
        2024, 1, 'No Completo', 'SaOtH9wBc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4237920, 'Carlos', 'Ramírez', 'carmen@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'examen de grado', '60808939', 
        2020, 2, 'No Completo', 'IsAIoKQV3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5003762, 'Laura', 'Flores', 'laura@ucb.edu.bo', 
        'laura@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '70626334', 
        2020, 1, 'No Completo', '6pcoqfBUc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7397106, 'Juan', 'Sánchez', 'luis@ucb.edu.bo', 
        'nan', 'Comunicación', 'examen de grado', '75220939', 
        2024, 2, 'No Completo', 'OCxSoE7l');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2292521, 'Carlos', 'Pérez', 'carlos@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'petae', '77168872', 
        2020, 1, 'Completo', 'kYyzznOt61');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1160444, 'Jorge', 'González', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Arquitectura', 'taller de grado 1 y 2', '76921184', 
        2024, 1, 'Completo', '3K5JvCCeN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3074294, 'Sofía', 'Pérez', 'pedro@ucb.edu.bo', 
        'sofía@hotmail.com', 'Ingeniería de Sistemas', 'examen de grado', '74654908', 
        2023, 2, 'Completo', 'rUrp9rdQ55g7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5136799, 'Pedro', 'Pérez', 'juan@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '61070193', 
        2023, 1, 'Completo', 'LsC4EsDlmCxK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9288527, 'Carlos', 'Ramírez', 'pedro@ucb.edu.bo', 
        'sofía@hotmail.com', 'Derecho', 'graduación por diplomado', '65863754', 
        2021, 2, 'No Completo', 'taFtawfrT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7901453, 'Juan', 'López', 'ana@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '70488518', 
        2024, 1, 'No Completo', 'effUeRvA0WF7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1981280, 'Laura', 'Flores', 'luis@ucb.edu.bo', 
        'ana@hotmail.com', 'Derecho', 'tesis de grado', '79152289', 
        2024, 1, 'No Completo', 'kRlOPpSlEes');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3129163, 'Juan', 'Flores', 'maría@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'taller de grado 1 y 2', '61216216', 
        2020, 1, 'Completo', 'UvwaliSXjtYU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1564182, 'Juan', 'Ramírez', 'carlos@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '75448024', 
        2023, 2, 'Completo', 'WujdqTx7gT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3675438, 'María', 'López', 'carmen@ucb.edu.bo', 
        'sofía@gmail.com', 'Psicología', 'trabajo de grado', '74024630', 
        2021, 1, 'No Completo', 'bECn6jyyU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6899125, 'Ana', 'Martínez', 'pedro@ucb.edu.bo', 
        'pedro@hotmail.com', 'Medicina', 'trabajo de grado', '78394276', 
        2024, 1, 'Completo', 'OTgYT9dMP05M');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9414755, 'Juan', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '77778477', 
        2024, 1, 'Completo', 'SIEzQFw4Qlkv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2687419, 'Carlos', 'González', 'juan@ucb.edu.bo', 
        'sofía@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '78432428', 
        2021, 2, 'No Completo', 'UeS2E5XnF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4487097, 'Laura', 'González', 'juan@ucb.edu.bo', 
        'ana@gmail.com', 'Ingeniería de Sistemas', 'petae', '75530136', 
        2021, 1, 'Completo', '9laP4MNBTe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8267856, 'María', 'Pérez', 'laura@ucb.edu.bo', 
        'ana@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '71218826', 
        2021, 1, 'No Completo', 'oFdvUv8rT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5413730, 'Sofía', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '67121993', 
        2023, 1, 'No Completo', 'mtZPVImU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4427889, 'Carlos', 'González', 'carlos@ucb.edu.bo', 
        'nan', 'Comunicación', 'petae', '70394619', 
        2023, 2, 'No Completo', 'aLd4jgfqPzY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3128834, 'María', 'Flores', 'carmen@ucb.edu.bo', 
        'laura@hotmail.com', 'Medicina', 'taller de grado 1 y 2', '77513495', 
        2024, 2, 'Completo', 'lSR7T0tvPCwu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7497228, 'Sofía', 'Ramírez', 'pedro@ucb.edu.bo', 
        'maría@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '75330862', 
        2021, 2, 'Completo', 'mkCgw4hJrG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1714141, 'Pedro', 'Flores', 'jorge@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '78983026', 
        2021, 2, 'Completo', '2vpgVC1aok');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9953618, 'Carmen', 'López', 'ana@ucb.edu.bo', 
        'maría@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '63620922', 
        2023, 2, 'No Completo', 'WahErFBUSCg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4485468, 'Luis', 'Pérez', 'carlos@ucb.edu.bo', 
        'nan', 'Derecho', 'trabajo de grado', '75075431', 
        2020, 1, 'Completo', 'z8abY04GQud');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2641172, 'Juan', 'Rodríguez', 'laura@ucb.edu.bo', 
        'pedro@yahoo.com', 'Medicina', 'petae', '75189594', 
        2021, 2, 'No Completo', 'UAEKJuqm8yCg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1649793, 'Carmen', 'Rodríguez', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Arquitectura', 'graduación por diplomado', '60313227', 
        2020, 2, 'Completo', 'Hhjhhfwf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2141504, 'Jorge', 'González', 'pedro@ucb.edu.bo', 
        'ana@gmail.com', 'Psicología', 'graduación por diplomado', '66572374', 
        2022, 2, 'No Completo', '1hfajI0rnSyF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8851759, 'Carlos', 'González', 'ana@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '79640376', 
        2024, 1, 'Completo', 'xZkl6PKEU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4310699, 'Ana', 'López', 'laura@ucb.edu.bo', 
        'luis@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '60843661', 
        2021, 1, 'No Completo', 'iujOHNktCrFN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2310472, 'Carlos', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'jorge@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '72042350', 
        2022, 1, 'No Completo', 'qe42sBWmOIZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3469087, 'Jorge', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'nan', 'Comunicación', 'proyecto dirigido', '61324883', 
        2021, 2, 'No Completo', 'XHg9hu0hJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4435070, 'María', 'Sánchez', 'carmen@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'proyecto dirigido', '71585321', 
        2021, 1, 'No Completo', 'LAw0FBCRW2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7838391, 'Luis', 'González', 'carmen@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '69988499', 
        2023, 1, 'Completo', '1YDOErucP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9674079, 'Carmen', 'Martínez', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '77253315', 
        2024, 1, 'No Completo', '3NyQLS7k');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7550710, 'Luis', 'López', 'pedro@ucb.edu.bo', 
        'laura@yahoo.com', 'Ingeniería de Sistemas', 'petae', '79450283', 
        2023, 2, 'Completo', 'PAqjxuKm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6274780, 'Pedro', 'López', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '67097020', 
        2020, 2, 'Completo', 'SIxNdoiJj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6971274, 'Juan', 'Flores', 'sofía@ucb.edu.bo', 
        'nan', 'Arquitectura', 'proyecto dirigido', '72288478', 
        2023, 2, 'Completo', '9Vd9fcgGV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9667277, 'Carlos', 'Flores', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'tesis de grado', '70155261', 
        2020, 1, 'Completo', 'j2UZlBYeq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8537007, 'Luis', 'Ramírez', 'ana@ucb.edu.bo', 
        'luis@hotmail.com', 'Psicología', 'examen de grado', '62426053', 
        2023, 2, 'Completo', 'EQaCABNc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8324807, 'Juan', 'Martínez', 'sofía@ucb.edu.bo', 
        'nan', 'Psicología', 'trabajo de grado', '79918287', 
        2021, 1, 'No Completo', 'YoWfxKexT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9516970, 'Pedro', 'Rodríguez', 'juan@ucb.edu.bo', 
        'nan', 'Arquitectura', 'proyecto dirigido', '62361778', 
        2021, 1, 'No Completo', 'nSCuXeO5b1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3436349, 'Juan', 'Martínez', 'carlos@ucb.edu.bo', 
        'laura@gmail.com', 'Comunicación', 'proyecto dirigido', '67039452', 
        2020, 1, 'Completo', 'mCxQuSx1l');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7211671, 'Ana', 'Flores', 'ana@ucb.edu.bo', 
        'maría@yahoo.com', 'Ingeniería de Sistemas', 'tesis de grado', '71336150', 
        2024, 2, 'Completo', '0sODH7NjqX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8055706, 'Juan', 'López', 'carmen@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'trabajo de grado', '76734880', 
        2023, 2, 'Completo', 'tdnnz3SWHN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4400250, 'Pedro', 'Ramírez', 'carlos@ucb.edu.bo', 
        'jorge@yahoo.com', 'Medicina', 'taller de grado 1 y 2', '78883694', 
        2021, 1, 'Completo', 'j1ijZgdPDo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9872307, 'Luis', 'Rodríguez', 'luis@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'proyecto dirigido', '60758238', 
        2020, 2, 'Completo', 'dN3tl09dJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6623973, 'Carmen', 'Martínez', 'maría@ucb.edu.bo', 
        'pedro@hotmail.com', 'Arquitectura', 'proyecto dirigido', '68487133', 
        2022, 1, 'Completo', 'Ag4a0jZdHb');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2989710, 'Luis', 'Sánchez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Derecho', 'graduación por diplomado', '66191857', 
        2024, 1, 'Completo', 'XVAmI1zg2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2832018, 'Ana', 'Pérez', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'graduación por diplomado', '79454538', 
        2023, 1, 'No Completo', 'jf5eMoJ2oH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7192877, 'Ana', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'tesis de grado', '76009496', 
        2020, 1, 'No Completo', '2ZHGn0csdXr3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1867682, 'Ana', 'Pérez', 'maría@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'petae', '67195338', 
        2020, 1, 'No Completo', 'l7LoT3Ml2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2415992, 'Sofía', 'González', 'juan@ucb.edu.bo', 
        'nan', 'Arquitectura', 'taller de grado 1 y 2', '60809194', 
        2023, 2, 'No Completo', 'MOUrVoLp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5603564, 'Pedro', 'González', 'ana@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '73169152', 
        2021, 2, 'Completo', '5GRpYjRR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8842050, 'Jorge', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'sofía@yahoo.com', 'Comunicación', 'trabajo de grado', '63904138', 
        2022, 1, 'Completo', 'xI9lMCQ3G');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7052003, 'Laura', 'Sánchez', 'pedro@ucb.edu.bo', 
        'nan', 'Psicología', 'graduación por diplomado', '64736127', 
        2023, 1, 'No Completo', '0bDBgFOJQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7627870, 'Pedro', 'Rodríguez', 'laura@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'tesis de grado', '64619952', 
        2022, 2, 'No Completo', 'DwP83t21N');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5792860, 'Laura', 'Sánchez', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '64184351', 
        2023, 2, 'Completo', 'kejeWiutO6M');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5199388, 'Juan', 'Martínez', 'jorge@ucb.edu.bo', 
        'ana@yahoo.com', 'Ingeniería de Sistemas', 'tesis de grado', '76886429', 
        2024, 2, 'No Completo', 'OC2dKz1eV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7224011, 'Pedro', 'Pérez', 'ana@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'examen de grado', '74555199', 
        2022, 1, 'Completo', '5ZI59zgm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4376975, 'Juan', 'Pérez', 'sofía@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '66705484', 
        2024, 2, 'No Completo', 'WwL3naqlQ2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1676003, 'Ana', 'Sánchez', 'ana@ucb.edu.bo', 
        'juan@hotmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '79911259', 
        2022, 2, 'Completo', 'SyS1V1KQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2597945, 'Carmen', 'González', 'luis@ucb.edu.bo', 
        'nan', 'Derecho', 'taller de grado 1 y 2', '67150836', 
        2024, 1, 'Completo', 'LPBXTnSTR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9472204, 'María', 'Rodríguez', 'luis@ucb.edu.bo', 
        'jorge@yahoo.com', 'Derecho', 'graduación por diplomado', '79935707', 
        2022, 2, 'Completo', 'wQ7Lh8o2F');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7967745, 'Carmen', 'Ramírez', 'juan@ucb.edu.bo', 
        'jorge@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '63928019', 
        2020, 2, 'No Completo', 'VJwJvOcYqvqh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1939863, 'Juan', 'Flores', 'luis@ucb.edu.bo', 
        'laura@gmail.com', 'Derecho', 'tesis de grado', '60162278', 
        2021, 1, 'Completo', 'C5kKyS0Y');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5351751, 'Pedro', 'Sánchez', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '63144793', 
        2021, 1, 'No Completo', 'Yr0pNrK88');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5440094, 'Juan', 'Rodríguez', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '79926038', 
        2024, 1, 'Completo', 'YwFxdOVvyu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2795727, 'Pedro', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '76831404', 
        2021, 2, 'Completo', 'wTPBWdcS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1013127, 'Ana', 'López', 'ana@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '78244141', 
        2024, 2, 'Completo', 'uYPb02XLoGka');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7836706, 'Jorge', 'Ramírez', 'ana@ucb.edu.bo', 
        'jorge@gmail.com', 'Derecho', 'proyecto dirigido', '68313071', 
        2022, 2, 'No Completo', '1r63K8Zk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1235564, 'Carlos', 'Ramírez', 'pedro@ucb.edu.bo', 
        'carmen@yahoo.com', 'Ingeniería de Sistemas', 'petae', '69902789', 
        2022, 2, 'No Completo', 'VPesN6VkC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5893176, 'Jorge', 'Pérez', 'ana@ucb.edu.bo', 
        'maría@hotmail.com', 'Comunicación', 'trabajo de grado', '71129832', 
        2023, 2, 'No Completo', 'dm2QUJPU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8285319, 'Juan', 'González', 'jorge@ucb.edu.bo', 
        'nan', 'Medicina', 'graduación por diplomado', '65924572', 
        2020, 1, 'Completo', '9H62b1vUyBKf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7086330, 'Pedro', 'González', 'carlos@ucb.edu.bo', 
        'sofía@yahoo.com', 'Medicina', 'graduación por diplomado', '68290692', 
        2022, 1, 'No Completo', 'PHR0bTms3l');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3390358, 'Juan', 'Sánchez', 'carmen@ucb.edu.bo', 
        'luis@hotmail.com', 'Comunicación', 'trabajo de grado', '62022482', 
        2022, 2, 'Completo', 'QjaU9VsT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3380821, 'Luis', 'Flores', 'ana@ucb.edu.bo', 
        'sofía@hotmail.com', 'Arquitectura', 'trabajo de grado', '79063767', 
        2022, 2, 'Completo', '1rOqgDnyxB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7084072, 'Carmen', 'Flores', 'laura@ucb.edu.bo', 
        'laura@gmail.com', 'Psicología', 'trabajo de grado', '64222683', 
        2022, 1, 'Completo', 'zP7CYAV5eklN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2335374, 'Carlos', 'Flores', 'carmen@ucb.edu.bo', 
        'carlos@hotmail.com', 'Medicina', 'examen de grado', '68176410', 
        2022, 1, 'Completo', '9bmW0zGL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9943315, 'Luis', 'Sánchez', 'sofía@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'graduación por diplomado', '70775566', 
        2024, 1, 'No Completo', 'tL1Oa7IINqP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3825247, 'Ana', 'López', 'luis@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'taller de grado 1 y 2', '64700841', 
        2023, 1, 'No Completo', 'MzjgqfVff');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3570479, 'María', 'Martínez', 'carlos@ucb.edu.bo', 
        'nan', 'Medicina', 'taller de grado 1 y 2', '73387836', 
        2022, 1, 'No Completo', 'Cb0xlrOL69');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1914022, 'Pedro', 'Flores', 'laura@ucb.edu.bo', 
        'jorge@gmail.com', 'Psicología', 'graduación por diplomado', '78965543', 
        2020, 2, 'No Completo', '4GREyNihWLA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1176005, 'María', 'Flores', 'jorge@ucb.edu.bo', 
        'jorge@hotmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '75028941', 
        2023, 2, 'No Completo', 'h7c5UOPabQh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7788258, 'Ana', 'Martínez', 'ana@ucb.edu.bo', 
        'juan@yahoo.com', 'Comunicación', 'graduación por diplomado', '65509461', 
        2020, 1, 'No Completo', 'Ucj8daKLKw4v');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3942107, 'Carmen', 'López', 'juan@ucb.edu.bo', 
        'nan', 'Comunicación', 'tesis de grado', '69970880', 
        2024, 1, 'No Completo', 'nrVQmiD9gG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1945017, 'Ana', 'Ramírez', 'carlos@ucb.edu.bo', 
        'ana@hotmail.com', 'Arquitectura', 'trabajo de grado', '64752276', 
        2020, 2, 'Completo', 'gBgeeE7OJ3F');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4445977, 'Juan', 'Ramírez', 'ana@ucb.edu.bo', 
        'nan', 'Comunicación', 'taller de grado 1 y 2', '76537712', 
        2023, 2, 'No Completo', '1nSc8lTeJFw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6956463, 'Jorge', 'Pérez', 'ana@ucb.edu.bo', 
        'pedro@yahoo.com', 'Psicología', 'examen de grado', '71770086', 
        2021, 2, 'No Completo', 'xv2iCMIVf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1177745, 'Sofía', 'Sánchez', 'luis@ucb.edu.bo', 
        'carmen@gmail.com', 'Medicina', 'tesis de grado', '64275472', 
        2021, 1, 'No Completo', 'f301ExKBXqkT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6710128, 'Laura', 'González', 'carlos@ucb.edu.bo', 
        'nan', 'Arquitectura', 'graduación por diplomado', '62494043', 
        2024, 1, 'Completo', 'UrR5BJudMg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5222474, 'Juan', 'Pérez', 'jorge@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'proyecto dirigido', '74081232', 
        2023, 2, 'Completo', 'DuTbbDST');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1559750, 'Carmen', 'Flores', 'jorge@ucb.edu.bo', 
        'ana@yahoo.com', 'Medicina', 'proyecto dirigido', '67469106', 
        2023, 2, 'No Completo', '6T1Ks5rYCWGp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9672012, 'Juan', 'Flores', 'jorge@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'graduación por diplomado', '75053047', 
        2022, 2, 'No Completo', '2zXm09QhK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2754025, 'Sofía', 'Sánchez', 'sofía@ucb.edu.bo', 
        'juan@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '66011965', 
        2020, 1, 'No Completo', 'A8C6yAGxbCp7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5435623, 'María', 'López', 'carlos@ucb.edu.bo', 
        'maría@gmail.com', 'Arquitectura', 'tesis de grado', '78232387', 
        2022, 1, 'Completo', 'NT1WHYhIJgE4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5139521, 'Sofía', 'López', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '63337511', 
        2022, 2, 'Completo', 'txWPk9oKe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2942057, 'Jorge', 'Sánchez', 'carlos@ucb.edu.bo', 
        'nan', 'Derecho', 'tesis de grado', '69321589', 
        2022, 1, 'No Completo', 'Ly5X9ufy9d');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5695459, 'Ana', 'Sánchez', 'sofía@ucb.edu.bo', 
        'sofía@hotmail.com', 'Arquitectura', 'proyecto dirigido', '75536111', 
        2021, 1, 'Completo', 'e6tHv2qAhmSn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8370057, 'Ana', 'Martínez', 'carmen@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '65645290', 
        2020, 1, 'No Completo', 'uKgqDkxyqCt1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9235856, 'María', 'González', 'ana@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'tesis de grado', '76428839', 
        2020, 1, 'Completo', 'mr6yj30r');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1865536, 'María', 'Ramírez', 'juan@ucb.edu.bo', 
        'maría@hotmail.com', 'Medicina', 'taller de grado 1 y 2', '60042566', 
        2021, 2, 'Completo', 'QQi2KYtWUC2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4278382, 'María', 'López', 'luis@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'examen de grado', '79833510', 
        2021, 2, 'Completo', 'g3taJKpHR9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3295032, 'Ana', 'López', 'maría@ucb.edu.bo', 
        'maría@yahoo.com', 'Comunicación', 'graduación por diplomado', '78042846', 
        2024, 2, 'No Completo', 'iaTxD5Nnydu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3112821, 'Luis', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'carlos@hotmail.com', 'Psicología', 'graduación por diplomado', '66965375', 
        2021, 2, 'Completo', 'caUOw6zGr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7700092, 'Pedro', 'Ramírez', 'carmen@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '67115968', 
        2024, 1, 'Completo', 'hB8c1dTBBjt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4254124, 'Sofía', 'Flores', 'luis@ucb.edu.bo', 
        'pedro@yahoo.com', 'Psicología', 'examen de grado', '61093578', 
        2022, 1, 'Completo', 'KUwrGoemI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4771150, 'Pedro', 'Flores', 'pedro@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'trabajo de grado', '68417630', 
        2020, 1, 'No Completo', 'Ebm36dFx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8732905, 'Carlos', 'Flores', 'carlos@ucb.edu.bo', 
        'juan@hotmail.com', 'Derecho', 'trabajo de grado', '60376164', 
        2021, 2, 'No Completo', 'HDNjUmXbw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4761671, 'Laura', 'Ramírez', 'sofía@ucb.edu.bo', 
        'ana@gmail.com', 'Medicina', 'trabajo de grado', '60181929', 
        2021, 2, 'Completo', 'h7YlFQyZo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6119249, 'Laura', 'López', 'pedro@ucb.edu.bo', 
        'jorge@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '65239305', 
        2020, 1, 'Completo', 'voKcqrYGDu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9670997, 'Pedro', 'Ramírez', 'ana@ucb.edu.bo', 
        'maría@hotmail.com', 'Psicología', 'petae', '71214866', 
        2021, 1, 'No Completo', 'q52swThayV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9547981, 'Ana', 'López', 'laura@ucb.edu.bo', 
        'juan@hotmail.com', 'Medicina', 'tesis de grado', '66544728', 
        2022, 1, 'No Completo', 'l6YFsfKhOLNx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3175143, 'Juan', 'López', 'pedro@ucb.edu.bo', 
        'carmen@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '61339233', 
        2022, 2, 'No Completo', 'j2N0j11yoYWM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5961103, 'Pedro', 'Ramírez', 'luis@ucb.edu.bo', 
        'jorge@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '62284384', 
        2023, 2, 'No Completo', 'zXZdJAgJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4070486, 'Juan', 'González', 'sofía@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'trabajo de grado', '75019454', 
        2022, 1, 'No Completo', 'qZ7LhchKy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6789841, 'Carmen', 'Pérez', 'jorge@ucb.edu.bo', 
        'carlos@gmail.com', 'Derecho', 'trabajo de grado', '60306155', 
        2020, 2, 'Completo', 'lOJ3eJ6Ar');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6150504, 'Sofía', 'Flores', 'maría@ucb.edu.bo', 
        'luis@hotmail.com', 'Arquitectura', 'tesis de grado', '73968648', 
        2023, 1, 'Completo', 'X32CMcqfxl');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3349709, 'Luis', 'Flores', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '77758114', 
        2022, 1, 'Completo', 'MeVeNwQcP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1642286, 'Luis', 'López', 'carmen@ucb.edu.bo', 
        'nan', 'Arquitectura', 'examen de grado', '68361579', 
        2021, 2, 'Completo', 'rZ5zsiOVeh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2662974, 'Jorge', 'Flores', 'pedro@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'petae', '76538660', 
        2020, 1, 'No Completo', 'n099mcUU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6410773, 'Laura', 'Martínez', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'petae', '76418202', 
        2020, 1, 'Completo', 'SCYzdaoL8CkB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1286052, 'Jorge', 'Martínez', 'maría@ucb.edu.bo', 
        'ana@gmail.com', 'Psicología', 'trabajo de grado', '70418982', 
        2020, 2, 'Completo', 'R9ZJ5GuSv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8567408, 'Sofía', 'Martínez', 'jorge@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'petae', '71738523', 
        2024, 1, 'Completo', 'XZmCK2uRqO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4524637, 'Pedro', 'Pérez', 'ana@ucb.edu.bo', 
        'carlos@hotmail.com', 'Derecho', 'proyecto dirigido', '79103907', 
        2023, 1, 'No Completo', '9tNgblOkcCM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4347831, 'Juan', 'Flores', 'carmen@ucb.edu.bo', 
        'ana@yahoo.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '72426340', 
        2020, 1, 'Completo', 'cee0XHjK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6399266, 'María', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '66726636', 
        2020, 1, 'Completo', 'v6Z4KY5ny');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6310257, 'Luis', 'Pérez', 'pedro@ucb.edu.bo', 
        'luis@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '65840290', 
        2022, 1, 'No Completo', '0Q7rKi35WYoK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5520903, 'Ana', 'Ramírez', 'jorge@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'trabajo de grado', '71288827', 
        2023, 2, 'Completo', 'YyPCWRKola');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5954017, 'Jorge', 'González', 'ana@ucb.edu.bo', 
        'nan', 'Psicología', 'graduación por diplomado', '72581543', 
        2022, 1, 'Completo', 'XSShBErT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7402911, 'Luis', 'Sánchez', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Derecho', 'taller de grado 1 y 2', '61587269', 
        2021, 1, 'Completo', 'jIqhqjl7zO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5104135, 'Jorge', 'Ramírez', 'luis@ucb.edu.bo', 
        'juan@gmail.com', 'Psicología', 'tesis de grado', '72991833', 
        2022, 1, 'No Completo', 'fLZxnsk31');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8815207, 'Carmen', 'López', 'carmen@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '78534509', 
        2022, 2, 'Completo', 'NzcO5yPb1nbm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7124518, 'Laura', 'Pérez', 'juan@ucb.edu.bo', 
        'pedro@hotmail.com', 'Medicina', 'graduación por diplomado', '75117714', 
        2024, 2, 'No Completo', '1ggSCprhR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6708317, 'Jorge', 'Flores', 'jorge@ucb.edu.bo', 
        'nan', 'Arquitectura', 'examen de grado', '72570638', 
        2021, 2, 'No Completo', 'oWhCZWdt870g');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2297752, 'Carlos', 'López', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Arquitectura', 'trabajo de grado', '75681315', 
        2024, 2, 'No Completo', 'A1NhGFK1YG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5215841, 'María', 'López', 'carlos@ucb.edu.bo', 
        'juan@gmail.com', 'Psicología', 'proyecto dirigido', '77603121', 
        2021, 2, 'No Completo', 'Oq4s0WHxV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5951389, 'Pedro', 'Rodríguez', 'ana@ucb.edu.bo', 
        'nan', 'Arquitectura', 'trabajo de grado', '70238469', 
        2024, 1, 'No Completo', 'jZ8agR5N8ES9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7856686, 'Luis', 'Sánchez', 'carlos@ucb.edu.bo', 
        'jorge@yahoo.com', 'Medicina', 'proyecto dirigido', '74031201', 
        2022, 2, 'Completo', 'wXb80HLv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9920011, 'Pedro', 'González', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Psicología', 'petae', '66962671', 
        2021, 2, 'Completo', 'SFH09Iz0j');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8078191, 'Carmen', 'Pérez', 'carmen@ucb.edu.bo', 
        'carmen@gmail.com', 'Comunicación', 'tesis de grado', '61164941', 
        2023, 2, 'No Completo', '0Y7BnCBaSz0o');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5688573, 'Luis', 'Sánchez', 'carlos@ucb.edu.bo', 
        'sofía@gmail.com', 'Medicina', 'taller de grado 1 y 2', '77749418', 
        2021, 1, 'No Completo', 'yhhctzNwP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5759620, 'Juan', 'González', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Arquitectura', 'tesis de grado', '73148161', 
        2022, 1, 'Completo', 'enoz6aGO6W');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7198105, 'Jorge', 'Flores', 'pedro@ucb.edu.bo', 
        'carlos@yahoo.com', 'Comunicación', 'graduación por diplomado', '74704368', 
        2022, 1, 'Completo', 'rZkoJtRkqI1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1560011, 'Ana', 'Flores', 'maría@ucb.edu.bo', 
        'luis@yahoo.com', 'Arquitectura', 'proyecto dirigido', '72674816', 
        2024, 1, 'Completo', 'qBOSinygbv8r');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7290951, 'Juan', 'López', 'maría@ucb.edu.bo', 
        'carlos@yahoo.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '67892189', 
        2024, 2, 'No Completo', 'gZgWeduv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4679801, 'Carlos', 'Sánchez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '73053729', 
        2020, 1, 'Completo', 'b4pNvlsD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3535839, 'Jorge', 'Sánchez', 'carlos@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'taller de grado 1 y 2', '72088307', 
        2020, 2, 'Completo', 'KXJScE2J');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5167567, 'Jorge', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'examen de grado', '67335509', 
        2023, 2, 'No Completo', 'myeLYrGz0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2154004, 'Luis', 'Sánchez', 'pedro@ucb.edu.bo', 
        'ana@gmail.com', 'Psicología', 'petae', '77752285', 
        2021, 2, 'Completo', 'xsIgPFYMhLU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7500457, 'Pedro', 'Ramírez', 'carmen@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'examen de grado', '73218315', 
        2020, 2, 'Completo', 'HotRoKqnI4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7441123, 'María', 'Rodríguez', 'luis@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'tesis de grado', '66193551', 
        2021, 1, 'No Completo', 'ZUC5kusoh24');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1253477, 'Luis', 'López', 'laura@ucb.edu.bo', 
        'maría@hotmail.com', 'Comunicación', 'trabajo de grado', '60650656', 
        2021, 2, 'No Completo', 'rT26GBDHOeZY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1164655, 'Ana', 'Sánchez', 'luis@ucb.edu.bo', 
        'sofía@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '78854096', 
        2023, 1, 'No Completo', 'XgbCXkU44m');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2600600, 'Ana', 'Ramírez', 'jorge@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '77929594', 
        2022, 2, 'No Completo', 'OUpsC6LzrZGe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4331712, 'Carlos', 'Martínez', 'maría@ucb.edu.bo', 
        'nan', 'Arquitectura', 'proyecto dirigido', '76496612', 
        2021, 2, 'No Completo', 'tT0KFk8U');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7923333, 'Laura', 'Ramírez', 'laura@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '63799578', 
        2024, 1, 'Completo', 'nKsLHJKpK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5180609, 'Luis', 'Ramírez', 'carmen@ucb.edu.bo', 
        'pedro@yahoo.com', 'Medicina', 'graduación por diplomado', '70842811', 
        2022, 1, 'No Completo', 'dp3Lfe6zG2hB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7191971, 'Juan', 'Rodríguez', 'ana@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'examen de grado', '78284217', 
        2022, 1, 'No Completo', 'fHNXix7Gt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5962245, 'María', 'López', 'jorge@ucb.edu.bo', 
        'jorge@hotmail.com', 'Comunicación', 'examen de grado', '79574786', 
        2022, 1, 'No Completo', 'ud5fyi1aWe3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8299501, 'Pedro', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'sofía@hotmail.com', 'Arquitectura', 'tesis de grado', '62405831', 
        2021, 2, 'No Completo', 'fy7ILXxXDxQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7272515, 'Sofía', 'López', 'pedro@ucb.edu.bo', 
        'laura@hotmail.com', 'Derecho', 'trabajo de grado', '76172060', 
        2022, 1, 'Completo', 'oB46RKJoUsjC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2171330, 'Carmen', 'Ramírez', 'luis@ucb.edu.bo', 
        'luis@hotmail.com', 'Arquitectura', 'examen de grado', '72021612', 
        2021, 1, 'No Completo', '3vvXoo2ep');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1742871, 'Sofía', 'Pérez', 'maría@ucb.edu.bo', 
        'carlos@hotmail.com', 'Arquitectura', 'graduación por diplomado', '73854681', 
        2024, 2, 'Completo', 'jJKGRzTW1G');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7764386, 'Sofía', 'Flores', 'maría@ucb.edu.bo', 
        'laura@hotmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '67100234', 
        2021, 2, 'Completo', 'O4nx0G8L7KU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4834966, 'Carlos', 'Pérez', 'carlos@ucb.edu.bo', 
        'ana@gmail.com', 'Comunicación', 'taller de grado 1 y 2', '60808229', 
        2022, 1, 'Completo', 'HwoXhGWCbQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6257470, 'Jorge', 'Sánchez', 'luis@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'proyecto dirigido', '69854017', 
        2024, 1, 'No Completo', 'edwdpywPc42');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4913528, 'Laura', 'Pérez', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Derecho', 'graduación por diplomado', '64151041', 
        2021, 2, 'No Completo', '5wFQw51Z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6618840, 'Carlos', 'Ramírez', 'carmen@ucb.edu.bo', 
        'luis@gmail.com', 'Medicina', 'graduación por diplomado', '70037769', 
        2021, 1, 'Completo', 'oRjCrglfO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9070112, 'Jorge', 'Martínez', 'ana@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'graduación por diplomado', '75861904', 
        2023, 1, 'Completo', 'unuyVlqwbluE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7246648, 'Juan', 'Pérez', 'sofía@ucb.edu.bo', 
        'carmen@gmail.com', 'Medicina', 'examen de grado', '78150978', 
        2022, 1, 'Completo', 'mKpGkN9ud2e');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7089343, 'Pedro', 'Rodríguez', 'juan@ucb.edu.bo', 
        'sofía@hotmail.com', 'Comunicación', 'graduación por diplomado', '62489389', 
        2020, 1, 'No Completo', 'L2UxVqnFm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1290757, 'Jorge', 'Martínez', 'jorge@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'petae', '67633757', 
        2024, 2, 'Completo', 'oRoh8cU11');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8009797, 'Luis', 'Martínez', 'sofía@ucb.edu.bo', 
        'laura@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '70013171', 
        2020, 2, 'No Completo', '6NlVtn13zqBm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3359669, 'Carmen', 'Sánchez', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'examen de grado', '68129093', 
        2024, 1, 'No Completo', 'E8NtkGUq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4162349, 'Juan', 'Sánchez', 'maría@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'tesis de grado', '77643160', 
        2020, 1, 'No Completo', 'UFiiWqlgCxH3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1530777, 'Laura', 'Flores', 'luis@ucb.edu.bo', 
        'jorge@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '63105361', 
        2023, 1, 'No Completo', 'lsGdCuD8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8249767, 'Juan', 'Pérez', 'juan@ucb.edu.bo', 
        'luis@hotmail.com', 'Arquitectura', 'examen de grado', '68552212', 
        2024, 1, 'Completo', '1UKnZkzgbF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5654608, 'Luis', 'Martínez', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'proyecto dirigido', '67824545', 
        2021, 2, 'No Completo', 's34CkkBdg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1730704, 'Laura', 'Rodríguez', 'laura@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'petae', '64612303', 
        2024, 2, 'Completo', 'PCJvVvOD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6746647, 'Luis', 'Martínez', 'carmen@ucb.edu.bo', 
        'pedro@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '65080856', 
        2024, 1, 'No Completo', 'k8ytmYurKinN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1551552, 'Juan', 'Ramírez', 'sofía@ucb.edu.bo', 
        'nan', 'Comunicación', 'trabajo de grado', '75269192', 
        2021, 2, 'No Completo', 'MW7HX6iC1ZS6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1745775, 'Laura', 'Sánchez', 'carmen@ucb.edu.bo', 
        'juan@hotmail.com', 'Medicina', 'petae', '69350631', 
        2022, 1, 'Completo', 'qoVeCqgz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5810190, 'Sofía', 'López', 'juan@ucb.edu.bo', 
        'pedro@yahoo.com', 'Comunicación', 'graduación por diplomado', '67002384', 
        2022, 2, 'No Completo', 'JtPzHH4ug');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4855048, 'Jorge', 'Pérez', 'luis@ucb.edu.bo', 
        'maría@hotmail.com', 'Comunicación', 'taller de grado 1 y 2', '78230092', 
        2021, 1, 'No Completo', 'peROhoEoqRc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5695195, 'Carmen', 'Martínez', 'pedro@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '74858316', 
        2023, 2, 'No Completo', 'SFEr9MhaR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4821754, 'María', 'González', 'carlos@ucb.edu.bo', 
        'nan', 'Arquitectura', 'trabajo de grado', '64332959', 
        2022, 2, 'Completo', 'nYvd0JeNuur');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6831321, 'María', 'Martínez', 'sofía@ucb.edu.bo', 
        'luis@yahoo.com', 'Comunicación', 'taller de grado 1 y 2', '76800794', 
        2020, 1, 'No Completo', 'VNFD1wgR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2257637, 'María', 'Sánchez', 'maría@ucb.edu.bo', 
        'nan', 'Medicina', 'tesis de grado', '76720538', 
        2020, 1, 'No Completo', 'fhvXqYvy51Zw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1091273, 'Luis', 'Flores', 'luis@ucb.edu.bo', 
        'juan@yahoo.com', 'Medicina', 'tesis de grado', '69973204', 
        2022, 2, 'No Completo', 'LTR6eBXdbva');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5304627, 'María', 'López', 'luis@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'proyecto dirigido', '75494360', 
        2023, 2, 'No Completo', 'k3Cv8HawAyft');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3143898, 'María', 'Rodríguez', 'luis@ucb.edu.bo', 
        'nan', 'Comunicación', 'proyecto dirigido', '63187079', 
        2023, 2, 'No Completo', 'K5dmW7euD6f');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6919918, 'Carlos', 'Ramírez', 'carlos@ucb.edu.bo', 
        'ana@gmail.com', 'Derecho', 'trabajo de grado', '62081519', 
        2021, 1, 'Completo', 'smsK7KAHR8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7613467, 'Jorge', 'López', 'pedro@ucb.edu.bo', 
        'maría@yahoo.com', 'Derecho', 'trabajo de grado', '63191997', 
        2024, 2, 'Completo', 'rShcJtA1FdMM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2447800, 'Carlos', 'Pérez', 'ana@ucb.edu.bo', 
        'jorge@gmail.com', 'Medicina', 'tesis de grado', '65776929', 
        2021, 1, 'No Completo', 'Ulyjox5xt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1421687, 'Luis', 'González', 'carlos@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'proyecto dirigido', '62752630', 
        2023, 2, 'Completo', 'Pb6a7txbRoJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9790614, 'Carmen', 'Flores', 'sofía@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '60678004', 
        2024, 1, 'Completo', '0oIkfwITMf1T');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3878833, 'Juan', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'tesis de grado', '71612155', 
        2021, 2, 'Completo', '25MLQHaQrU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6690562, 'Juan', 'Sánchez', 'juan@ucb.edu.bo', 
        'luis@hotmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '75308609', 
        2023, 1, 'Completo', 'AX8qn3U6u0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5330549, 'Luis', 'López', 'maría@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'proyecto dirigido', '60987447', 
        2022, 1, 'No Completo', 'nSiLySce8hIH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4095371, 'Juan', 'López', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '63603736', 
        2021, 2, 'Completo', 'gP3A4nb8YC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6929894, 'Luis', 'Flores', 'juan@ucb.edu.bo', 
        'carmen@gmail.com', 'Ingeniería de Sistemas', 'petae', '77858333', 
        2022, 1, 'Completo', 'TAml3sLkD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4367458, 'Laura', 'López', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Derecho', 'taller de grado 1 y 2', '76551323', 
        2021, 2, 'No Completo', 'dWPVSqGj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7812583, 'Ana', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'nan', 'Derecho', 'tesis de grado', '73129478', 
        2020, 2, 'No Completo', '8wsSMVzR9C1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5845614, 'Luis', 'Ramírez', 'jorge@ucb.edu.bo', 
        'juan@gmail.com', 'Arquitectura', 'proyecto dirigido', '66679204', 
        2022, 2, 'Completo', 'SzvoktB1l');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7933374, 'Sofía', 'Martínez', 'juan@ucb.edu.bo', 
        'laura@yahoo.com', 'Medicina', 'tesis de grado', '63934241', 
        2020, 1, 'Completo', 'w7iECpVEG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1383014, 'Luis', 'Pérez', 'laura@ucb.edu.bo', 
        'ana@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '61600997', 
        2022, 2, 'Completo', 'hwmvWemt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6279699, 'Carlos', 'Rodríguez', 'juan@ucb.edu.bo', 
        'carmen@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '75118082', 
        2023, 2, 'No Completo', 'THHduPjPyBN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9529683, 'Carlos', 'Ramírez', 'juan@ucb.edu.bo', 
        'jorge@hotmail.com', 'Medicina', 'proyecto dirigido', '77945792', 
        2023, 2, 'Completo', 'XfghqBseWPK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4131566, 'Ana', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '61967009', 
        2023, 1, 'No Completo', 'BJu1wiAms');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9604271, 'Jorge', 'Martínez', 'carmen@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '77739716', 
        2021, 2, 'No Completo', 'E36GGKQGUM4b');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4779329, 'Juan', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'sofía@yahoo.com', 'Medicina', 'proyecto dirigido', '67178872', 
        2020, 2, 'No Completo', 'JfcWNkgm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8870404, 'Pedro', 'Ramírez', 'pedro@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '75752867', 
        2022, 1, 'No Completo', 'UpGIkn5Gy7of');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6996779, 'María', 'Flores', 'sofía@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'tesis de grado', '76184201', 
        2024, 2, 'Completo', 'HzpNuCSj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9764886, 'Laura', 'Martínez', 'maría@ucb.edu.bo', 
        'carmen@gmail.com', 'Comunicación', 'graduación por diplomado', '65463706', 
        2024, 1, 'Completo', 'csCPcwHPYP1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2732839, 'María', 'González', 'carmen@ucb.edu.bo', 
        'laura@gmail.com', 'Medicina', 'petae', '77543559', 
        2024, 1, 'No Completo', 'eG8DFtYi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4044483, 'Luis', 'González', 'pedro@ucb.edu.bo', 
        'carlos@hotmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '68723485', 
        2020, 1, 'No Completo', 'Ci2yexHI2p4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2227916, 'Jorge', 'Sánchez', 'jorge@ucb.edu.bo', 
        'juan@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '67981404', 
        2020, 2, 'No Completo', 'cME4vskn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9367705, 'Luis', 'Rodríguez', 'luis@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'proyecto dirigido', '73186741', 
        2021, 1, 'No Completo', 'Vzd1JqXzCE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3552136, 'Juan', 'Ramírez', 'jorge@ucb.edu.bo', 
        'pedro@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '64892758', 
        2024, 2, 'Completo', 'iCG0BkmK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1485945, 'Juan', 'González', 'juan@ucb.edu.bo', 
        'carlos@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '70428051', 
        2023, 1, 'Completo', 'LKFksN9f');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4372782, 'Jorge', 'Flores', 'ana@ucb.edu.bo', 
        'jorge@hotmail.com', 'Psicología', 'tesis de grado', '69879172', 
        2022, 1, 'No Completo', 'mGYoHc9VkU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9639980, 'María', 'Flores', 'carmen@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'proyecto dirigido', '75339118', 
        2024, 2, 'Completo', 'BocrHgEFpF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6255768, 'Juan', 'Ramírez', 'carlos@ucb.edu.bo', 
        'maría@yahoo.com', 'Medicina', 'examen de grado', '66517964', 
        2020, 2, 'Completo', 'rhl9I2Qr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1689550, 'Laura', 'Flores', 'ana@ucb.edu.bo', 
        'jorge@hotmail.com', 'Psicología', 'tesis de grado', '75637085', 
        2020, 1, 'Completo', 'h5nTaBEc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8463566, 'Luis', 'Ramírez', 'luis@ucb.edu.bo', 
        'juan@hotmail.com', 'Derecho', 'proyecto dirigido', '70853213', 
        2023, 2, 'Completo', 'ONnjHxmte0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3896294, 'Luis', 'Sánchez', 'maría@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'examen de grado', '65505507', 
        2021, 1, 'No Completo', 'nGfilxdKH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7953611, 'Carlos', 'Flores', 'pedro@ucb.edu.bo', 
        'maría@gmail.com', 'Derecho', 'proyecto dirigido', '79542459', 
        2022, 2, 'No Completo', 'QuadydSH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2263025, 'María', 'Pérez', 'laura@ucb.edu.bo', 
        'laura@gmail.com', 'Comunicación', 'examen de grado', '73728334', 
        2020, 1, 'Completo', '61J5oA88bt68');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4456898, 'Ana', 'Flores', 'ana@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '72886842', 
        2024, 2, 'Completo', '9FAvg30V8xE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6080062, 'Carmen', 'Rodríguez', 'laura@ucb.edu.bo', 
        'luis@yahoo.com', 'Medicina', 'proyecto dirigido', '69185634', 
        2024, 1, 'Completo', 'LRRJ4Ft6GO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4060082, 'Jorge', 'Sánchez', 'ana@ucb.edu.bo', 
        'maría@yahoo.com', 'Ingeniería de Sistemas', 'examen de grado', '67414256', 
        2023, 1, 'No Completo', 'b115Qnxd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2824187, 'Carmen', 'Pérez', 'pedro@ucb.edu.bo', 
        'sofía@gmail.com', 'Medicina', 'petae', '79229933', 
        2020, 1, 'Completo', 'HxdW3HVFmK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9902604, 'Jorge', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'laura@hotmail.com', 'Derecho', 'proyecto dirigido', '61199202', 
        2023, 2, 'Completo', 'Hh4V0Tz3dKT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6583602, 'Jorge', 'Flores', 'luis@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'proyecto dirigido', '64209196', 
        2024, 2, 'No Completo', 'OFf6H9Uv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6567057, 'Jorge', 'Martínez', 'laura@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '69892566', 
        2024, 2, 'Completo', 'idtiGeKg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5571895, 'María', 'Ramírez', 'juan@ucb.edu.bo', 
        'maría@yahoo.com', 'Medicina', 'petae', '60582673', 
        2021, 2, 'No Completo', '0twCdGQQOWYG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6726179, 'Pedro', 'López', 'juan@ucb.edu.bo', 
        'laura@hotmail.com', 'Arquitectura', 'taller de grado 1 y 2', '79242277', 
        2023, 2, 'No Completo', 'oqgTOqUeP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3604193, 'Juan', 'Sánchez', 'maría@ucb.edu.bo', 
        'maría@gmail.com', 'Medicina', 'graduación por diplomado', '67476831', 
        2020, 1, 'No Completo', 'aDfn9Z1Z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3423812, 'Jorge', 'Pérez', 'juan@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'tesis de grado', '68959892', 
        2021, 2, 'Completo', 'zZpCt0JEGO1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1950831, 'Carlos', 'Martínez', 'jorge@ucb.edu.bo', 
        'nan', 'Medicina', 'examen de grado', '72929840', 
        2023, 1, 'Completo', '1GxBCRE3h');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6077359, 'Sofía', 'González', 'laura@ucb.edu.bo', 
        'sofía@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '70739849', 
        2020, 2, 'No Completo', 'X0WYg0QTF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3473855, 'Laura', 'González', 'jorge@ucb.edu.bo', 
        'pedro@yahoo.com', 'Comunicación', 'proyecto dirigido', '78690503', 
        2021, 2, 'Completo', 'rOiHWU5tCcRM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9467585, 'Luis', 'Sánchez', 'sofía@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'trabajo de grado', '69062641', 
        2021, 2, 'Completo', 'KNNv5ZeEVXQY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7124088, 'Juan', 'Martínez', 'ana@ucb.edu.bo', 
        'ana@yahoo.com', 'Psicología', 'examen de grado', '67255210', 
        2022, 1, 'Completo', 'PfshGdaZ30jd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2431615, 'Pedro', 'Pérez', 'juan@ucb.edu.bo', 
        'pedro@gmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '74165499', 
        2024, 1, 'Completo', 'CEkZqZ4UJ5h');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2785990, 'Carlos', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'taller de grado 1 y 2', '78479763', 
        2021, 1, 'No Completo', 'dJtyQUO9C3G');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5092678, 'Carlos', 'Pérez', 'laura@ucb.edu.bo', 
        'pedro@hotmail.com', 'Arquitectura', 'proyecto dirigido', '67527959', 
        2024, 1, 'Completo', '6L0GEgqNklK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2132073, 'Jorge', 'Pérez', 'sofía@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '61010258', 
        2022, 1, 'No Completo', '6v7ycRDhh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8041640, 'Pedro', 'Martínez', 'juan@ucb.edu.bo', 
        'carmen@yahoo.com', 'Psicología', 'petae', '68968198', 
        2021, 2, 'No Completo', 'kQhcNTOnJu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7535712, 'María', 'González', 'juan@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'tesis de grado', '75442400', 
        2020, 1, 'No Completo', 'PXPXdh0R');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1207348, 'Jorge', 'Pérez', 'laura@ucb.edu.bo', 
        'jorge@hotmail.com', 'Comunicación', 'examen de grado', '70120365', 
        2022, 2, 'No Completo', '29LZ8TiCTyTi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3893772, 'María', 'Martínez', 'luis@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'examen de grado', '64860298', 
        2024, 2, 'No Completo', 'GekzYOgKI8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6788179, 'María', 'López', 'sofía@ucb.edu.bo', 
        'maría@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '72623262', 
        2023, 2, 'Completo', 'nH1v3tr100');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6437176, 'Sofía', 'Sánchez', 'jorge@ucb.edu.bo', 
        'jorge@hotmail.com', 'Arquitectura', 'examen de grado', '61131193', 
        2022, 1, 'No Completo', 'kYW6Fh3b4r2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8052580, 'Ana', 'Sánchez', 'carmen@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'petae', '79651473', 
        2022, 2, 'No Completo', 'NIkHQEW5rI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7075153, 'Sofía', 'Ramírez', 'luis@ucb.edu.bo', 
        'luis@hotmail.com', 'Derecho', 'tesis de grado', '61512247', 
        2020, 2, 'Completo', 'TIPiQ17kP8kq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7426203, 'Sofía', 'Pérez', 'carlos@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'trabajo de grado', '73876791', 
        2022, 2, 'No Completo', 'xXHask3By05C');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8312095, 'Ana', 'López', 'carlos@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '64872232', 
        2021, 2, 'No Completo', 'VZCurVwe0Wm4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2351278, 'Luis', 'Ramírez', 'maría@ucb.edu.bo', 
        'ana@yahoo.com', 'Medicina', 'tesis de grado', '65748374', 
        2023, 1, 'No Completo', 'ExVkkhjdEtHN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7432030, 'Laura', 'Martínez', 'maría@ucb.edu.bo', 
        'sofía@gmail.com', 'Psicología', 'tesis de grado', '70217655', 
        2021, 2, 'Completo', '5x7zQU1Lj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5793810, 'Luis', 'López', 'ana@ucb.edu.bo', 
        'jorge@hotmail.com', 'Medicina', 'trabajo de grado', '61388591', 
        2023, 1, 'No Completo', 'snpVWagBSy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7597275, 'Juan', 'González', 'carlos@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '73501963', 
        2024, 1, 'Completo', 'xfUuoeRnZNQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4064538, 'Laura', 'Ramírez', 'jorge@ucb.edu.bo', 
        'luis@hotmail.com', 'Medicina', 'examen de grado', '60990285', 
        2021, 2, 'No Completo', 'BQc8NcjKlc0x');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8008858, 'Juan', 'Rodríguez', 'laura@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '78074447', 
        2024, 2, 'No Completo', '9IqliGm1vVZW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8208297, 'Carmen', 'Flores', 'sofía@ucb.edu.bo', 
        'carlos@hotmail.com', 'Psicología', 'petae', '76191693', 
        2021, 2, 'No Completo', 'm3Eiy7qwY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6032468, 'Carmen', 'Pérez', 'juan@ucb.edu.bo', 
        'nan', 'Medicina', 'tesis de grado', '77718210', 
        2023, 2, 'Completo', 'aIgYTGuFD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8971959, 'Sofía', 'Rodríguez', 'laura@ucb.edu.bo', 
        'luis@hotmail.com', 'Derecho', 'proyecto dirigido', '63766592', 
        2023, 1, 'Completo', 'ujxNcSN1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3412426, 'Sofía', 'Ramírez', 'sofía@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'examen de grado', '72650610', 
        2021, 1, 'No Completo', 'jTnGh89If');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9377211, 'Pedro', 'González', 'sofía@ucb.edu.bo', 
        'nan', 'Arquitectura', 'trabajo de grado', '63222968', 
        2024, 2, 'Completo', 'zdlv1YZ2RBs');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3395470, 'Jorge', 'González', 'luis@ucb.edu.bo', 
        'sofía@yahoo.com', 'Psicología', 'petae', '62797317', 
        2023, 2, 'No Completo', 'AVm6zY3A');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9872218, 'Carmen', 'Rodríguez', 'laura@ucb.edu.bo', 
        'ana@gmail.com', 'Medicina', 'proyecto dirigido', '73751986', 
        2023, 2, 'Completo', 'bxLhzxto');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1061398, 'Luis', 'Flores', 'jorge@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '74634081', 
        2020, 1, 'Completo', '9dRwhTqB6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3843524, 'Laura', 'Sánchez', 'carlos@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'examen de grado', '73196234', 
        2021, 2, 'No Completo', 'wM1CRLKl2XM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6514536, 'Pedro', 'Flores', 'juan@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'petae', '66096426', 
        2023, 2, 'No Completo', 'pGhMoGfgBCN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4186369, 'Luis', 'Rodríguez', 'maría@ucb.edu.bo', 
        'carmen@gmail.com', 'Psicología', 'petae', '72225889', 
        2022, 1, 'Completo', 'X3PWWnaL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6072756, 'Carlos', 'Pérez', 'ana@ucb.edu.bo', 
        'carlos@hotmail.com', 'Arquitectura', 'examen de grado', '71205558', 
        2023, 1, 'Completo', 'RwrauEPvsL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4357448, 'Ana', 'Martínez', 'sofía@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '65682862', 
        2020, 1, 'Completo', 'eVVo8DbV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9469476, 'Laura', 'Flores', 'juan@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'tesis de grado', '75077437', 
        2024, 1, 'Completo', 'qOfmUwqeq2f');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6144878, 'Luis', 'Ramírez', 'ana@ucb.edu.bo', 
        'maría@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '62226486', 
        2021, 2, 'No Completo', 'VwE0qwJvSh5p');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2619933, 'Luis', 'Ramírez', 'maría@ucb.edu.bo', 
        'juan@gmail.com', 'Ingeniería de Sistemas', 'petae', '66800670', 
        2024, 1, 'Completo', 'oRs3L39eV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3491179, 'Jorge', 'Ramírez', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '69474826', 
        2022, 1, 'No Completo', '0TP0MToSeSg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9667918, 'Laura', 'Sánchez', 'jorge@ucb.edu.bo', 
        'pedro@hotmail.com', 'Arquitectura', 'tesis de grado', '78903484', 
        2022, 2, 'Completo', 'tkzkQJJdIi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6909339, 'Juan', 'González', 'luis@ucb.edu.bo', 
        'laura@yahoo.com', 'Comunicación', 'trabajo de grado', '77402490', 
        2024, 2, 'Completo', '3o6stz2k');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9191463, 'Jorge', 'González', 'juan@ucb.edu.bo', 
        'nan', 'Medicina', 'taller de grado 1 y 2', '71857115', 
        2021, 2, 'Completo', 'sJ4CZds5wk1Z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5813217, 'Carlos', 'López', 'maría@ucb.edu.bo', 
        'sofía@gmail.com', 'Medicina', 'proyecto dirigido', '64565018', 
        2020, 2, 'Completo', 'DHrMtUEw7uN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1457322, 'Laura', 'Pérez', 'sofía@ucb.edu.bo', 
        'nan', 'Psicología', 'trabajo de grado', '72505705', 
        2023, 2, 'No Completo', 'gyl35p90');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7458467, 'Pedro', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'laura@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '69974466', 
        2022, 2, 'No Completo', '0IbpdYQy5YE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6519734, 'Ana', 'Sánchez', 'maría@ucb.edu.bo', 
        'maría@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '61994837', 
        2023, 1, 'No Completo', '5U2MQWczLD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2318190, 'Jorge', 'Pérez', 'juan@ucb.edu.bo', 
        'jorge@gmail.com', 'Derecho', 'proyecto dirigido', '73004234', 
        2022, 2, 'Completo', 'vXveVg49lO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9022575, 'Ana', 'López', 'carlos@ucb.edu.bo', 
        'laura@yahoo.com', 'Comunicación', 'taller de grado 1 y 2', '69579731', 
        2021, 2, 'No Completo', 'GkDfqGljIS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1829633, 'Laura', 'Ramírez', 'pedro@ucb.edu.bo', 
        'juan@yahoo.com', 'Medicina', 'examen de grado', '61410280', 
        2022, 2, 'Completo', 'heWYLN9v');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6293420, 'Laura', 'Ramírez', 'luis@ucb.edu.bo', 
        'maría@yahoo.com', 'Derecho', 'graduación por diplomado', '69773837', 
        2023, 2, 'No Completo', 'eezPo5SE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7233271, 'Juan', 'González', 'luis@ucb.edu.bo', 
        'carlos@hotmail.com', 'Derecho', 'taller de grado 1 y 2', '65886147', 
        2021, 1, 'No Completo', 'TZhcSz3u');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4042315, 'Carlos', 'Flores', 'ana@ucb.edu.bo', 
        'pedro@hotmail.com', 'Ingeniería de Sistemas', 'petae', '79361380', 
        2021, 1, 'Completo', 'LuzgmRL6LTO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4199429, 'María', 'Pérez', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '71023857', 
        2023, 2, 'No Completo', 'Adw69KRcUr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2261634, 'Sofía', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'luis@gmail.com', 'Arquitectura', 'tesis de grado', '78642315', 
        2024, 1, 'Completo', 'pr6zdKj8du5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2492289, 'Jorge', 'López', 'pedro@ucb.edu.bo', 
        'luis@hotmail.com', 'Psicología', 'examen de grado', '72875380', 
        2020, 1, 'Completo', 'BSCdy21asEU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5773705, 'Pedro', 'Ramírez', 'jorge@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'taller de grado 1 y 2', '66054697', 
        2021, 2, 'Completo', 'sPcewOsoowx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8154335, 'Juan', 'López', 'ana@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '70894832', 
        2021, 1, 'No Completo', '62BJBkBoq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6292149, 'Ana', 'Martínez', 'juan@ucb.edu.bo', 
        'sofía@gmail.com', 'Arquitectura', 'examen de grado', '69146218', 
        2020, 1, 'Completo', 'uhdUhxwX2S0v');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6698014, 'Luis', 'González', 'ana@ucb.edu.bo', 
        'juan@yahoo.com', 'Comunicación', 'tesis de grado', '63539917', 
        2023, 2, 'No Completo', 'TfXSl7AiFK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8016714, 'Carmen', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'pedro@hotmail.com', 'Ingeniería de Sistemas', 'petae', '72638271', 
        2022, 1, 'Completo', 'SNZnHYvaG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1541641, 'Laura', 'González', 'juan@ucb.edu.bo', 
        'nan', 'Arquitectura', 'taller de grado 1 y 2', '63583834', 
        2023, 2, 'No Completo', '2tBkF7VO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4485717, 'Ana', 'López', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'tesis de grado', '76380640', 
        2023, 2, 'Completo', '5XJ38E87r1UO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5714535, 'Juan', 'Sánchez', 'luis@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'petae', '63526720', 
        2021, 1, 'Completo', 'K9JAJPY9EjK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1080829, 'María', 'González', 'sofía@ucb.edu.bo', 
        'luis@yahoo.com', 'Medicina', 'trabajo de grado', '74233221', 
        2021, 2, 'Completo', '7Jm1mYDJad');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4836108, 'Jorge', 'López', 'carmen@ucb.edu.bo', 
        'maría@hotmail.com', 'Psicología', 'tesis de grado', '63574260', 
        2021, 2, 'No Completo', 'WzsMQkjfqq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2675676, 'Carlos', 'González', 'jorge@ucb.edu.bo', 
        'maría@yahoo.com', 'Comunicación', 'tesis de grado', '75010003', 
        2023, 2, 'No Completo', 'igQ8R1v5O');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9369892, 'Juan', 'Ramírez', 'carmen@ucb.edu.bo', 
        'laura@gmail.com', 'Comunicación', 'graduación por diplomado', '62029267', 
        2022, 1, 'No Completo', 'aHMvIhbkav');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5814429, 'Ana', 'Sánchez', 'carlos@ucb.edu.bo', 
        'pedro@gmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '69314220', 
        2021, 1, 'No Completo', '2xbou1Dyt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3261039, 'Laura', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'laura@yahoo.com', 'Medicina', 'proyecto dirigido', '64394553', 
        2021, 1, 'Completo', 'yT7lHHV33Vkd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9616982, 'Carlos', 'Martínez', 'maría@ucb.edu.bo', 
        'jorge@yahoo.com', 'Medicina', 'examen de grado', '79662256', 
        2020, 1, 'Completo', '13hNoQWd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5808229, 'Laura', 'Pérez', 'maría@ucb.edu.bo', 
        'maría@gmail.com', 'Medicina', 'trabajo de grado', '77154646', 
        2022, 1, 'No Completo', 'ryItNEmuS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5617152, 'Sofía', 'Ramírez', 'carlos@ucb.edu.bo', 
        'ana@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '62719311', 
        2020, 2, 'Completo', 'nBs3IQlNi3u');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2595330, 'Jorge', 'Flores', 'jorge@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'petae', '72969234', 
        2020, 2, 'Completo', 'dw3lseRVV7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1584452, 'Pedro', 'Pérez', 'jorge@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'tesis de grado', '70520987', 
        2022, 1, 'No Completo', 'Os2hADfND0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6414273, 'Juan', 'Martínez', 'maría@ucb.edu.bo', 
        'ana@yahoo.com', 'Arquitectura', 'tesis de grado', '65933189', 
        2022, 1, 'No Completo', 'py38GpKFZCx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8651829, 'Jorge', 'Ramírez', 'carlos@ucb.edu.bo', 
        'ana@hotmail.com', 'Medicina', 'trabajo de grado', '77020401', 
        2024, 1, 'Completo', 'JXeC7iKmd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3171345, 'Luis', 'López', 'sofía@ucb.edu.bo', 
        'sofía@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '62147995', 
        2020, 1, 'Completo', 'QCff4zIbTp3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5509838, 'María', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'nan', 'Psicología', 'proyecto dirigido', '65567872', 
        2021, 2, 'No Completo', '2xYopgrocE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1284255, 'Pedro', 'Sánchez', 'maría@ucb.edu.bo', 
        'laura@gmail.com', 'Medicina', 'petae', '65832869', 
        2022, 2, 'No Completo', 'nkE1EIlAl');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9282096, 'Sofía', 'López', 'carmen@ucb.edu.bo', 
        'nan', 'Medicina', 'trabajo de grado', '79323936', 
        2024, 1, 'Completo', 'wjfxRjB3H8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8427766, 'Carlos', 'Rodríguez', 'maría@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'petae', '70807367', 
        2022, 2, 'No Completo', '4OlyiII5i');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6994651, 'Laura', 'Martínez', 'carlos@ucb.edu.bo', 
        'juan@hotmail.com', 'Derecho', 'tesis de grado', '60492460', 
        2020, 1, 'Completo', '1Ddf0oVUnI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3129568, 'María', 'López', 'laura@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'trabajo de grado', '60671437', 
        2022, 1, 'No Completo', 'F8opzTGRL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3878128, 'Sofía', 'López', 'maría@ucb.edu.bo', 
        'juan@gmail.com', 'Comunicación', 'tesis de grado', '73883899', 
        2024, 1, 'Completo', 'OrzgH2hFZk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2524294, 'Carmen', 'Sánchez', 'juan@ucb.edu.bo', 
        'nan', 'Comunicación', 'petae', '72575457', 
        2023, 1, 'Completo', 'HdFf9Jk0HP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2723402, 'Carmen', 'González', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'tesis de grado', '63676515', 
        2022, 2, 'No Completo', 'Q9oFOjW0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2218645, 'Jorge', 'Pérez', 'ana@ucb.edu.bo', 
        'nan', 'Comunicación', 'tesis de grado', '71931094', 
        2024, 1, 'No Completo', 'L7Smu0di');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5181725, 'Jorge', 'Sánchez', 'carlos@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '79785622', 
        2021, 2, 'No Completo', 'Me4Mi2Rq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2969425, 'María', 'Pérez', 'jorge@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'tesis de grado', '66284972', 
        2023, 1, 'Completo', '0bOZUfBJXYNf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8897112, 'Sofía', 'Rodríguez', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '65028496', 
        2020, 1, 'Completo', 'Jhg5A0Jzf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5447164, 'Carmen', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'trabajo de grado', '61014611', 
        2024, 1, 'Completo', 'tNWa5VoVWH2X');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3059643, 'Carlos', 'Rodríguez', 'laura@ucb.edu.bo', 
        'jorge@hotmail.com', 'Comunicación', 'taller de grado 1 y 2', '64316517', 
        2021, 2, 'Completo', 'Z7o3wRJVtvD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1965996, 'Carlos', 'Rodríguez', 'carlos@ucb.edu.bo', 
        'maría@yahoo.com', 'Medicina', 'examen de grado', '67732328', 
        2020, 1, 'No Completo', 'YL38Gyirmtb');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2015703, 'Jorge', 'Pérez', 'carmen@ucb.edu.bo', 
        'nan', 'Psicología', 'tesis de grado', '71075340', 
        2023, 2, 'Completo', 'N0Tp6dLy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9346738, 'Laura', 'López', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Medicina', 'tesis de grado', '63742473', 
        2020, 2, 'Completo', 'MxgBcFLy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5357277, 'María', 'Pérez', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Comunicación', 'graduación por diplomado', '74780729', 
        2023, 1, 'No Completo', '1NWNAblE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6580046, 'Juan', 'Flores', 'carmen@ucb.edu.bo', 
        'nan', 'Psicología', 'trabajo de grado', '78734704', 
        2023, 2, 'No Completo', 'qEV7w8hOG8u');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6782291, 'María', 'Pérez', 'maría@ucb.edu.bo', 
        'ana@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '78920508', 
        2020, 2, 'No Completo', '7MZuf297BvH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8772093, 'María', 'Ramírez', 'ana@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'trabajo de grado', '63763353', 
        2022, 1, 'No Completo', 'ch02LTV5XMtj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7248143, 'Carlos', 'Pérez', 'sofía@ucb.edu.bo', 
        'luis@yahoo.com', 'Arquitectura', 'tesis de grado', '65863171', 
        2024, 2, 'No Completo', 'D2FmnC4CdSv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8011848, 'Jorge', 'Ramírez', 'maría@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'graduación por diplomado', '75951262', 
        2022, 1, 'Completo', 'QlQGqIZb3E');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2378700, 'Pedro', 'Ramírez', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Psicología', 'tesis de grado', '78968692', 
        2020, 1, 'No Completo', 'bgW48GS7QFB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4088905, 'Carmen', 'Martínez', 'carmen@ucb.edu.bo', 
        'ana@gmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '73170172', 
        2022, 1, 'Completo', '3Rz59hZB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9772707, 'Sofía', 'Pérez', 'carlos@ucb.edu.bo', 
        'nan', 'Comunicación', 'examen de grado', '61940658', 
        2022, 1, 'No Completo', 'A2F9Q5rU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5822135, 'Luis', 'Martínez', 'luis@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '66991850', 
        2023, 2, 'Completo', 't7WyIZoixz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7408169, 'Sofía', 'Sánchez', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'tesis de grado', '76199581', 
        2022, 1, 'Completo', 'gLedCus4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3018603, 'Laura', 'Ramírez', 'jorge@ucb.edu.bo', 
        'luis@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '79933457', 
        2024, 2, 'Completo', 'Q3rZTXLo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7192370, 'Pedro', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'tesis de grado', '62027492', 
        2021, 1, 'No Completo', 'roxljmDGVw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6275477, 'Carlos', 'Ramírez', 'carlos@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'examen de grado', '75242712', 
        2020, 1, 'Completo', '1X7zMv2GIbkT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4149232, 'Luis', 'Flores', 'ana@ucb.edu.bo', 
        'carlos@yahoo.com', 'Psicología', 'petae', '79181390', 
        2022, 2, 'No Completo', 'NcJsJ7DM3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4245855, 'Sofía', 'López', 'jorge@ucb.edu.bo', 
        'maría@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '75535508', 
        2024, 1, 'No Completo', 'idvaS4rplrWA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3427680, 'Luis', 'Ramírez', 'jorge@ucb.edu.bo', 
        'juan@gmail.com', 'Derecho', 'petae', '72413629', 
        2021, 2, 'Completo', 'MCjXzOqdLA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1174630, 'Ana', 'Sánchez', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'tesis de grado', '75785411', 
        2023, 1, 'No Completo', '5pYQiznF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5673436, 'Pedro', 'Flores', 'maría@ucb.edu.bo', 
        'jorge@hotmail.com', 'Derecho', 'tesis de grado', '75550109', 
        2024, 1, 'No Completo', '3xDozUJ9XY9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6926670, 'Luis', 'Ramírez', 'jorge@ucb.edu.bo', 
        'maría@gmail.com', 'Derecho', 'tesis de grado', '65232814', 
        2021, 2, 'No Completo', '3iMGY5kzyfl');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3340787, 'Pedro', 'Ramírez', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Arquitectura', 'petae', '65691168', 
        2021, 2, 'Completo', 'KyiSYTLQtte');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7817775, 'Pedro', 'Flores', 'laura@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'tesis de grado', '71535986', 
        2024, 1, 'Completo', 'rjUXNHHse8F');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4899124, 'Jorge', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '76766538', 
        2021, 1, 'No Completo', 'isLCuMmP3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4702616, 'Pedro', 'Rodríguez', 'maría@ucb.edu.bo', 
        'maría@hotmail.com', 'Psicología', 'examen de grado', '75358613', 
        2022, 1, 'Completo', 'gQG2IudjYc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5601637, 'Carmen', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Comunicación', 'examen de grado', '73096631', 
        2024, 1, 'No Completo', 'rtDYDZwx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2729870, 'Carlos', 'González', 'carlos@ucb.edu.bo', 
        'jorge@hotmail.com', 'Comunicación', 'examen de grado', '69692589', 
        2023, 1, 'No Completo', '8YOJKqid8Eps');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4093083, 'Carlos', 'Ramírez', 'luis@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'tesis de grado', '67751736', 
        2022, 1, 'Completo', '7uuZnTIAn7y');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2870307, 'Jorge', 'Martínez', 'pedro@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '68013076', 
        2022, 2, 'No Completo', 'byN5U84FRcUo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1934376, 'Ana', 'González', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '60016656', 
        2022, 1, 'No Completo', 'b52xAMDeQbWA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2024703, 'Laura', 'López', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '64036189', 
        2021, 1, 'No Completo', 'Ynz763EvgV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8071022, 'Luis', 'González', 'jorge@ucb.edu.bo', 
        'luis@hotmail.com', 'Ingeniería de Sistemas', 'petae', '75099128', 
        2024, 1, 'Completo', '4p03WqqB3D');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5932511, 'Pedro', 'González', 'luis@ucb.edu.bo', 
        'jorge@gmail.com', 'Derecho', 'proyecto dirigido', '61177599', 
        2021, 1, 'Completo', 'POaISAhDSx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2029086, 'Carmen', 'González', 'pedro@ucb.edu.bo', 
        'ana@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '62676626', 
        2020, 1, 'No Completo', 'l0MJJbKr35p');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9763460, 'Laura', 'Ramírez', 'carmen@ucb.edu.bo', 
        'laura@yahoo.com', 'Psicología', 'graduación por diplomado', '61058753', 
        2021, 2, 'No Completo', 'ftK40fREu1Bf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8036332, 'Luis', 'González', 'carmen@ucb.edu.bo', 
        'carlos@hotmail.com', 'Arquitectura', 'petae', '75116019', 
        2022, 1, 'No Completo', 'woHz6n98112W');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5483471, 'Pedro', 'Flores', 'maría@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'petae', '73158425', 
        2023, 1, 'No Completo', '1MGvQBbmh9IB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3110354, 'Ana', 'Pérez', 'carlos@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'proyecto dirigido', '76969637', 
        2021, 2, 'No Completo', 'K6SZ3ccwNzwY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7058463, 'Juan', 'Martínez', 'pedro@ucb.edu.bo', 
        'luis@yahoo.com', 'Comunicación', 'petae', '70682956', 
        2020, 2, 'No Completo', 'iPxhuIA5Dr3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2818753, 'Juan', 'Ramírez', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Derecho', 'taller de grado 1 y 2', '68497679', 
        2021, 1, 'No Completo', 'X49OcZXTS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4900540, 'Ana', 'Flores', 'juan@ucb.edu.bo', 
        'carmen@hotmail.com', 'Arquitectura', 'graduación por diplomado', '65892895', 
        2020, 2, 'Completo', 'QH8UGcSrNZ9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1938292, 'María', 'Sánchez', 'maría@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'graduación por diplomado', '64586746', 
        2021, 2, 'No Completo', 'Xvsbkjiuxtym');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8100654, 'Ana', 'Flores', 'luis@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'taller de grado 1 y 2', '69086170', 
        2023, 1, 'No Completo', 'HcLU2Jspk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4616076, 'Laura', 'Sánchez', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Psicología', 'petae', '76044918', 
        2021, 1, 'Completo', 'JGCY9ZaIpO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6758586, 'María', 'Rodríguez', 'luis@ucb.edu.bo', 
        'ana@hotmail.com', 'Arquitectura', 'proyecto dirigido', '64567098', 
        2023, 2, 'No Completo', 'Vde9duyPrl7I');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9385604, 'Pedro', 'Martínez', 'laura@ucb.edu.bo', 
        'laura@yahoo.com', 'Comunicación', 'proyecto dirigido', '78453933', 
        2024, 1, 'Completo', 'p7RvC4n3B');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7148110, 'Juan', 'Martínez', 'jorge@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'petae', '66973830', 
        2020, 2, 'No Completo', 'cdTs3cb5D');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5143359, 'Carlos', 'Rodríguez', 'luis@ucb.edu.bo', 
        'ana@gmail.com', 'Derecho', 'petae', '72550793', 
        2021, 1, 'Completo', 'COr8zfYkLo5P');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2964080, 'Carlos', 'Pérez', 'laura@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'trabajo de grado', '71365184', 
        2020, 2, 'No Completo', 'hvdHBzup');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5449480, 'Jorge', 'López', 'pedro@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'tesis de grado', '72229452', 
        2022, 1, 'Completo', 'OiIqRUKlToLW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3382261, 'María', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'carlos@yahoo.com', 'Arquitectura', 'tesis de grado', '67742386', 
        2023, 1, 'No Completo', 'VGfVGe1P');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8284358, 'Luis', 'Sánchez', 'carlos@ucb.edu.bo', 
        'luis@gmail.com', 'Comunicación', 'tesis de grado', '75130265', 
        2022, 2, 'No Completo', 'andItMgO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5930722, 'Juan', 'Flores', 'laura@ucb.edu.bo', 
        'pedro@hotmail.com', 'Psicología', 'graduación por diplomado', '74509108', 
        2021, 2, 'Completo', 'ewnlwZrkIa');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1626752, 'Sofía', 'Rodríguez', 'maría@ucb.edu.bo', 
        'carlos@yahoo.com', 'Derecho', 'graduación por diplomado', '72717455', 
        2023, 1, 'Completo', 'L5X73NEE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9548334, 'María', 'Ramírez', 'carmen@ucb.edu.bo', 
        'sofía@hotmail.com', 'Psicología', 'proyecto dirigido', '67859185', 
        2022, 1, 'No Completo', '2tfJudfR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4506610, 'Sofía', 'Flores', 'carmen@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'trabajo de grado', '65224423', 
        2024, 2, 'No Completo', '4uiuzEPkW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3793598, 'Sofía', 'Sánchez', 'juan@ucb.edu.bo', 
        'jorge@gmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '71116845', 
        2024, 2, 'No Completo', 'SJUunMEl4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7331075, 'Luis', 'Pérez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Derecho', 'trabajo de grado', '78821076', 
        2023, 2, 'Completo', 'ZdYLgVZYD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2673342, 'Laura', 'Ramírez', 'jorge@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'tesis de grado', '72998184', 
        2020, 2, 'No Completo', '1bZzeB97xve');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6577499, 'Juan', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Medicina', 'proyecto dirigido', '68130412', 
        2024, 2, 'No Completo', 'gIhuTGS9FRD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2149937, 'Carmen', 'Pérez', 'carlos@ucb.edu.bo', 
        'ana@yahoo.com', 'Comunicación', 'graduación por diplomado', '66916775', 
        2021, 2, 'No Completo', 'WW1HWw71');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2410144, 'Luis', 'López', 'luis@ucb.edu.bo', 
        'ana@gmail.com', 'Comunicación', 'graduación por diplomado', '67251304', 
        2021, 2, 'Completo', '971pu836g9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1011362, 'María', 'Martínez', 'laura@ucb.edu.bo', 
        'sofía@hotmail.com', 'Comunicación', 'trabajo de grado', '72754192', 
        2021, 1, 'No Completo', '7bi6qyslq5Ao');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7921955, 'Sofía', 'Sánchez', 'juan@ucb.edu.bo', 
        'maría@gmail.com', 'Arquitectura', 'tesis de grado', '79595176', 
        2022, 2, 'No Completo', 'AzxFMZ5rkF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6903043, 'Carmen', 'Pérez', 'carlos@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '78477123', 
        2024, 2, 'No Completo', 'QeAy8bMO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4340790, 'Luis', 'Martínez', 'jorge@ucb.edu.bo', 
        'nan', 'Arquitectura', 'tesis de grado', '73917469', 
        2024, 1, 'Completo', 'SrzDq5lVm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8499265, 'Sofía', 'Rodríguez', 'laura@ucb.edu.bo', 
        'pedro@hotmail.com', 'Comunicación', 'petae', '71522794', 
        2022, 2, 'Completo', 'jqSiUtfu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8674955, 'Pedro', 'Pérez', 'sofía@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '76790485', 
        2024, 2, 'No Completo', '1ArPYqiH5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2671336, 'Jorge', 'Martínez', 'carlos@ucb.edu.bo', 
        'laura@yahoo.com', 'Medicina', 'proyecto dirigido', '70822616', 
        2022, 2, 'Completo', '52JmJ0J94Wn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1318913, 'Pedro', 'González', 'juan@ucb.edu.bo', 
        'juan@gmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '73997561', 
        2022, 1, 'Completo', 'agIlinlPUCo5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5629021, 'Carlos', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'ana@gmail.com', 'Comunicación', 'graduación por diplomado', '67357527', 
        2022, 1, 'Completo', '7AscQ6lG6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1667123, 'Carmen', 'Flores', 'jorge@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'graduación por diplomado', '66886667', 
        2022, 2, 'Completo', 'oK8pWhx8BGP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2901556, 'Ana', 'Ramírez', 'carlos@ucb.edu.bo', 
        'juan@yahoo.com', 'Arquitectura', 'proyecto dirigido', '70152731', 
        2023, 1, 'Completo', 'qIJAU3KgTYUr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6968585, 'Laura', 'González', 'pedro@ucb.edu.bo', 
        'carmen@hotmail.com', 'Psicología', 'graduación por diplomado', '60352586', 
        2023, 1, 'Completo', 'pyrpz9Nh5iPy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5987927, 'María', 'Sánchez', 'sofía@ucb.edu.bo', 
        'jorge@hotmail.com', 'Psicología', 'graduación por diplomado', '63860695', 
        2022, 1, 'Completo', '20Cj01Yh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7116817, 'Luis', 'Flores', 'carmen@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'examen de grado', '79269566', 
        2021, 2, 'No Completo', '4yTb8faBZL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1377786, 'Juan', 'Rodríguez', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Derecho', 'examen de grado', '76432497', 
        2024, 2, 'No Completo', 'iDx2LLp7a0N2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2581728, 'Carlos', 'Pérez', 'luis@ucb.edu.bo', 
        'juan@hotmail.com', 'Comunicación', 'examen de grado', '65276132', 
        2021, 2, 'No Completo', '5MB9c5HO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8980278, 'Laura', 'López', 'carlos@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'trabajo de grado', '61321689', 
        2020, 1, 'Completo', 'IbBgYQpzKB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9470039, 'Ana', 'Sánchez', 'carmen@ucb.edu.bo', 
        'sofía@hotmail.com', 'Derecho', 'trabajo de grado', '72481028', 
        2022, 2, 'No Completo', '83DcNo1QQar');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4904890, 'Carmen', 'López', 'luis@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '60919071', 
        2020, 2, 'Completo', 'nDpyMzwsHfCV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8346063, 'Jorge', 'López', 'carlos@ucb.edu.bo', 
        'juan@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '79412441', 
        2024, 2, 'No Completo', 'DXQav0WFv2e2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4311314, 'María', 'Rodríguez', 'luis@ucb.edu.bo', 
        'jorge@hotmail.com', 'Medicina', 'examen de grado', '68875034', 
        2024, 2, 'No Completo', 'X9slZ73BQIp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2126412, 'Ana', 'González', 'maría@ucb.edu.bo', 
        'pedro@yahoo.com', 'Medicina', 'trabajo de grado', '63884104', 
        2022, 1, 'No Completo', 'QD8FFg17');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9904715, 'Jorge', 'Rodríguez', 'laura@ucb.edu.bo', 
        'juan@yahoo.com', 'Medicina', 'tesis de grado', '72366863', 
        2020, 2, 'Completo', 'y15dcDugdzPR');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6037399, 'Carlos', 'López', 'pedro@ucb.edu.bo', 
        'laura@hotmail.com', 'Arquitectura', 'proyecto dirigido', '68255910', 
        2021, 1, 'Completo', 'JqxWJUUdCMf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1295962, 'Juan', 'Flores', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '68867306', 
        2020, 1, 'No Completo', 'rWJM28IQ2nhj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2766590, 'Pedro', 'González', 'ana@ucb.edu.bo', 
        'nan', 'Medicina', 'taller de grado 1 y 2', '76844439', 
        2024, 2, 'Completo', 'rGPwqaoESt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1594628, 'Jorge', 'López', 'jorge@ucb.edu.bo', 
        'pedro@hotmail.com', 'Arquitectura', 'proyecto dirigido', '76291743', 
        2023, 2, 'Completo', 'AqACOAg8e3D2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6846977, 'María', 'Martínez', 'ana@ucb.edu.bo', 
        'nan', 'Derecho', 'trabajo de grado', '75210383', 
        2022, 2, 'Completo', 'EqUtymtoBFT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8668718, 'Laura', 'Ramírez', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'graduación por diplomado', '64502186', 
        2021, 1, 'No Completo', 'wrS4UdatM2R');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2410568, 'Pedro', 'Ramírez', 'sofía@ucb.edu.bo', 
        'sofía@yahoo.com', 'Psicología', 'proyecto dirigido', '75868782', 
        2020, 2, 'Completo', '7Msr6zkqlxp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1329016, 'Luis', 'Ramírez', 'ana@ucb.edu.bo', 
        'nan', 'Derecho', 'petae', '67045160', 
        2023, 1, 'No Completo', 'CK03bEV94bz4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5089979, 'Pedro', 'Martínez', 'ana@ucb.edu.bo', 
        'juan@yahoo.com', 'Medicina', 'petae', '71870948', 
        2021, 1, 'Completo', 'PsePJ1iaSd5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5717036, 'Sofía', 'Ramírez', 'maría@ucb.edu.bo', 
        'ana@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '77755478', 
        2020, 1, 'No Completo', 'xaZQsWbZmMFP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1055879, 'Ana', 'Flores', 'carmen@ucb.edu.bo', 
        'laura@gmail.com', 'Ingeniería de Sistemas', 'petae', '66157766', 
        2020, 2, 'No Completo', 'Fi3sChO5g');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1716155, 'Pedro', 'Rodríguez', 'juan@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'trabajo de grado', '70912147', 
        2023, 2, 'No Completo', 'IjSmUsc4v0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2198878, 'Carlos', 'González', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '75816690', 
        2023, 2, 'No Completo', 'w54sIb5HpBu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2213176, 'Ana', 'Flores', 'carmen@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'graduación por diplomado', '62792674', 
        2022, 1, 'No Completo', 'pAJWKt2FnGJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7298529, 'Carlos', 'González', 'maría@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'petae', '73420440', 
        2020, 1, 'Completo', 'sTE0YwEkk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7605420, 'Jorge', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'nan', 'Medicina', 'petae', '63739875', 
        2022, 1, 'Completo', 'JguYeU5n');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5165004, 'Jorge', 'Flores', 'carlos@ucb.edu.bo', 
        'maría@yahoo.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '79802303', 
        2023, 2, 'No Completo', 'GjHbrNvL1sy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6866535, 'Carlos', 'Rodríguez', 'maría@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '62935136', 
        2023, 1, 'No Completo', 'hws6fVlbtT0o');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1347558, 'Jorge', 'Sánchez', 'laura@ucb.edu.bo', 
        'sofía@hotmail.com', 'Medicina', 'taller de grado 1 y 2', '71277961', 
        2020, 1, 'No Completo', 'AIg5uMrB9h');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2110969, 'Pedro', 'López', 'ana@ucb.edu.bo', 
        'juan@hotmail.com', 'Derecho', 'taller de grado 1 y 2', '75332405', 
        2021, 2, 'Completo', 'Gu3izLhzx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5246086, 'Jorge', 'Flores', 'maría@ucb.edu.bo', 
        'nan', 'Arquitectura', 'tesis de grado', '73211602', 
        2021, 1, 'Completo', 'aPqfir2vGZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5360366, 'Ana', 'Ramírez', 'maría@ucb.edu.bo', 
        'carmen@gmail.com', 'Comunicación', 'examen de grado', '64356050', 
        2024, 2, 'No Completo', 'rD47iFOYioTA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7642311, 'Juan', 'Sánchez', 'juan@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '78455090', 
        2020, 1, 'Completo', 'efTQLiN3WnI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4664385, 'Jorge', 'González', 'juan@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '63011918', 
        2023, 1, 'Completo', 'd0WfP81MRB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1969376, 'Laura', 'González', 'juan@ucb.edu.bo', 
        'laura@gmail.com', 'Medicina', 'graduación por diplomado', '67713553', 
        2021, 2, 'No Completo', 'EsMpZTKF0q');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7403523, 'Laura', 'Ramírez', 'luis@ucb.edu.bo', 
        'pedro@yahoo.com', 'Psicología', 'trabajo de grado', '60679283', 
        2024, 1, 'No Completo', 'P5fGwGxDbGg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4805047, 'Ana', 'Ramírez', 'ana@ucb.edu.bo', 
        'luis@gmail.com', 'Medicina', 'trabajo de grado', '69486091', 
        2021, 2, 'Completo', 'LyPPua55i');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2056412, 'Laura', 'Rodríguez', 'ana@ucb.edu.bo', 
        'maría@yahoo.com', 'Ingeniería de Sistemas', 'examen de grado', '61508906', 
        2022, 2, 'Completo', 'hPbDHmwm7RlQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7074223, 'Laura', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'jorge@hotmail.com', 'Psicología', 'tesis de grado', '76761289', 
        2023, 2, 'No Completo', 'jJC3hSzQ3bnv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2918436, 'Laura', 'Martínez', 'ana@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'examen de grado', '76153395', 
        2021, 1, 'Completo', 's1a02AWXafr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5230295, 'Juan', 'Pérez', 'carmen@ucb.edu.bo', 
        'laura@hotmail.com', 'Comunicación', 'graduación por diplomado', '61249748', 
        2022, 1, 'No Completo', 'GYv92fGfviHv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3792578, 'Luis', 'Martínez', 'luis@ucb.edu.bo', 
        'carlos@hotmail.com', 'Psicología', 'graduación por diplomado', '60726973', 
        2021, 1, 'No Completo', 'qk6QdFx5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4778822, 'Laura', 'Ramírez', 'ana@ucb.edu.bo', 
        'laura@hotmail.com', 'Arquitectura', 'petae', '70421737', 
        2022, 2, 'Completo', 'njsu52tQw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4428290, 'Ana', 'Pérez', 'juan@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'taller de grado 1 y 2', '73153416', 
        2021, 1, 'No Completo', 'dDytYEGNIe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4402873, 'María', 'González', 'pedro@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '71446003', 
        2022, 1, 'No Completo', 'xTJawSrVb4u');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2668624, 'Carlos', 'Flores', 'maría@ucb.edu.bo', 
        'luis@yahoo.com', 'Comunicación', 'proyecto dirigido', '79400415', 
        2022, 2, 'Completo', 'VYI7nN1ayh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8387822, 'Carlos', 'Flores', 'sofía@ucb.edu.bo', 
        'jorge@hotmail.com', 'Comunicación', 'trabajo de grado', '64097855', 
        2020, 1, 'No Completo', 'ejfofxLIh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5885611, 'Carmen', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'sofía@yahoo.com', 'Arquitectura', 'petae', '73872272', 
        2022, 1, 'Completo', 'GNJuJFlfWRqg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3909811, 'María', 'López', 'ana@ucb.edu.bo', 
        'nan', 'Comunicación', 'petae', '77439972', 
        2020, 1, 'No Completo', 'NLGUwz2tm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8637273, 'María', 'Ramírez', 'pedro@ucb.edu.bo', 
        'carlos@hotmail.com', 'Medicina', 'graduación por diplomado', '75030215', 
        2024, 2, 'No Completo', 'dsVK3TFU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5577281, 'María', 'Sánchez', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'proyecto dirigido', '65738244', 
        2021, 2, 'No Completo', 'gohG00wk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2238178, 'Laura', 'Sánchez', 'jorge@ucb.edu.bo', 
        'nan', 'Psicología', 'tesis de grado', '71559991', 
        2022, 1, 'No Completo', 'qXWibBrfhxkC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4966966, 'Pedro', 'Martínez', 'ana@ucb.edu.bo', 
        'carmen@hotmail.com', 'Comunicación', 'proyecto dirigido', '62768056', 
        2022, 1, 'No Completo', '3spW8m9rv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8135230, 'Ana', 'Ramírez', 'pedro@ucb.edu.bo', 
        'nan', 'Derecho', 'taller de grado 1 y 2', '73033093', 
        2022, 2, 'No Completo', 'ht1VbaGTpJy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9475803, 'Luis', 'González', 'sofía@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'examen de grado', '72927408', 
        2020, 2, 'Completo', 'uXdB2OOhee');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5977010, 'Pedro', 'Rodríguez', 'maría@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'graduación por diplomado', '60844436', 
        2023, 2, 'Completo', 'Hv8mGzHi3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2252172, 'María', 'López', 'pedro@ucb.edu.bo', 
        'carmen@yahoo.com', 'Arquitectura', 'graduación por diplomado', '65090734', 
        2023, 1, 'Completo', 'UOLl35d5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1838662, 'Juan', 'López', 'ana@ucb.edu.bo', 
        'jorge@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '60262136', 
        2023, 2, 'Completo', 'V1tvqNwRX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7619562, 'Carmen', 'González', 'juan@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'graduación por diplomado', '61395473', 
        2023, 1, 'No Completo', 'JxmD6NdA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6218938, 'Carmen', 'Sánchez', 'laura@ucb.edu.bo', 
        'jorge@yahoo.com', 'Comunicación', 'trabajo de grado', '60475793', 
        2022, 2, 'No Completo', 'NKRErvuSegfa');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9188142, 'Pedro', 'Rodríguez', 'maría@ucb.edu.bo', 
        'luis@gmail.com', 'Arquitectura', 'petae', '77031735', 
        2023, 2, 'No Completo', 'akLfCxcJq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8684567, 'Luis', 'López', 'carlos@ucb.edu.bo', 
        'carlos@hotmail.com', 'Derecho', 'trabajo de grado', '73646494', 
        2023, 2, 'No Completo', 'AIIYaVtexTFD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5870223, 'Sofía', 'Flores', 'laura@ucb.edu.bo', 
        'ana@hotmail.com', 'Ingeniería de Sistemas', 'examen de grado', '71404447', 
        2020, 1, 'No Completo', 'wJNJ6y3u9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4010065, 'Luis', 'Ramírez', 'jorge@ucb.edu.bo', 
        'luis@yahoo.com', 'Medicina', 'examen de grado', '69616531', 
        2021, 2, 'Completo', 'gpDRL8de');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3119061, 'Sofía', 'Ramírez', 'ana@ucb.edu.bo', 
        'sofía@yahoo.com', 'Medicina', 'tesis de grado', '66520520', 
        2020, 2, 'Completo', 'W3ff9tT2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1159864, 'María', 'Ramírez', 'carlos@ucb.edu.bo', 
        'luis@hotmail.com', 'Comunicación', 'examen de grado', '76225065', 
        2024, 2, 'No Completo', 'Ad2uc4K1i3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4540255, 'Sofía', 'Pérez', 'ana@ucb.edu.bo', 
        'ana@hotmail.com', 'Arquitectura', 'petae', '75040417', 
        2023, 2, 'No Completo', 'GQyDJezb1V');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5910518, 'Juan', 'Ramírez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Psicología', 'graduación por diplomado', '75702194', 
        2022, 2, 'Completo', 'bYCCQUTo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5563024, 'Carlos', 'Ramírez', 'maría@ucb.edu.bo', 
        'jorge@hotmail.com', 'Arquitectura', 'examen de grado', '73490454', 
        2022, 1, 'No Completo', '3JfJ1J3reX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3486891, 'Jorge', 'López', 'maría@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '63816144', 
        2022, 1, 'No Completo', 'Zvk9Do1F');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1223567, 'Laura', 'López', 'luis@ucb.edu.bo', 
        'carmen@hotmail.com', 'Comunicación', 'trabajo de grado', '64523710', 
        2020, 1, 'No Completo', 'hIFgwc6D9SUW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2262908, 'María', 'González', 'luis@ucb.edu.bo', 
        'laura@hotmail.com', 'Psicología', 'examen de grado', '68692112', 
        2022, 1, 'Completo', 'cKhokjEuU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9312851, 'María', 'López', 'luis@ucb.edu.bo', 
        'maría@yahoo.com', 'Comunicación', 'proyecto dirigido', '62951657', 
        2024, 1, 'No Completo', '4YPlB0JWQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5332135, 'Sofía', 'Martínez', 'sofía@ucb.edu.bo', 
        'carmen@yahoo.com', 'Ingeniería de Sistemas', 'examen de grado', '78150558', 
        2024, 1, 'Completo', 'ODYNSZfJgxYU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5763580, 'María', 'López', 'carmen@ucb.edu.bo', 
        'laura@yahoo.com', 'Derecho', 'tesis de grado', '68652345', 
        2020, 1, 'Completo', 'cEFm7O6x');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6312985, 'Carlos', 'Pérez', 'jorge@ucb.edu.bo', 
        'ana@gmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '78705070', 
        2023, 2, 'No Completo', 'b6F73woHup');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4420825, 'Luis', 'Flores', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Arquitectura', 'proyecto dirigido', '64957707', 
        2023, 2, 'Completo', 'Ohu2QH2k3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4347966, 'Ana', 'López', 'sofía@ucb.edu.bo', 
        'nan', 'Medicina', 'tesis de grado', '62195009', 
        2020, 2, 'Completo', '3h92t5Fz60');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4066907, 'Jorge', 'Flores', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '68566693', 
        2021, 1, 'No Completo', 'un49rFG8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8287656, 'Carmen', 'Martínez', 'maría@ucb.edu.bo', 
        'luis@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '74963238', 
        2024, 2, 'Completo', '7oDZvJaItvl7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8475858, 'Juan', 'López', 'jorge@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'petae', '76318161', 
        2024, 2, 'Completo', 'jOMUfs6KCs5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1340728, 'Sofía', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'petae', '75968950', 
        2020, 2, 'Completo', 'F4x7FpfO1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5887040, 'Laura', 'López', 'pedro@ucb.edu.bo', 
        'maría@yahoo.com', 'Arquitectura', 'examen de grado', '63682354', 
        2023, 2, 'Completo', 'Uw93286Skq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2010657, 'Luis', 'González', 'carmen@ucb.edu.bo', 
        'sofía@yahoo.com', 'Comunicación', 'proyecto dirigido', '67857021', 
        2022, 2, 'No Completo', 'WhYdf13Im5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4087887, 'Jorge', 'Ramírez', 'pedro@ucb.edu.bo', 
        'maría@yahoo.com', 'Arquitectura', 'examen de grado', '73913096', 
        2023, 1, 'Completo', '3jkdSDHU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9581888, 'Sofía', 'Pérez', 'ana@ucb.edu.bo', 
        'sofía@yahoo.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '66337286', 
        2024, 1, 'No Completo', 'XmJtuQ6ftVn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2214280, 'Luis', 'Ramírez', 'jorge@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '71896779', 
        2024, 2, 'Completo', 'zBe9Jz5Pca7T');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2359004, 'Luis', 'Rodríguez', 'laura@ucb.edu.bo', 
        'maría@yahoo.com', 'Medicina', 'examen de grado', '61525991', 
        2021, 1, 'Completo', 'YGAPQXOZF09');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7033457, 'Jorge', 'González', 'jorge@ucb.edu.bo', 
        'jorge@gmail.com', 'Derecho', 'examen de grado', '75555461', 
        2024, 2, 'No Completo', 'P4m924Jodz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3755437, 'Carmen', 'Flores', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'graduación por diplomado', '76517251', 
        2022, 1, 'Completo', '8oheNwqQhzx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1566477, 'Laura', 'Martínez', 'maría@ucb.edu.bo', 
        'jorge@yahoo.com', 'Comunicación', 'taller de grado 1 y 2', '79987452', 
        2023, 1, 'Completo', 'WA9MM15TZkD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1881393, 'Sofía', 'Flores', 'jorge@ucb.edu.bo', 
        'sofía@yahoo.com', 'Medicina', 'graduación por diplomado', '73727635', 
        2020, 1, 'No Completo', 'rlpDOjS6VoX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5003473, 'Ana', 'Ramírez', 'carmen@ucb.edu.bo', 
        'nan', 'Medicina', 'proyecto dirigido', '63885127', 
        2021, 1, 'No Completo', '5D7rDugEJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8398705, 'Carmen', 'Ramírez', 'sofía@ucb.edu.bo', 
        'sofía@hotmail.com', 'Comunicación', 'petae', '77561211', 
        2024, 1, 'Completo', 'AZhGOFEbF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2624667, 'Juan', 'González', 'carmen@ucb.edu.bo', 
        'sofía@yahoo.com', 'Arquitectura', 'examen de grado', '64572421', 
        2024, 2, 'Completo', 'nVkcrD7x');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3366006, 'María', 'López', 'pedro@ucb.edu.bo', 
        'ana@hotmail.com', 'Derecho', 'examen de grado', '72217705', 
        2020, 1, 'No Completo', 'yjWj0h3jyPwi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1197460, 'Pedro', 'González', 'carlos@ucb.edu.bo', 
        'carlos@gmail.com', 'Arquitectura', 'petae', '62461399', 
        2024, 1, 'No Completo', 'Lou9OIsrB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3546328, 'Juan', 'Pérez', 'sofía@ucb.edu.bo', 
        'carlos@hotmail.com', 'Derecho', 'proyecto dirigido', '72460261', 
        2020, 2, 'Completo', 'AAKpoXerVI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6400058, 'Ana', 'Rodríguez', 'maría@ucb.edu.bo', 
        'laura@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '72910204', 
        2023, 2, 'No Completo', 'Dmx8piOANC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6341799, 'Carlos', 'Flores', 'pedro@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'proyecto dirigido', '66835799', 
        2020, 2, 'Completo', 'd8MqzGy1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4019938, 'Laura', 'Pérez', 'sofía@ucb.edu.bo', 
        'carlos@hotmail.com', 'Arquitectura', 'trabajo de grado', '64818950', 
        2024, 2, 'Completo', 'd7SB4ocImtq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1422124, 'Carlos', 'González', 'pedro@ucb.edu.bo', 
        'maría@hotmail.com', 'Arquitectura', 'graduación por diplomado', '67502684', 
        2023, 2, 'No Completo', 'Yu8ZzULfx4i');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3551846, 'Sofía', 'Flores', 'carlos@ucb.edu.bo', 
        'carlos@yahoo.com', 'Medicina', 'trabajo de grado', '79213415', 
        2022, 2, 'Completo', 'lSk7OgVeb4z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8542134, 'Juan', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Derecho', 'proyecto dirigido', '75124046', 
        2021, 1, 'Completo', 'FJ35csxWU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1619577, 'Carlos', 'Pérez', 'luis@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'tesis de grado', '66300732', 
        2024, 2, 'No Completo', 'DsVh7lK6Blq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1042916, 'Pedro', 'López', 'laura@ucb.edu.bo', 
        'nan', 'Comunicación', 'petae', '76329360', 
        2022, 1, 'Completo', 'O7mQ2EkY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8273880, 'Sofía', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Comunicación', 'examen de grado', '62838373', 
        2024, 1, 'No Completo', 'VE4Q0QuH6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2931746, 'Luis', 'González', 'laura@ucb.edu.bo', 
        'carlos@hotmail.com', 'Psicología', 'trabajo de grado', '77912989', 
        2023, 1, 'No Completo', 'IznXs5ub');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4074515, 'Sofía', 'Pérez', 'maría@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'trabajo de grado', '64022838', 
        2022, 1, 'No Completo', 'fyk2H5wuvJ6h');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2882762, 'Carlos', 'Ramírez', 'laura@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'tesis de grado', '61725061', 
        2022, 2, 'Completo', 'JRrrKUElIEV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3496165, 'Jorge', 'López', 'pedro@ucb.edu.bo', 
        'sofía@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '75247239', 
        2023, 2, 'No Completo', 'Vz0kKPDJnHi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7060153, 'Pedro', 'González', 'jorge@ucb.edu.bo', 
        'pedro@yahoo.com', 'Comunicación', 'proyecto dirigido', '75439853', 
        2021, 2, 'Completo', 'PgIEC1WC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6985253, 'Luis', 'Ramírez', 'jorge@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'trabajo de grado', '62783167', 
        2022, 2, 'Completo', 'Urj9ayEG1L');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4172481, 'Sofía', 'Flores', 'laura@ucb.edu.bo', 
        'luis@yahoo.com', 'Derecho', 'examen de grado', '75912432', 
        2022, 2, 'No Completo', '3VKV8jyy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9353917, 'María', 'Ramírez', 'laura@ucb.edu.bo', 
        'maría@yahoo.com', 'Medicina', 'proyecto dirigido', '67804684', 
        2023, 2, 'No Completo', 'p1K3NfhNi1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8409855, 'María', 'Flores', 'ana@ucb.edu.bo', 
        'maría@yahoo.com', 'Arquitectura', 'graduación por diplomado', '74111308', 
        2024, 1, 'Completo', '2W04TRGU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1714518, 'Ana', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '68052280', 
        2021, 2, 'No Completo', 'o5UCYC5vTZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4588410, 'Juan', 'Flores', 'maría@ucb.edu.bo', 
        'maría@yahoo.com', 'Medicina', 'taller de grado 1 y 2', '66341175', 
        2021, 2, 'Completo', '2pm32kdNaSy8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7140799, 'Ana', 'Sánchez', 'maría@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'examen de grado', '65720733', 
        2024, 2, 'Completo', 'kntHy8A8oEI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6437834, 'Luis', 'Martínez', 'carlos@ucb.edu.bo', 
        'nan', 'Arquitectura', 'examen de grado', '70854120', 
        2022, 2, 'Completo', 'AodqV4UQ4z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9713750, 'Pedro', 'Sánchez', 'pedro@ucb.edu.bo', 
        'ana@yahoo.com', 'Derecho', 'tesis de grado', '65262298', 
        2020, 2, 'Completo', 'gUA1o2kKp3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6942802, 'Jorge', 'González', 'carlos@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'tesis de grado', '62626138', 
        2024, 2, 'No Completo', 'Zymt6Ij3LQ0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7044332, 'Pedro', 'Pérez', 'luis@ucb.edu.bo', 
        'sofía@gmail.com', 'Derecho', 'taller de grado 1 y 2', '76806205', 
        2023, 2, 'Completo', 'sendnwOViPtO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7737326, 'Pedro', 'Martínez', 'jorge@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '71158471', 
        2023, 1, 'Completo', 'k4wTyjOn1yN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2422961, 'Sofía', 'Ramírez', 'carlos@ucb.edu.bo', 
        'nan', 'Psicología', 'trabajo de grado', '70683392', 
        2023, 2, 'Completo', 'G55x7MXDSk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2196937, 'Juan', 'Sánchez', 'luis@ucb.edu.bo', 
        'sofía@hotmail.com', 'Arquitectura', 'tesis de grado', '72002054', 
        2020, 2, 'No Completo', 'Rtn4jDeey');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3353982, 'Sofía', 'Ramírez', 'sofía@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'tesis de grado', '61023843', 
        2020, 2, 'No Completo', 'rMIajmjOz26x');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8047800, 'Laura', 'Martínez', 'carlos@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'petae', '76547696', 
        2024, 1, 'Completo', '297Z4wumZ3Pt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4210247, 'Sofía', 'González', 'juan@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'petae', '63066018', 
        2021, 1, 'No Completo', '4LIZgsvz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7331603, 'Pedro', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'nan', 'Medicina', 'examen de grado', '63237756', 
        2020, 2, 'Completo', 'dZR5Z49tf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9961223, 'Carlos', 'Rodríguez', 'maría@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '62496580', 
        2020, 2, 'Completo', 'DQkSZC6Dly');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4111560, 'Pedro', 'Flores', 'sofía@ucb.edu.bo', 
        'carlos@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '76842743', 
        2022, 2, 'Completo', '3I09VM3lFQN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6160219, 'Sofía', 'Martínez', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '69687039', 
        2024, 1, 'Completo', 'pG0T1vMkEXd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7559094, 'Jorge', 'Pérez', 'sofía@ucb.edu.bo', 
        'maría@hotmail.com', 'Medicina', 'tesis de grado', '74525930', 
        2024, 1, 'No Completo', '8YMVTVFZW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9458669, 'Laura', 'Martínez', 'maría@ucb.edu.bo', 
        'carmen@hotmail.com', 'Comunicación', 'tesis de grado', '70117665', 
        2022, 2, 'Completo', 'XtZpxerlN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8128940, 'Ana', 'González', 'carmen@ucb.edu.bo', 
        'nan', 'Medicina', 'graduación por diplomado', '62282658', 
        2020, 2, 'Completo', 'GEU7Fd4BC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4006596, 'Ana', 'López', 'laura@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '73292252', 
        2022, 1, 'No Completo', 'Kj0nC4VK96');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9170670, 'Pedro', 'López', 'sofía@ucb.edu.bo', 
        'carmen@yahoo.com', 'Arquitectura', 'graduación por diplomado', '66245205', 
        2021, 1, 'Completo', '3Og6qt4vSM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4207930, 'Luis', 'Martínez', 'luis@ucb.edu.bo', 
        'sofía@gmail.com', 'Psicología', 'trabajo de grado', '72186621', 
        2022, 1, 'Completo', 'qoPUw0Jh2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7677723, 'Carlos', 'Pérez', 'carmen@ucb.edu.bo', 
        'carlos@gmail.com', 'Medicina', 'graduación por diplomado', '71980945', 
        2023, 1, 'Completo', 'iIIRdiX5S');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2774516, 'Carlos', 'Martínez', 'pedro@ucb.edu.bo', 
        'juan@gmail.com', 'Comunicación', 'taller de grado 1 y 2', '72111158', 
        2020, 1, 'Completo', 'gmu60pJs3c');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7515359, 'Ana', 'Martínez', 'juan@ucb.edu.bo', 
        'luis@yahoo.com', 'Comunicación', 'tesis de grado', '77833760', 
        2021, 1, 'No Completo', 'qgvZq5i8Y');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2512338, 'María', 'Ramírez', 'maría@ucb.edu.bo', 
        'jorge@hotmail.com', 'Derecho', 'tesis de grado', '72233857', 
        2023, 1, 'No Completo', 'I6ju4BFIY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2863536, 'Sofía', 'Sánchez', 'maría@ucb.edu.bo', 
        'jorge@yahoo.com', 'Arquitectura', 'proyecto dirigido', '68303803', 
        2021, 1, 'Completo', 'jVqe31p0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2314429, 'Laura', 'López', 'jorge@ucb.edu.bo', 
        'maría@yahoo.com', 'Derecho', 'proyecto dirigido', '75183611', 
        2022, 2, 'Completo', '8S0hdUGB2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2994967, 'Carlos', 'Flores', 'carlos@ucb.edu.bo', 
        'nan', 'Psicología', 'taller de grado 1 y 2', '60676280', 
        2023, 2, 'Completo', 'JKDx1mJtC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3900253, 'Carmen', 'González', 'ana@ucb.edu.bo', 
        'pedro@hotmail.com', 'Medicina', 'taller de grado 1 y 2', '69352091', 
        2024, 2, 'Completo', '7CkTxlxdxlr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7940404, 'Laura', 'Sánchez', 'laura@ucb.edu.bo', 
        'pedro@gmail.com', 'Psicología', 'tesis de grado', '64008802', 
        2021, 2, 'No Completo', 'wfsZpdJx7yVp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4124180, 'Laura', 'López', 'maría@ucb.edu.bo', 
        'nan', 'Comunicación', 'trabajo de grado', '76120271', 
        2022, 2, 'Completo', 'AZULKDDOA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8611183, 'Jorge', 'González', 'carlos@ucb.edu.bo', 
        'luis@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '65437712', 
        2020, 2, 'No Completo', 'Ff351Kwpulb');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8578036, 'Sofía', 'Sánchez', 'maría@ucb.edu.bo', 
        'nan', 'Medicina', 'taller de grado 1 y 2', '69033012', 
        2022, 1, 'No Completo', 'NeXv0xbXnt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6642925, 'Juan', 'López', 'pedro@ucb.edu.bo', 
        'nan', 'Comunicación', 'examen de grado', '79171508', 
        2021, 1, 'Completo', 'fLwT8lLKy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4086814, 'Sofía', 'López', 'laura@ucb.edu.bo', 
        'luis@hotmail.com', 'Psicología', 'trabajo de grado', '60384534', 
        2023, 2, 'Completo', 'HNd0J9nhrpA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7719732, 'Sofía', 'Sánchez', 'luis@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '67501039', 
        2023, 1, 'No Completo', 'yIxWA23TA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1859544, 'Pedro', 'Martínez', 'pedro@ucb.edu.bo', 
        'laura@gmail.com', 'Derecho', 'proyecto dirigido', '79328860', 
        2021, 1, 'No Completo', 'Fbw7X9kypq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2655425, 'Pedro', 'López', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '79312002', 
        2021, 1, 'Completo', 'keMxz9bX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3273065, 'María', 'Pérez', 'pedro@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '70841902', 
        2024, 2, 'No Completo', 'SxyPdFN6JXB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2575632, 'Ana', 'López', 'carlos@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '75058033', 
        2020, 1, 'No Completo', 'DJjqeUd5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9522138, 'Sofía', 'González', 'juan@ucb.edu.bo', 
        'maría@gmail.com', 'Ingeniería de Sistemas', 'petae', '66964984', 
        2020, 1, 'Completo', '98HQbxH70CU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9635897, 'Juan', 'Pérez', 'laura@ucb.edu.bo', 
        'nan', 'Psicología', 'graduación por diplomado', '75716292', 
        2020, 2, 'Completo', 'M211bMv1PGU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9080164, 'Carmen', 'Pérez', 'carlos@ucb.edu.bo', 
        'ana@hotmail.com', 'Psicología', 'proyecto dirigido', '60971244', 
        2024, 2, 'No Completo', '7mG92vFN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3455890, 'Luis', 'Martínez', 'luis@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '67153302', 
        2020, 2, 'Completo', 'A9yj7cZSWi');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8773311, 'María', 'González', 'carlos@ucb.edu.bo', 
        'jorge@gmail.com', 'Comunicación', 'petae', '74701694', 
        2023, 1, 'No Completo', 'QKkyzsP0jp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3795694, 'Ana', 'López', 'maría@ucb.edu.bo', 
        'carlos@hotmail.com', 'Comunicación', 'proyecto dirigido', '76423970', 
        2022, 1, 'Completo', 'gm4yqcvKVt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1392945, 'Jorge', 'Flores', 'laura@ucb.edu.bo', 
        'nan', 'Comunicación', 'petae', '74119182', 
        2020, 1, 'No Completo', '3XgTEwZT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1599451, 'María', 'Pérez', 'ana@ucb.edu.bo', 
        'carmen@hotmail.com', 'Medicina', 'trabajo de grado', '73298668', 
        2023, 1, 'Completo', 'WZaO4xb2Dba');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8809952, 'María', 'Martínez', 'jorge@ucb.edu.bo', 
        'nan', 'Medicina', 'proyecto dirigido', '74314472', 
        2024, 2, 'No Completo', '47KrTPGSiV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4099606, 'Laura', 'Ramírez', 'sofía@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'petae', '61735214', 
        2023, 1, 'Completo', '8H0BsKDnS4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7497829, 'Sofía', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'petae', '73336756', 
        2022, 2, 'Completo', 'HIFzJiru');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7661685, 'Pedro', 'Ramírez', 'juan@ucb.edu.bo', 
        'luis@yahoo.com', 'Medicina', 'tesis de grado', '75730294', 
        2020, 1, 'No Completo', 'fnZrvUjMKEa');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6355823, 'Ana', 'Ramírez', 'juan@ucb.edu.bo', 
        'nan', 'Medicina', 'taller de grado 1 y 2', '66320186', 
        2023, 2, 'Completo', '1CsbwBavpKu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2269456, 'Ana', 'Pérez', 'carmen@ucb.edu.bo', 
        'maría@yahoo.com', 'Comunicación', 'proyecto dirigido', '78873821', 
        2023, 2, 'No Completo', 'Kz6lUMny');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3583234, 'Jorge', 'Martínez', 'juan@ucb.edu.bo', 
        'sofía@gmail.com', 'Psicología', 'examen de grado', '60340996', 
        2022, 2, 'Completo', 'EvXlsjbOjx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8352126, 'Carlos', 'Sánchez', 'ana@ucb.edu.bo', 
        'pedro@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '74403675', 
        2021, 1, 'Completo', 'G6kdAPoNkd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1456737, 'Juan', 'Ramírez', 'luis@ucb.edu.bo', 
        'ana@gmail.com', 'Derecho', 'taller de grado 1 y 2', '74298347', 
        2024, 1, 'Completo', 'VD6iBWA6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9935927, 'Sofía', 'Martínez', 'laura@ucb.edu.bo', 
        'maría@yahoo.com', 'Ingeniería de Sistemas', 'trabajo de grado', '65397811', 
        2022, 1, 'Completo', 'FkRuVWS9SL0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4880111, 'Sofía', 'Sánchez', 'sofía@ucb.edu.bo', 
        'maría@yahoo.com', 'Derecho', 'examen de grado', '63806388', 
        2020, 1, 'Completo', '0S5LxnDB8Em');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9828357, 'Laura', 'Ramírez', 'sofía@ucb.edu.bo', 
        'maría@hotmail.com', 'Comunicación', 'taller de grado 1 y 2', '68909663', 
        2022, 1, 'No Completo', 'eFL55tvm');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8664356, 'Carmen', 'Flores', 'juan@ucb.edu.bo', 
        'luis@yahoo.com', 'Medicina', 'examen de grado', '68837371', 
        2021, 1, 'No Completo', 'KBYar5vzP2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3973918, 'Juan', 'Ramírez', 'maría@ucb.edu.bo', 
        'laura@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '73755604', 
        2020, 1, 'Completo', '1MJL3E1LWENy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8878272, 'María', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'nan', 'Arquitectura', 'petae', '70695936', 
        2024, 1, 'Completo', 'sJ8iP2Sv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7117834, 'Juan', 'Sánchez', 'sofía@ucb.edu.bo', 
        'luis@yahoo.com', 'Psicología', 'graduación por diplomado', '71071019', 
        2020, 1, 'No Completo', 'Xtg6dXy2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7420680, 'María', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'proyecto dirigido', '60092790', 
        2023, 2, 'No Completo', 'PQmvBCMpy0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2857852, 'Sofía', 'Pérez', 'laura@ucb.edu.bo', 
        'juan@gmail.com', 'Derecho', 'tesis de grado', '62153078', 
        2021, 2, 'Completo', 'ACc9c9TeUf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5490247, 'Carlos', 'Pérez', 'pedro@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'graduación por diplomado', '61346804', 
        2024, 1, 'Completo', 'Y1RDEj4BBkX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1812777, 'Carlos', 'Ramírez', 'luis@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'graduación por diplomado', '63438138', 
        2024, 2, 'No Completo', 'EbcXTGN8NnUL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4212846, 'Pedro', 'Flores', 'ana@ucb.edu.bo', 
        'carmen@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '79465540', 
        2021, 2, 'No Completo', 'Ac79dE8CU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3295582, 'Sofía', 'Sánchez', 'ana@ucb.edu.bo', 
        'carlos@hotmail.com', 'Derecho', 'petae', '79642791', 
        2020, 1, 'No Completo', '7NkYJN43g');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7083670, 'Carmen', 'López', 'carmen@ucb.edu.bo', 
        'maría@hotmail.com', 'Medicina', 'examen de grado', '76705391', 
        2024, 1, 'No Completo', 'MOlZkzE40');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5356775, 'Pedro', 'Flores', 'juan@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'proyecto dirigido', '76949332', 
        2020, 1, 'No Completo', 'H5CssLDN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5299899, 'Pedro', 'Martínez', 'pedro@ucb.edu.bo', 
        'nan', 'Arquitectura', 'trabajo de grado', '62987057', 
        2022, 2, 'Completo', 'yNez7vBO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3994553, 'Ana', 'Ramírez', 'sofía@ucb.edu.bo', 
        'sofía@gmail.com', 'Derecho', 'trabajo de grado', '64221755', 
        2024, 2, 'No Completo', '1ildEBpN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1267480, 'Ana', 'López', 'juan@ucb.edu.bo', 
        'laura@yahoo.com', 'Psicología', 'petae', '64174742', 
        2024, 2, 'No Completo', 'ht30CFdW1Q');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5284452, 'Luis', 'González', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Arquitectura', 'proyecto dirigido', '62009486', 
        2022, 2, 'No Completo', 'UPmjCUtKYHI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5233435, 'Sofía', 'González', 'jorge@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'trabajo de grado', '66042792', 
        2022, 2, 'No Completo', 'x1q1Xrft5S');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4103582, 'Jorge', 'Flores', 'maría@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'petae', '70324030', 
        2022, 2, 'Completo', 'sDqGQI1W');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1366464, 'Juan', 'Ramírez', 'laura@ucb.edu.bo', 
        'luis@yahoo.com', 'Arquitectura', 'tesis de grado', '68561555', 
        2024, 2, 'No Completo', 'u64741bnSJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9633791, 'Carlos', 'Martínez', 'carmen@ucb.edu.bo', 
        'laura@yahoo.com', 'Derecho', 'examen de grado', '76793580', 
        2024, 2, 'No Completo', 'HWtdgJPj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7098833, 'Luis', 'Rodríguez', 'maría@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'trabajo de grado', '76794156', 
        2023, 2, 'No Completo', 'iAvYIChbl4J');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4517606, 'Ana', 'Sánchez', 'sofía@ucb.edu.bo', 
        'maría@hotmail.com', 'Derecho', 'examen de grado', '74838264', 
        2022, 1, 'No Completo', 'M2LY3LZL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6980036, 'Laura', 'Ramírez', 'ana@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'examen de grado', '75482262', 
        2024, 1, 'No Completo', 'wh0DtIrL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1527289, 'Pedro', 'López', 'jorge@ucb.edu.bo', 
        'juan@hotmail.com', 'Arquitectura', 'trabajo de grado', '71988499', 
        2023, 1, 'Completo', 'MaImeJS4N');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9427789, 'Carlos', 'López', 'jorge@ucb.edu.bo', 
        'carmen@gmail.com', 'Psicología', 'proyecto dirigido', '75057602', 
        2021, 2, 'Completo', 'tzNPFEzO65');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3137698, 'Pedro', 'Pérez', 'sofía@ucb.edu.bo', 
        'pedro@yahoo.com', 'Comunicación', 'petae', '75696889', 
        2023, 1, 'No Completo', 'rm2YwQzykX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8422426, 'Juan', 'Flores', 'laura@ucb.edu.bo', 
        'luis@hotmail.com', 'Arquitectura', 'petae', '68540379', 
        2022, 1, 'No Completo', 'MnBoqb5C');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6171048, 'María', 'Martínez', 'laura@ucb.edu.bo', 
        'juan@hotmail.com', 'Arquitectura', 'taller de grado 1 y 2', '68568793', 
        2021, 2, 'No Completo', 'sUsQAnai');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3300208, 'Carlos', 'Martínez', 'carmen@ucb.edu.bo', 
        'nan', 'Medicina', 'petae', '69537936', 
        2024, 1, 'No Completo', 'LliQST7K');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8629818, 'María', 'Rodríguez', 'laura@ucb.edu.bo', 
        'maría@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '73341372', 
        2021, 1, 'No Completo', 'VWXVSx0w0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7075849, 'Juan', 'Martínez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '77737650', 
        2022, 2, 'Completo', 'sVDbYtxKfS3M');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5391614, 'Sofía', 'Rodríguez', 'laura@ucb.edu.bo', 
        'pedro@gmail.com', 'Ingeniería de Sistemas', 'examen de grado', '75840985', 
        2024, 2, 'Completo', 'TlZ0MK9q26L');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7723759, 'Laura', 'Rodríguez', 'maría@ucb.edu.bo', 
        'sofía@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '75530760', 
        2020, 2, 'No Completo', 'K2L51KzJDQJM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5033292, 'Pedro', 'López', 'ana@ucb.edu.bo', 
        'maría@yahoo.com', 'Psicología', 'trabajo de grado', '79479443', 
        2021, 1, 'Completo', 'qFh0CGB3fy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8971559, 'Pedro', 'López', 'pedro@ucb.edu.bo', 
        'jorge@hotmail.com', 'Derecho', 'proyecto dirigido', '68236541', 
        2020, 1, 'No Completo', 'ctBE4tXOYQ6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8657747, 'Juan', 'Pérez', 'pedro@ucb.edu.bo', 
        'nan', 'Arquitectura', 'examen de grado', '62188270', 
        2022, 2, 'Completo', '15Mze03k7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4944376, 'Sofía', 'González', 'jorge@ucb.edu.bo', 
        'nan', 'Medicina', 'taller de grado 1 y 2', '69738180', 
        2022, 1, 'Completo', 'xpRNiGcwn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8377312, 'Laura', 'Pérez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '71220694', 
        2021, 2, 'Completo', 'yz8WvKZId3Qr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5679014, 'Sofía', 'Sánchez', 'jorge@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'tesis de grado', '73874441', 
        2021, 2, 'Completo', 'STk22LEWd2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1332750, 'Laura', 'López', 'ana@ucb.edu.bo', 
        'nan', 'Medicina', 'graduación por diplomado', '61678362', 
        2021, 2, 'No Completo', 'w55mNVYKxLd2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3692066, 'Carmen', 'López', 'pedro@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'tesis de grado', '60698690', 
        2020, 2, 'No Completo', 'kvzFLsUali');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5139724, 'Luis', 'Pérez', 'ana@ucb.edu.bo', 
        'nan', 'Arquitectura', 'trabajo de grado', '78795075', 
        2022, 2, 'No Completo', 'ZjikDS81b');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9288927, 'Juan', 'Ramírez', 'jorge@ucb.edu.bo', 
        'nan', 'Derecho', 'petae', '62300745', 
        2024, 1, 'Completo', 'vNgbVov1S8cO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4244605, 'Laura', 'Martínez', 'juan@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'examen de grado', '73177914', 
        2023, 1, 'Completo', '3uFRkdtQcs5p');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6045837, 'María', 'Rodríguez', 'ana@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'tesis de grado', '77338094', 
        2021, 1, 'Completo', 'FHZnA47o');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4061553, 'Carmen', 'López', 'pedro@ucb.edu.bo', 
        'ana@yahoo.com', 'Medicina', 'tesis de grado', '68402415', 
        2021, 1, 'Completo', 'XP4BTPzt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8722362, 'Sofía', 'López', 'pedro@ucb.edu.bo', 
        'sofía@gmail.com', 'Derecho', 'taller de grado 1 y 2', '66539868', 
        2023, 1, 'Completo', '4CjkQHLKWp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9753901, 'Luis', 'Pérez', 'laura@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'petae', '68022406', 
        2022, 2, 'Completo', 'q6qdBP6nN5EK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3668897, 'Luis', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'trabajo de grado', '69775947', 
        2023, 2, 'No Completo', 'CNhVFpY95JdO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6417172, 'Juan', 'Flores', 'jorge@ucb.edu.bo', 
        'maría@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '68129026', 
        2024, 2, 'Completo', 'IIpO6aDjk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5392185, 'María', 'Flores', 'carlos@ucb.edu.bo', 
        'laura@gmail.com', 'Psicología', 'graduación por diplomado', '72813391', 
        2022, 1, 'No Completo', '5gJGXL1JQQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1528881, 'Carlos', 'Martínez', 'jorge@ucb.edu.bo', 
        'sofía@yahoo.com', 'Comunicación', 'tesis de grado', '71148346', 
        2021, 1, 'No Completo', '4bMtIZXChAVx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3672812, 'Laura', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'sofía@hotmail.com', 'Derecho', 'trabajo de grado', '60146197', 
        2022, 1, 'Completo', 'zSP9Lyodb8JK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1520871, 'Sofía', 'Pérez', 'carlos@ucb.edu.bo', 
        'juan@yahoo.com', 'Psicología', 'trabajo de grado', '68808845', 
        2022, 2, 'Completo', 'iGSkaJkBA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9876512, 'María', 'Ramírez', 'pedro@ucb.edu.bo', 
        'pedro@yahoo.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '66543450', 
        2022, 1, 'No Completo', 'P0A94or5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6808285, 'María', 'Martínez', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Arquitectura', 'examen de grado', '66553121', 
        2020, 2, 'Completo', 'gLwHiB4xpz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4191098, 'Pedro', 'Sánchez', 'maría@ucb.edu.bo', 
        'nan', 'Arquitectura', 'proyecto dirigido', '64615137', 
        2024, 1, 'No Completo', 'vuWGHfuJSk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5819464, 'Carlos', 'López', 'luis@ucb.edu.bo', 
        'jorge@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '77993940', 
        2023, 2, 'Completo', 'KNPruN4vp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1863411, 'Laura', 'Sánchez', 'laura@ucb.edu.bo', 
        'sofía@yahoo.com', 'Arquitectura', 'taller de grado 1 y 2', '73153616', 
        2022, 1, 'No Completo', '9tPC9ZAKh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7747564, 'Luis', 'Ramírez', 'maría@ucb.edu.bo', 
        'luis@gmail.com', 'Medicina', 'examen de grado', '61917435', 
        2023, 2, 'No Completo', 'syVhPiwUkU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2275525, 'María', 'González', 'maría@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'proyecto dirigido', '76350425', 
        2020, 1, 'No Completo', 'tUMfqxjg0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3653522, 'Juan', 'González', 'luis@ucb.edu.bo', 
        'nan', 'Arquitectura', 'taller de grado 1 y 2', '63032126', 
        2022, 2, 'No Completo', '56FL1xz4BB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3767610, 'María', 'Flores', 'carlos@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '70263531', 
        2022, 2, 'Completo', 'BsXE5jPSKU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2001913, 'Luis', 'González', 'sofía@ucb.edu.bo', 
        'pedro@gmail.com', 'Derecho', 'taller de grado 1 y 2', '76732071', 
        2020, 2, 'No Completo', 'br5ix0im');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2569776, 'Carlos', 'Rodríguez', 'laura@ucb.edu.bo', 
        'sofía@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '62999814', 
        2020, 2, 'No Completo', '7AVzmwy7BPAH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2356070, 'Ana', 'Martínez', 'luis@ucb.edu.bo', 
        'juan@hotmail.com', 'Derecho', 'tesis de grado', '78093002', 
        2024, 2, 'Completo', 'ZttunUdq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7072746, 'Luis', 'Flores', 'maría@ucb.edu.bo', 
        'sofía@hotmail.com', 'Derecho', 'graduación por diplomado', '63090464', 
        2021, 2, 'Completo', 'ugf1nxNjdNvo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8652599, 'Ana', 'Flores', 'carlos@ucb.edu.bo', 
        'carmen@hotmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '70732099', 
        2023, 1, 'Completo', '5zzHoFWsNt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9557763, 'Ana', 'Pérez', 'luis@ucb.edu.bo', 
        'jorge@gmail.com', 'Derecho', 'petae', '75110440', 
        2024, 1, 'No Completo', 'AKouTPYvk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6343345, 'Carlos', 'Martínez', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Medicina', 'graduación por diplomado', '62431379', 
        2020, 2, 'No Completo', 'meyiQ9MPI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8729291, 'Carmen', 'Flores', 'carmen@ucb.edu.bo', 
        'carmen@yahoo.com', 'Medicina', 'graduación por diplomado', '63463270', 
        2020, 2, 'Completo', 'OHogUEJ3FKLd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7335627, 'Luis', 'Martínez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Derecho', 'tesis de grado', '70405103', 
        2024, 2, 'No Completo', 'mhIiVIvx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8787312, 'Carmen', 'Rodríguez', 'ana@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'tesis de grado', '60873551', 
        2020, 1, 'Completo', 'acdmEc4vzv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1021530, 'María', 'González', 'carmen@ucb.edu.bo', 
        'luis@hotmail.com', 'Comunicación', 'proyecto dirigido', '65608196', 
        2024, 2, 'No Completo', 'jqFeRsw0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3956701, 'María', 'González', 'carlos@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '72867671', 
        2024, 2, 'Completo', 'LSEb4iktHx7l');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9565756, 'Carlos', 'Ramírez', 'maría@ucb.edu.bo', 
        'pedro@gmail.com', 'Arquitectura', 'petae', '65810072', 
        2024, 1, 'No Completo', 'K4n3DsQVV');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8035370, 'Ana', 'González', 'maría@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '71954351', 
        2023, 1, 'No Completo', 'F2Ga0HCPH4o');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7086826, 'Carlos', 'Ramírez', 'maría@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'graduación por diplomado', '67502006', 
        2021, 2, 'No Completo', 'MUYEhl5CucO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5224041, 'Carlos', 'Ramírez', 'laura@ucb.edu.bo', 
        'carmen@hotmail.com', 'Derecho', 'examen de grado', '77684351', 
        2023, 2, 'Completo', 'lGiU25dEN');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4048639, 'Juan', 'Martínez', 'maría@ucb.edu.bo', 
        'carlos@yahoo.com', 'Comunicación', 'taller de grado 1 y 2', '74213686', 
        2020, 1, 'Completo', '87jUB43jbJNA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1686043, 'María', 'Pérez', 'sofía@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '79038238', 
        2021, 2, 'Completo', 'fDh3cvxh3pj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4005340, 'Pedro', 'Ramírez', 'luis@ucb.edu.bo', 
        'jorge@hotmail.com', 'Derecho', 'petae', '66283656', 
        2022, 1, 'No Completo', 'DOuMaP0VK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8677689, 'Juan', 'Martínez', 'juan@ucb.edu.bo', 
        'nan', 'Derecho', 'petae', '78403181', 
        2024, 1, 'No Completo', 'tYOS1wJnwwL5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8757988, 'Luis', 'Flores', 'luis@ucb.edu.bo', 
        'carlos@yahoo.com', 'Medicina', 'proyecto dirigido', '78571751', 
        2023, 1, 'No Completo', 'WTNsqcH14');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4575707, 'Sofía', 'Sánchez', 'carlos@ucb.edu.bo', 
        'pedro@yahoo.com', 'Comunicación', 'tesis de grado', '61250049', 
        2021, 1, 'No Completo', 'ADln3WKFh9C');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1809484, 'Luis', 'González', 'juan@ucb.edu.bo', 
        'ana@hotmail.com', 'Medicina', 'tesis de grado', '63244726', 
        2024, 1, 'No Completo', 'rMgxpOLF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3773884, 'María', 'Martínez', 'luis@ucb.edu.bo', 
        'juan@yahoo.com', 'Medicina', 'tesis de grado', '60331322', 
        2023, 1, 'Completo', '6j8cSVP9Y');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4685170, 'Carlos', 'González', 'carmen@ucb.edu.bo', 
        'carmen@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '70564559', 
        2021, 1, 'No Completo', 'nlD7XlPDDdt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8802801, 'María', 'Martínez', 'maría@ucb.edu.bo', 
        'juan@gmail.com', 'Arquitectura', 'taller de grado 1 y 2', '69896924', 
        2020, 1, 'Completo', 'fjcZNl3OZBLh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4942072, 'María', 'López', 'luis@ucb.edu.bo', 
        'laura@gmail.com', 'Psicología', 'trabajo de grado', '61981704', 
        2020, 2, 'No Completo', 'YGIFRJmKR0c');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8020165, 'Laura', 'López', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '77010613', 
        2022, 2, 'No Completo', 'gdmsZHnS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1954282, 'Carmen', 'López', 'sofía@ucb.edu.bo', 
        'carlos@gmail.com', 'Arquitectura', 'trabajo de grado', '74562319', 
        2023, 2, 'No Completo', 'xHZ4fpm3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6269289, 'Pedro', 'Ramírez', 'carmen@ucb.edu.bo', 
        'sofía@gmail.com', 'Comunicación', 'taller de grado 1 y 2', '72319869', 
        2021, 1, 'No Completo', 'GlQ9xpu7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4883049, 'Sofía', 'Flores', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'graduación por diplomado', '69124447', 
        2024, 1, 'Completo', 'wK4IuE8tkiRv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5179337, 'Sofía', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'laura@yahoo.com', 'Medicina', 'trabajo de grado', '78558849', 
        2020, 2, 'Completo', '2XvLnlj7W0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4888411, 'Ana', 'Pérez', 'jorge@ucb.edu.bo', 
        'carlos@hotmail.com', 'Derecho', 'proyecto dirigido', '73017558', 
        2021, 1, 'No Completo', 'scNvZFlb');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4194658, 'Juan', 'Ramírez', 'maría@ucb.edu.bo', 
        'nan', 'Arquitectura', 'tesis de grado', '73609716', 
        2024, 1, 'No Completo', 'fAJ1C8yrPROy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7198015, 'Ana', 'González', 'pedro@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'proyecto dirigido', '79830416', 
        2023, 2, 'No Completo', 'OFPkfpLch');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6968236, 'Juan', 'Flores', 'carmen@ucb.edu.bo', 
        'jorge@gmail.com', 'Comunicación', 'graduación por diplomado', '64197858', 
        2020, 1, 'No Completo', 'Q5bNhT50fxO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3908332, 'María', 'Flores', 'maría@ucb.edu.bo', 
        'laura@hotmail.com', 'Comunicación', 'proyecto dirigido', '68592789', 
        2024, 1, 'No Completo', '9DROSSc0');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7518513, 'Jorge', 'Martínez', 'juan@ucb.edu.bo', 
        'juan@hotmail.com', 'Comunicación', 'tesis de grado', '66828142', 
        2020, 1, 'Completo', 'dhVHlZFNKY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3899192, 'Ana', 'Pérez', 'laura@ucb.edu.bo', 
        'jorge@hotmail.com', 'Derecho', 'proyecto dirigido', '63344258', 
        2020, 1, 'No Completo', 'BXC8FWiEZqGo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6872305, 'María', 'Rodríguez', 'laura@ucb.edu.bo', 
        'ana@hotmail.com', 'Comunicación', 'petae', '69302702', 
        2024, 2, 'Completo', 'UE6jF15YX2Xt');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7211730, 'Carmen', 'Rodríguez', 'laura@ucb.edu.bo', 
        'laura@gmail.com', 'Medicina', 'graduación por diplomado', '64491668', 
        2020, 1, 'Completo', 'rSU2Wyh0w4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1163789, 'Carmen', 'López', 'luis@ucb.edu.bo', 
        'ana@gmail.com', 'Medicina', 'petae', '75328804', 
        2021, 1, 'No Completo', 'rX7iaj7f4x');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8264131, 'Pedro', 'López', 'carlos@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '74750792', 
        2022, 2, 'Completo', 'Dnkgn3rXqs1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2536544, 'Carlos', 'Sánchez', 'laura@ucb.edu.bo', 
        'sofía@hotmail.com', 'Medicina', 'proyecto dirigido', '77920151', 
        2023, 1, 'No Completo', 'bm4X8dBEVx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7329554, 'Laura', 'Sánchez', 'ana@ucb.edu.bo', 
        'luis@yahoo.com', 'Comunicación', 'trabajo de grado', '73337965', 
        2020, 2, 'No Completo', 'j5MtmVxiDM');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3741817, 'Pedro', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'luis@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '64366413', 
        2024, 2, 'Completo', 'KeUTMJUa');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4259968, 'Carlos', 'Martínez', 'carmen@ucb.edu.bo', 
        'laura@yahoo.com', 'Medicina', 'graduación por diplomado', '73920095', 
        2024, 2, 'Completo', '0XRMnIh7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9981938, 'Pedro', 'Martínez', 'maría@ucb.edu.bo', 
        'sofía@yahoo.com', 'Ingeniería de Sistemas', 'petae', '64416627', 
        2023, 2, 'No Completo', 'J784iqZ8Aw');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4524854, 'Luis', 'Ramírez', 'ana@ucb.edu.bo', 
        'pedro@gmail.com', 'Medicina', 'examen de grado', '75942679', 
        2022, 2, 'No Completo', '7QoWlHT1e6c');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4595760, 'Pedro', 'González', 'carlos@ucb.edu.bo', 
        'carlos@gmail.com', 'Psicología', 'taller de grado 1 y 2', '71141165', 
        2023, 2, 'Completo', 'rLhlhRFkv7m');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8205791, 'Pedro', 'López', 'sofía@ucb.edu.bo', 
        'ana@hotmail.com', 'Medicina', 'trabajo de grado', '69044812', 
        2023, 1, 'Completo', '7fi91j6fFdiz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3415897, 'Carlos', 'López', 'luis@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '73025104', 
        2023, 2, 'Completo', 'rB92zdrTZKyB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2812687, 'María', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'luis@yahoo.com', 'Comunicación', 'graduación por diplomado', '75529117', 
        2022, 1, 'No Completo', 'qhL3zmtxQsX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1222582, 'Laura', 'Flores', 'jorge@ucb.edu.bo', 
        'carmen@yahoo.com', 'Medicina', 'graduación por diplomado', '64897714', 
        2024, 1, 'No Completo', 'uTx9AtCHCQC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7818462, 'Laura', 'Flores', 'pedro@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'proyecto dirigido', '76780193', 
        2024, 2, 'No Completo', 'TE8bzU5o9ZS');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9276601, 'María', 'Martínez', 'maría@ucb.edu.bo', 
        'jorge@gmail.com', 'Psicología', 'taller de grado 1 y 2', '76559369', 
        2024, 1, 'No Completo', 'Vb5XcCUGv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1624367, 'Luis', 'González', 'carmen@ucb.edu.bo', 
        'carlos@gmail.com', 'Arquitectura', 'proyecto dirigido', '71797778', 
        2023, 1, 'No Completo', 'vLTwohNW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9668653, 'Luis', 'González', 'maría@ucb.edu.bo', 
        'juan@yahoo.com', 'Medicina', 'trabajo de grado', '71063099', 
        2021, 1, 'No Completo', '19iicsQcu1fr');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3195076, 'Carlos', 'Flores', 'luis@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'examen de grado', '79699672', 
        2024, 1, 'No Completo', 't2fqvSThlaNe');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7681821, 'Pedro', 'González', 'maría@ucb.edu.bo', 
        'nan', 'Medicina', 'petae', '77536252', 
        2021, 1, 'No Completo', 'zvZtXURLqyEK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9749376, 'Jorge', 'Ramírez', 'sofía@ucb.edu.bo', 
        'nan', 'Comunicación', 'proyecto dirigido', '77814487', 
        2023, 1, 'No Completo', '2jxzxWU7zC5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4866960, 'María', 'Flores', 'carmen@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'taller de grado 1 y 2', '76566829', 
        2020, 1, 'No Completo', 'LGKXCeJ3X');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7060098, 'Pedro', 'Ramírez', 'carmen@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'graduación por diplomado', '61875853', 
        2020, 2, 'No Completo', 'IJMfrS9wPy8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6490476, 'Luis', 'López', 'jorge@ucb.edu.bo', 
        'jorge@gmail.com', 'Arquitectura', 'tesis de grado', '62750544', 
        2022, 1, 'No Completo', 'HvfY3y4AtmL5');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7577425, 'Luis', 'Ramírez', 'maría@ucb.edu.bo', 
        'maría@hotmail.com', 'Medicina', 'tesis de grado', '73651395', 
        2021, 1, 'No Completo', 'XYYwh6kpEs');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6374564, 'Laura', 'González', 'pedro@ucb.edu.bo', 
        'nan', 'Medicina', 'tesis de grado', '78109186', 
        2023, 1, 'Completo', '3DzeR58ifXRG');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6457016, 'Ana', 'González', 'jorge@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'petae', '61322128', 
        2023, 2, 'No Completo', 'Tu8ccT9K');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9976202, 'Laura', 'Rodríguez', 'jorge@ucb.edu.bo', 
        'nan', 'Arquitectura', 'trabajo de grado', '78425448', 
        2021, 2, 'No Completo', 'x4HfFVm9VT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3905058, 'Juan', 'González', 'pedro@ucb.edu.bo', 
        'carmen@yahoo.com', 'Arquitectura', 'graduación por diplomado', '70827329', 
        2024, 2, 'No Completo', 'iAVtyowv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8128896, 'Sofía', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'juan@gmail.com', 'Arquitectura', 'examen de grado', '74852273', 
        2024, 1, 'Completo', 'i5PkHQ7oPaXz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6431850, 'Luis', 'Flores', 'carmen@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'examen de grado', '71320047', 
        2023, 1, 'Completo', 'VRj6fQ8gGXh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3628659, 'Luis', 'González', 'juan@ucb.edu.bo', 
        'carlos@gmail.com', 'Arquitectura', 'graduación por diplomado', '73769525', 
        2022, 2, 'No Completo', 'PYzdhv8x');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9661495, 'Carmen', 'Ramírez', 'juan@ucb.edu.bo', 
        'carlos@gmail.com', 'Psicología', 'trabajo de grado', '65857633', 
        2022, 2, 'No Completo', 'NiFAc6oYkc');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2238530, 'Luis', 'Pérez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '76881541', 
        2024, 1, 'No Completo', 'dDrxbaqE');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3671684, 'Carlos', 'Ramírez', 'pedro@ucb.edu.bo', 
        'nan', 'Psicología', 'proyecto dirigido', '75738784', 
        2021, 1, 'No Completo', '0KSlHarDsKo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2532780, 'Juan', 'Flores', 'sofía@ucb.edu.bo', 
        'pedro@hotmail.com', 'Psicología', 'tesis de grado', '71194152', 
        2022, 2, 'No Completo', '25MxqAQpp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4346312, 'Juan', 'González', 'juan@ucb.edu.bo', 
        'ana@hotmail.com', 'Medicina', 'proyecto dirigido', '71329487', 
        2020, 1, 'Completo', 'W89aRnvS87');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8337206, 'María', 'Martínez', 'carmen@ucb.edu.bo', 
        'sofía@hotmail.com', 'Psicología', 'petae', '77086552', 
        2021, 1, 'Completo', 'swajSZCRKf');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3111982, 'Carlos', 'Flores', 'luis@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '70153984', 
        2023, 1, 'No Completo', 'UzbBUVUb2L');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9888603, 'Sofía', 'Rodríguez', 'luis@ucb.edu.bo', 
        'sofía@hotmail.com', 'Derecho', 'taller de grado 1 y 2', '64612169', 
        2021, 1, 'Completo', 'F7OXACnEx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5490604, 'Carmen', 'González', 'ana@ucb.edu.bo', 
        'ana@hotmail.com', 'Arquitectura', 'proyecto dirigido', '60632360', 
        2022, 1, 'Completo', 'zkKUCwAp');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7505073, 'Sofía', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'taller de grado 1 y 2', '64667197', 
        2022, 1, 'No Completo', '2y9oqizc2nb1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7219590, 'Jorge', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'ana@yahoo.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '68080663', 
        2024, 2, 'No Completo', 'YXMblHZjqLC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9570428, 'Laura', 'Pérez', 'laura@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '67001511', 
        2022, 2, 'Completo', 'CJX41s5Z');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6306010, 'Luis', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'petae', '67700488', 
        2022, 2, 'Completo', 'uwuUTWA8Ck');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6577598, 'Luis', 'Pérez', 'juan@ucb.edu.bo', 
        'sofía@yahoo.com', 'Psicología', 'tesis de grado', '67715986', 
        2022, 1, 'Completo', 'obripIfBv');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1309175, 'Laura', 'Pérez', 'sofía@ucb.edu.bo', 
        'juan@yahoo.com', 'Derecho', 'graduación por diplomado', '79332517', 
        2020, 2, 'No Completo', 'Hc8gytMtB2');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7806593, 'Sofía', 'González', 'sofía@ucb.edu.bo', 
        'luis@gmail.com', 'Psicología', 'examen de grado', '63398548', 
        2022, 1, 'Completo', '2rGOX5isDb');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9804307, 'Laura', 'Flores', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'examen de grado', '71216589', 
        2024, 2, 'No Completo', 'oTc1rqNHH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6336332, 'Carmen', 'Rodríguez', 'laura@ucb.edu.bo', 
        'sofía@hotmail.com', 'Derecho', 'proyecto dirigido', '73403072', 
        2023, 1, 'Completo', 'UBbpfgi4');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7750222, 'Pedro', 'Ramírez', 'maría@ucb.edu.bo', 
        'juan@gmail.com', 'Comunicación', 'proyecto dirigido', '60073602', 
        2022, 1, 'Completo', 'oHVxRPJwP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6141471, 'Luis', 'López', 'pedro@ucb.edu.bo', 
        'carmen@yahoo.com', 'Comunicación', 'proyecto dirigido', '78557943', 
        2024, 2, 'Completo', 'mjrE4qSwzmj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1682976, 'Juan', 'Pérez', 'maría@ucb.edu.bo', 
        'sofía@yahoo.com', 'Comunicación', 'examen de grado', '78674072', 
        2023, 2, 'Completo', 'fSGvSKd88');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5522932, 'Juan', 'Sánchez', 'carmen@ucb.edu.bo', 
        'carmen@yahoo.com', 'Psicología', 'tesis de grado', '69306518', 
        2024, 2, 'Completo', '0orpvemjO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7969243, 'Carlos', 'López', 'carlos@ucb.edu.bo', 
        'ana@yahoo.com', 'Comunicación', 'trabajo de grado', '72375978', 
        2020, 2, 'Completo', 'lMUjezh9fpP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2139956, 'Ana', 'López', 'carlos@ucb.edu.bo', 
        'pedro@hotmail.com', 'Ingeniería de Sistemas', 'graduación por diplomado', '79942490', 
        2022, 2, 'No Completo', 'Xq7Z0lO3Zxn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1467582, 'Ana', 'Ramírez', 'carmen@ucb.edu.bo', 
        'carlos@gmail.com', 'Arquitectura', 'tesis de grado', '73193098', 
        2022, 2, 'Completo', 'bQ4luCpUK3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8223856, 'María', 'Sánchez', 'ana@ucb.edu.bo', 
        'nan', 'Psicología', 'petae', '79470118', 
        2020, 1, 'No Completo', 'k1eOAMxjl8');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7791848, 'Luis', 'Pérez', 'juan@ucb.edu.bo', 
        'ana@gmail.com', 'Psicología', 'taller de grado 1 y 2', '63839107', 
        2020, 1, 'No Completo', 'aSOcOjnito');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1013831, 'María', 'Pérez', 'sofía@ucb.edu.bo', 
        'ana@gmail.com', 'Arquitectura', 'examen de grado', '74095470', 
        2024, 2, 'No Completo', '9AXSPHAQH');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9256073, 'Ana', 'Flores', 'pedro@ucb.edu.bo', 
        'laura@yahoo.com', 'Comunicación', 'petae', '72591719', 
        2023, 1, 'Completo', 'yKnvsMIjuk');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5491800, 'Carlos', 'Flores', 'pedro@ucb.edu.bo', 
        'carmen@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '60200105', 
        2020, 1, 'No Completo', 'T6HPauTZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8659847, 'Laura', 'Rodríguez', 'carmen@ucb.edu.bo', 
        'jorge@yahoo.com', 'Ingeniería de Sistemas', 'petae', '71498784', 
        2020, 2, 'No Completo', 'LArJVwftSqT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7031197, 'Ana', 'Pérez', 'carlos@ucb.edu.bo', 
        'carlos@yahoo.com', 'Medicina', 'petae', '61106823', 
        2022, 2, 'No Completo', 'em964Acz');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1875206, 'Luis', 'Martínez', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'petae', '78214693', 
        2024, 1, 'Completo', 'IGUkZhHx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5499632, 'Laura', 'González', 'luis@ucb.edu.bo', 
        'luis@yahoo.com', 'Ingeniería de Sistemas', 'petae', '73657332', 
        2020, 1, 'Completo', 'VdZ5l0jX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8134086, 'Laura', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'nan', 'Derecho', 'taller de grado 1 y 2', '75294388', 
        2023, 2, 'No Completo', 'OQQlBUGj3Ec7');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7025579, 'Jorge', 'Pérez', 'juan@ucb.edu.bo', 
        'maría@hotmail.com', 'Derecho', 'taller de grado 1 y 2', '64007881', 
        2021, 2, 'No Completo', 'fWr392wZ0KX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5884463, 'Juan', 'López', 'maría@ucb.edu.bo', 
        'nan', 'Derecho', 'graduación por diplomado', '61066929', 
        2023, 2, 'Completo', 'dlGivMPUNF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2119316, 'Jorge', 'Sánchez', 'carlos@ucb.edu.bo', 
        'jorge@yahoo.com', 'Psicología', 'tesis de grado', '76681425', 
        2020, 1, 'Completo', '2RqZU7GjI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3248814, 'Jorge', 'Rodríguez', 'juan@ucb.edu.bo', 
        'maría@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '70472803', 
        2021, 2, 'Completo', 'gXfOlrAQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9050068, 'Pedro', 'Martínez', 'jorge@ucb.edu.bo', 
        'sofía@yahoo.com', 'Psicología', 'tesis de grado', '60704000', 
        2020, 2, 'Completo', 'AkSgALRIfjj');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4802612, 'Sofía', 'Pérez', 'ana@ucb.edu.bo', 
        'pedro@yahoo.com', 'Arquitectura', 'petae', '71450768', 
        2022, 2, 'Completo', '2U4VA7cy7xI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5152815, 'Pedro', 'Sánchez', 'ana@ucb.edu.bo', 
        'nan', 'Medicina', 'tesis de grado', '77805643', 
        2024, 1, 'Completo', 'bWbzKEzb');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1783546, 'Ana', 'López', 'ana@ucb.edu.bo', 
        'laura@yahoo.com', 'Psicología', 'taller de grado 1 y 2', '60791660', 
        2023, 1, 'No Completo', 'EZqhqC54yOPF');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6367922, 'Luis', 'Sánchez', 'sofía@ucb.edu.bo', 
        'nan', 'Medicina', 'petae', '62100411', 
        2023, 2, 'No Completo', 'FjikLrkDY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5779899, 'Carlos', 'Ramírez', 'ana@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'taller de grado 1 y 2', '74305672', 
        2024, 1, 'No Completo', 'qudwTf0ItptL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3986208, 'Luis', 'Flores', 'maría@ucb.edu.bo', 
        'pedro@yahoo.com', 'Psicología', 'examen de grado', '76973499', 
        2020, 1, 'Completo', 'nzbtpPMN6k5G');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6185958, 'Laura', 'Flores', 'carlos@ucb.edu.bo', 
        'laura@hotmail.com', 'Derecho', 'graduación por diplomado', '66922818', 
        2020, 1, 'Completo', '2dX1e0HA9a');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9591406, 'Sofía', 'Flores', 'sofía@ucb.edu.bo', 
        'jorge@gmail.com', 'Comunicación', 'trabajo de grado', '71417397', 
        2021, 1, 'No Completo', 'gFT9vaegKeg9');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9513049, 'Luis', 'González', 'laura@ucb.edu.bo', 
        'nan', 'Comunicación', 'tesis de grado', '60266961', 
        2022, 2, 'No Completo', '7hffCe2Jre');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9396914, 'Laura', 'Ramírez', 'maría@ucb.edu.bo', 
        'juan@hotmail.com', 'Psicología', 'petae', '64243401', 
        2022, 1, 'Completo', 'V7LTztlKfHLq');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2399400, 'Laura', 'López', 'sofía@ucb.edu.bo', 
        'juan@gmail.com', 'Medicina', 'proyecto dirigido', '60466863', 
        2023, 1, 'Completo', 'mZP9CE7pA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8951459, 'Jorge', 'Ramírez', 'sofía@ucb.edu.bo', 
        'sofía@gmail.com', 'Psicología', 'tesis de grado', '77464958', 
        2024, 1, 'No Completo', '8RfwGnYpl');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2245357, 'Jorge', 'Sánchez', 'pedro@ucb.edu.bo', 
        'ana@hotmail.com', 'Psicología', 'petae', '65536795', 
        2024, 2, 'Completo', 'bsxxqDIx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9035084, 'Luis', 'González', 'juan@ucb.edu.bo', 
        'pedro@hotmail.com', 'Comunicación', 'petae', '66486211', 
        2021, 1, 'No Completo', '7LZvxaOAeo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8375929, 'Juan', 'Pérez', 'jorge@ucb.edu.bo', 
        'maría@hotmail.com', 'Comunicación', 'examen de grado', '78392117', 
        2022, 2, 'Completo', 'msCamLjaVQ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4586728, 'Luis', 'López', 'luis@ucb.edu.bo', 
        'luis@yahoo.com', 'Derecho', 'tesis de grado', '60674052', 
        2021, 2, 'No Completo', '4VVYPcvzBn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4049774, 'Jorge', 'Pérez', 'carlos@ucb.edu.bo', 
        'carmen@gmail.com', 'Arquitectura', 'proyecto dirigido', '77982423', 
        2021, 1, 'No Completo', 'Ab00utYy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3084225, 'Pedro', 'Rodríguez', 'maría@ucb.edu.bo', 
        'maría@hotmail.com', 'Psicología', 'petae', '79624233', 
        2020, 2, 'Completo', 'Knur10Ibhnx');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6575351, 'Sofía', 'González', 'luis@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'examen de grado', '62846504', 
        2022, 2, 'No Completo', 'nWUC5kRh');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9119926, 'María', 'Ramírez', 'jorge@ucb.edu.bo', 
        'nan', 'Derecho', 'proyecto dirigido', '63060673', 
        2022, 2, 'No Completo', 'dTYbQ6LwsPA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5921531, 'María', 'López', 'luis@ucb.edu.bo', 
        'pedro@hotmail.com', 'Derecho', 'proyecto dirigido', '73600521', 
        2020, 2, 'No Completo', 'PCis824M');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8526445, 'Carlos', 'Flores', 'maría@ucb.edu.bo', 
        'maría@hotmail.com', 'Arquitectura', 'taller de grado 1 y 2', '73149758', 
        2020, 2, 'No Completo', 'mipIHhraj8Rd');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4013637, 'Laura', 'González', 'pedro@ucb.edu.bo', 
        'luis@yahoo.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '66302736', 
        2023, 1, 'No Completo', 'ePNhmW7iU');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3995751, 'Pedro', 'López', 'carmen@ucb.edu.bo', 
        'ana@hotmail.com', 'Medicina', 'trabajo de grado', '78198556', 
        2024, 2, 'Completo', '1PZ9mwqnW7F6');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5906916, 'Juan', 'Pérez', 'carmen@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '74809102', 
        2020, 1, 'Completo', 'yX2ux8IL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6154192, 'Juan', 'López', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'examen de grado', '78220240', 
        2021, 1, 'No Completo', 'rUjEDfvkV04');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7847883, 'Carmen', 'Pérez', 'maría@ucb.edu.bo', 
        'luis@hotmail.com', 'Medicina', 'taller de grado 1 y 2', '62692574', 
        2023, 2, 'No Completo', 'VYBUi72p');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7690276, 'María', 'Ramírez', 'laura@ucb.edu.bo', 
        'nan', 'Derecho', 'trabajo de grado', '76725097', 
        2024, 1, 'No Completo', 'LTyApHJW');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6849921, 'Jorge', 'Martínez', 'juan@ucb.edu.bo', 
        'ana@hotmail.com', 'Psicología', 'petae', '60367276', 
        2023, 2, 'No Completo', 'eZ0LxOP9lQyP');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6510768, 'Carmen', 'Rodríguez', 'luis@ucb.edu.bo', 
        'luis@hotmail.com', 'Ingeniería de Sistemas', 'petae', '65147004', 
        2022, 2, 'No Completo', '67qbJt6yoB');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6135820, 'María', 'Martínez', 'pedro@ucb.edu.bo', 
        'ana@yahoo.com', 'Medicina', 'tesis de grado', '68608318', 
        2024, 2, 'No Completo', 'cinMZr6xqf19');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9725050, 'Juan', 'Pérez', 'pedro@ucb.edu.bo', 
        'luis@gmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '61000511', 
        2020, 1, 'No Completo', 'm3KJp3TJC');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4395154, 'Carlos', 'Rodríguez', 'laura@ucb.edu.bo', 
        'carlos@gmail.com', 'Comunicación', 'examen de grado', '60503533', 
        2024, 1, 'Completo', 'GT47sjLqC3');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (2364762, 'Carmen', 'López', 'carlos@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'trabajo de grado', '72476019', 
        2021, 2, 'Completo', 'Z0Liwm37pYqy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5631048, 'Ana', 'Sánchez', 'carmen@ucb.edu.bo', 
        'juan@hotmail.com', 'Ingeniería de Sistemas', 'trabajo de grado', '71800308', 
        2020, 1, 'No Completo', 'kE6jPAlMrA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3161681, 'Sofía', 'Rodríguez', 'pedro@ucb.edu.bo', 
        'maría@gmail.com', 'Arquitectura', 'graduación por diplomado', '62321786', 
        2023, 1, 'Completo', '8N8fzPShAQy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1846538, 'Sofía', 'López', 'laura@ucb.edu.bo', 
        'carmen@gmail.com', 'Derecho', 'graduación por diplomado', '76295010', 
        2023, 2, 'No Completo', 'VJf1O9jEpy');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6028720, 'María', 'Rodríguez', 'sofía@ucb.edu.bo', 
        'pedro@yahoo.com', 'Derecho', 'taller de grado 1 y 2', '60329170', 
        2023, 1, 'Completo', 'Y6kbRVsPNNof');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (4725701, 'Ana', 'Pérez', 'juan@ucb.edu.bo', 
        'laura@hotmail.com', 'Ingeniería de Sistemas', 'tesis de grado', '73107621', 
        2024, 2, 'No Completo', 'xsXt40vLX');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7977522, 'Sofía', 'Pérez', 'jorge@ucb.edu.bo', 
        'nan', 'Ingeniería de Sistemas', 'proyecto dirigido', '63617357', 
        2020, 2, 'No Completo', 'mF0u0e4g9OT');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3551166, 'María', 'Martínez', 'juan@ucb.edu.bo', 
        'laura@hotmail.com', 'Ingeniería de Sistemas', 'proyecto dirigido', '76674400', 
        2024, 2, 'No Completo', '36MFSiHSoga1');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8026577, 'Luis', 'López', 'sofía@ucb.edu.bo', 
        'ana@yahoo.com', 'Psicología', 'proyecto dirigido', '76595077', 
        2023, 2, 'Completo', 'qZmbaGyI6M');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1453877, 'María', 'González', 'maría@ucb.edu.bo', 
        'carlos@gmail.com', 'Ingeniería de Sistemas', 'petae', '69058154', 
        2024, 2, 'No Completo', '3pW64MO1dZ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1898852, 'Luis', 'López', 'ana@ucb.edu.bo', 
        'maría@gmail.com', 'Comunicación', 'tesis de grado', '73353990', 
        2022, 2, 'No Completo', 'sn7e7HbKZg');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8958356, 'Jorge', 'López', 'juan@ucb.edu.bo', 
        'maría@yahoo.com', 'Ingeniería de Sistemas', 'tesis de grado', '72446548', 
        2023, 2, 'No Completo', 'WGJgHkb2HJ');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (8167312, 'María', 'Ramírez', 'luis@ucb.edu.bo', 
        'nan', 'Comunicación', 'graduación por diplomado', '65782257', 
        2020, 1, 'No Completo', '8ERHohSu');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5331485, 'María', 'Martínez', 'maría@ucb.edu.bo', 
        'nan', 'Medicina', 'trabajo de grado', '62139967', 
        2023, 1, 'No Completo', 'cRc105xZNQI');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (6608600, 'Pedro', 'López', 'maría@ucb.edu.bo', 
        'juan@yahoo.com', 'Ingeniería de Sistemas', 'petae', '78030737', 
        2023, 2, 'No Completo', '53PPdKd9Su');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1256473, 'Carlos', 'Sánchez', 'carlos@ucb.edu.bo', 
        'carlos@yahoo.com', 'Arquitectura', 'tesis de grado', '69081473', 
        2023, 2, 'Completo', 'rRZvcd2dK');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9631819, 'Jorge', 'López', 'carlos@ucb.edu.bo', 
        'carmen@gmail.com', 'Comunicación', 'petae', '71051184', 
        2023, 2, 'Completo', '3cGjztIxY');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (9300205, 'María', 'González', 'carlos@ucb.edu.bo', 
        'luis@hotmail.com', 'Arquitectura', 'graduación por diplomado', '74646441', 
        2023, 1, 'No Completo', 'JJOAH1OdTO');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3743490, 'Carmen', 'Ramírez', 'sofía@ucb.edu.bo', 
        'laura@gmail.com', 'Arquitectura', 'graduación por diplomado', '60002485', 
        2021, 2, 'Completo', 'udcI3MOSS3sA');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3172220, 'Sofía', 'López', 'juan@ucb.edu.bo', 
        'nan', 'Psicología', 'examen de grado', '62933536', 
        2024, 2, 'No Completo', 'VaXJC0wIjUo');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (1401437, 'Carmen', 'Flores', 'jorge@ucb.edu.bo', 
        'maría@gmail.com', 'Psicología', 'petae', '73499898', 
        2020, 1, 'Completo', 'HTaIgwJLD');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (7569423, 'María', 'López', 'carlos@ucb.edu.bo', 
        'carlos@hotmail.com', 'Medicina', 'proyecto dirigido', '78914302', 
        2024, 2, 'Completo', 'tcnz7DZvx7qn');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (3386333, 'Jorge', 'Ramírez', 'carlos@ucb.edu.bo', 
        'pedro@hotmail.com', 'Psicología', 'taller de grado 1 y 2', '69251394', 
        2021, 2, 'No Completo', 'ZcQB1BgL');
INSERT INTO estudiantes (ci, nombre, apellido, correo_institucional, correo_personal, carrera, asignatura, telefono, anio, semestre, estado_invitacion, contrasena) 
        VALUES (5382383, 'Jorge', 'Sánchez', 'carmen@ucb.edu.bo', 
        'laura@yahoo.com', 'Derecho', 'graduación por diplomado', '73730299', 
        2020, 2, 'Completo', 'YSdHtz7it');

-- fin tabla estudiantes 1000 datos
