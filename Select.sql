
 # estado actual 
SELECT * FROM Lugar_Parqueadero WHERE Id_Espacio = 1;

#trigger
UPDATE Ticket SET horaSali = NOW() WHERE Id_Ticket = 1;

#Crea ticket 
INSERT INTO Ticket (Id_Ticket, Id_Met, Id_Veh, horaEnt, Id_Espacio) 
VALUES (2, 1, 1, '2024-05-16 09:00:00', 1);

# llamar procedimiento
CALL Salida_Vehiculo(2, '2024-05-16 14:00:00', 'Revisar luces');

#Ticket actualizado
SELECT * FROM Ticket WHERE Id_Ticket = 2;

#Espacio liberado
SELECT * FROM Lugar_Parqueadero WHERE Id_Espacio = 1;