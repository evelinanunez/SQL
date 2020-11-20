INSERT INTO almacen (nro, nombre, responsable)
VALUES (1,'PrimerAlmacen', 'Evelina nunez'),
		(5,'SegundoAlmacen', 'Luis Accornero'),
		(10,'TercerAlmacen', 'Martin Gomez'),
		(15,'CuartoAlmacen', 'Marita Gomez'),
		(17, 'QuintoAlmacen' ,'Jesica Caceres'),
		(20, 'SextoAlmacen', ' Mia Milagros'),
		(22, 'SeptimoAlmacen', 'Lorena nunez');
     
INSERT INTO articulo (cod_art, descripcion, precio)
VALUES  (1, 'A', 101),
		(2, 'F', 205),
        (5, 'A', 808),
        (8, 'G', 903),
        (9, 'H', 788),
        (10, 'A',999),
        (11, 'B', 1001),
        (12, 'B', 2005);
        
INSERT INTO material (cod_mat, descripcion)
VALUES (1, 'H1'),
	   (2, 'H2'),
       (3, 'H3'),
       (4, 'H4'),
       (5, 'H5'),
       (6, 'H6'),
       (7, 'H7'),
       (8, 'H8'),
       (9, 'H9'),
       (10, 'H10'),
       (11, 'H11'),
       (12, 'H12'),
       (13, 'H13'),
       (14, 'H14'),
       (15, 'H15'),
       (16, 'H16'),
       (17, 'H17'),
       (123, 'H20'),
       (18, 'H18');
   


INSERT INTO ciudad (cod_ciu, nombre)
VALUES 	(1, 'ZARATE'),
		(2, 'MAR DEL PLATA'),
        (3, 'ROSARIO'),
        (4, 'LA PLATA'),
        (5, 'CAPITAL FEDERAL'),
        (6, 'LUJAN');
        
INSERT INTO proveedor (cod_prov, nombre, domicilio, cod_ciu, fecha_alta)
VALUES (1, 'ABC', 'LARRALDE 1148',1, '20200801'),
       (2, 'DCL', 'GUEMES 122',1, '20140101'),
       (3, 'ABCeve', 'RIVADAVIA 12344',4, '20000502'),
       (15, 'FFO', 'LINIERS 145',5, '20030501'),
       (16, 'FLM', 'SUIPACHA 123',3, '20010709'),
       (17, 'AAA', 'INT GRANT 123',3, '20130313'),
       (9, 'EVELINA','MORON 123' ,1 ,'20200302'),
       (10, 'EVE','JAQUES 394', 2, '20200501'),
       (18, 'BBF', 'SUIPACHA 7854',5, '20010101');
       
INSERT INTO contiene (nro, cod_art)
VALUES (1,1),
	   (1,2),
       (1,5),
       (1,8),
       (1,9),
       (1,8),
       (1,11),
       (10,12),
       (10,2),
       (10,10),
       (10,8),
       (5,1),
       (5,5),
       (15,1),
       (15,10),
       (20,8);
       
       
INSERT INTO compuesto_por (cod_art, cod_mat)
VALUES (1,1),
	   (2,1),
       (5,1),
       (8,4),
       (9,5),
       (10,6),
       (11,7),
       (12,8),
       (1,2),
	   (2,2),
       (5,3),
       (8,3),
       (1,3),
       (10,4),
       (11,4),
       (12,4);
       
       
INSERT INTO provisto_por (cod_mat, cod_prov)
VALUES (1, 15),
	   (2, 2),
       (3, 1),
       (4, 3),
       (5, 16),
       (5, 17),
       (7, 16),
       (7, 15),
       (4, 16),
       (9, 3),
       (17, 10),
       (11, 10),
       (14, 10),
       (4, 15),
       (14, 15),
       (15, 18),
       (16, 18);

 
       
       
	

