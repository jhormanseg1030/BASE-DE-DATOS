CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios`(
	IN Id_Usu INT (10),
    IN nom VARCHAR (50),
    IN Password VARCHAR (50),
    IN email VARCHAR (100),
    IN apell VARCHAR (50),
    IN num1 VARCHAR (15),
    IN num2 VARCHAR (15),
    IN Id_Direcc INT (10)
)
BEGIN
	iNSERT INTO Usuarios (Id_Usu,nom,Password,email,apell,num1,num2,Id_Direcc)
	VALUES (Id_Usu,nom,Password,email,apell,num1,num2,Id_Direcc);
END