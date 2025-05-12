CREATE DEFINER=`root`@`localhost` PROCEDURE `Lugar_Parqueadero`(
	IN Id_Espacio int(10),
	IN cod varchar(10),
	IN Estado bit(1), 
	IN Id_Parq int(10),
	IN Id_Tip_Parq int(10)
)
BEGIN
	iNSERT INTO  Lugar_Parqueadero(Id_Espacio,cod,Estado,Id_Parq,Id_Tip_Parq)
	VALUES (Id_Espacio,cod,Estado,Id_Parq,Id_Tip_Parq);
END