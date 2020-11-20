INSERT INTO especialidad (cod_esp, descripcion)
VALUES (1, 'Gerente'),
	   (2, 'Operario');
        

INSERT INTO area( cod_area, descripcion)
VALUES ('A1', 'Area 1'),
	   ('A2', 'Area 2');
        

INSERT INTO empleado( nro, nombre, cod_esp, nro_jefe, sueldo, f_ingreso)
VALUES (1000, 'Evelina',1, NULL, 10000, '20000101'),
	   (1001, 'Marita',2, 1000, 5000, '20080501'),
	   (1002, 'Rodrigo',2, 1000, 2000, '20091001');
        
        
INSERT INTO trabaja (nro_emp, cod_area)
VALUES  (1000, 'A1'),
        (1000, 'A2'),
        (1001, 'A1'),
        (1002, 'A2');
        
