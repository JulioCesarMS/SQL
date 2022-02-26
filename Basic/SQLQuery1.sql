--CREATE DATABASE Escuela
/*comentarios de multiples lineas*/
USE escuela
CREATE TABLE Departamento1(
	--campo tipodedato incremental nulo primaria
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL

)