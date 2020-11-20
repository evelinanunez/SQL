use ejercicio2;

/*1- Hallar los números de vuelo desde el origen A hasta el destino F*/
SELECT nro_vuelo
FROM vuelo
WHERE desde = 'A' AND hasta ='F';

/*2- Hallar los nombres de pasajeros y números de vuelo para aquellos pasajeros que viajan desde A a D.*/
SELECT P.nombre AS "nombre de pasajeros", V.nro_vuelo AS "numero de vuelo"
FROM pasajero P JOIN vuelo V ON P.nro_vuelo= V.nro_vuelo
WHERE V.desde ='A' AND V.hasta= 'D';

/*3- Hallar los tipos de avión para vuelos que parten desde C*/
SELECT  DISTINCT A.tipo_avion
FROM avion A JOIN vuelo V ON A.nro_avion = V.nro_avion
WHERE V.desde = 'C';

/*4- Listar los distintos tipo y nro de avión que tienen a H como destino*/
SELECT A.tipo_avion , A.nro_avion AS "numero de avion"
FROM avion A JOIN vuelo V ON A.nro_avion = V.nro_avion
WHERE V.hasta = 'H';

/*5- Mostrar por cada avión (numero y modelo) la cantidad de avuelos en que se encuentra registrado.*/
SELECT A.nro_avion AS "numero de avion", A.modelo , COUNT(*) AS "candidad de vuelos"
FROM avion A JOIN vuelo V ON A.nro_avion= V.nro_avion
GROUP BY A.nro_avion;

/*6-Cuántos pasajeros diferentes han volado en un avión de modelo B-777*/
SELECT DISTINCT COUNT(P.documento) AS "cantidad de pasajeros"
FROM avion A JOIN vuelo V ON A.nro_avion = V.nro_avion
			 JOIN pasajero P ON V.nro_vuelo= P.nro_vuelo
GROUP BY A.nro_avion,A.modelo
HAVING A.modelo = 'B-777';

/*Consulta punto 6: aca me esta duplicando el pasajero '17555522', 'CRISTINA1', que viajo en dos vuelos diferentes con un modelo 'B-777'*/

/*7- Listar la cantidad promedio de pasajeros transportados por los aviones de la compañía, por tipo de avión.*/
SELECT  AVG(nro_vuelo,documento)
FROM avion A JOIN vuelo V ON A.nro_avion = V.nro_vuelo
			 JOIN pasajero P ON V.nro_vuelo= P.nro_vuelo
GROUP BY A.nro_avion, A.tipo_avion;




