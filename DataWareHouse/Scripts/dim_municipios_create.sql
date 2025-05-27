-- Explicación:
-- OBJECT_ID('dbo.DIM_Municipios', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Municipios', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Municipios (
		CodMpio int NOT NULL,
		CodDpto tinyint NOT NULL,	
		NomMpio nvarchar(30) NOT NULL,
		Latitud float NOT NULL,
		Longitud float NOT NULL,
		CONSTRAINT DIM_Municipios_PK PRIMARY KEY (CodMpio),
		CONSTRAINT DIM_Municipios_DIM_Departamentos_FK FOREIGN KEY (CodDpto) REFERENCES dbo.DIM_Departamentos(CodDpto)
	);
END;