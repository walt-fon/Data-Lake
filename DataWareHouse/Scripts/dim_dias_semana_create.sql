-- Explicación:
-- OBJECT_ID('dbo.DIM_Dias_Semana', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Dias_Semana', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Dias_Semana (
		DiaSemana tinyint IDENTITY(1,1) NOT NULL,
		NomDiaSemana nvarchar(10) NOT NULL,
		NomCortoDiaSemana char(3) NOT NULL,
		CONSTRAINT DIM_Dias_Semana_PK PRIMARY KEY (DiaSemana)
	);
END;
