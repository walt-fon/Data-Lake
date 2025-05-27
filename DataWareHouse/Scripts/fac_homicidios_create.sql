-- Explicación:
-- OBJECT_ID('dbo.FAC_Homicidios', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.FAC_Homicidios', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.FAC_Homicidios (
		IdHomicidio int NOT NULL,
		FechaHecho date NOT NULL,
		CodMpio int NOT NULL,
		IdZona tinyint NOT NULL,
		IdSexo tinyint NOT NULL,
		Cantidad tinyint NOT NULL,
		CONSTRAINT FAC_Homicidios_PK PRIMARY KEY (IdHomicidio),
		CONSTRAINT FAC_Homicidios_DIM_Fechas_FK FOREIGN KEY (FechaHecho) REFERENCES DataWareHouse.dbo.DIM_Fechas(FechaHecho),
		CONSTRAINT FAC_Homicidios_DIM_Municipios_FK FOREIGN KEY (CodMpio) REFERENCES DataWareHouse.dbo.DIM_Municipios(CodMpio),
		CONSTRAINT FAC_Homicidios_DIM_Sexos_FK FOREIGN KEY (IdSexo) REFERENCES DataWareHouse.dbo.DIM_Sexos(IdSexo),
		CONSTRAINT FAC_Homicidios_DIM_Zonas_FK FOREIGN KEY (IdZona) REFERENCES DataWareHouse.dbo.DIM_Zonas(IdZona)
	);
END;