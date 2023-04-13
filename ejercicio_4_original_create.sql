-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-13 14:10:45.882

-- tables
-- Table: TP03_EJ04_DISCIPLINA
CREATE TABLE TP03_EJ04_DISCIPLINA (
    id_disciplina int  NOT NULL DEFAULT null,
    nombre_disciplina varchar(20)  NOT NULL DEFAULT null,
    descripcion_disciplina varchar(120)  NOT NULL DEFAULT null,
    CONSTRAINT TP03_EJ04_DISCIPLINA_pk PRIMARY KEY (id_disciplina)
);

-- Table: TP03_EJ04_INVESTIGADOR
CREATE TABLE TP03_EJ04_INVESTIGADOR (
    id_investigador int  NOT NULL DEFAULT null,
    tipo_doc char(3)  NOT NULL DEFAULT null,
    nro_doc int  NOT NULL DEFAULT null,
    nombre varchar(40)  NOT NULL DEFAULT null,
    apellido varchar(40)  NOT NULL DEFAULT null,
    direccion varchar(40)  NOT NULL DEFAULT null,
    fecha_nac date  NOT NULL DEFAULT null,
    TP03_EJ04_DISCIPLINA_id_disciplina int  NOT NULL,
    CONSTRAINT TP03_EJ04_INVESTIGADOR_pk PRIMARY KEY (id_investigador)
);

-- Table: TP03_EJ04_PROYECTO
CREATE TABLE TP03_EJ04_PROYECTO (
    cod_proyecto int  NOT NULL DEFAULT null,
    nombre_proyecto varchar(40)  NOT NULL DEFAULT null,
    monto decimal(10,2)  NOT NULL DEFAULT null,
    estadio char(3)  NOT NULL DEFAULT null,
    tipo_proy char(1)  NOT NULL DEFAULT null,
    CONSTRAINT TP03_EJ04_PROYECTO_pk PRIMARY KEY (cod_proyecto)
);

-- Table: TP03_EJ04_PROY_INIC_FINAL
CREATE TABLE TP03_EJ04_PROY_INIC_FINAL (
    fecha_inicio date  NOT NULL DEFAULT null,
    fecha_fin date  NULL DEFAULT null,
    TP03_EJ04_PROYECTO_cod_proyecto int  NOT NULL,
    TP03_EJ04_INVESTIGADOR_id_investigador int  NOT NULL,
    CONSTRAINT TP03_EJ04_PROY_INIC_FINAL_pk PRIMARY KEY (TP03_EJ04_PROYECTO_cod_proyecto)
);

-- Table: TP03_EJ04_TAREA
CREATE TABLE TP03_EJ04_TAREA (
    id_tarea int  NOT NULL DEFAULT null,
    nombre_tarea varchar(15)  NOT NULL DEFAULT null,
    cant_horas decimal(6,2)  NOT NULL DEFAULT null,
    CONSTRAINT TP03_EJ04_TAREA_pk PRIMARY KEY (id_tarea)
);

-- Table: proy_aprob_recha
CREATE TABLE proy_aprob_recha (
    TP03_EJ04_PROYECTO_cod_proyecto int  NOT NULL,
    CONSTRAINT proy_aprob_recha_pk PRIMARY KEY (TP03_EJ04_PROYECTO_cod_proyecto)
);

-- Table: sabe_realizar
CREATE TABLE sabe_realizar (
    TP03_EJ04_TAREA_id_tarea int  NOT NULL,
    TP03_EJ04_INVESTIGADOR_id_investigador int  NOT NULL,
    CONSTRAINT sabe_realizar_pk PRIMARY KEY (TP03_EJ04_TAREA_id_tarea,TP03_EJ04_INVESTIGADOR_id_investigador)
);

-- Table: telefono
CREATE TABLE telefono (
    telefono int  NOT NULL,
    TP03_EJ04_INVESTIGADOR_id_investigador int  NOT NULL,
    CONSTRAINT telefono_pk PRIMARY KEY (TP03_EJ04_INVESTIGADOR_id_investigador)
);

-- foreign keys
-- Reference: TP03_EJ04_INVESTIGADOR_TP03_EJ04_DISCIPLINA (table: TP03_EJ04_INVESTIGADOR)
ALTER TABLE TP03_EJ04_INVESTIGADOR ADD CONSTRAINT TP03_EJ04_INVESTIGADOR_TP03_EJ04_DISCIPLINA
    FOREIGN KEY (TP03_EJ04_DISCIPLINA_id_disciplina)
    REFERENCES TP03_EJ04_DISCIPLINA (id_disciplina)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TP03_EJ04_PROY_INIC_FINAL_TP03_EJ04_INVESTIGADOR (table: TP03_EJ04_PROY_INIC_FINAL)
ALTER TABLE TP03_EJ04_PROY_INIC_FINAL ADD CONSTRAINT TP03_EJ04_PROY_INIC_FINAL_TP03_EJ04_INVESTIGADOR
    FOREIGN KEY (TP03_EJ04_INVESTIGADOR_id_investigador)
    REFERENCES TP03_EJ04_INVESTIGADOR (id_investigador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TP03_EJ04_PROY_INIC_FINAL_TP03_EJ04_PROYECTO (table: TP03_EJ04_PROY_INIC_FINAL)
ALTER TABLE TP03_EJ04_PROY_INIC_FINAL ADD CONSTRAINT TP03_EJ04_PROY_INIC_FINAL_TP03_EJ04_PROYECTO
    FOREIGN KEY (TP03_EJ04_PROYECTO_cod_proyecto)
    REFERENCES TP03_EJ04_PROYECTO (cod_proyecto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: proy_aprob_recha_TP03_EJ04_PROYECTO (table: proy_aprob_recha)
ALTER TABLE proy_aprob_recha ADD CONSTRAINT proy_aprob_recha_TP03_EJ04_PROYECTO
    FOREIGN KEY (TP03_EJ04_PROYECTO_cod_proyecto)
    REFERENCES TP03_EJ04_PROYECTO (cod_proyecto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sabe_realizar_TP03_EJ04_INVESTIGADOR (table: sabe_realizar)
ALTER TABLE sabe_realizar ADD CONSTRAINT sabe_realizar_TP03_EJ04_INVESTIGADOR
    FOREIGN KEY (TP03_EJ04_INVESTIGADOR_id_investigador)
    REFERENCES TP03_EJ04_INVESTIGADOR (id_investigador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sabe_realizar_TP03_EJ04_TAREA (table: sabe_realizar)
ALTER TABLE sabe_realizar ADD CONSTRAINT sabe_realizar_TP03_EJ04_TAREA
    FOREIGN KEY (TP03_EJ04_TAREA_id_tarea)
    REFERENCES TP03_EJ04_TAREA (id_tarea)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: telefono_TP03_EJ04_INVESTIGADOR (table: telefono)
ALTER TABLE telefono ADD CONSTRAINT telefono_TP03_EJ04_INVESTIGADOR
    FOREIGN KEY (TP03_EJ04_INVESTIGADOR_id_investigador)
    REFERENCES TP03_EJ04_INVESTIGADOR (id_investigador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

