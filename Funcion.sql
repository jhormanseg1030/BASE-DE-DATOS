
USE `prueba`;
DROP function IF EXISTS `prueba`.`Valor_Parqueo`;
;

DELIMITER $$
USE `prueba`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `Valor_Parqueo`(Hora_Entrada TIMESTAMP,Hora_Salida DATETIME,Tipo_Parqueadero INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE Horas_Estadia INT;
    DECLARE Hora DECIMAL(10,2);
    DECLARE Dia DECIMAL(10,2);
    DECLARE Mes DECIMAL(10,2);
    DECLARE Total DECIMAL(10,2);
    
	# Tarifas
    SELECT Valor_Hora, Valor_Dia, Valor_Mes 
    INTO Hora, Dia, Mes
    FROM Tip_Parq 
    WHERE Id_Tip_Parq = Tipo_Parqueadero;
    
    #Horas de estadía
    SET Horas_Estadia = TIMESTAMPDIFF(HOUR, Hora_Entrada, Hora_Salida);
    
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
