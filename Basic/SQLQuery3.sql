--CREATE DATABASE Aerolineas

/*comentarios de multiples lineas*/
USE Aerolineas
CREATE TABLE aerolinea(
	--campo tipodedato incremental nulo primaria
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	telefono VARCHAR(30) NOT NULL,
	clave VARCHAR(30) NOT NULL,
	direccion VARCHAR(30) NOT NULL
)

CREATE TABLE persona(
	--campo tipodedato incremental nulo primaria
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	telefono VARCHAR(30) NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	nacimiento DATETIME NOT NULL
)

CREATE TABLE avion(
	--campo tipodedato incremental nulo primaria
	matricula INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	tipo VARCHAR(30)NOT NULL,
	nasientos INT NOT NULL,
	FECHAFABRICACION DATETIME NOT NULL,
	IDaerolinea INT NOT NULL FOREIGN KEY REFERENCES aerolinea(id)
	
)

CREATE TABLE empleado(
	--campo tipodedato incremental nulo primaria
	nempleado INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	tipo VARCHAR(30)NOT NULL,
	idAerolinea INT NOT NULL FOREIGN KEY REFERENCES aerolinea(id),
	idPersona INT NOT NULL FOREIGN KEY REFERENCES persona(id)
	
)

CREATE TABLE categoria(
	--campo tipodedato incremental nulo primaria
	id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	descripcion VARCHAR(30) NOT NULL
)

CREATE TABLE cliente(
	--campo tipodedato incremental nulo primaria
	ncliente INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idCategoria INT NOT NULL FOREIGN KEY REFERENCES categoria(id),
	idPersona INT NOT NULL FOREIGN KEY REFERENCES persona(id)
	
)


CREATE TABLE aerolineacliente(
	--campo tipodedato incremental nulo primaria
	ncliente INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idaerolinea INT FOREIGN KEY REFERENCES aerolinea(id),
	idcliente INT FOREIGN KEY REFERENCES cliente(ncliente)
	
)