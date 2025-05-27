INSERT INTO DataWareHouse.dbo.FAC_Homicidios 
(FechaHecho, CodMpio, IdZona, IdSexo, Cantidad)
SELECT FECHA_HECHO AS FechaHecho
	, COD_MUNI AS CodMpio
	, (SELECT IdZona FROM DataWareHouse.dbo.DIM_Zonas WHERE NomZona = H.ZONA) AS IdZona
	, (SELECT IdSexo FROM DataWareHouse.dbo.DIM_Sexos WHERE NomSexo = H.SEXO) AS IdSexo
	, CANTIDAD AS Cantidad
FROM DataLake.dbo.DL_Homicidios AS H