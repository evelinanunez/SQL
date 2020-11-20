DROP DATABASE IF EXISTS ejercicio3;
CREATE DATABASE ejercicio3;
USE ejercicio3;

CREATE TABLE proveedor
	(id_proveedor SMALLINT UNSIGNED PRIMARY KEY,
	 nombre VARCHAR(80) NOT NULL,
     cuit INT UNSIGNED
     );
     
CREATE TABLE producto
	(id_producto SMALLINT UNSIGNED PRIMARY KEY,
	descripcion VARCHAR(70) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    id_proveedor SMALLINT UNSIGNED PRIMARY KEY,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
    );
    
CREATE TABLE cliente
	(id_cliente SMALLINT UNSIGNED PRIMARY KEY,
     nombre VARCHAR(70) NOT NULL
     );
     
CREATE TABLE vendedor
	(id_empleado SMALLINT UNSIGNED PRIMARY KEY,
     nombre  VARCHAR(50) NOT NULL,
     apellido VARCHAR(60) NOT NULL,
     dni INT NOT NULL
     );

CREATE TABLE venta
	(nro_factura SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_cliente SMALLINT UNSIGNED PRIMARY KEY,
	fecha DATE NOT NULL,
    id_vendedor SMALLINT UNSIGNED,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
    );
    
CREATE TABLE detalle_venta
	(nro_factura SMALLINT UNSIGNED AUTO_INCREMENT,
     nro_detalle SMALLINT UNSIGNED AUTO_INCREMENT,
     id_producto SMALLINT UNSIGNED,
     cantidad INT,
     precio_unitario DECIMAL(10,1) NOT NULL,
     CONSTRAINT detalle_venta PRIMARY KEY (nro_factura, nro_detalle),
     FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
     );
     
     