USE Aerolineas

SELECT DISTINCT nombre
FROM Persona

SELECT nombre, paterno, materno
FROM Persona

SELECT nombre + paterno + materno -- El simbolo mas sirve ara concatenar
FROM Persona

SELECT sueldo/2 as Aguinaldo, sueldo  --As sirve para nombrar una columna 
FROM empleado

SELECT 'Hola, ' + nombre + ' ' + paterno + ' ' + ISNULL(materno,' ') + 'tu edad es ' + CONVERT(VARCHAR(2),20)
FROM Persona

--Ejercicios:

-- 1) MOSTRAR EL APELLIDO PATERNO, MATERNO, Y EL NOMBRE DE LAS PERSONAS
SELECT paterno + materno + nombre -- El simbolo mas sirve para concatenar
FROM Persona

-- 3) MOSTRAR EL NOMBRE DE LAS AEROL�NEAS
SELECT DISTINCT Nombre
FROM Aerolinea

-- 4) MOSTRAR EL NOMBRE DE LOS CODIGOS POSTALES DADOS DE ALTA PARA LAS DIRECCIONES
SELECT DISTINCT codigoPostal
FROM Direccion

-- 5) MOSTRAR EL IDENTIFICADOR DE CLIENTE, EL APELLIDO PATERNO Y EL NOMBRE
SELECT idPersona, paterno, nombre
FROM Persona

-- 6) MOSTRAR EL NOMBRE CON EL TITULO DE 'CLIENTE�
SELECT nombre + ' ' + paterno + ' ' + ISNULL(materno,' ') as Cliente 
FROM Persona

-- 7) MOSTRAR EL NOMBRE CON EL TITULO 'CLIENTE', EL APELLIDO PATERNO Y MATERNO CON EL TITULO 
SELECT nombre as Cliente , paterno + ISNULL(materno,' ') as Apellidos
FROM Persona

-- 9) MOSTRAR EL IDENTIFICADOR CON EL TITULO '#ASIENTOS', Y EL TIPO DE AVI�N DE TODOS LOS REGISTRADOS EN LA BD
SELECT tipoAvion, numAsientos
FROM TipoAvion

-- 10) MOSTRAR A MANERA DE PORCENTAJE LA CAPACIDAD DE ASIENTOS CONSIDERANDO QUE 150 ASIENTOS ES EL 100%
SELECT *,CONVERT(VARCHAR(3),(numAsientos*100/150))+ '%' as Capacidad
FROM TipoAvion

-- CONDICIONALES
SELECT *
FROM tipoAvion

SELECT *
FROM AVION
WHERE fechaFabricacion >= '20140101' --AAAAMMDD
WHERE numAsientos > 150

SELECT *
FROM Empleado
WHERE sueldo BETWEEN 15000 AND 40000

SELECT *
FROM Empleado
WHERE sueldo >= 15000 AND SUELDO <= 40000

----------------------------------------------------
-- clase 3
----------------------------------------------------

SELECT *
FROM Persona
WHERE nombre LIKE 'ED%'  --comienzan con ED

SELECT *
FROM Persona
WHERE nombre LIKE 'Ed_ardo'  --

SELECT *
FROM Persona
WHERE nombre LIKE 'Ed[h-z]ardo'  --comienzan con ED

SELECT *
FROM Persona
WHERE nombre LIKE 'Ed[^u]ardo'  --se excluyen los que no tenga u


SELECT *
FROM TipoAvion 
where tipoAvion LIKE '%9' -- los que terminan con 9


SELECT *
FROM Persona
WHERE materno IS NULL -- Los que tienen valores nulos


SELECT *
FROM Persona
WHERE sexo = 1
AND materno IS NULL  -- AND si se cumplen ambas

SELECT *
FROM Persona
WHERE sexo = 1
OR materno IS NULL  -- OR si se cumplen una condici�n


-----------------------------------------------------
-- ORDER BY (Ordenar dtos)
-----------------------------------------------------
-- ASC Ordena de manera ascendente
-- DES Ordena de manera descendente


SELECT *
FROM empleado
WHERE sueldo BETWEEN  20000 AND 46000
ORDER BY fechaingreso        -- Ordena de forma ascendente por fecha de ingreso

SELECT *
FROM empleado
WHERE sueldo BETWEEN  20000 AND 46000
ORDER BY fechaingreso DESC        -- Ordenade forma descendente la columna fechaingreso

SELECT *
FROM empleado
WHERE sueldo BETWEEN  20000 AND 46000
ORDER BY 3 DESC        -- Ordena de forma descendente columna 3

SELECT *
FROM empleado
WHERE sueldo BETWEEN  20000 AND 46000
ORDER BY 3 DESC, 5 ASC        -- Ordena de forma descendente columna 3,y de forma ascendente columna 5


SELECT *, sueldo * 12 AS sueldoanual -- AS pone etiqueta a columna
FROM empleado
WHERE sueldo BETWEEN 2000 AND 46000
ORDER BY sueldoanual   


----------------------------------------
-- DATEDD (Funci�n para sumar dias a una fecha determinada)
----------------------------------------

SELECT *, DATEADD (yy,1,fechafabricacion) AS fingarantia --Agrega un a�o a la fecha de fabricaci�n
FROM Avion

SELECT *, DATEADD (mm,6,fechaingreso) AS fecha6mesesdespues -- Se agrega columana con fecha de 6 meses despues de ingreso
FROM Vendedor


------------------------------------------------------------
-- DATEDIFF (Funci�n para obtener la diferencia entre dos fechas)
-----------------------------------------------------------

SELCT DATEDIFF(DD,'19860226',GETDATE())


-- Calcular la antiguedad de todos los aviones 

SELECT *, DATEDIFF(YY,fechafabricacion,GETDATE()) AS A�osdevidaavion
FROM Avion

----------------------------------------------------------------
-- DATENAMEB (Para mostrar la fecha en texto, sea A�os, meses o d�as)
----------------------------------------------------------------


SELECT DATENAME(DW,'19891031')
SELECT DATENAME(mm,'19891031')


--Mostrar el nombre del mes del siguiente mantenimiento de todos los aviones
SELECT *
FROM Avion

SELECT *, DATENAME(MM,DATEADD(MM,mesesMantenimiento,UltimoMantenimiento)) AS Mesproximomenteniumiento
FROM Avion

-- Obtner la lista de empleados que hayan ingresado el mes de enero
SELECT * 
FROM Empleado
where month(fechaingreso) = 1

SELECT * 
FROM Empleado
where month(fechaingreso) = MONTH(GETDATE())

SELECT *, ISNUMERIC(tipoAvion)
FROM tipoAvion  -- Devuelve 0 cuando la sentencia es falsa

SELECT *, ISNUMERIC(numAsientos)
FROM tipoAvion  -- Devuelve 1 cuando la sentencia es verdadera

-----------------------------------------------------
-- Concatenar numero de asientos 
-----------------------------------------------------

SELECT *, CONVERT(VARCHAR(5),numAsientos),
          ' El tipo de avi�n ' + tipoAvion + ' tiene ' +
          CONVERT(VARCHAR(5),numAsientos) + ' asientos. ' 
FROM tipoAvion 

------------------------------------------------------
-- ROUND
------------------------------------------------------

SELECT ROUND(5.09878,2)
SELECT ROUND(5.09878,2,1)


--------------------------------
-- RTRIM (regresa la cadena sin espacios a la derecha)
--------------------------------

SELECT '*' + '    valor     '  + '*' 
SELECT '*' + RTRIM('    valor     ')  + '*'  -- Quita espacios en blanco a la derecha
SELECT '*' + lTRIM('    valor     ')  + '*' -- Quita espacios en blanco a la izquierda
SELECT '*' + LTRIM(RTRIM('    valor     '))  + '*' -- Quita espacios en blaco a ambos lados


--------------------------------------------------------
-- REPALCE ( expresion, cafena a buscar, cadena de reemplazo)
--------------------------------------------------------

SELECT  tipoAvion, REPLACE(tipoAvion,'MAX','MIN') AS Reemplazada
FROM tipoAvion

-------------------------------------------------------
-- Lower y Upper (Regresan en minusculas y mayusculas, respectivamente)
-------------------------------------------------------

SELECT *, LOWER(tipoAvion) AS Minusculas, UPPER(tipoAvion) AS Mayusculas
FROM tipoAvion

--

SELECT DATEDIFF(DD,0,GETDATE())
SELECT DATEADD(DD,0,DATEDIFF(DD,0,GETDATE()))


--------------------------------
-- RTRIM (regresa la cadena sin espacios a la izquierda)
--------------------------------


 
 
 
 -------------------------------------------------------------------------
 - -----------------------------------------------------------------------
 -- EJERCICIO
 -------------------------------------------------------------------------
 ------------------------------------------------------------------------
 
--Seleccionar el nombre de todos los tipos de aviones con m�s mas de 200 asientos

 SELECT *
 FROM tipoAvion
 WHERE numAsientos > 200

--Seleccionar el nombre de todos los tipos de aviones con m�s mas de 200 asientos, con la siguiente leyenda: "El avi�n" <tipo avi�n> "tiene una capacidad de " <num asientos> "asientos"
SELECT *, 'El avi�n' + tipoAvion + ' tiene una capacidad de ' + CONVERT(VARCHAR(5),numAsientos) + 'asientos' 
FROM tipoAvion
WHERE numAsientos > 200 

--Seleccionar el nombre completo de todas las personas en la base de datos que cumplan a�os hoy y mostrarlo como "Felices " <edad> " a�os " <nombre completo> "!!!"
SELECT *, ' FELICES ' + CONVERT(VARCHAR(3),DATEDIFF(YY,nacimiento,GETDATE())) + ' A�OS ' + nombre + ' ' + paterno + ' ' 
FROM Persona 
WHERE DAY(nacimiento)= DAY(GETDATE()) AND MONTH(nacimiento) = MONTH(GETDATE())

--mostrar la antig�edad en a�os de todos los aviones almacenados en la base de datos
SELECT *, DATEDIFF(yy,fechaFabricacion,GETDATE()) AS antiguaedad
FROM Avion

--mostrar la fecha exacta del siguiente mantenimiento de los aviones tomando como referencia la fecha del �ltimo, orden�ndolos por el que est� m�s pr�ximo a vencer
SELECT *, DATEADD(MM,mesesMantenimiento,UltimoMantenimiento) AS PROXMANTT
FROM Avion
ORDER BY PROXMANTT ASC

--mostrar el tiempo en d�as que falta para el mantenimiento de los aviones tomando como referencia la fecha del �ltimo, orden�ndolos por el que est� m�s pr�ximo a vencer
SELECT *, DATEADD(MM,mesesMantenimiento,UltimoMantenimiento) AS PROXMANTT
FROM Avion
ORDER BY PROXMANTT DESC

--mostrar el tiempo en d�as por el que se atras� o adelant� el �ltimo mantenimiento de los aviones tomando como referencia la fecha de adquisici�n.
SELECT *, DATEDIFF(dd,DATEADD(MM,mesesMantenimiento,fechaFabricacion),UltimoMantenimiento)
FROM Avion

--mostrar el d�a de la semana en que le toca mantenimiento a cada uno de los aviones
SELECT *,DATENAME(DW,UltimoMantenimiento)
FROM Avion

--Mostra las aerol�neas extranjeras , con el texto, la aerol�nea <nombre> es extranjera
SELECT *, 'La aerolinea ' + Nombre + ' Es extranjera'
FROM Aerolinea
WHERE nacional = 0
--Selecciona la tabla de clientes ordenandola por la fecha de registro de manera descendente
SELECT *
FROM Cliente
ORDER BY fechaRegistro desc
--Selecciona todos los domicilios cuyo n�mero de casa no sea num�rico--11. mostrar todos los vuelos y ordenarlos por los que tengan est�n m�s pr�ximos y tengan m�s lugares vac�os
SELECT *
FROM Direccion
WHERE ISNUMERIC(numero) = 0

--mostrar los vuelos que tengan un precio por asiento mayor a 1000 pesos, ordenarlos de manera ascendente
SELECT *
FROM Vuelo
WHERE precioPorAsiento > 1000
ORDER BY precioPorAsiento ASC 

--Mostrar todos los empleados que no tengan jefe
SELECT *
FROM Empleado
WHERE idJefe IS NULL

--Selecciona al cliente tipo Oro que tenga m�s antig�edad de registro
SELECT *, DATEDIFF(YY,fechaRegistro,GETDATE()) as year
FROM Cliente
WHERE idTipoCliente=3 AND DATEDIFF(YY,fechaRegistro,GETDATE())=15

--Selecciona todos los domicilios y ordenalos por c�digo postal, colonia y calle
SELECT *
FROM Direccion
ORDER BY  codigoPostal, colonia, calle ASC

--Selecciona el sueldo diario de los empleados considerando que todos los meses son de 30 d�as, agregar el alias "sueldo diario" y ordenarlo de manera descendente
SELECT*, ROUND(sueldo/30,2,1) AS sueldodiario
FROM Empleado
ORDER BY sueldodiario DESC

--Realiza una consulta a los tipos de clientes que muestre el siguiente texto "al ser cliente " <tipo cliente> " tienes un descuento de " <porcentaje descuento>
SELECT *, 'aL SER UN CLIENTE ' + TipoCliente + ' tIENES UN DESCUENTO DE ' + CONVERT(VARCHAR(3),descuento)+'%'
FROM TipoCliente

--selecciona los vuelos del mes de diciembre de 2014 que cuesten menos de 4000 pesos y ordenalos de forma ascendente en costo
SELECT *
FROM Vuelo
WHERE MONTH(fechaVuelo) = 12 AND YEAR(fechaVuelo)= 2014 AND precioPorAsiento < 4000
ORDER BY precioPorAsiento ASC

--muestra una lista de todos los tipos de aviones ordenandolos de manera ascendente por el nombre del fabricante y descendente por la cantidad de asientos
SELECT *
FROM TipoAvion
ORDER BY fabricante ASC, numAsientos DESC

--selecciona los vuelos que se realizaron esta �ltima semana
SELECT * 
FROM Vuelo
WHERE fechaVuelo BETWEEN DATEADD(DD,-7,GETDATE()) AND GETDATE()

--selecciona los vuelos que se compraron durante el �ltimo mes
SELECT * 
FROM Vuelo
WHERE  fechaVuelo BETWEEN DATEADD(DD,-30,GETDATE()) AND GETDATE()


--Selecciona las compras con una antig�edad mayor a un a�o
SELECT *, DATEDIFF(YY,fechaCompra,GETDATE()) AS Numyears
FROM Venta
WHERE DATEDIFF(YY,fechaCompra,GETDATE()) > 1

--selecciona el d�a de la semana en que saldr�n todos los vuelos.

SELECT *, DATENAME(DW,fechaVuelo) AS diaproxvuelo
FROM Vuelo 
