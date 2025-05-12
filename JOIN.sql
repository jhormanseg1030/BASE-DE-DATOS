/*Parqueo*/
SELECT p.nomPar,p.capacidadTol FROM Parqueadero as p
JOIN Lugar_Parqueadero as l on p.Id_Parq= l.Id_Parq;

SELECT t.nom,t.Valor_Hora,t.Valor_Dia,t.Valor_Mes FROM tip_parq as t
JOIN Lugar_Parqueadero as l on l.Id_Tip_Parq = t.Id_Tip_Parq ;

SELECT t.nom FROM  lugar_parqueadero as l
RIGHT JOIN  tip_Parq as t on l.Id_Tip_Parq = t.Id_Tip_Parq
where  l.Id_Tip_Parq is null;

 /* left--
 
 Usuarios*/
SELECT u.nom FROM Usuarios as u
JOIN Direcciones as d on u.Id_Direcc= d.Id_Direcc;

 /* Dirreciones*/
SELECT d.Id_Vias,d.numero,d.comple FROM Direcciones as d
JOIN Vias as v on d.Id_Vias= v.Id_Vias;

SELECT v.Id_Vias,v.tipoVia FROM Vias as v
JOIN Barrio as b on v.Id_Barrio= b.Id_Barrio;

SELECT v.tipoVia FROM  Direcciones as d
RIGHT JOIN  Vias as v on v.Id_Vias = d.Id_Vias
where  d.Id_Vias is null;