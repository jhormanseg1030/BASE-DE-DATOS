DROP DATABASE IF EXISTS prueba;
CREATE DATABASE prueba;
USE prueba;

CREATE TABLE Roles(
	id_Rol INT (10) PRIMARY KEY,
    TipRol VARCHAR (20) NOT NULL
);
CREATE TABLE Usuarios(
	Id_Usu INT(10) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    email VARCHAR(100)NOT NULL ,
    apell VARCHAR(50) NOT NULL,
    num1 VARCHAR(15) NOT NULL,
    num2 VARCHAR(15),
    Id_Direcc INT (10),
    Id_Veh INT(10)
);
CREATE TABLE Direcciones(
	Id_Direcc INT (10) PRIMARY KEY,
    Id_Vias INT (10),
	numero VARCHAR (10),
	comple VARCHAR (50)
);
CREATE TABLE Vias(
	Id_Vias INT (10) PRIMARY KEY,
    tipoVia VARCHAR (10),
    Id_Barrio INT(10)
);
CREATE TABLE Barrio(
	Id_Barrio INT (10) PRIMARY KEY,
    nomBarrio VARCHAR (50),
    Id_Cuidad INT (10)
);
CREATE TABLE Cuidad(
	Id_Cuidad INT (10) PRIMARY KEY,
    nomCui VARCHAR (50)
);
CREATE TABLE Vehiculo(
	Id_Veh INT (10) PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(20) NOT NULL,
    Id_TipVeh INT (10),
    Id_Ticket INT(10),
    Id_Color INT (10)
);
CREATE TABLE Tipo_Vehiculo(
    Id_TipoVeh INT(10) PRIMARY KEY,
    tipoVeh VARCHAR (50) NOT NULL,
	Valor_Hora DECIMAL (10,2),
	Valor_Dia DECIMAL (10,2),
	Valor_Mes DECIMAL (10,2)
);

CREATE TABLE Color(
	Id_Color INT (10)PRIMARY KEY,
    Tipo_color VARCHAR (20) NOT NULL
);

CREATE TABLE Parqueadero(
   Id_Parq INT(10) PRIMARY KEY,
   nomPar VARCHAR(50),
   capacidadTol INT(10) NOT NULL
);
CREATE TABLE Lugar_Parqueadero(
	Id_Espacio INT(10) PRIMARY KEY,
    cod VARCHAR (10) UNIQUE,
    Id_Estado INT (10),
    Id_Parq INT (10)
);
CREATE TABLE Estado_Parqueadero(
	Id_Estado INT (10) PRIMARY KEY,
    TipoEsta VARCHAR (20) NOT NULL
);
CREATE TABLE Usuarios_Parqueadero(
	Id_Usu INT (10),
    Id_Parq INT (10)
);

CREATE TABLE Ticket (
	Id_Ticket INT(10) PRIMARY KEY,
    Id_Pago INT (10),
    Observaciones INT(30),
    Id_Veh INT (10),
    horaEnt TIMESTAMP,
    horaSali DATETIME
);
CREATE TABLE Pago(
	Id_Pago INT(10) PRIMARY KEY,
	monto DECIMAL (10,2) NOT NULL,
    fecha_hora_tick DATETIME,
	fechPag TIMESTAMP NOT NULL,
    Id_Met INT (10)
);
CREATE TABLE Metodo_de_pago(
	Id_Met INT (10) PRIMARY KEY,
    tipoPag VARCHAR(20)
);
CREATE TABLE Usuarios_Roles(
	Id_Usu INT (10),
    Id_Rol INT (10)
);
ALTER TABLE Usuarios
ADD FOREIGN KEY (Id_Veh) REFERENCES Vehiculo(Id_Veh);

ALTER TABLE Usuarios
ADD FOREIGN KEY (Id_Direcc) REFERENCES Direcciones(Id_Direcc);

ALTER TABLE Direcciones
ADD FOREIGN KEY (Id_Vias) REFERENCES Vias(Id_Vias);

ALTER TABLE Vias
ADD FOREIGN KEY (Id_Barrio) REFERENCES Barrio(Id_Barrio);

ALTER TABLE Barrio
ADD FOREIGN KEY (Id_Cuidad) REFERENCES Cuidad(Id_Cuidad);

ALTER TABLE Lugar_Parqueadero
ADD FOREIGN KEY (Id_Estado) REFERENCES Estado_Parqueadero(Id_Estado);

ALTER TABLE Lugar_Parqueadero
ADD FOREIGN KEY (Id_Parq) REFERENCES Parqueadero(Id_Parq);

ALTER TABLE Usuarios_Parqueadero
ADD FOREIGN KEY (Id_Usu) REFERENCES Usuarios(Id_Usu);

ALTER TABLE Usuarios_Parqueadero
ADD FOREIGN KEY (Id_Parq) REFERENCES Parqueadero(Id_Parq);

ALTER TABLE Usuarios_Roles
ADD FOREIGN KEY (Id_Usu) REFERENCES Usuarios(Id_Usu);

ALTER TABLE Usuarios_Roles
ADD FOREIGN KEY (Id_Rol) REFERENCES Roles(Id_Rol);

ALTER TABLE Ticket
ADD FOREIGN KEY (Id_Pago) REFERENCES Pago(Id_Pago);

ALTER TABLE Ticket
ADD FOREIGN KEY (Id_Veh) REFERENCES Vehiculo(Id_Veh);

ALTER TABLE Pago
ADD FOREIGN KEY (Id_Met) REFERENCES Metodo_de_pago(Id_Met);

ALTER TABLE Vehiculo
ADD FOREIGN KEY (Id_Color)REFERENCES Color(Id_Color);


ALTER TABLE Ticket CHANGE COLUMN Observaciones Recomendaciones Varchar (30);
