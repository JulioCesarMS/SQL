/*Fecha de Clase: 21/04/2018*/

/*Manual de Bases de Datos*/

/*Cómo crear una Base de Datos*/

create database dip_bd;

/*Cómo abrir una Base de Datos*/

use dip_bd;

/*Cómo crear una Tabla*/

create table libro
(
  Clave int,
  Título varchar(50),
  Autor varchar(100),
  Precio decimal(6,2)
  );
  
/*Ejemplo creando la tabla empleado*/

create table empleado
  (
    Clave varchar(5),
    Nombre varchar(30),
    Apellido_Paterno varchar(20),
    Apellido_Materno varchar(20),
    Edad int(2),
    Sueldo decimal(8,2),
    Puesto varchar(50)
    );

/*Cómo eliminar una tabla*/

drop table empleado;
drop table libro;
drop database dip_bd;

/*Cómo insertar un registro en una tabla*/

insert into libro
values
(1,'Cien años de soledad','GABO',150);
select * from libro;
insert into libro
values
(2,'Amanecer','Stephanie Meyer',399);
select * from libro;


/****************************************************************************************************************************************/

/*Clase del: 28/04/2018*/

/*Restricciones. Una restricción es una limitante que se inserta en una columna, es decir, las restricciones se aplican a las columnas. 
Una columna puede tener más de una restricción; el nombre con el que se conocen a las restricciones es 'Constraints'*/

/*Not Null: Especifica que el dato para una columna es de captura obligatoria*/

/*Pasos recomendados para la Implementación de de una Base de Datos*/

/*Paso 1: Análisis del Requerimiento*/

/*Recursos para el Análisis: Cuestionarios, entrevistas, reuniones, documentos, observación*/

/*Algunas restricciones se establecen de manera elemental y otras tienen su origen en las 'Reglas del Negocio'*/

/*Unique: Se usa para especificar que el dato en una columna es irrepetible*/

/*Primary Key (Clave Principal): Es la clave principal que identifica cada fila y es por default 'Not Null y 'Unique' 
Esta clave es usada para:

a) Clasificar los datos en la Consulta
b) Buscar una fila específica
c) Crear relaciones entre tablas
Una convención para el nombre de la columna Primary Key es utilizar las letras 'ID' al principio o al final*/

create table médico
(
  MedicoID int primary key,
  Nombre varchar(40) not null,
  Primer_Ap varchar(100) not null,
  Segundo_Ap varchar(15) null,
  Cédula varchar(15) not null unique,
  Celular_1 varchar(15) not null,
  Celular_2 varchar(15) null,
  Cédula_esp varchar(15) null,
  Especialidad varchar(30) null
  );
insert into médico
(MedicoID,Nombre,Primer_Ap,Segundo_Ap,Cédula,Celular_1,Celular_2,Cédula_esp,Especialidad)
values
(1,'Juan','Pérez','Pérez','1345','5514148893','5584328918','567','Pediatra');
select * from médico;
insert into médico
(MedicoID,Nombre,Primer_Ap,Segundo_Ap,Cédula,Celular_1,Celular_2,Cédula_esp,Especialidad)
values
(2,'Juana','Pérez','Pérez','13456','5514148893','5584328918','567','Pediatra');
select * from médico;
insert into médico
(MedicoID,Nombre,Primer_Ap,Segundo_Ap,Cédula,Celular_1,Celular_2,Cédula_esp,Especialidad)
values
(3,'John','Pérez','','13458','5514148893','5584328918','567','Pediatra');
insert into médico
(MedicoID,Nombre,Primer_Ap,Cédula,Celular_1,Celular_2,Cédula_esp,Especialidad)
values
(4,'John','Pérez','13498','5514148893','5584328918','567','Pediatra');

/*Mostrar detalle de la Estructura de una Tabla*/

describe médico;

/*Cómo asignar un valor por default a una columna*/

create table cliente
(
  IDCliente varchar(5) primary key,
  Colonia varchar(35) not null default 'Falta Colonia'
  );
insert into cliente
(IDcliente)
values
('1');
select * from cliente;
describe cliente;
drop tables libro,empleado;
create table libro
(
  Clave int primary key,
  Título varchar(100) not null,
  Autor varchar(50) not null,
  Precio decimal(8,2) not null,
  Editorial varchar(40) not null,
  Categoría varchar(40) null
  );
  insert into libro
(Clave,Título,Autor,Precio,Editorial,Categoría)
values
(1,'La Esencia de la Vida','Bryan Warner',954.79,'Interscope','');
create table empleado
  (
    ID_Empleado varchar(5) primary key not null,
    Nombre varchar(30) not null,
    Primer_Ap varchar(20) not null,
    Segundo_Ap varchar(20) not null,
    Edad int(2) null,
    Sueldo decimal(8,2) not null,
    Puesto varchar(50) not null,
    Cursos_adicionales varchar(50) not null default 'Sin especificar'
    );
insert into empleado
(Clave,Nombre,Primer_Ap,Segundo_Ap,Edad,Sueldo,Puesto,Cursos_adicionales)
values
(1,'Jonatan','C.','C.',29,17999.99,'Senior','');
select * from empleado;
drop table empleado;
create table empleado
  (
    Clave varchar(5) primary key not null,
    Nombre varchar(30) not null,
    Primer_Ap varchar(20) not null,
    Segundo_Ap varchar(20) not null,
    Edad int(2) null,
    Sueldo decimal(8,2) not null,
    Puesto varchar(50) not null,
    Cursos_adicionales varchar(50) not null default 'Sin especificar'
    );
insert into empleado
(Clave,Nombre,Primer_Ap,Segundo_Ap,Edad,Sueldo,Puesto,Cursos_adicionales)
values
(1,'Jonatan','C.','C.',29,17999.99,'Senior','');
select * from empleado;

/*Llave Primaria Autoincrementable*/

create table cheque
(
IDCheque int auto_increment primary key,
Importe decimal(10,2) not null
);
insert into cheque
(importe)
values
(1000);
select*from cheque;
insert into cheque
(importe)
values
(3200.47);
insert into cheque
(importe)
values
(3000),
(4000),
(5000);
delete from cheque
where IDCheque=5;
select*from cheque;
insert into cheque
(importe)
values
(6000);
select*from cheque;
insert into cheque
(IDCheque,importe)
values
(5,5000);
select*from cheque;
describe cheque;

/*Llave Primaria Compuesta*/

/*Es aquella que en su creación utiliza dos o más columnas hasta un máximo de 16*/

create table factura
(
Serie char(1),
Folio int,
Importe float,
primary key (serie,folio)
);
insert into factura
(Serie,Folio,Importe)
values
('A',100,1250),
('A',101,3050),
('B',101,1100);
select*from factura;

/*Modificar la Estructura de una Tabla*/

/*Agregar una Columna*/

alter table médico
add column Salario decimal(10,2);
describe médico;
select*from médico;
alter table médico
add column Fecha_Ingreso datetime;
describe médico;
select*from médico;

/*Eliminar una Columna*/

alter table médico
drop column Fecha_Ingreso;
alter table médico
add column Fecha_Registro datetime not null default '1900/01/01';
select*from médico;

/*Modificar el tipo y/o tamaño de una Columna*/

alter table médico
modify column nombre varchar(50);
describe médico;
select*from médico;
alter table médico
modify column nombre varchar(3);
select*from médico;
alter table médico
modify column salario float;
describe médico;

/*Cambiar el nombre de una Columna*/

alter table médico
change column Nombre Name varchar(50);
describe médico;
alter table médico
modify column Name varchar(100);
describe médico;

/*En todos los casos las palabra 'column' es opcional*/

/**********************************************************************************************************************************/

/*Clase del: 05/05/2018*/

/*Cómo Eliminar Filas de una Tabla*/

/*Usamos el comando "delete" seguido de la clásula "from" y el nombre de la tabla que contiene las filas a borrar

Ejemplo: "delete from médico"

El comando anterior eliminaría todas las filas de la tabla "médico" debido a que no cuenta con un filtro.

Un filtro es la selección de "filas" mediante un criterio lógico que puede utilizar los operadores de comparación">,<,<=,>=,<> 
y las conectivas lógicas "and" y "or"

Para este ejemplo, el "and" obliga a que se cumplan ambas condiciones, mientras que "or" aplica el criterio de que se cumpla una u otra*/

/*El siguiente comando eliminaría el médico que tiene sólo la clave "3"

"delete from médico
where
idmedico=;"*/

select * from médico;
delete from médico
where
MedicoID=3;

/*Como podemos ver, la palabra clave para crear el "filtro" es "where"*/

select * from empleado;
delete from empleado
where
Clave=1;
select * from empleado;
delete from médico
where
MedicoID=1 and MedicoID=2;
select * from médico;
delete from médico
where
MedicoID=1 or MedicoID=2;
select * from médico;

/*Cómo actualizar datos en las columnas del registro*/

/*Usamos el comando "Update" seguido del nombre de la tabla y después la palabra "set", seguida del nombre de la columna que se va 
  a modificar y con un signo de "=" el nuevo valor*/

select * from libro;
select * from factura;
update factura
set importe=7777
where
Serie='A'
and
Folio=101;
select * from factura;

/*"Clasificación de comandos dentro de SQL"*/

/*1.- Clasificación DDL (Data Definition Language) Comandos usados para crear, modificar o eliminar objetos. Es decir, comandos que impacten 
      la estructura como: "create", "drop", "alter"

  2.- Clasificación DML (Data Manipulation Language) Comandos usados para agregar, eliminar, actualizar o consultar datos de las tablas 
      (insert, delete, update y select) es decir, aquellos que le peguen a los datos.

  3.- Clasificación DCL (Data Control Language) Comandos usados para la configuración y administración del servidor y la base de datos ".DBA" 
      (Administrador de la Base de Datos)
*/

/*Paso 2: Diseño de la Base de Datos*/

/* - ¿Qué tablas?
   - ¿Qué columnas?
   - ¿Qué constraints?
   - ¿Qué relaciones?
   - Modelo Entidad-Relación, donde "entidad" es la tabla*/

/*"Relaciones en Bases de Datos*/

/*Como dijimos, una base de datos relacional permite crear relaciones entre las tablas, usando para ello una columna que las conecte. 
  Que es, por un lado, la Primary Key de una tabla VS la llave secundaria de otra. Es entonces que podemos crear "llaves secundarias" 
o "Foreign Key" para estas relaciones. Es obligado que la FK sea del mismo tipo que la PK con quien crea la relación.

Las FK garantizan además la integridad de los datos*/

/*Los pasos para crear objetos son los siguientes:

1) Orden Lógico (las que no se actualizan constantemente o prácticamente no se tocan)

2) No tienen FK

* Para estos efectos, algunas tablas son consideradas como "catálogos" cuyas características son:
- Poco DML
- Datos Generales

3) Las demás... Llamadas "Tablas de Movimientos o Transaccionales"
- Mucho DML
- Detalle de Operaciones

* Algunas consideraciones tienen denominado como "Master (catálogo) o Detalle (tabla de movimientos)"*/

/*"Tipos de Relación"*/

/*1) Uno a Varios: Se da cuando, por cada una vez que aparece una clave como PK en una tabla, a su vez puede aparecer varias veces como FK
  2) Uno a Uno: Se da cuando cuando, por cada vez que aparece una clave como PK en una tabla, aparece una y sólo una vez en otra tabla como 
     "Llave Secundaria"
  3) Varios a Varios: Se da cuando cuando aparecen varias veces en varias tablas ls PK y las FK
   */

/**********************************************************************************************/

/*Clase del: 12/05/2018*/

/*Desarrollo de Proyecto: Liverpool*/

create database Liverpool;
use Liverpool;

/*********************************************************************************************/

create table Almacén
(
  Id_Almacén int primary key,
  Nombre varchar(30) not null
  );

/*********************************************************************************************/

create table Marca
(
  Id_Marca int primary key,
  Nombre varchar(30) not null
  );

/*********************************************************************************************/

create table Categoría
(
  Id_Categ varchar(30) primary key,
  Nombre varchar(30) not null
  );

/**********************************************************************************************/

  create table Vendedor
(
  Id_Vend int primary key,
  Nombre varchar(40) not null,
  Comisión decimal(4,2) not null
  );

/***********************************************************************************************/

create table Proveedor
(
  Id_Prov int primary key,
  Nombre varchar(50) not null
  );

/************************************************************************************************/

create table Cliente
(
  Id_Cliente int primary key,
  Nombre varchar(50) not null
  );

/************************************************************************************************/

create table Producto
(
  Id_Prod varchar(5) primary key,
  Descripión varchar(50) not null,
  Precio decimal(9,2) not null,
  Id_Marca int not null
  references Marca (Id_Marca),
  Id_Categ varchar(5) not null
  references Categoría (Id_Categ),
  Id_Prov int not null
  references Proveedor (Id_Prov)
  );

/*********************************************************************************************/

create table Venta
(
  Id_Venta int auto_increment 
  primary key,
  Folio int not null unique,
  Fecha  datetime not null,
  Id_Vend int not null,
  Id_Cliente int not null,
  Importe decimal(9,2),
  foreign key (Id_Vend)
  references Vendedor (Id_Vend),
  foreign key (Id_Cliente)
  references Cliente (Id_Cliente)
  );

/*************************************DECLARACIONES********************************************************/

insert into Almacén
(Id_Almacén,Nombre)
values
(1,'Plaza Dos Patios');
select * from Almacén;

/***************************************************/

insert into Marca
(Id_Marca,Nombre)
values
(1,'Samsung');
select * from Marca;

/***************************************************/

insert into Categoría
(Id_Categ,Nombre)
values
(1,'Electrónicos');
select * from Categoría;

/***************************************************/

insert into Vendedor
(Id_Vend,Nombre,Comisión)
values
(1,'Marisol Corona',75.99);
select * from Vendedor;

/***************************************************/

insert into Proveedor
(Id_Prov,Nombre)
values
(1,'Samsung de México, S.A. de C.V.');
select * from Proveedor;

/***************************************************/

insert into Cliente
(Id_Cliente,Nombre)
values
(1,'Mapfre Unidad de Servicios, S.A.');
select * from Cliente;

/***************************************************/

insert into Producto
(Id_Prod,Descripión,Precio,Id_Marca,Id_Categ,Id_Prov)
values
(1,'Pantalla 40 PGDS',12600,1,1,1);
select * from Producto;

/**********************EJERCICIO 1 DE ERROR*****************************/

insert into Producto
(Id_Prod,Descripión,Precio,Id_Marca,Id_Categ,Id_Prov)
values
(2,'Pantalla 40 PGDS',12600,3,1,1);
select * from Producto;

/**********************EJERCICIO 2 DE ERROR*****************************/

insert into Producto
(Id_Prod,Descripión,Precio,Id_Marca,Id_Categ,Id_Prov)
values
(3,'Pantalla 40 PGDS',12600,3,5,1);
select * from Producto;

/***************************************************/

insert into Venta
(Id_Venta,Folio,Fecha,Id_Vend,Id_Cliente,Importe)
values
(1,1,'2018/05/12',1,1,12600);
select * from Venta;

/*********************CREANDO MODELOS PARA VALIDACIÓN DE CONSTRAINTS EN ESQUEMAS**********************/

drop table Producto;
create table Producto
(
  Id_Prod varchar(5) primary key,
  Descripión varchar(50) not null,
  Precio decimal(9,2) not null,
  Id_Marca int not null,
  Id_Categ varchar(30) not null,
  Id_Prov int not null,
  foreign key (Id_Marca)
  references Marca (Id_Marca),
  foreign key (Id_Categ)
  references Categoría (Id_Categ),
  foreign key (Id_Prov)
  references Proveedor (Id_Prov)
  );

/******************************************************/

insert into Producto
(Id_Prod,Descripión,Precio,Id_Marca,Id_Categ,Id_Prov)
values
(1,'Pantalla 40 PGDS',12600,1,1,1);
select * from Producto;

/**********************EJERCICIO 3 DE ERROR (CON CORRECCIONES)*****************************/

insert into Producto
(Id_Prod,Descripión,Precio,Id_Marca,Id_Categ,Id_Prov)
values
(2,'Pantalla 40 PGDS',12600,3,1,1);
select * from Producto;

/************************FUNDAMENTOS DE NOMALIZACIÓN**************************************/

/*La normalización es el proceso de organizar los datos de una base de datos. Se incluye la creación de tablas y el establecimiento de 
relaciones entre ellas según reglas diseñadas tanto para proteger los datos como para hacer que la base de datos sea más flexible al 
eliminar la redundancia y las dependencias incoherentes.*/

use Liverpool;
alter table Cliente
add column Id_Vend int;
select*from Cliente;

/*************************CORRECCIÒN DE CAMPO**********************************/

alter table Cliente
drop column Id_Vend;

/********************AGREGADO DE COLUMNA CORRECTO*****************************/

alter table Cliente
add column Id_Vend int not null default 0;
select*from Cliente;

/*************************CREAR RELACIÓN ENTRE TABLAS*************************/

alter table Cliente
add constraint FK_Cliente_Vend_Id_Vend
foreign key(Id_Vend)
references Vendedor(Id_Vend);

/********************CORRIGIENDO CON ACTUALIZACIÓN****************************/

update Cliente	
set Id_Vend=1;
select * from Cliente;
alter table Cliente
add constraint FK_Cliente_Vend_Id_Vend
foreign key(Id_Vend)
references Vendedor(Id_Vend);

/*************************TRABAJANDO CON LA BASE DE EJEMPLO 'NORTHWIND'********/

use northwind;
select*from products;
select count(*) from products;
describe products;
select*from categories;
describe categories;
select*from suppliers;
describe suppliers;
select*from employees;
select*from customers;
describe customers;
select*from orders;
select*from order_details;
describe order_details;
describe orders;
describe shippers;

/*Clase del: 19/05/2018*/

/**************************DECLARACIONES DE CARGA MASIVA***************************/

/*Cómo Poblar una Tabla con Registros Obtenidos de un Archivo .txt o .csv*/
/*Load Data Infile '/home/usr140/Escritorio/datos.txt'
Fields Terminated By ';'
Lines Terminated By '\n'*/

/**********************************************************************************/

use dip_bd;
create table Trabajador
(
Nombre varchar(30) not null,
Apellido varchar(20) not null,
Sueldo decimal(8,2) not null
);
Load Data Infile '/home/usr140/Escritorio/datos.txt' into table Trabajador
Fields Terminated By ';'
Lines Terminated By '\n';

/*********************************************************************************/

use northwind;

/********************************COMANDO SELECT***********************************/

/*Permite el desarrollo de consultas a las tablas en la base de datos.*/

/***********************************ESTRUCTURA SINTÁCTICA************************/

/*Select <columnas> from <tabla>
  where
        <filtro>
  order by <columnas(s)>;
  Select es para seleccionar columnas y where selecciona filas*/
/*1.- Elegir columnas para incluirlas en el Result Set*/
Select*from customers;

/********************EJECUTANDO CONSULTAS PRIMERA MODALIDAD***********************/

Select customerid,
	   companyname,
       contactname,
       contacttitle,
       phone,
       address,
       region,
       country
       from customers
       where 
          country='Mexico'
       or country='France'
       or country='Germany';

/********************EJECUTANDO CONSULTAS SEGUNDA MODALIDAD***********************/

Select customerid,
	   companyname,
       contactname,
       contacttitle,
       phone,
       address,
       region,
       country
       from customers
       where 
            country in ('Mexico','Germany','France'); /*Esta última línea del código se conoce como "Lista de Valores"*/
            
/***************EJECUTANDO CONSULTAS ORDENADAS EN MODALIDAD POR COLUMNA***********/       

Select customerid,
	   companyname,
       contactname,
       contacttitle,
       phone,
       address,
       region,
       country
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by country;

/***********EJECUTANDO CONSULTAS ORDENADAS POR LA POSICION DE LA COLUMNA****/       

Select customerid,
	   companyname,
       contactname,
       contacttitle,
       phone,
       address,
       region,
       country
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by 8;

/********USO DE ALIAS EN LOS NOMBRES DE LAS COLUMNAS EN LA LISTA DE SELECCION**********/

/*NOTA: La ejecución del siguiente comando no modifica la estructura de la tabla*/

Select customerid as 'Clave',
	   companyname as 'Nombre',
       contactname as 'Contacto',
       contacttitle as 'Puesto',
       phone as 'Teléfono',
       address as 'Dirección',
       region as 'Región',
       country as 'País'
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by 8;

/***********EJECUTANDO CONSULTAS CON ALIAS SIN "AS" PARA LAS COLUMNAS****/

Select customerid 'Clave',
	   companyname 'Nombre',
       contactname 'Contacto',
       contacttitle 'Puesto',
       phone 'Teléfono',
       address 'Dirección',
       region 'Región',
       country 'País'
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by 8;       

/***********EJECUTANDO CONSULTAS CON ALIAS SIN "COMILLAS" PARA LAS COLUMNAS****/       

Select customerid Clave,
	   companyname Nombre,
       contactname Contacto,
       contacttitle Puesto,
       phone Teléfono,
       address Dirección,
       region Región,
       country País
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by 8;

/******EJECUTANDO CONSULTAS CON ORDENAMIENTO EN FUNCION DEL ALIAS SIN "COMILLAS" PARA LAS COLUMNAS****/             

Select customerid Clave,
	   companyname Nombre,
       contactname Contacto,
       contacttitle Puesto,
       phone Teléfono,
       address Dirección,
       region Región,
       country País
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by País;

/******EJECUTANDO CONSULTAS CON ORDENAMIENTOS VARIOS EN FUNCION DEL ALIAS SIN "COMILLAS" PARA LAS COLUMNAS****/       

Select customerid Clave,
	   companyname Nombre,
       contactname Contacto,
       contacttitle Puesto,
       phone Teléfono,
       address Dirección,
       region Región,
       country País
       from customers
       where 
            country in ('Mexico','Germany','France')
       order by 'País de Origen'; /*No marca error, pero no lo ordena. Las comillas no funcionan para el "order by"*/

/*CONSULTA QUE MUESTRE LOS PRODUCTOS QUE NO TIENEN EXISTENCIA*/       

select*from products;
select productid Clave,
       productname Descripción,
       unitsinstock Existencia
       from products
       where
            unitsinstock=0;

/*CONSULTA QUE MUESTRE LOS PRODUCTOS CON UN PRECIO ENTRE 10 Y 18, INCLUIDOS LOS EXTREMOS (10 Y 18)*/

select productid Clave,
       productname Descripción,
       unitprice precio
              from products
              where
                  unitprice>=10
              and
                  unitprice<=18;

/*CONSULTA QUE MUESTRE LOS PRODUCTOS CON UN PRECIO ENTRE 10 Y 18, INCLUIDOS LOS EXTREMOS (10 Y 18) CON MODALIDAD CORTA*/                  

select productid Clave,
       productname Descripción,
       unitprice precio
              from products
              where
                  unitprice between 10 and 18;

/***************************DESARROLLE LAS SIGUIENTES CONSULTAS*******************************/                  

/*   A) Pedidos de los clientes ALFKI, VINET, ANTON, PARIS (ORDERS)
     No. de pedido, clave cliente, fecha.
     B) Productos de categorías del 1 al 3 con existencia menor a 15. (PRODUCTS)
     C) Pedidos de los vendedores 3,5 y 9 para los clientes ALFKI, VINET, ANTON y PARIS. (ORDERS)
     D) Renglones de pedidos donde aparezcan los productos con clave mayor a 40 y que hayan facturado menos de 3 pzas. (ORDER DETAILS)
     E) Clientes que no tengan asignada una región. (CUSTOMERS)
      "Usar alias, filtros necesarios, etc."
*/

/*********************************CONSULTA "A"************************************************/

use northwind;
select*from orders;
select customerid 'Clave Cliente',
	   orderid Pedido,
       orderdate Fecha
       from orders
       where
            customerid='ALFKI'
            or
            customerid='VINET'
            or
            customerid='ANTON'
            or
            customerid='PARIS';

/*******************************CONSULTA "A" MODO SHORT****************************************/            

select customerid 'Clave Cliente',
	   orderid Pedido,
       orderdate Fecha
       from orders
       where
            customerid in ('ALFKI','VINET','ANTON','PARIS');            

/*********************************CONSULTA "B"************************************************/            

select*from products;
select categoryid 'Clave Categoría',
	   productname 'Nombre Producto',
       unitsinstock Existencia
       from products
       where
            unitsinstock<15
            and
            categoryid>=1
            and
            categoryid<=3;

/*********************************CONSULTA "C"************************************************/                        

select*from orders;
select employeeid 'No. Vendedor',
	   customerid 'Clave Cliente'
       from orders
       where employeeid in(3,5,9) and customerid in ('ALFKI','VINET','ANTON','PARIS');
           

/*********************************CONSULTA "D"************************************************/                                   

select*from order_details;
select productid 'Clave Producto',
       quantity Cantidad
       from order_details
       where
            productid>40
            and
            quantity<3;

/*********************************CONSULTA "E"************************************************/                                               

select*from customers;
select companyname Cliente,
       region Región
	from customers
	where 
		region is null
        or
        region='';

/*****************************************COMPARADOR "LIKE"**********************************/

/*Se utiliza para valores de tipo "caracter" en los filtros. Se vale de los comodines "%" y/o "?", "_"*/

/********************************BUSCAR CON LA LETRA INICIAL**********************************/

select companyname
	from customers
	where
		 companyname like 'A%';

/**********************BUSCAR CON LA LETRA FINAL**********************************/

select companyname
	from customers
	where
		 companyname like '%S';

/**********************BUSCAR CON LA LETRA EN MEDIO O ENTRE************************/       

select companyname
	from customers
	where
		 companyname like '%TAQ%';

/******************BUSCAR CON COMODIN "_" (EL CARACTER QUE SEA)********************/

select companyname
	from customers
	where
		 companyname like 'A_F%';         

/**************BUSCAR CON COMODIN "_" (EL CARACTER QUE SEA) + COMBINACIONES VARIAS********/         

select companyname
	from customers
	where
		 companyname like 'A__R%S';         

/*CONSULTA QUE MUESTRE LAS PERSONA QUE TRABAJAN EN NORTHWIND DEL SEXO FEMENINO*/         

select*from employees;
select firstname Nombre,
       lastname Apellido,
       titleofcourtesy Título
       from employees
       where
			titleofcourtesy like '%s%';

/************************************UNIÓN DE TABLAS***************************/            

/*(JOIN DE TABLAS)*/

/*"Select" permite consultar desde más de una tabla mediante la unión (Join) de éstas; utilizando 
para ello, una columna de conexión entre tablas que normalmente son la PK de una tabla la FK de la otra; 
aunque no es obligatorio que exista una relación entre ambas*/

use dip_bd;
create table T1
(IDT1 int primary key,
 DatoT1 char(2));
create table T2
(IDT2 int primary key,
 DatoT2 char(2));

/******************************AGREGAR DATOS**********************************/

insert into T1
(IDT1,DatoT1)
values
(1,'AA'),
(2,'BB'),
(3,'CC');
insert into T2
(IDT2,DatoT2)
values
(1,2),
(2,2),
(3,1),
(4,5),
(5,3);
select*from T1;
select*from T2;

/************************EJEMPLO DE QUERY TIPO JOIN****************************/

select T1.*,T2.*
from T1,T2
where T1.IDT1=T2.DatoT2;

/**************************CLASE DEL 26/05/2018********************************/

/***********************FUNCIONES DE AGREGADO**********************************/

use northwind;
/*Llamadas también 'De Agrupamiento' y que ya existen una vez que se instala el Servidor de Base de Datos. Por lo tanto, para su uso, 
  basta con 'invocarlas'*/

/*COUNT: Esta función devuelve el número de 'filas' que tiene una tabla*/

select count(*) as Productos
from products;

/***********CONSULTA: CONTEO DE PRODUCTOS SIN EXISTENCIA (POR FILAS)***********/

select count(*) as Productos,
	   	   productname 'Nombre Producto',
           unitsinstock Existencia
		   from products
	       where unitsinstock=0;

/*SUM: Suma los valores numéricos contenidos en una columna y ésta puede ser una columna 'calculada'*/

/***********CONSULTA: CONTEO DE PRODUCTOS SIN EXISTENCIA (POR COLUMNAS)***********/

select sum(unitsinstock) Piezas
from products;

/****CONSULTA: CONTEO DE PRODUCTOS POR CATEGORÍA 'SEA FOODS' (POR COLUMNAS)********/

select sum(unitsinstock) Piezas,
	categoryid 'Clave Categoría'
	from products
	where 
		categoryid='Sea Foods';

/*AVG: Devuelve el promedio de los valores numéricos contenidos en una columna (Sum)/(Count)*/

select avg(unitsinstock) Piezas Promedio,
	categoryid 'Clave Categoría'
    from products
    where categoryid=5;

/*MIN: Devuelve el dato menor contenido en una columna*/

select min(unitprice) Precio Unitario
	from products;
/*MAX: Devuelve el dato mayor contenido en una columna */
select max(unitprice) Precio Unitario
	from products;

/*************DESARROLLE LA SIGUIENTE CONSULTA**********/

/*Pedidos, Piezas, Precio-Min, Precio-Max, Precio-Prom*/

use northwind;
select*from order_details;
select count(*) as 'Detalles de Compra',
	sum(quantity) as 'Suma de las Piezas',
	min(unitprice) as 'Precio Mínimo',
	max(unitprice) as 'Precio Máximo',
	avg(unitprice) as 'Precio Promedio'
	from order_details
		where productid=12;

/********************************************COLUMNAS CALCULADAS*************************************************/

/*Son aquellas que no existen en la Base de Datos, sino, que se obtienen como resultado de una operación aritmética (+,-,*,/) 
usando valores contenidos en otras columnas o no*/

/*CONSULTA QUE MUESTRA LOS RENGLONES DE LOS PEDIDOS INCLUYENDO EL IMPORTE BRUTO*/

select*from order_details;
select orderid pedido,unitprice precio, quantity cantidad,
(unitprice*quantity) Bruto
from order_details;

/*CONSULTA QUE MUESTRA LOS RENGLONES DE LOS PEDIDOS INCLUYENDO EL % DE DESCUENTO*/

select*from order_details;
select orderid pedido,unitprice precio, quantity cantidad,
(unitprice*quantity) Bruto, discount '% Dscto'
from order_details;
select*from order_details;

/*CONSULTA QUE MUESTRA LOS RENGLONES DE LOS PEDIDOS INCLUYENDO EL IMPORTE CON DESCUENTO*/

select orderid pedido,unitprice precio, quantity cantidad,
(unitprice*quantity)*(1-discount)
from order_details;

/*CONSULTA QUE MUESTRA LOS RENGLONES DE LOS PEDIDOS INCLUYENDO EL IMPORTE CON DESCUENTO 'LARGA'*/

select orderid pedido,unitprice precio, quantity cantidad,
((unitprice*quantity)-(unitprice*quantity)*(discount))
from order_details;

/*CONSULTA QUE MUESTRA LOS RENGLONES DE LOS PEDIDOS INCLUYENDO EL IMPORTE DEL DESCUENTO*/

select orderid pedido,unitprice precio, quantity cantidad,
((unitprice*quantity)- (unitprice*quantity)*discount) Subtotal
from order_details;

/*CONSULTA QUE MUESTRA LOS RENGLONES DE LOS PEDIDOS INCLUYENDO EL IVA*/

select orderid pedido,unitprice precio, quantity cantidad,
((unitprice*quantity)- (unitprice*quantity)*discount)*16/100 IVA
from order_details;

/*CONSULTA QUE MUESTRA LOS RENGLONES CON UN DESCUENTO MAYOR A $300.00*/

select*from products;
select*from order_details;
select orderid Pedido,
	unitprice 'Precio Unitario',
	quantity Cantidad,
	(unitprice*quantity) Bruto,
	discount '% de Descuento',
	((unitprice*quantity)*(1-discount)) Subtotal,
	((unitprice*quantity)*discount)'Importe de Descuento',
    (((unitprice*quantity)*(1-discount)) * .16) IVA,
    ((unitprice*quantity)*(1-discount)) + (((unitprice*quantity)*(1-discount)) * .16)'Neto'
    from order_details where ((unitprice*quantity)*discount) > 300 
    order by 7  desc;

/*CONSULTA QUE MUESTRA LA VALORIZACIÓN DEL INVENTARIO POR PRODUCTO*/

select*from products;
select productname Producto, unitprice 'Precio Unitario', unitsinstock Pzas,
(unitprice*unitsinstock) 'Inv. Lista'
from products;

/*CONSULTA QUE MUESTRA CUAL ES EL IMPORTE DE LA CONSULTA ANTERIOR PONDERANDO EL 8% A TODOS LOS PRODS.*/

select productname Producto, unitprice 'Precio Unitario', unitsinstock Pzas,
(unitprice*unitsinstock)-(unitprice*unitsinstock)*8/100 'Precio Remate'
from products;

/*CONSULTA QUE MUESTRA CUAL ES EL IMPORTE DE LA UTILIDAD QUE ESTOY PERDIENDO*/

select productname Producto, unitprice 'Precio Unitario', unitsinstock Pzas,
(unitprice*unitsinstock)*1.30 - (unitprice*unitsinstock) Utilidad,
(unitprice*unitsinstock)*1.30*8/100 Pérdida
from products;

/*CONSULTA QUE MUESTRA EL REMATE DEL TOTAL DE LOS PRODUCTOS SACRIFICANDO LA UTILIDAD (30%) AL 50% Y EN UNA SOLA CIFRA INDIQUE EL MONTO*/

use northwind;
select*from products;
select sum((unitprice*unitsinstock)*(.30)*(.5)) Sacrificio
from products;

/****************************VALIDACION GENERAL************************/

select sum(unitprice*unitsinstock)*.3*.5 Lista
from products;

/*********CONSULTA QUE MUESTRE EL TOTAL DE PEDIDOS CON MAX Y PROMEDIOS - PROD. 12*********/

select*from order_details;
select count(*) as 'Detalles de Compra',
sum(quantity) as 'Suma de las Piezas',
min(unitprice) as 'Precio Mínimo',
max(unitprice) as 'Precio Máximo',
avg(quantity) as 'Promedio de las Piezas',
sum(unitprice*quantity) as 'Importe Bruto'
	from order_details
		where
			productid=12;

/********************************************UNIÓN DE TABLAS******************************/

/*Existen dos sintaxis para unir las tablas
a) Usando 'Where': Se escriben en la clásula 'from' los nombres de las tablas que se van a unir separados con ',' y se usa la 
   cláusula 'where' para establecer el criterio de igualdad para la unión de los datos contenidos en las columnas de conexión.

Pudiera suceder que existan nombre duplicados de columnas en las tablas que se van a unir lo que provoca un error de ambigüedad 
en dichos nombres. Lo anterior se resuelve agregando el nombre de la tabla antes del nombre de la columna y separándolos con un '.'
*/

/***Ejemplo: CONSULTA QUE MUESTRE UN CATÁLOGO DE PRODUCTOS QUE INCLUYA EL NOMBRE DE LA CATEGORÍA***/

select productid Clave, productname Descripción,
	   products.categoryid Categoría, categoryname Nombre
       from products, categories
			where
            products.categoryid=categories.categoryid
            order by categoryname;

/*********CONSULTA EXTENDIDA CON PROVEEDORES****************/            

select productid Clave, productname Descripción,
	   products.categoryid Categoría, categoryname Nombre,
       products.supplierid proveedor, companyname Proveedor
       from products, categories, suppliers
			where
            products.categoryid=categories.categoryid
            and
            products.supplierid=suppliers.supplierid
            and
            categories.categoryid in (5,7);

/*******DESARROLLE LA SIGUIENTE CONSULTA (Pedido,Cliente,Nombre,Vendedor,Nombre********/

select*from orders;

select orderid Pedido,
	   customers.customerid Cliente, companyname Nombre,
       employees.employeedid Vendedor, firstname Nombre,
			from orders, customers, employees
            where
            orders.customerid=customers.customerid
			and
			orders.employeeid=employees.employeeid;           

/**************USO DE ALIAS EN LOS NOMBRES DE LAS TABLAS*******************************/

/*El objetivo de usar 'alias' es reducir el código*/

select productid Clave, productname Descripción,
	   p.categoryid Categoría, categoryname Nombre,
       p.supplierid proveedor, companyname Proveedor
       from products p, categories c, suppliers s
			where
            p.categoryid=c.categoryid
            and
            p.supplierid=s.supplierid
            and
            c.categoryid in (5,7);
/*******************************CLASE DEL: 02/06/2018*********************************/

/*b) USANDO INNER JOIN: Lo que cambia en esta sintaxis es que en la cláusula "from" sólo se escribe
el nombre de la tabla principal y se usa "Inner Join" para cada una de las tablas que se van a unir,
el "criterio de igualdad" de la unión es idéntico al que se usó en el "Where", sólo hay que declarar-
lo usando la palabra clave "On"*/

/*************************************************************************************/

use northwind;

/************************CONSULTA CON INNER JOIN***************************************/

select productid Clave, productname Descripción,
P.categoryid Categoría, categoryname Nombre
	from products P
    inner join categories C
    on
    P.categoryid=C.categoryid;
    
/***************************AGREGANDO "SUPPLIER"**************************************/    

select productid Clave, productname Descripción,
P.categoryid Categoría, categoryname Nombre,
P.supplierid Proveedor, companyname Nombre
	from products P
    inner join categories C
    on
    P.categoryid=C.categoryid
    inner join suppliers S
    on
    P.supplierid=S.supplierid;
    
/*******************AGREGANDO "SUPPLIER Y FILTRO DE CATEGORÍAS"****************************/    

select productid Clave, productname Descripción,
P.categoryid Categoría, categoryname Nombre,
P.supplierid Proveedor, companyname Nombre
	from products P
    inner join categories C
    on
    P.categoryid=C.categoryid
    inner join suppliers S
    on
    P.supplierid=S.supplierid
    where
    P.categoryid in (1,3);

/******REALIZA LAS CONSULTAS VISTAS AL INICIO DEL TEMA CON LA CLÁUSULA INNER JOIN***********/    
/*CONSULTA EXTENDIDA CON PROVEEDORES*/            

select productid Clave, productname Descripción,
	   P.categoryid Categoría, categoryname Nombre,
       P.supplierid proveedor, companyname Proveedor
       from products P
	   inner join categories C
       on
       P.categoryid=C.categoryid
       inner join suppliers S
       on
       P.categoryid=S.supplierid;

/*CONSULTA (Pedido,Cliente,Nombre,Vendedor,Nombre*/

select orderid 'Clave de Pedido', customerid Cliente, employeeid Empleado,
O.orderdate Fecha
from orders O
inner join customers C
on
O.customerid=C.customerid
inner join employees E
on
O.customerid=E.employeedid;

/*CONCLUSIÓN: El uso de where se recomienda cuando son pocas filas y el inner join cuando ya son grandes
volúmenes de filas*/

/*********************************CONSULTAS AGRUPADAS*************************************/

/*CLÁUSULA GROUP BY*/

/*Estas consultas llamadas también de "tipo resumen" o ejecutivas muestran resultados consolidados,
es decir, son totales agrupados por una determinada columna. 

La cláusula "Group By" se utiliza conjuntamente con las funciones de agregado para la obtención de
los totales. 

Ejemplo:

select clasif, count(*) Total
from noticias
group by clasif; */

/*DESARROLLE UNA CONSULTA QUE MUESTRE CUÁNTOS PRODUCTOS EXISTEN POR CATEGORÍA*/

select categoryid Categoría,
	count(*) 'Total por Categoría'
	from products
	group by categoryid;

/*DESARROLLE UNA CONSULTA QUE MUESTRE CUÁNTOS PRODUCTOS EXISTEN POR CATEGORÍA AGREGANDO NOMBRE A LA CATEGORÍA*/

select P.categoryid Categoría, categoryname Nombre,
	count(*) Total
	from products P
    inner join categories C
	on 
    P.categoryid=C.categoryid
    group by C.categoryid;

/*DESARROLLE UNA CONSULTA QUE MUESTRE CUÁNTOS PRODUCTOS EXISTEN POR CATEGORÍA AGREGANDO 
NOMBRE A LA CATEGORÍA AGREGANDO EL IMPORTE A PRECIO DE LISTA*/
select*from products;
select P.categoryid Categoría, categoryname Nombre,
	count(*) Total, sum(unitsinstock) Piezas, sum(unitsinstock*unitprice) Importe
	from products P
    inner join categories C
	on 
    P.categoryid=C.categoryid
    group by C.categoryid;
    
/*DESARROLLE LA SIGUIENTE CONSULTA DONDE SE MUESTRE:
- Cliente,
- Nombre del Cliente,
- No. de Pedidos Hechos.
- Importe de los Pedidos Hechos.*/

/*SE QUEDA DE TAREA*/

select C.customerid as Cliente,
		companyname as 'Nombre del Cliente',
        count(O.orderid) as 'Total de Pedidos',
        sum(unitprice*quantity) Importe
        from orders O
        inner join customers C
        on
        C.customerid=O.orderid
        group by C.customerid;
        
/*DESARROLLE LA SIGUIENTE CONSULTA DONDE SE MUESTREN LAS CAT CON MAS DE 10 PROD*/

select P.categoryid Categoría, categoryname Nombre,
	count(*) Total, sum(unitsinstock) Piezas, sum(unitsinstock*unitprice) Importe
	from products P
    inner join categories C
	on 
    P.categoryid=C.categoryid
    group by C.categoryid
    having count(*)>10;

/*Clásula "Having" Desarrolla una subconsulta a fin de obtener los valores agrupados para poder
compararlos contra el valor del filtro*/

select P.categoryid Categoría, categoryname Nombre,
	count(*) Total, sum(unitsinstock) Piezas, sum(unitsinstock*unitprice) Importe
	from products P
    inner join categories C
	on 
    P.categoryid=C.categoryid
    where P.categoryid<3
    group by C.categoryid
    having count(*)>10;

/*DESARROLLE LA SIGUIENTE CONSULTA EN PRODUCTOS DONDE SE MUESTRE:
- Nombre de la Categoría,
- Total de Productos,
- Importe entre 10,000 y 18,000
*/

select P.categoryid as Número,
	categoryname as Nombre,
    count(*) as 'Total de Productos',
    sum(unitprice*unitsinstock) as Importe,
    sum(unitsinstock) as 'Total de Piezas'
    from products P
    inner join categories C
    on
    P.categoryid=C.categoryid
    group by P.categoryid
    having count(*)>10
    and
    sum(unitprice*unitsinstock) between 10000 and 18000;
    
/*Desarrolle la consulta de ventas por vendedor
- Vendedores
- Nombre
- No. Ventas (Pedidos)
- Importe <5000*/

select employeeid as Vendedor,
	firstname as Nombre,
    lastname as Apellido
        from employees;
    
/*******************CLASE DEL 09/06/2018*******************************/

use northwind;

/*CONSULTAS AVANZADAS (ADVANCED QUERIES*/

/*Se considera así cuando la ejecución incluye más de un select. Como hemos observado,
el "result set" se parece a una "tabla"

A partir del segundo select en el código se llaman "Subconsultas" y podemos decir que una subcon-
sulta es un select anidado en otro select y es requisito sintáctico escribir la subconsulta entre
paréntesis

Una subconsulta puede usarse para obtener valores que son usados para el filtro de la consulta externa
o para simular un "Self Join" (unión a la misma tabla)*/

/*Ejemplo: Suponga que no conoce la clave del producto "chang" y le solicitan una consulta que muestre
en qué reglones de los pedidos aparece este producto */

select*from order_details;

/***************************Ejercicio***********************************************/

select orderid Pedido, productid Clave
from order_details OD
	where productid=(select productid from products
		where productname='chang');

/*******************Ejercicio agregando descripción con inner join******************/

select orderid Pedido, OD.productid Clave,
		P.productname Descripción
from order_details OD
	inner join products P
    on
    P.productid=OD.productid
	where OD.productid=(select productid from products
		where productname='chang');
        
/************Ejercicio agregando descripción con inner join y producto "chai"**********/

select*from products;

select orderid Pedido, OD.productid Clave,
		P.productname Descripción
from order_details OD
	inner join products P
    on
    P.productid=OD.productid
	where OD.productid=(select productid from products
		where productname='chang')
        or
        (select productid from products
        where productname='Chai')
        order by clave;
        
/*********************************MÉTODO 2******************************************/
select orderid Pedido, OD.productid Clave,
		P.productname Descripción
from order_details OD
	inner join products P
    on
    P.productid=OD.productid
	where OD.productid=(select productid from products
		where productname='chang' or productname="Chai");
        
/********************************MÉTODO 3******************************************/

select orderid Pedido, OD.productid Clave,
		P.productname Descripción
from order_details OD
	inner join products P
    on
    P.productid=OD.productid
	where OD.productid in (select productid from products
		where productname in ('chang', 'chai'))
    order by clave;
    
select*from products;
    
/***************************VERIFICANDO EXISTENCIAS************************************/

select orderid Pedido, OD.productid Clave,
		P.productname Descripción
from order_details OD
	inner join products P
    on
    P.productid=OD.productid
	where OD.productid in (select productid from products
		where productname in ('chang', 'chai') and unitsinstock>30)
    order by clave;

/*Ejemplo 2: Consulta que muestre los clientes que no han comprado

Aplicando la Teoría de Conjuntos*/

select customerid Clave, companyname Nombre
from customers C
where customerid not in
(select customerid from orders);

/*Ejemplo 3: Consulta que muestre los clientes que han comprado*/

select customerid Clave, companyname Nombre
from customers C
where customerid in
(select customerid from orders);

/*Ejemplo 4: Consulta que muestre los vendedores que sí han colocado cuando menos un pedido 
(Vendedor y Nombre*/

select*from orders;

select O.employeeid Vendedor,
	   concat(firstname,' ',lastname) Nombre
	from orders O
	inner join employees E
    on
    E.employeeid=O.employeeid;

/*Consulta que muestre qué productos se vendieron arriba del promedio de precio de lista
Clave, descripción y precio vendido*/

select*from order_details;

select avg(unitprice) 'Precio Promedio'
from products;

/**********************************************************************/

select orderid Clave, unitprice Precio
from order_details
where unitprice>(select avg(unitprice)from products)
order by unitprice;

/*************************REALIZANDO EJERCICIO EN CLASE*****************************/
select count(*) from
(select P.productid Clave, OD.unitprice Precio
from order_details OD
inner join products P
on
OD.productid=P.productid
where OD.unitprice>(select avg(unitprice) from products)
order by OD.unitprice) S;

use northwind;

/*Consulta que muestre qué productos se vendieron con el precio de lista más caro y que fueron más de 10 pzas*/

select*from products;

select max(unitprice)
from products;

select avg(unitprice)
from products;

/******************************************************************************************/

select 
	   OD.orderid as Pedido,
	   OD.productid as 'Clave de Producto',
	   productname as 'Nombre del Producto',
       OD.quantity as 'Número de Piezas',
       P.unitprice Precio
       from order_details OD
inner join products P
on
OD.productid=P.productid
where OD.unitprice=(select max(unitprice) from products) and quantity>10;

/**************************Ejemplo con "Self Join"****************************/

/*Consulta que muestre los siguientes campos

- Clave de Empleado.
- Nombre.
- Jefe.
- Nombre Jefe. */

select*from employees;

/****************************PRIMER MODO*****************************************/

select clave, nombre, Jefe, firstname 'Nombre_Jefe'
from
(select 
	   employeeid as Clave,
       concat(firstname,' ',lastname) as Nombre,
       reportsto as Jefe
	   from employees) as Sub
       inner join employees E
       on
       Sub.Jefe=E.employeeid;

/****************************SEGUNDO MODO*****************************************/

select 
       E1.employeeid Clave, 
       E1.firstname Nombre, 
       E1.reportsto Jefe,
       E2.firstname
       from employees E1
       inner join employees E2
       on
       E1.reportsto=E2.employeeid;
       
