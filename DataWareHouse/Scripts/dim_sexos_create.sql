-- Explicación:
-- OBJECT_ID('dbo.DIM_Sexos', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Sexos', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Sexos (
		IdSexo tinyint IDENTITY(1,1) NOT NULL,
		NomSexo nvarchar(20) NOT NULL,
		CONSTRAINT DIM_Sexos_PK PRIMARY KEY (IdSexo)
	);
END;