-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-13 13:44:44.152

-- tables
-- Table: cliente
CREATE TABLE cliente (
    id_cliente int  NOT NULL,
    cuit int  NOT NULL,
    apellido varchar(20)  NOT NULL,
    nombre varchar(20)  NOT NULL,
    calle varchar(20)  NOT NULL,
    puerta int  NOT NULL,
    piso int  NOT NULL,
    email varchar(50)  NULL,
    telefono int  NOT NULL,
    garante int  NULL,
    CONSTRAINT cliente_ak_1 UNIQUE () NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);

-- Table: compone
CREATE TABLE compone (
    porcentaje decimal(%,%)  NOT NULL,
    id_prod_qui int  NOT NULL,
    producto_quimico_2_id_prod_qui int  NOT NULL,
    CONSTRAINT compone_pk PRIMARY KEY (producto_quimico_2_id_prod_qui,id_prod_qui)
);

-- Table: envio
CREATE TABLE envio (
    nro_envio int  NOT NULL,
    cantidad int  NOT NULL,
    peso decimal(%,%)  NOT NULL,
    producto_quimico_id_prod_qui int  NOT NULL,
    cliente_id_cliente int  NOT NULL,
    CONSTRAINT envio_pk PRIMARY KEY (nro_envio)
);

-- Table: produc_quimico_solido
CREATE TABLE produc_quimico_solido (
    forma varchar(30)  NOT NULL,
    empaque_max varchar(30)  NOT NULL,
    producto_quimico_id_prod_qui int  NOT NULL,
    CONSTRAINT produc_quimico_solido_pk PRIMARY KEY (producto_quimico_id_prod_qui)
);

-- Table: producto_quimico
CREATE TABLE producto_quimico (
    id_prod_qui int  NOT NULL,
    nombre_pro_qui int  NOT NULL,
    formula int  NOT NULL,
    tipo varchar(10)  NOT NULL,
    CONSTRAINT producto_quimico_pk PRIMARY KEY (id_prod_qui)
);

-- Table: producto_quimico_liquido
CREATE TABLE producto_quimico_liquido (
    inflamable varchar(50)  NOT NULL,
    tipo_envase varchar(20)  NOT NULL,
    condi_traslado varchar(100)  NULL,
    producto_quimico_id_prod_qui int  NOT NULL,
    CONSTRAINT producto_quimico_liquido_pk PRIMARY KEY (producto_quimico_id_prod_qui)
);

-- foreign keys
-- Reference: cliente_cliente (table: cliente)
ALTER TABLE cliente ADD CONSTRAINT cliente_cliente
    FOREIGN KEY (garante)
    REFERENCES cliente (id_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: compone_producto_quimico (table: compone)
ALTER TABLE compone ADD CONSTRAINT compone_producto_quimico
    FOREIGN KEY (id_prod_qui)
    REFERENCES producto_quimico (id_prod_qui)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: compone_producto_quimico (table: compone)
ALTER TABLE compone ADD CONSTRAINT compone_producto_quimico
    FOREIGN KEY (producto_quimico_2_id_prod_qui)
    REFERENCES producto_quimico (id_prod_qui)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: envio_cliente (table: envio)
ALTER TABLE envio ADD CONSTRAINT envio_cliente
    FOREIGN KEY (cliente_id_cliente)
    REFERENCES cliente (id_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: envio_producto_quimico (table: envio)
ALTER TABLE envio ADD CONSTRAINT envio_producto_quimico
    FOREIGN KEY (producto_quimico_id_prod_qui)
    REFERENCES producto_quimico (id_prod_qui)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: produc_quimico_solido_producto_quimico (table: produc_quimico_solido)
ALTER TABLE produc_quimico_solido ADD CONSTRAINT produc_quimico_solido_producto_quimico
    FOREIGN KEY (producto_quimico_id_prod_qui)
    REFERENCES producto_quimico (id_prod_qui)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: producto_quimico_liquido_producto_quimico (table: producto_quimico_liquido)
ALTER TABLE producto_quimico_liquido ADD CONSTRAINT producto_quimico_liquido_producto_quimico
    FOREIGN KEY (producto_quimico_id_prod_qui)
    REFERENCES producto_quimico (id_prod_qui)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

