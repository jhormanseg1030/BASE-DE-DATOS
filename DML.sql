
INSERT INTO Metodo_de_pago (Id_Met,tipoPag) VALUES (1,"pse"),(2,"tarjeta"),(3,"Efectivo");
INSERT INTO Parqueadero(Id_Parq,nomPar,capacidadTol) VALUES (1,"Parqueadero don jose","50");

INSERT INTO Roles(Id_Rol,TipRol) VALUES (1,"cliente"),(2,"Administrador");
INSERT INTO tipo_vehiculo(Id_TipoVeh,tipoVeh) VALUES (1,"Bicicleta"),(2,"Moto"),(3,"Carro"),(4,"Camion");
INSERT INTO Color(Id_Color,Tipo_Color) VALUES (1,"Amarillo"),(2,"Azul"),(3,"Rojo"),(4,"Blanco"),(5,"negro"),(6,"Gris"),(7,"Verde"),(8,"Plateado");
INSERT INTO Cuidad(Id_Cuidad,nomCui) VALUES (1,"Bogota"),(2,"Medellin"),(3,"Cali");
INSERT INTO Estado_Parqueadero(Id_Estado,TipoEsta) VALUES (1,"Activo"),(2,"Inactivo");

/*Tablas debiles*/

INSERT INTO Usuarios(Id_Usu,nom,Password,email,apell,num1,num2) VALUES (1,"Juan","123","juan@gmail.com","Lopez","3232332","4242424");
INSERT INTO Barrio(Id_Barrio,nomBarrio,Id_Cuidad) VALUES (1,"quirigua",2),(2,"Kennedy",1);
INSERT INTO Vias(Id_Vias,tipoVia,Id_Barrio) VALUES (1,"Calle",1),(2,"Carrera",1),(3,"Avenida",1),(4,"transver",1);
INSERT INTO Vehiculo(Id_Veh,placa,color,marca) VALUES (1,"GHJ345","Rojo","BMW");
INSERT INTO Ticket(Id_Ticket,Recomendaciones,horaEnt) VALUES (1,"Por favor no pierda su ticket","2025/03/14 12:30:00");
INSERT INTO usuarios_parqueadero (Id_Usu,Id_Parq) Values (1,1);
INSERT INTO Usuarios_Roles (Id_Usu,Id_Rol) Values (1,1);

SELECT * FROM Barrio;