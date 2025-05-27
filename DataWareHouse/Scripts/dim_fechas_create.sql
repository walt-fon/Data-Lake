-- Explicación:
-- OBJECT_ID('dbo.DIM_Fechas', 'U'): Verifica si existe un objeto de tipo tabla ('U' para "User Table") con ese nombre.
-- Si OBJECT_ID devuelve NULL, la tabla no existe, por lo que se ejecuta la instrucción CREATE TABLE.

IF OBJECT_ID('dbo.DIM_Fechas', 'U') IS NULL
BEGIN
	CREATE TABLE dbo.DIM_Fechas (
		FechaHecho date NOT NULL,
		Annio int NOT NULL,
		Mes tinyint NOT NULL,
		Dia tinyint NOT NULL,
		DiaSemana tinyint NOT NULL,
		Semana tinyint NOT NULL,
		Trimestre tinyint NOT NULL,
		CONSTRAINT DIM_Fechas_PK PRIMARY KEY (FechaHecho),
		CONSTRAINT DIM_Fechas_DIM_Dias_Semana_FK FOREIGN KEY (DiaSemana) REFERENCES DataWareHouse.dbo.DIM_Dias_Semana(DiaSemana),
		CONSTRAINT DIM_Fechas_DIM_Meses_FK FOREIGN KEY (Mes) REFERENCES DataWareHouse.dbo.DIM_Meses(Mes),
		CONSTRAINT DIM_Fechas_DIM_Trimestres_FK FOREIGN KEY (Trimestre) REFERENCES DataWareHouse.dbo.DIM_Trimestres(Trimestre)
	);
END;