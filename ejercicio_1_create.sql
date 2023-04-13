-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-06 15:22:39.632

-- tables
-- Table: audio
CREATE TABLE audio (
    formato varchar(20)  NOT NULL,
    duracion int  NOT NULL,
    objeto_id_objeto int  NOT NULL,
    objeto_coleccion_id_coleccion int  NOT NULL,
    CONSTRAINT audio_pk PRIMARY KEY (objeto_id_objeto,objeto_coleccion_id_coleccion)
);

-- Table: coleccion
CREATE TABLE coleccion (
    id_coleccion int  NOT NULL,
    titulo_coleccion varchar(25)  NOT NULL,
    descripcion varchar(100)  NOT NULL,
    CONSTRAINT coleccion_pk PRIMARY KEY (id_coleccion)
);

-- Table: documento
CREATE TABLE documento (
    tipo_publicacion varchar(10)  NOT NULL,
    modos_color varchar(20)  NOT NULL,
    resolucion_captura varchar(20)  NOT NULL,
    objeto_id_objeto int  NOT NULL,
    objeto_coleccion_id_coleccion int  NOT NULL,
    CONSTRAINT documento_pk PRIMARY KEY (objeto_id_objeto,objeto_coleccion_id_coleccion)
);

-- Table: objeto
CREATE TABLE objeto (
    id_objeto int  NOT NULL,
    titulo varchar(25)  NOT NULL,
    descripcion varchar(50)  NOT NULL,
    fuente varchar(25)  NOT NULL,
    fecha date  NOT NULL,
    repositorio_id_repositorio int  NOT NULL,
    coleccion_id_coleccion int  NOT NULL,
    tipo varchar(10)  NOT NULL,
    CONSTRAINT objeto_pk PRIMARY KEY (id_objeto,coleccion_id_coleccion)
);

-- Table: repositorio
CREATE TABLE repositorio (
    id_repositorio int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    publico boolean  NOT NULL,
    descripcion  varchar(100)  NOT NULL,
    dueño varchar(40)  NULL,
    CONSTRAINT repositorio_pk PRIMARY KEY (id_repositorio)
);

-- Table: video
CREATE TABLE video (
    resolucion varchar(10)  NOT NULL,
    frames_x_segundo varchar(10)  NOT NULL,
    objeto_id_objeto int  NOT NULL,
    objeto_coleccion_id_coleccion int  NOT NULL,
    CONSTRAINT video_pk PRIMARY KEY (objeto_id_objeto,objeto_coleccion_id_coleccion)
);

-- foreign keys
-- Reference: audio_objeto (table: audio)
ALTER TABLE audio ADD CONSTRAINT audio_objeto
    FOREIGN KEY (objeto_id_objeto, objeto_coleccion_id_coleccion)
    REFERENCES objeto (id_objeto, coleccion_id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: documento_objeto (table: documento)
ALTER TABLE documento ADD CONSTRAINT documento_objeto
    FOREIGN KEY (objeto_id_objeto, objeto_coleccion_id_coleccion)
    REFERENCES objeto (id_objeto, coleccion_id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: objeto_coleccion (table: objeto)
ALTER TABLE objeto ADD CONSTRAINT objeto_coleccion
    FOREIGN KEY (coleccion_id_coleccion)
    REFERENCES coleccion (id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: objeto_repositorio (table: objeto)
ALTER TABLE objeto ADD CONSTRAINT objeto_repositorio
    FOREIGN KEY (repositorio_id_repositorio)
    REFERENCES repositorio (id_repositorio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: video_objeto (table: video)
ALTER TABLE video ADD CONSTRAINT video_objeto
    FOREIGN KEY (objeto_id_objeto, objeto_coleccion_id_coleccion)
    REFERENCES objeto (id_objeto, coleccion_id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

