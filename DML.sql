/*Tablas fuertes*/

INSERT INTO Metodo_de_pago (Id_Met,tipoPag) VALUES (1,"pse"),(2,"tarjeta"),(3,"Efectivo");
INSERT INTO Parqueadero(Id_Parq,nomPar,capacidadTol) VALUES (1,"Parqueadero don jose","50");
INSERT INTO Roles(Id_Rol,TipRol) VALUES (1,"cliente"),(2,"Administrador");
INSERT INTO tipo_vehiculo(Id_TipoVeh,tipoVeh) VALUES (1,"Bicicleta"),(2,"Moto"),(3,"Carro"),(4,"Camion");
INSERT INTO Color(Id_Color,Tipo_Color) VALUES (1,"Amarillo"),(2,"Azul"),(3,"Rojo"),(4,"Blanco"),(5,"negro"),(6,"Gris"),(7,"Verde"),(8,"Plateado");
INSERT INTO Cuidad(Id_Cuidad,nomCui) VALUES (1,"Bogota"),(2,"Medellin"),(3,"Cali");
INSERT INTO Tip_Parq(Id_Tip_Parq,Nom,Valor_Hora,Valor_Dia,Valor_Mes) VALUES (1,"Pequeño","700","10000","25000"),(2,"Mediano","2500","18000","25000"),(3,"Grande","3500","20000","35000"),(4,"Muy Grande","4500","25000","40000");

/*Tablas debiles*/
INSERT INTO Usuarios_Roles (Id_Usu,Id_Rol) Values (1,1);


