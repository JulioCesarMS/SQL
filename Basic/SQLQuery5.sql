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

-- 3) MOSTRAR EL NOMBRE DE LAS AEROLÍNEAS
SELECT DISTINCT Nombre
FROM Aerolinea

-- 4) MOSTRAR EL NOMBRE DE LOS CODIGOS POSTALES DADOS DE ALTA PARA LAS DIRECCIONES
SELECT DISTINCT codigoPostal
FROM Direccion

-- 5) MOSTRAR EL IDENTIFICADOR DE CLIENTE, EL APELLIDO PATERNO Y EL NOMBRE
SELECT idPersona, paterno, nombre
FROM Persona

-- 6) MOSTRAR EL NOMBRE CON EL TITULO DE 'CLIENTE‘
SELECT nombre + ' ' + paterno + ' ' + ISNULL(materno,' ') as Cliente 
FROM Persona

-- 7) MOSTRAR EL NOMBRE CON EL TITULO 'CLIENTE', EL APELLIDO PATERNO Y MATERNO CON EL TITULO 
SELECT nombre as Cliente , paterno + ISNULL(materno,' ') as Apellidos
FROM Persona

-- 9) MOSTRAR EL IDENTIFICADOR CON EL TITULO '#ASIENTOS', Y EL TIPO DE AVIÓN DE TODOS LOS REGISTRADOS EN LA BD
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
OR materno IS NULL  -- OR si se cumplen una condición


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
-- DATEDD (Función para sumar dias a una fecha determinada)
----------------------------------------

SELECT *, DATEADD (yy,1,fechafabricacion) AS fingarantia --Agrega un año a la fecha de fabricación
FROM Avion

SELECT *, DATEADD (mm,6,fechaingreso) AS fecha6mesesdespues -- Se agrega columana con fecha de 6 meses despues de ingreso
FROM Vendedor


------------------------------------------------------------
-- DATEDIFF (Función para obtener la diferencia entre dos fechas)
-----------------------------------------------------------

SELCT DATEDIFF(DD,'19860226',GETDATE())


-- Calcular la antiguedad de todos los aviones 

SELECT *, DATEDIFF(YY,fechafabricacion,GETDATE()) AS Añosdevidaavion
FROM Avion

----------------------------------------------------------------
-- DATENAMEB (Para mostrar la fecha en texto, sea Años, meses o días)
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
          ' El tipo de avión ' + tipoAvion + ' tiene ' +
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
 
--Seleccionar el nombre de todos los tipos de aviones con más mas de 200 asientos

 SELECT *
 FROM tipoAvion
 WHERE numAsientos > 200

--Seleccionar el nombre de todos los tipos de aviones con más mas de 200 asientos, con la siguiente leyenda: "El avión" <tipo avión> "tiene una capacidad de " <num asientos> "asientos"
SELECT *, 'El avión' + tipoAvion + ' tiene una capacidad de ' + CONVERT(VARCHAR(5),numAsientos) + 'asientos' 
FROM tipoAvion
WHERE numAsientos > 200 

--Seleccionar el nombre completo de todas las personas en la base de datos que cumplan años hoy y mostrarlo como "Felices " <edad> " años " <nombre completo> "!!!"
SELECT *, ' FELICES ' + CONVERT(VARCHAR(3),DATEDIFF(YY,nacimiento,GETDATE())) + ' AÑOS ' + nombre + ' ' + paterno + ' ' 
FROM Persona 
WHERE DAY(nacimiento)= DAY(GETDATE()) AND MONTH(nacimiento) = MONTH(GETDATE())

--mostrar la antigüedad en años de todos los aviones almacenados en la base de datos
SELECT *, DATEDIFF(yy,fechaFabricacion,GETDATE()) AS antiguaedad
FROM Avion

--mostrar la fecha exacta del siguiente mantenimiento de los aviones tomando como referencia la fecha del último, ordenándolos por el que esté más próximo a vencer
SELECT *, DATEADD(MM,mesesMantenimiento,UltimoMantenimiento) AS PROXMANTT
FROM Avion
ORDER BY PROXMANTT ASC

--mostrar el tiempo en días que falta para el mantenimiento de los aviones tomando como referencia la fecha del último, ordenándolos por el que esté más próximo a vencer
SELECT *, DATEADD(MM,mesesMantenimiento,UltimoMantenimiento) AS PROXMANTT
FROM Avion
ORDER BY PROXMANTT DESC

--mostrar el tiempo en días por el que se atrasó o adelantó el último mantenimiento de los aviones tomando como referencia la fecha de adquisición.
SELECT *, DATEDIFF(dd,DATEADD(MM,mesesMantenimiento,fechaFabricacion),UltimoMantenimiento)
FROM Avion

--mostrar el día de la semana en que le toca mantenimiento a cada uno de los aviones
SELECT *,DATENAME(DW,UltimoMantenimiento)
FROM Avion

--Mostra las aerolíneas extranjeras , con el texto, la aerolínea <nombre> es extranjera
SELECT *, 'La aerolinea ' + Nombre + ' Es extranjera'
FROM Aerolinea
WHERE nacional = 0
--Selecciona la tabla de clientes ordenandola por la fecha de registro de manera descendente
SELECT *
FROM Cliente
ORDER BY fechaRegistro desc
--Selecciona todos los domicilios cuyo número de casa no sea numérico--11. mostrar todos los vuelos y ordenarlos por los que tengan estén más próximos y tengan más lugares vacíos
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

--Selecciona al cliente tipo Oro que tenga más antigûedad de registro
SELECT *, DATEDIFF(YY,fechaRegistro,GETDATE()) as year
FROM Cliente
WHERE idTipoCliente=3 AND DATEDIFF(YY,fechaRegistro,GETDATE())=15

--Selecciona todos los domicilios y ordenalos por código postal, colonia y calle
SELECT *
FROM Direccion
ORDER BY  codigoPostal, colonia, calle ASC

--Selecciona el sueldo diario de los empleados considerando que todos los meses son de 30 días, agregar el alias "sueldo diario" y ordenarlo de manera descendente
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

--selecciona los vuelos que se realizaron esta última semana
SELECT * 
FROM Vuelo
WHERE fechaVuelo BETWEEN DATEADD(DD,-7,GETDATE()) AND GETDATE()

--selecciona los vuelos que se compraron durante el último mes
SELECT * 
FROM Vuelo
WHERE  fechaVuelo BETWEEN DATEADD(DD,-30,GETDATE()) AND GETDATE()


--Selecciona las compras con una antigûedad mayor a un año
SELECT *, DATEDIFF(YY,fechaCompra,GETDATE()) AS Numyears
FROM Venta
WHERE DATEDIFF(YY,fechaCompra,GETDATE()) > 1

--selecciona el día de la semana en que saldrán todos los vuelos.

SELECT *, DATENAME(DW,fechaVuelo) AS diaproxvuelo
FROM Vuelo 

---------------------------------------
-- Ejemplo Joins
---------------------------------------

SELECT *
FROM Persona

SELECT *
FROM Empleado

SELECT * 
FROM  Empleado
INNER JOIN Persona
	ON Empleado.idPersona = persona.IdPersona
--WHERE idEmpleado = 7

SELECT EM.*, PE.*
FROM  Empleado AS EM
INNER JOIN Persona AS PE
	ON EM.idPersona = PE.IdPersona
--WHERE idEmpleado = 7

-- SEGUNDA FORMA
SELECT em.*, pe.*
FROM Empleado AS em, Persona AS PE
where em.idPersona = pe.IdPersona
AND idEmpleado = 7

-- Producto cartesiano. sucede cuando no se agrega el INNER JOIN o el WHERE en este caso
SELECT em.*, pe.*
FROM Empleado AS em, Persona AS PE

SELECT * 
FROM Cliente
INNER JOIN Persona
	ON personaId = IdPersona -- CUANDO LOS ID SEAN IGUALES SE ANTEPONE NOMBRE DE TABLA O UN ALIAS


--No equi-join

-- Todos los vendedores que tienen un porcentaje de comisión menor al descuento del tio de ciente

SELECT *
FROM Vendedor  AS v
INNER JOIN TipoCliente AS t
	ON v.porcentajeComision > t.descuento
	
SELECT *
FROM Persona

SELECT *
FROM Cliente

SELECT* --Llama a todas las personas que son clientes
FROM Persona as a
INNER JOIN  Cliente as b
	ON	a.IdPersona = b.personaId

SELECT*  --Llama a todas las personas no importando si son clientes
FROM Persona as a
LEFT OUTER JOIN  Cliente as b
	ON	a.IdPersona = b.personaId
WHERE b.personaId IS NULL	


SELECT*  --Llama a todas las personas no son empleados
FROM Persona as a
LEFT OUTER JOIN  Empleado as b -- EL left trae  solo los valores de la tabla izquierda, es decir, persona
	ON	a.IdPersona = b.idPersona
WHERE b.idPersona IS NULL	

SELECT*  --Llama a todas las personas no son empleados
FROM Empleado as a
RIGHT OUTER JOIN  Persona as b -- EL left trae  solo los valores de la tabla izquierda, es decir, persona
	ON	a.IdPersona = b.idPersona
WHERE a.idPersona IS NULL	

SELECT a.idEmpleado, b.nombre + b.paterno + ISNULL(b.materno,'') as 'nombre' , 
		a.idJefe, jef.*,
		jef.idEmpleado,
		pjef.nombre, pjef.paterno, ISNULL(pjef.materno,'') as 'nombre jefe'
		
FROM Empleado as a
INNER JOIN Persona as b
	ON a.idPersona = b.IdPersona
LEFT OUTER JOIN  Empleado as jef
	ON a.idJefe = jef.idEmpleado
	LEFT OUTER JOIN Persona  as pjef
	ON jef.idPersona = pjef.IdPersona

-------------------------------------------------------
-- Ejercicios
-------------------------------------------------------
SELECT *
FROM Vuelo

SELECT *
FROM Venta

SELECT *
FROM Avion

SELECT *
FROM TipoAvion

SELECT *
FROM Vuelo AS a
INNER JOIN  Venta as b
	ON a.idVuelo = b.idVuelo
INNER JOIN  Avion as c
	ON	a.matriculaAvion = c.matricula
INNER JOIN  TipoAvion as d
	ON c.idTipoAvion = d.idTipoAvion
	ORDER BY  a.fechaVuelo
	
-- Ejemplo de práctica, para calentar motores

SELECT *
FROM Avion AS a
INNER JOIN Aerolinea AS b
	ON a.aerolineaId = b.AerolineaId
INNER JOIN Empleado AS c
	ON b.AerolineaId = c.AerolineaId
INNER JOIN TipoEmpleado AS d
	ON c.idTipoEmpleado = d.idTipoEmpleado 
WHERE tipoEmpleado = 'Piloto' OR tipoEmpleado = 'Gerente' 

-------------------------------------------------------------
--Ejercicios JOINS
-------------------------------------------------------------

--mostrar todos los vuelos y ordenarlos por los que tengan estén más próximos y tengan más lugares vacíos
SELECT *
FROM Vuelo AS a
INNER JOIN Venta AS b
		ON	a.idVuelo = b.idVuelo
ORDER BY numAsientos DESC

--selecciona los clientes tipo oro que tengan menos de 5 años de antigûedad
SELECT *, YEAR(fechaRegistro) AS Antiguaedad
FROM Cliente AS a 
INNER JOIN TipoCliente AS b
	ON a.idTipoCliente = b.idTipoCliente
where b.tipoCliente = 'oro'


--selecciona los tipos de empleado de vuelo con la siguiente leyenda "el tipo de empleado " + <nombre del tipo> + " requiere estar en vuelo"
SELECT*
FROM Empleado AS a
INNER JOIN TipoEmpleado AS b
	ON A.idTipoEmpleado = B.idTipoEmpleado
INNER JOIN Persona AS c
	ON a.idPersona = c.IdPersona
WHERE b.esDeVuelo = 1

--Seleccionar el nombre, apellido paterno y apellido materno de todos los empleados de las aerolíneas

SELECT a.AerolineaId, idEmpleado, b.nombre , paterno, materno  
FROM Aerolinea AS c
INNER JOIN Empleado as a
	ON c.AerolineaId = a.AerolineaId
INNER JOIN Persona AS b
	ON a.idPersona = b.IdPersona
	
--Seleccionar el nombre, apellido paterno y apellido materno de todos los empleados de las aerolíneas concatenados en una sola columna con el alias nombre del empleado.
SELECT b.nombre + ' ' + paterno + ' ' + materno AS NombEmp
FROM Aerolinea AS c
INNER JOIN Empleado as a
	ON c.AerolineaId = a.AerolineaId
INNER JOIN Persona AS b
	ON a.idPersona = b.IdPersona

--Seleccionar el nombre, apellido paterno y apellido materno de todos los empleados de las aerolíneas con la siguiente leyenda "bienvenido, " <nombre completo de la persona> ", hoy es " <fecha actual>
SELECT ' Bienvenido ' + b.nombre + ' ' + paterno + ' ' + materno + ' hoy es ' + CONVERT(VARCHAR(10),GETDATE()) AS NombEmp
FROM Aerolinea AS c
INNER JOIN Empleado as a
	ON c.AerolineaId = a.AerolineaId
INNER JOIN Persona AS b
	ON a.idPersona = b.IdPersona
	
--Muestra los nombres completos de todos los empleados que sean pilotos
SELECT a.tipoEmpleado, c.nombre,c.paterno,c.materno
FROM TipoEmpleado AS a
INNER JOIN Empleado AS b
	ON a.idTipoEmpleado = b.idTipoEmpleado
INNER JOIN Persona as c
	ON b.idPersona = c.IdPersona
WHERE a.tipoEmpleado ='Piloto'

--Muestra una lista de todos los clientes que viven entre los códigos postales 00100 y 00999


--Muestra la matrícula de los aviones que no tienen vuelos programados a partir de hoy
--Muestra el nombre completo de los pilotos que no tienen vuelos programados a partir de hoy
--Muestra el nombre completo de los empleados y el nombre completo de sus jefes
--Muestra la dirección (concatenando calle, número, colónia y CP) de todos los clientes registrados 
--Muestra el tipo de cliente que tiene cada uno de ellos con la siguiente leyenda: "Estimado " + <nombre completo> + " usted tiene nivel " + <tipocliente>
--Muestra la matrìcula de todos los aviones junto con el nombre de la aerolínea propietaria de los mismos.
--Muestra la información de los vuelos que vendieron los vendedores que ingresaron despuès del año 2010 indicando el nombre completo del vendedor y el cliente y la matrícula del avión.
--Muestra el costo total de cada una de las ventas de febrero del 2014, considerando que cada venta puede tener màs de un asiento vendido.
--Muestra la aerolínea, el tipo de avion, la matrñicula del avió?, la fecha de vuela y el precio por asiento de todos los vuelos con un precio por asiento mayor a $4000, ordenarlos de manera descendente
--Muestra la fecha y tipo de avión de todos los vuelos programados de aerolineas internacionales.
--Muestra el nombre completo, el id de cliente y id de empleado de todos los empleados que sean clientes
--Muestra cuánto cobró de comisión cada uno de los vendedores por cada una de sus ventas.
--Muestra los empleados que tienen un sueldo mayor al sueldo máximo por su tipo de puesto
--Muestra el nombre completo de todos los empleados y ordenalos por la bandera si es empleado de vuelo o no.
--Muestra el precio de los vuelos considerando el descuento que tiene cada cliente.
--Muestra el nombre completo y edad de las personas que ya tienen boleto comprado para el avión con matrícula 234312
--Muestra la dirección de las personas que viven en la misma dirección
--Muestra el nombre de las personas que cumpla años en un rango de +/- 10 días a la fecha de un vuelo.
--Muestra todos los clientes que no hayan realizado alguna compra en el año 2014
--Muestra los aviones que actualmente no tengan vuelos programados.
--Muestra una lista de todos los empleados que laborarán en el vuelo con Id 2

---------------------------------------------------------------
--- GROUP BY
---------------------------------------------------------------

SELECT matriculaAvion, precioporasiento, SUM(numAsientos)
FROM Vuelo  AS a
INNER JOIN Venta AS b
	ON	a.idVuelo = b.idVuelo
GROUP BY matriculaAvion, precioporasiento -- Agrupa por matriculaAvion y precioporasiento.
ORDER BY matriculaAvion

SELECT *
FROM Venta AS a
