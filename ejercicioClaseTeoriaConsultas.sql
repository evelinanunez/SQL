USE ejercicioClaseTeoria;

/*1- Listar el nombre y descripcion de especialidad de todos los empleados*/
-- Junta explicita
SELECT EM.nombre AS "nombre de empleado", ESP.descripcion AS "descripcion de especialidad"
FROM empleado EM JOIN especialidad ESP ON EM.cod_esp=ESP.cod_esp;


-- Junta implicita, en donde hace producto cartesiano y filtro segun la condición.
SELECT EM.nombre, ESP.descripcion
FROM empleado EM,
	 especialidad ESP
WHERE EM.cod_esp= ESP.cod_esp;

-- 2- “Listar el nombre de aquellos empleados que trabajan en el área de código A1”

SELECT EM.nombre
FROM empleado EM JOIN trabaja T ON EM.nro=T.nro_emp -- junta explicita
WHERE T.cod_area = 'A1';

SELECT EM.nombre
FROM empleado EM,
	 trabaja T
WHERE EM.nro=T.nro_emp -- junta implicita
AND T.cod_area = 'A1';

-- 3-“Listar el nombre de todos los empleados junto al nombre de su jefe”
SELECT EM.nombre, J.nombre AS jefe
FROM empleado EM,
	 empleado J
WHERE EM.nro_jefe= J.nro; -- Junta implicita

SELECT EM.nombre, J.nombre AS jefe
FROM empleado EM JOIN empleado J ON EM.nro_jefe=J.nro; -- Junta explicita.alter

/*4- “Listar el nombre de todos sus empleados. Indicar además el nombre de su jefe (si
es que tiene)”*/

SELECT EM.nombre, J.nombre AS jefe
FROM empleado EM LEFT JOIN empleado J ON EM.nro_jefe=J.nro; -- Ejemplo claro de LEFT JOIN donde quiero que me traiga todos los datos del lado izquierdo aunque no encuentre pareja.

/*5- “Listar el nombre de los empleados que trabajan en el área de descripción Area 1 y
que cobran más de $5000”*/

SELECT EM.nombre
FROM empleado EM JOIN trabaja T ON EM.nro= T.nro_emp
				 JOIN area A ON T.cod_area=A.cod_area
WHERE A.descripcion = 'Area 1' 
AND EM.sueldo> 5000;
-- Si tenemos 2 áreas con la misma descripcion, usamos el DISTINCT, pero si tenemos dos empleados que se llaman igual lo pederiamos, traer otro registro para diferenciarlo, aunque no este pedido en el problema.

-- 6-“Indicar la cantidad de empleados de la empresa”	 
SELECT COUNT(EM.nro)
FROM empleado EM;

-- 7-“Indicar la cantidad de empleados y sueldo máximo de la empresa”

SELECT COUNT(EM.nro), MAX(EM.sueldo)
FROM empleado EM;

-- 8“Cuántos empleados ganan más de $3000?”

SELECT COUNT(EM.nro)
FROM empleado EM
WHERE EM.sueldo>3000;

-- 9-“Indicar el sueldo mínimo de los empleados por cada código de especialidad”

SELECT EM.cod_esp, MIN(EM.sueldo)
FROM empleado EM
GROUP BY EM.cod_esp; -- Yo quiero que me agrupe por cod_esp , no por empleado, aca en este caso no es el agrupamiento por clave primaria como suele ser recomendado.

/*10-“Indicar el sueldo mínimo de los empleados por cada código de especialidad, sólo
para aquellas especialidades cuyo mínimo sea mayor a 3000”*/

SELECT EM.cod_esp, MIN(EM.sueldo)
FROM empleado EM
GROUP BY EM.cod_esp
HAVING MIN(EM.sueldo)>3000;  -- Tener cuidado aca, porque es donde la fc de agregacion "el sueldo minimo" sea mayor a 3000, no que el campo sueldo sea mayor a 3000!!! CUIDADO!!

/* 11-“Indicar el sueldo mínimo de los empleados por cada código de especialidad, sólo
para aquellas especialidades con más de 5 empleados”*/

SELECT EM.cod_esp , MIN(EM.sueldo)
FROM empleado EM
GROUP BY EM.cod_esp
HAVING COUNT(*) >1;

-- 12“Indicar cantidad de empleados por cada descripción de especialidad”

SELECT ESP.descripcion, COUNT(*)
FROM empleado  EM JOIN especialidad ESP ON EM.cod_esp=ESP.cod_esp
GROUP BY ESP.cod_esp, ESP.descripcion;
-- HAVING COUNT(*);  No es necesario porque la funcion contar cuenta lo que tengo dentro de las bolsitas.
-- Que sucede si dos o más especialidades tienen la misma descripción?

-- NOTA: Normalmente agruparemos por campos que sean claves
-- Sólo podremos devolver en la cláusula SELECT aquellos campos por los cuales hemos agrupado, o funciones de agregación

-- 13 “Indicar cantidad de empleados a cargo de cada número de jefe”

SELECT J.nro AS "numero jefe", COUNT(EM.nro) AS "empleados a cargo"
FROM empleado EM JOIN empleado J ON EM.nro_jefe=J.nro
GROUP BY J.nro;
-- Hace exactamente lo mismo.

-- Le digo que todos los empleados que tienen jefe, o sea nro_jefe no este vacio, los agrupo por nro_jefe, y luego uso la función contar para cada bolsita.
SELECT nro_jefe, COUNT(*)
FROM empleado 
WHERE nro_jefe IS NOT NULL
GROUP BY nro_jefe;

-- 14- “Indicar cantidad de empleados a cargo de cada jefe, mostrando su nombre”
SELECT J.nombre, COUNT(*)
FROM empleado EM JOIN empleado J ON EM.nro_jefe=J.nro
GROUP BY J.nro,J.nombre;

-- 15-“Cuántos jefes hay?”
SELECT  COUNT(DISTINCT J.nro)
FROM  empleado EM JOIN empleado J ON EM.nro_jefe=J.nro 
GROUP BY J.nro;   -- Me parece que no es correcto, porque agrupo por jefe y si le pido contar cuantos jefes hay siempre me va a dar 1.


SELECT COUNT( DISTINCT nro_jefe)
FROM empleado;

/*
Variantes de COUNT
COUNT (*): cantidad de registros del grupo
COUNT (<campo>): cantidad de registros del grupo, donde el campo indicado no sea NULL
COUNT (DISTINCT <campo>): cantidad de registros únicos del grupo, donde el campo indicado no sea NULL (no cuenta repetidos)
*/

