DROP DATABASE IF EXISTS ejercicio1;
CREATE DATABASE ejercicio1;
USE ejercicio1;

CREATE TABLE almacen 
(
	nro SMALLINT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    responsable VARCHAR(50)
);

CREATE TABLE articulo
(
	cod_art SMALLINT UNSIGNED PRIMARY KEY,
    descripcion VARCHAR(100),
    precio DECIMAL(10,2) NOT NULL
);
CREATE TABLE material
(
	cod_mat SMALLINT UNSIGNED PRIMARY KEY,
    descripcion VARCHAR(100)
);

CREATE TABLE ciudad
(
	cod_ciu SMALLINT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE proveedor
(
	cod_prov SMALLINT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(100),
    cod_ciu SMALLINT UNSIGNED,
    fecha_alta DATE NOT NULL,
    FOREIGN KEY (cod_ciu) REFERENCES ciudad (cod_ciu)
);

CREATE TABLE contiene 
(
	nro SMALLINT UNSIGNED,
    cod_art SMALLINT UNSIGNED,
    FOREIGN KEY (nro) REFERENCES almacen (nro),
    FOREIGN KEY (cod_art) REFERENCES articulo( cod_art)
);
    
CREATE TABLE compuesto_por
(
	cod_art SMALLINT UNSIGNED,
    cod_mat SMALLINT UNSIGNED,
    FOREIGN KEY (cod_mat) REFERENCES material(cod_mat),
    FOREIGN KEY (cod_art) REFERENCES articulo(cod_art)
);

CREATE TABLE provisto_por
(
	 cod_mat SMALLINT UNSIGNED,
     cod_prov SMALLINT UNSIGNED,
     FOREIGN KEY (cod_mat) REFERENCES material(cod_mat),
     FOREIGN KEY (cod_prov) REFERENCES proveedor(cod_prov)
);

