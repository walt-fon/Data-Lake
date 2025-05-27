-- Explicación:
-- OBJECT_ID('dbo.DIM_Trimestres', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Trimestres', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Trimestres (
		Trimestre tinyint IDENTITY(1,1) NOT NULL,
		NomTrimestre nvarchar(15) NOT NULL,
		NomCortoTrimestre char(6) NOT NULL,
		CONSTRAINT DIM_Trimestres_PK PRIMARY KEY (Trimestre)
	);
END;