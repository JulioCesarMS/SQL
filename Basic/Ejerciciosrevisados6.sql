--1. muestra la cantidad de domicilios por código postal 
--que existen registrados.
Select codigoPostal, COUNT(direccionId)
from Direccion
group by codigoPostal

--2. muestra el nombre de los empleados y la cantidad de personas 
--que tienen a su cargo.
Select a.idJefe, c.nombre, c.paterno, ISNULL(c.materno,''), COUNT(a.idEmpleado)
from Empleado as a
	inner join	Empleado as b
		on a.idJefe = b.idEmpleado
			inner join Persona as c
			on b.idPersona = c.IdPersona
group by a.idJefe, c.nombre, c.paterno, c.materno


Select idJefe, COUNT(idEmpleado) 
from Empleado 
where idJefe IN(Select idEmpleado from Empleado)
group by idJefe



--3. muestra la nómina que se tiene que pagar agrupando por tipo 
--de empleado.
Select idTipoEmpleado, SUM(sueldo)
from Empleado
group by idTipoEmpleado





--4. muestra el nombre de las aerolineas y la cantidad de aviones 
--que tiene agrupando por el año de fabricación de cada uno de ellos
Select Nombre, YEAR(fechaFabricacion), COUNT(matricula)
from Aerolinea		as	a
inner join Avion	as b
on a.AerolineaId = b.aerolineaId
group by Nombre, YEAR(fechaFabricacion)
order by Nombre

--5. muestra el número de clientes que se tienen, agrupandolos por
-- tipo de cliente
Select idTipoCliente, COUNT(idTipoCliente)
from cliente
group by idTipoCliente

Select idTipoCliente, COUNT(clienteId)
from cliente
group by idTipoCliente




--6. muestra cuantos hombres y cuantas mujeres hay registrados en 
--el sistema.
SELECT sexo, COUNT(IdPersona)
from persona
group by sexo

--7. muestra el nombre de los vendedores y el número de ventas que 
--han realizado.
Select b.vendedorId, c.nombre, c.paterno, c.materno, COUNT(idVenta)
from venta				as a
inner join Vendedor		as b
on a.idVendedor = b.vendedorId
inner join Persona		as c
on b.personaId = c.IdPersona
group by b.vendedorId, c.nombre, c.paterno, c.materno


--8. muestra la comisión que ganó cada uno de los vendedores durante 
--el primer trimestre del 2014
Select idVendedor, SUM(numAsientos*precioPorAsiento * porcentajeComision / 100)
from Venta			as a
inner join Vuelo	as b
on a.idVuelo = b.idVuelo
inner join Vendedor		as c
on a.idVendedor = c.vendedorId
where fechaCompra between '20160101' and '20160331'
group by idVendedor

Select idVendedor,porcentajeComision, SUM(numAsientos * precioPorAsiento * porcentajeComision / 100)
from Venta			as a
inner join Vuelo	as b
on a.idVuelo = b.idVuelo
inner join Vendedor		as c
on a.idVendedor = c.vendedorId
where fechaCompra between '20160101' and '20160331'
group by idVendedor, porcentajeComision






--9. muestra la cantidad de asientos vendidos por vuelo y la cantidad 
--de asientos que falta por vender para completar los asientos
-- disponibles en el avión.

Select a.idVuelo, SUM(a.numAsientos), d.numAsientos-SUM(a.numAsientos)
from venta			as a 
inner join Vuelo	as b
on a.idVuelo = b.idVuelo
inner join Avion	as c
on b.matriculaAvion = c.matricula
inner join TipoAvion as d
on c.idTipoAvion = d.idTipoAvion
group by a.idVuelo, d.numAsientos



--10. muestra los vuelos que tengan más de 5 asientos vendidos
Select a.idVuelo, SUM(a.numAsientos)
from venta			as a 
inner join Vuelo	as b
on a.idVuelo = b.idVuelo
group by a.idVuelo
having SUM(a.numAsientos) > 5

--11. muestra los vuelos cuyas ventas sumen más de 10000 pesos
Select a.idVuelo, SUM(numAsientos*precioPorAsiento)
from Venta as a
inner join Vuelo as b
on a.idVuelo = b.idVuelo
group by a.idVuelo
having SUM(numAsientos*precioPorAsiento) > 10000



--12. muestra a los clientes que han gastado más de 10000 pesos 
--en la compra de vuelos.
Select a.idCliente, SUM(numAsientos*precioPorAsiento * (100 - descuento) /100)
from Venta as a
inner join Vuelo as b
on a.idVuelo = b.idVuelo
inner join Cliente as c
on a.idCliente = c.clienteId
inner join TipoCliente as d
on c.idTipoCliente = d.idTipoCliente
group by a.idCliente
having SUM(numAsientos*precioPorAsiento * (100 - descuento) / 100) > 10000

--13. muestra el número de vuelos que tienen o han tenido todos
-- los empleados
Select idEmpleado, COUNT(idVuelo)
from VueloEmpleado
group by idEmpleado


--14. muestra el promedio de edad de los clientes registrados.
Select AVG(DATEDIFF(YY,nacimiento,GETDATE()))
from Cliente		as a
inner join Persona	as b
on a.personaId = b.IdPersona

Select idTipoCliente, AVG(DATEDIFF(YY,nacimiento,GETDATE()))
from Cliente		as a
inner join Persona	as b
on a.personaId = b.IdPersona
group by idTipoCliente


--15. muestra el promedio de meses que los aviones de cada 
--aerolínea deben tener mantenimiento
Select a.AerolineaId, a.Nombre, AVG(b.mesesMantenimiento)
from Aerolinea		as a
inner join Avion	as b
on a.AerolineaId = b.aerolineaId
group by a.AerolineaId, a.Nombre


--16. muestra la venta mínima de cada uno de los vendedores
Select idVendedor, MIN(numAsientos*precioPorAsiento)
from Venta as a
--inner join Vendedor as b
--on a.idVendedor = b.vendedorId
inner join Vuelo as c
on a.idVuelo = c.idVuelo
group by idVendedor
