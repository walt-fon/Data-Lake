INSERT INTO DataWareHouse.dbo.DIM_Departamentos
(CodDpto, NomDpto, Latitud, Longitud)
SELECT COD_DPTO, NOM_DPTO, LATITUD, LONGITUD
FROM DataLake.dbo.DL_Departamentos
