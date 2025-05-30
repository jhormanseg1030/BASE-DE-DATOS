/*Barrio*/
USE `prueba`;
DROP procedure IF EXISTS `Barrio`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Barrio` (
	IN Id_Barrio INT,
    IN nomBarrio VARCHAR (50),
    IN Id_Cuidad INT
)
BEGIN
	INSERT INTO Barrio (Id_Barrio,nomBarrio,Id_Cuidad)
    VALUES (Id_Barrio,nomBarrio,Id_Cuidad);
END$$

DELIMITER ;

/*Vias*/

USE `prueba`;
DROP procedure IF EXISTS `Vias`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Vias` (
	IN Id_Vias INT,
	IN tipoVia VARCHAR (10),
    IN Id_Barrio INT
)
BEGIN
	INSERT INTO Vias (Id_Vias,tipoVia,Id_Barrio)
    VALUES (Id_Vias,tipoVia,Id_Barrio);
END$$

DELIMITER ;

/*Direcciones*/

USE `prueba`;
DROP procedure IF EXISTS `Direcciones`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Direcciones` (
	IN Id_Direcc INT,
    IN Id_Vias INT,
    IN numero VARCHAR (50),
    IN comple VARCHAR (50)
)
BEGIN
	INSERT INTO Direcciones (Id_Direcc,Id_Vias,numero,comple)
    VALUES (Id_Direcc,Id_Vias,numero,comple);
END$$

DELIMITER ;

/*Usuarios*/

USE `prueba`;
DROP procedure IF EXISTS `Usuarios`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Usuarios` (
	IN Id_Usu INT,
    IN nom VARCHAR (50),
    IN Password VARCHAR (50),
    IN email VARCHAR (50),
    IN apell VARCHAR (50),
    IN num1 VARCHAR (15),
    IN num2 VARCHAR (15),
	IN Id_Direcc INT 
)
BEGIN
	INSERT INTO Usuarios (Id_Usu,nom,Password,email,apell,num1,num2,Id_Direcc)
    VALUES (Id_Usu,nom,Password,email,apell,num1,num2,Id_Direcc);
END$$

DELIMITER ;

/*Vehiculo*/

USE `prueba`;
DROP procedure IF EXISTS `Vehiculo`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Vehiculo` (
	IN Id_Veh INT,
    IN placa VARCHAR (10),
    IN marca VARCHAR (20),
    IN Id_TipoVeh INT,
    IN Id_Color INT,
    IN Id_Usu INT
)
BEGIN
	INSERT INTO Vehiculo (Id_Veh,placa,marca,Id_TipoVeh,Id_Color,Id_Usu)
    VALUES (Id_Veh,placa,marca,Id_TipoVeh,Id_Color,Id_Usu);
END$$

DELIMITER ;

/*Lugar_parqueadero*/

USE `prueba`;
DROP procedure IF EXISTS `Lugar_parqueadero`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Lugar_parqueadero` (
	IN Id_Espacio INT,
    IN cod VARCHAR (10),
    IN Estado VARCHAR (20),
    IN Id_Parq INT,
    IN Id_Tip_Parq INT
)
BEGIN
	INSERT INTO Lugar_parqueadero (Id_Espacio,cod,Estado,Id_Parq,Id_Tip_Parq)
    VALUES (Id_Espacio,cod,Estado,Id_Parq,Id_Tip_Parq);
END$$

DELIMITER ;

/*Ticket*/
USE `prueba`;
DROP procedure IF EXISTS `Ticket`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Ticket` (
	IN Id_Ticket INT,
    IN Id_Met INT,
    IN Recomendaciones VARCHAR (30),
    IN Id_Veh INT,
    IN horaEnt TIMESTAMP,
    IN horaSali DATETIME,
    IN Id_Espacio INT
)
BEGIN
	INSERT INTO Ticket (Id_Ticket,Id_Met,Recomendaciones,Id_Veh,horaEnt,horaSali,Id_Espacio)
    VALUES (Id_Ticket,Id_Met,Recomendaciones,Id_Veh,horaEnt,horaSali,Id_Espacio);
END$$

DELIMITER ;




/*SALIDA DE VEHICULO*/

USE `prueba`;
DROP procedure IF EXISTS `Salida_Vehiculo`;

DELIMITER $$
USE `prueba`$$
CREATE PROCEDURE `Salida_Vehiculo` (
	IN P_Id_Ticket INT,
	IN P_Hora_Salida DATETIME,
    IN P_recomendaciones VARCHAR(30)
)
BEGIN
	DECLARE V_Id_Espacio INT;
    DECLARE V_Id_Tip_Parq INT;
    DECLARE V_Hora_Entrada TIMESTAMP;
    DECLARE V_Pagar DECIMAL (10,2);
    
    # Datos del ticket
    SELECT horaEnt, Id_Espacio INTO V_Hora_Entrada, V_Id_Espacio
    FROM Ticket WHERE Id_Ticket = P_Id_Ticket;

    
    #Tipo de parqueadero :3
	SELECT Id_Tip_Parq INTO V_Id_Tip_Parq
    FROM Lugar_Parqueadero
    WHERE Id_Espacio = V_Id_Espacio;
    
    #Calcular valor que esta en la funcion :3
	SET V_Pagar = Valor_Parqueo (V_Hora_Entrada, P_Hora_Salida, V_Id_Tip_Parq);
    
    # Actualizar ticket que es salida, recomendaciones, y valor
    UPDATE Ticket 
    SET HoraSali = P_Hora_Salida, Recomendaciones = P_Recomendaciones
    WHERE Id_Ticket = p_Id_Ticket;
    
    #Lo que se debe mostrar
	SELECT 
	P_Id_Ticket AS 'Ticket N°',
	V_Hora_Entrada AS 'Hora Entrada',
	P_Hora_Salida AS 'Hora Salida',
	V_Pagar AS 'Valor a Pagar',
	'Salida registrada correctamente' AS 'Mensaje';
    
END$$

DELIMITER ;

