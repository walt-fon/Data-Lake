--- Explicación:
-- OBJECT_ID('dbo.DIM_Departamentos', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Departamentos', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Departamentos (
		CodDpto tinyint NOT NULL,
		NomDpto nvarchar(60) NOT NULL,
		Latitud float NOT NULL,
		Longitud float NOT NULL,
		CONSTRAINT DIM_Departamentos_PK PRIMARY KEY (CodDpto)
	);
END;