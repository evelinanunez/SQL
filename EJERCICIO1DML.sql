USE ejercicio1;

SELECT nombre
FROM proveedor;

/*1*/
SELECT cod_art AS "numero de artículo"
FROM articulo
WHERE precio BETWEEN '100' AND '1000'
AND descripcion LIKE'A%';

/*2*/
SELECT *
FROM proveedor;

SELECT cod_prov, nombre, domicilio, cod_ciu, fecha_alta
FROM proveedor;

/*3*/
SELECT descripcion
FROM material
WHERE cod_mat IN (1,3,6,9,18);

SELECT descripcion
FROM material
WHERE cod_mat IN(1,3,6,9,18);

/*4 Listar codigo y nombre de proveedores de la calle Suipacha , que hayan sido dados de alta en el año 2001*/

SELECT cod_prov AS codigo, nombre AS "nombre del proveedor"
FROM proveedor
WHERE domicilio  LIKE '%suipacha%'   /*Usar LIKE para los string*/ 
AND fecha_alta BETWEEN '20010101' AND '20011231';

SELECT P.cod_prov, P.nombre
FROM proveedor P
WHERE P.domicilio LIKE '%SUIPACHA%'
AND fecha_alta BETWEEN '20010101' AND '20011231';

/*5* Listar el nombre de todos los proveedores y de su ciudad*/


SELECT  P.nombre, C.nombre as "CIUDAD"
FROM proveedor P JOIN ciudad C ON P.cod_ciu= C.cod_ciu;

/*6 Listar los nombres de los proveedores de la ciudad de La Plata*/
SELECT P.nombre
FROM proveedor P JOIN ciudad C ON P.cod_ciu= C.cod_ciu
WHERE C.nombre LIKE 'LA PLATA';

/*7 Listar los numeros de almacenes que almacenan el articulo de descripción A*/
SELECT DISTINCT ALM.nro AS "Numero almacen", ALM.nombre
FROM almacen ALM JOIN contiene C ON ALM.nro = C.nro
				 JOIN articulo ART ON C.nro= ART.cod_art
WHERE ART.descripcion = 'A';

/*8 Listar  los materiales (codigo y descripcion) provistos por proveedores de la ciudad rosario*/
SELECT DISTINCT M.cod_mat AS "codigo material", M.descripcion
FROM ciudad C JOIN proveedor P ON C.cod_ciu= P.cod_ciu
			  JOIN provisto_por PP ON P.cod_prov= PP.cod_prov
              JOIN material M ON PP.cod_mat=M.cod_mat
WHERE C.nombre ='rosario';

-- /*9 Listar los nombres de los proveedores que proveen materiales para articulos ubicados en almacenes que Martin Gomez tiene a su cargo*/
-- SELECT P.nombre AS "Nombre proveedor"
-- FROM proveedor P JOIN provisto_por PP ON P.cod_prov= PP.cod_prov
-- 				 JOIN compuesto_por CP ON PP.cod_mat= CP.cod_mat
--                  JOIN articulo ART ON CP.cod_art= ART.cod_art
--                  JOIN contiene C ON ART.cod_art= C.cod_art
--                  JOIN almacen ALM ON C.nro=ALM.nro
-- GROUP BY P.cod_prov, P.nombre
-- HAVING ALM.reponsable =' martin gomez';

/*10*/
UPDATE contiene
SET nro = 20
WHERE nro = 10;


/*11 DELETE FROM proveedor;*/

/*12- Indicar la cantidad de proveedores que comienzan con la letra F*/
SELECT COUNT(*)
FROM proveedor 
WHERE nombre LIKE 'F%';

/*13-Listar el promedio de precios de los articulos por cada almacen(nombre)*/
SELECT AL.nombre, AVG(AR.precio) promedio
FROM articulo AR JOIN contiene C ON AR.cod_art = C.cod_art
				 JOIN  almacen AL ON AL.nro = C.nro
GROUP BY AL.nro, AL.nombre;

/*14 Listar la descripcion de articulos compuesto por al menos 2 materiales*/
SELECT * FROM articulo;

SELECT AR.descripcion
FROM articulo AR JOIN compuesto_por cp ON AR.cod_art = cp.cod_art
GROUP BY AR.cod_art, AR.descripcion
HAVING COUNT(*) >=2;

/*15 Listar la cantidad de materiales que provee cada proveedor (codigo, nombre y domicilio)*/

SELECT P.cod_prov, P.nombre, P.domicilio , COUNT(*)
FROM provisto_por CP JOIN  proveedor P ON CP.cod_prov= P.cod_prov
GROUP BY P.cod_prov;

-- /*16 Cual es el precio maximo  de los articulos que proveen los proveedores de la ciudad de Zarate*/
-- SELECT  MAX(AR.precio)
-- FROM articulo AR JOIN compuesto_por CP ON AR.cod_art = CP.cod_ar 
-- 				 JOIN provisto_por PP ON CP.cod_mat = PP.cod_mat
--                  JOIN proveedor P ON PP.cod_prov = P.cod_prov
--                  JOIN ciudad C ON P.cod_ciu = C.cod_ciudad
-- WHERE C.nombre = 'Zarate';

/*17- Listar los nombres de aquellos proveedores que noproveen ningun material*/
    
SELECT P.nombre 
FROM proveedor P
WHERE  NOT EXISTS (SELECT 1
					FROM provisto_por PP
					WHERE P.cod_prov= PP.cod_prov);
    
    
    
/*18-Listar los codigos de los materiales que provea el proveedor 10 y no los provea el  proveedor15*/

SELECT PP.cod_mat
FROM provisto_por PP
WHERE cod_prov = 10 
AND NOT EXISTS (SELECT 1
				FROM provisto_por PP2
                WHERE PP2.cod_prov =15 
                AND PP.cod_mat= PP2.cod_mat);
                
                
                
/*19-Listar el numero y nombre de almacenes que contienen los artículos de descripcion A y los descrición B (ambos)*/
/*SELECT ALM.numero, ALM.nombre
FROM almacen ALM JOIN contiene C ON ALM.nro= C.nro
WHERE  EXISTS  (SELECT 1
			   FROM articulo ART1
               WHERE ART.descripcion ='B'
               AND ART1.cod_art =C.cod_art  AND   EXISTS    (SELECT 1
													FROM articulo ART2
													WHERE ART.descripcion = 'A'
													AND ART2.cod_art= ART1.cod_art));
 */              

/*20- Listar la descripción de articulos compuestos por todos los materiales*/

/*SELECT P.cod_prov, P.nombre
FROM proveedor P 
WHERE EXISTS  ( SELECT 1
				FROM provisto_por
                WHERE 

					(SELECT 1
					 FROM compuesto_por CP
					 WHERE CP.cod_art EXISTS (SELECT 1
									  FROM articulo ART
									  WHERE precio> 100
                                       AND ART.cod_art= CP.cod_art));
 
 */

  SELECT cod_prov, nombre
  FROM proveedor p
  WHERE EXISTS (SELECT 1
				FROM provisto_por pp JOIN compuesto_por cp ON pp.cod_mat =cp.cod_mat
									 JOIN articulo art ON art.cod_art= cp.cod_art
				WHERE art.precio >100
                AND pp.cod_prov = p.cod_prov);
    
   SELECT A.descripcion
   FROM articulo A
   WHERE EXIsTS (SELECT MAX(ART.precio)
				FROM articulo ART
                GROUP BY ART.precio
                AND ART.cod_art= A.cod_art);
    
    
    
    
    
    
    