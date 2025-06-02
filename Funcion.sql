USE `prueba`;
DROP function IF EXISTS `Valor_Parqueo`;


DELIMITER $$
USE `prueba`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Valor_Parqueo`(Hora_Entrada TIMESTAMP,Tipo_Parqueadero INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE Horas_Estadia INT;
    DECLARE Hora DECIMAL(10,2);
    DECLARE Dia DECIMAL(10,2);
    DECLARE Mes DECIMAL(10,2);
    DECLARE Total DECIMAL(10,2)DEFAULT 0;
    
	# Tarifas
    SELECT Valor_Hora, Valor_Dia, Valor_Mes 
    INTO Hora, Dia, Mes
    FROM Tip_Parq 
    WHERE Id_Tip_Parq = Tipo_Parqueadero;
    
    #Horas de estadía
    SET Horas_Estadia = TIMESTAMPDIFF(MINUTE, Hora_Entrada,NOW());
    
    # Valor según el tiempo
    IF Horas_Estadia >= 720 THEN
        SET Total = Mes * FLOOR(Horas_Estadia / 720);
        SET Horas_Estadia = Horas_Estadia % 720;
    END IF;
    
    IF Horas_Estadia >= 24 THEN 
        SET Total = Total + (Dia * FLOOR(Horas_Estadia / 24));
        SET Horas_Estadia = Horas_Estadia % 24;
    END IF;

    # Horas restantes
    SET Total = Total + (Hora * Horas_Estadia);
    
    RETURN Total;
END$$

DELIMITER ;
;

/*Espacio_Disponible*/

USE `prueba`;
DROP function IF EXISTS `Espacio_Disponible`;

DELIMITER $$
USE `prueba`$$
CREATE FUNCTION `Espacio_Disponible` (P_Id_Parqueadero INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE Ocupados INT;
    DECLARE Maximo INT;
    
    SELECT COUNT(*) INTO Ocupados FROM Lugar_Parqueadero
    WHERE Id_Parq = P_Id_Parqueadero AND Estado ="Ocupado";
    
    SELECT capacidadTol INTO Maximo FROM Parqueadero 
    WHERE Id_Parq = P_Id_Parqueadero;
    
RETURN (Ocupados < Maximo);
END$$

DELIMITER ;
