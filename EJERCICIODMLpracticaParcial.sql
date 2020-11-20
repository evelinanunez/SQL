

/*7-Listar los numero de los almacenes que almacen el articulo de descripción A*/
SELECT DISTINCT C.nro AS "numero de almacaen"
FROM contiene C JOIN articulo ART ON C.cod_art= ART.cod_art
WHERE ART.descripcion = 'A';

/*8 Listar los materiales (codigo y descripción)provistos por proveedores de la ciudad de rosario*/
SELECT DISTINCT M.cod_mat "codigo material", M.descripcion
FROM  ciudad C JOIN proveedor P ON C.cod_ciu=P.cod_ciu
				JOIN provisto_por PP ON P.cod_prov= PP.cod_prov
				 JOIN material M ON PP.cod_mat=M.cod_mat                 
WHERE C.nombre LIKE 'ROSARIO';

/*9- Listar los nombres de los proveedores que proveen materiales para artículos ubicados en almacenes que Martin Gomez tiene a su cargo*/
SELECT P.nombre AS "nombre de los proveedores"
FROM proveedor P JOIN provisto_por PP ON P.cod_prov=PP.cod_prov
				 JOIN compuesto_por CP ON PP.cod_mat= CP.cod_mat
                 JOIN contiene C ON CP.cod_art= C.cod_art
                 JOIN almacen ALM ON C.nro=ALM.nro
WHERE ALM.responsable = '%Martin Gomez%';

SELECT nro, cod_art 
FROM contiene  
WHERE nro = 10;

UPDATE contiene
SET nro =20
WHERE nro=10;

SELECT DISTINCT nro, cod_art 
FROM contiene  
WHERE nro = 20;

/*eliminar a los proveedores que contengan la palabra  ABC en su nombre*/
SELECT COUNT(*)
FROM proveedor;

-- DELETE FROM proveedor
-- WHERE nombre LIKE '%ABC%';

/*12- Cantidad de proveedores que comienzan con la letra F*/
SELECT COUNT(*) AS "Cantidad de proveedores"
FROM proveedor
WHERE nombre LIKE 'F%';

/*13- Listar el promedio de precios de los artículos por cada almacen(nombre)*/
SELECT AVG(ART.precio), ALM.nombre
FROM almacen ALM JOIN contiene C ON ALM.nro=C.nro
				 JOIN articulo ART ON C.cod_art=ART.cod_art
GROUP BY ALM.nro, ALM.nombre;  -- agrupar por nombre también si quiero mostrarlo en el select

/*14 listar la descripcion de  articulos compuestos por al menos 2 materiales */
SELECT ART.descripcion AS "descripcion de  articulos"
FROM articulo ART JOIN compuesto_por CP ON ART.cod_art= CP.cod_art
				  JOIN material MAT ON CP.cod_mat=MAT.cod_mat -- material no sería necesario porque tengo que contar los cod_mat no necesito su descripción.
GROUP BY ART.cod_art, ART.descripcion
HAVING COUNT(MAT.cod_mat) >2;

/*15- Listar cantidad de materiales  que provee cada proveedor ( codigo, nombre y domicilio)*/
SELECT COUNT(PP.cod_mat) AS "cantidad de materiales", P.cod_prov AS codigo, P.nombre, P.domicilio
FROM proveedor P JOIN provisto_por PP ON P.cod_prov=PP.cod_prov
GROUP BY P.cod_prov, P.nombre, P.domicilio;

/*16- Cual es el precio máximo de los artículos  que proveen los proveedores de la ciudad de Zárate*/
SELECT MAX(ART.precio)
FROM articulo ART JOIN compuesto_por CP ON ART.cod_art=CP.cod_art
				  JOIN provisto_por PP ON CP.cod_mat=PP.cod_mat
                  JOIN proveedor P ON PP.cod_prov= P.cod_prov
                  JOIN ciudad C ON P.cod_ciu=C.cod_ciu
WHERE C.nombre = 'zarate';

/*17- Listar los nombres de aquellos proveedores que no proveen ningún meterial*/

-- Utilizando subconsulta.
SELECT P.nombre
FROM proveedor P
WHERE NOT EXISTS (SELECT 1 -- tengo que solo trar un dato(pero no restringe la cant de columnas que puedo traer), el exists o no exists solo evalua si la condición trae o no trae dato. V ó F
                  FROM provisto_por PP -- JOIN material M ON PP.cod_mat=M.cod_mat TENGO QUE DARME CUENTA QUE NO ESTOY USANDO ESTA TABLA PARA NADA
                  WHERE PP.cod_prov=P.cod_prov); -- Condición de comparación con la tabla de afuera, en el IN la comparación se hace en el mismo IN.

-- Utilizando el LEFT JOIN
SELECT P.nombre
FROM proveedor P LEFT JOIN provisto_por PP ON P.cod_prov=PP.cod_prov -- Junto prov + provisto por, dejanto todos las parejas inclusive los prov que no tienen pareja y tienen el campo vacio en cod_mat
WHERE PP.cod_mat IS  NULL; -- filto por ese campo vacio.

-- Utilizando grupos
SELECT P.nombre
FROM proveedor P LEFT JOIN provisto_por PP ON P.cod_prov=PP.cod_prov 
GROUP BY P.cod_prov, P.nombre
HAVING COUNT(PP.cod_mat) =0;

