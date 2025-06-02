DELIMITER //
CREATE TRIGGER BEFORE_Insert_Ticket
BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    DECLARE Espacio VARCHAR(20);
    
    -- 1. Obtener estado del espacio
    SELECT Estado INTO Espacio
    FROM Lugar_Parqueadero
    WHERE Id_Espacio = NEW.Id_Espacio;
    
    -- 2. Si ya está ocupado, cancelar inserción
    IF Espacio = 'Ocupado' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El espacio ya está ocupado.';
    END IF;
END //
DELIMITER ;