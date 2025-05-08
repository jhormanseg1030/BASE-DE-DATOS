/*Tablas fuertes*/

INSERT INTO Metodo_de_pago (Id_Met,tipoPag) VALUES (1,"pse"),(2,"tarjeta"),(3,"Efectivo");
INSERT INTO Parqueadero(Id_Parq,nomPar,capacidadTol) VALUES (1,"Parqueadero don jose","50");
INSERT INTO Roles(Id_Rol,TipRol) VALUES (1,"cliente"),(2,"Administrador");
INSERT INTO tipo_vehiculo(Id_TipoVeh,tipoVeh,Valor_Hora,Valor_Dia,Valor_Mes) VALUES (1,"Bicicleta","700","10000","25000"),(2,"Moto","2500","18000","25000"),(3,"Carro","3500","20000","35000"),(4,"Camion","4500","25000","40000");
INSERT INTO Color(Id_Color,Tipo_Color) VALUES (1,"Amarillo"),(2,"Azul"),(3,"Rojo"),(4,"Blanco"),(5,"negro"),(6,"Gris"),(7,"Verde"),(8,"Plateado");
INSERT INTO Cuidad(Id_Cuidad,nomCui) VALUES (1,"Bogota"),(2,"Medellin"),(3,"Cali");
INSERT INTO Estado_Parqueadero(Id_Estado,TipoEsta) VALUES (1,"Activo"),(2,"Inactivo");

/*Tablas debiles*/

INSERT INTO Usuarios(Id_Usu,nom,Password,email,apell,num1,num2) VALUES (1,"Juan","123","juan@gmail.com","Lopez","3232332","4242424");
INSERT INTO Barrio(Id_Barrio,nomBarrio,Id_Cuidad) VALUES (1,"quirigua",2),(2,"Kennedy",1);
INSERT INTO Vias(Id_Vias,tipoVia,Id_Barrio) VALUES (1,"Calle",1),(2,"Carrera",1),(3,"Avenida",1),(4,"transver",1);
INSERT INTO Vehiculo(Id_Veh,placa,marca,Id_TipVeh,Id_Ticket,Id_color) VALUES (1,"GHJ345","BMW",1,1,6);
INSERT INTO Ticket(Id_Ticket,Recomendaciones,horaEnt,horaSali,Id_Veh) VALUES (1,"Por favor no pierda su ticket","2025/03/14 12:30:00","2025/03/14 5:30:00",1);
INSERT INTO Direcciones(Id_Direcc,numero,comple,Id_Vias) VALUES (1,"79-48","Sur,88-50",1);
INSERT INTO usuarios_parqueadero (Id_Usu,Id_Parq) Values (1,1);
INSERT INTO Usuarios_Roles (Id_Usu,Id_Rol) Values (1,1);
INSERT INTO Lugar_parqueadero (Id_Espacio,cod,Id_Estado,Id_Parq) Values (1,"1-1",1,1);
