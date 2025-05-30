CALL Ticket(3, 'Cuide su ticket', 1, 1); 

SELECT * FROM Ticket WHERE Id_Ticket = LAST_INSERT_ID(); 

CALL Salida_Vehiculo(LAST_INSERT_ID(), 'Gracias por visitarnos'); 

SELECT * FROM Ticket WHERE Id_Ticket = LAST_INSERT_ID(); 

SELECT * FROM Lugar_Parqueadero WHERE Id_Espacio = 1; 




