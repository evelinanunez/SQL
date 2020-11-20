DROP DATABASE IF EXISTS ejercicio2;
CREATE DATABASE ejercicio2;
USE ejercicio2;


CREATE TABLE avion
	(nro_avion SMALLINT UNSIGNED PRIMARY KEY,
     tipo_avion VARCHAR(60)NOT NULL,
     modelo VARCHAR (50) NOT NULL
	);
    
CREATE TABLE  vuelo
	(nro_vuelo SMALLINT UNSIGNED  PRIMARY KEY,
     desde VARCHAR(50) NOT NULL,
     hasta VARCHAR(50) NOT NULL,
     fecha DATE NOT NULL,
     nro_avion SMALLINT UNSIGNED NOT NULL,
     FOREIGN KEY (nro_avion) REFERENCES avion (nro_avion)
     );
     
CREATE TABLE pasajero
	(nro_vuelo SMALLINT UNSIGNED,
     documento INT ,
     nombre VARCHAR(70) NOT NULL,
     CONSTRAINT pasajero PRIMARY KEY (nro_vuelo , documento),
     FOREIGN KEY (nro_vuelo) REFERENCES vuelo(nro_vuelo)
     );
     
INSERT INTO avion
	VALUES(1, 'COMERCIAL','BOEING 737'),
		  (2, 'CARGA', 'AIRBUS 320'),
          (3, 'MILITAR', 'B-777'),
          (4, 'COMERCIAL', 'AIRBUS 330'),
          (5, 'CARGA' , 'AIRBUS 300-600');
          
INSERT vuelo
	VALUES(1,'A', 'D','20200120', 1),
		  (2,'C', 'H','20101201', 3),
          (3,'A', 'F','20200505', 4),
          (4,'C', 'H','20200801', 3),
          (5,'C', 'PERU', '20180201',1);
          
INSERT INTO pasajero
	VALUES(1, '34986785', 'EVELINA'),
		  (2, '17555522', 'CRISTINA1'),
          (4, '17555522', 'CRISTINA1'),
          (2, '17951517', 'CRISTINA2'),
          (2, '17917267', 'CRISTINA3'),
          (1, '42551888', 'MARITA'),
          (4, '14298748', 'ANTONIO'),
          (5, '88855222', 'PATRICIO');