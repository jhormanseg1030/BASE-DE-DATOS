DELIMITER //
CREATE TRIGGER Actualizar
AFTER UPDATE ON Ticket 
FOR EACH ROW 
BEGIN
	IF NEW.horaSali IS NOT NULL AND (OLD.horaSali IS NULL OR NEW.horaSali <> OLD.horaSali) THEN 
		UPDATE Lugar_Parqueadero 
		SET Estado = "Disponible" 
		WHERE Id_Espacio = NEW.Id_Espacio;
    END IF;
END //

DELIMITER ;
