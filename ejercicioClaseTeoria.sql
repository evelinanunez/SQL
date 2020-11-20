DROP DATABASE IF EXISTS ejercicioTeoria;
CREATE DATABASE ejercicioTeoria;
USE ejercicioTeoria;



CREATE TABLE especialidad
		( cod_esp SMALLINT UNSIGNED PRIMARY KEY,
          descripcion VARCHAR(50)
          );
   
CREATE TABLE area
		(cod_area VARCHAR(10) PRIMARY KEY,
         descripcion VARCHAR(50)
         );
         
CREATE TABLE empleado 
		( nro SMALLINT UNSIGNED PRIMARY KEY,
          nombre VARCHAR(80) NOT NULL,
          cod_esp SMALLINT UNSIGNED, -- FK
          nro_jefe SMALLINT UNSIGNED, -- FK
          sueldo DECIMAL (10,2) NOT NULL,
          f_ingreso DATE NOT NULL,
          FOREIGN KEY (cod_esp) REFERENCES especialidad(cod_esp),
          FOREIGN KEY (nro_jefe) REFERENCES empleado(nro)
          );
    
CREATE TABLE trabaja
		( nro_emp SMALLINT UNSIGNED,
          cod_area VARCHAR(10),
          PRIMARY KEY (nro_emp, cod_area),
          FOREIGN KEY (nro_emp) REFERENCES empleado(nro),
          FOREIGN KEY (cod_area) REFERENCES area(cod_area)
          );