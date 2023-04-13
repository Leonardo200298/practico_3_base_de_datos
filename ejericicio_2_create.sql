-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-12 20:50:42.776

-- tables
-- Table: autor_catalogo
CREATE TABLE autor_catalogo (
    autor int  NOT NULL,
    catalogo_libro_cod_catalogo int  NOT NULL,
    CONSTRAINT autor_catalogo_pk PRIMARY KEY (autor,catalogo_libro_cod_catalogo)
);

-- Table: catalogo_libro
CREATE TABLE catalogo_libro (
    cod_catalogo int  NOT NULL,
    titulo varchar(20)  NOT NULL,
    formato varchar(10)  NOT NULL,
    editorial varchar(20)  NOT NULL,
    CONSTRAINT catalogo_libro_pk PRIMARY KEY (cod_catalogo)
);

-- Table: con_carnet
CREATE TABLE con_carnet (
    nro_carnet int  NOT NULL,
    id_usuario int  NOT NULL,
    CONSTRAINT nro_carnet UNIQUE () NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT con_carnet_pk PRIMARY KEY (id_usuario)
);

-- Table: ejemplar_libreria
CREATE TABLE ejemplar_libreria (
    nro_ejemplar int  NOT NULL,
    anio_de_edicion int  NOT NULL,
    nro_edicion int  NOT NULL,
    catalogo_libro_cod_catalogo int  NOT NULL,
    CONSTRAINT ejemplar_libreria_pk PRIMARY KEY (nro_ejemplar,catalogo_libro_cod_catalogo)
);

-- Table: integran
CREATE TABLE integran (
    prestamo_id_prestamo int  NOT NULL,
    ejemplar_libreria_nro_ejemplar int  NOT NULL,
    CONSTRAINT integran_pk PRIMARY KEY (prestamo_id_prestamo,ejemplar_libreria_nro_ejemplar)
);

-- Table: prestamo
CREATE TABLE prestamo (
    id_prestamo int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    con_carnet_id_usuario int  NOT NULL,
    CONSTRAINT prestamo_pk PRIMARY KEY (id_prestamo)
);

-- Table: sin_carnet
CREATE TABLE sin_carnet (
    nro_celular int  NOT NULL,
    id_usuario int  NOT NULL,
    CONSTRAINT sin_carnet_pk PRIMARY KEY (id_usuario)
);

-- Table: usuario
CREATE TABLE usuario (
    id_usuario int  NOT NULL,
    tipo_de_doc varchar(10)  NOT NULL,
    nro_doc int  NOT NULL,
    apellido varchar(20)  NOT NULL,
    nombre varchar(20)  NOT NULL,
    email varchar(30)  NOT NULL,
    tipo_usario varchar(15)  NOT NULL,
    CONSTRAINT tipo_de_doc UNIQUE () NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT nro_doc UNIQUE () NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT usuario_pk PRIMARY KEY (id_usuario)
);

-- foreign keys
-- Reference: autor_catalogo_catalogo_libro (table: autor_catalogo)
ALTER TABLE autor_catalogo ADD CONSTRAINT autor_catalogo_catalogo_libro
    FOREIGN KEY (catalogo_libro_cod_catalogo)
    REFERENCES catalogo_libro (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: con_carnet_usuario (table: con_carnet)
ALTER TABLE con_carnet ADD CONSTRAINT con_carnet_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ejemplar_libreria_catalogo_libro (table: ejemplar_libreria)
ALTER TABLE ejemplar_libreria ADD CONSTRAINT ejemplar_libreria_catalogo_libro
    FOREIGN KEY (catalogo_libro_cod_catalogo)
    REFERENCES catalogo_libro (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: integran_ejemplar_libreria (table: integran)
ALTER TABLE integran ADD CONSTRAINT integran_ejemplar_libreria
    FOREIGN KEY (ejemplar_libreria_nro_ejemplar)
    REFERENCES ejemplar_libreria (nro_ejemplar)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: integran_prestamo (table: integran)
ALTER TABLE integran ADD CONSTRAINT integran_prestamo
    FOREIGN KEY (prestamo_id_prestamo)
    REFERENCES prestamo (id_prestamo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: prestamo_con_carnet (table: prestamo)
ALTER TABLE prestamo ADD CONSTRAINT prestamo_con_carnet
    FOREIGN KEY (con_carnet_id_usuario)
    REFERENCES con_carnet (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sin_carnet_usuario (table: sin_carnet)
ALTER TABLE sin_carnet ADD CONSTRAINT sin_carnet_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

