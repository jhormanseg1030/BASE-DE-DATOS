CALL Barrio (1,"quirigua",2);
CALL Barrio (2,"Kennedy",1);
CALL Vias (1,"Calle",1);
CALL Vias (2,"Carrera",1);
CALL Vias (3,"Avenida",1);
CALL Vias (4,"transver",1);
CALL Direcciones (1,1,"79-48","Sur,88-50");
CALL Usuarios (1,"Juan","123","juan@gmail.com","Lopez","3232332","4242424",1);
CALL Vehiculo (1,"GHJ345","BMW",1,6,1);
CALL Lugar_parqueadero (1,"1-1","Activo",1,3);
CALL Ticket (1,2,"Por favor no pierda su ticket",1,"2025/03/14 10:00:00","2025/03/14 5:30:00",1); 


CALL Salida_Vehiculo(1, NOW(), 'Gracias por su visita');	