CREATE DEFINER=`root`@`localhost` PROCEDURE `Usuarios`(
	IN Id_Usu INT,
    IN nom VARCHAR (50),
    IN Password VARCHAR (50),
    IN email VARCHAR (100),
    IN apell VARCHAR (50),
    IN num1 VARCHAR (15),
    IN num2 VARCHAR (15)
)
BEGIN
	INSERT INTO Usuarios (Id_Usu,nom,Password,email,apell,num1,num2,Id_Direcc)
    VALUE (Id_Usu,nom,Password,email,apell,num1,num2,Id_Direcc);
END