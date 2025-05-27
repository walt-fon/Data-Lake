-- Explicación:
-- OBJECT_ID('dbo.DIM_Meses', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Meses', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Meses (
		Mes tinyint IDENTITY(1,1) NOT NULL,
		NomMes nvarchar(10) NOT NULL,
		NomCortoMes char(3) NOT NULL,
		CONSTRAINT DIM_Meses_PK PRIMARY KEY (Mes)
	);
END;