CREATE TABLE Datalake.dbo.DL_Municipios (
	COD_DPTO tinyint NULL,
	NOM_DPTO nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	COD_MPIO int NULL,
	NOM_MPIO nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	TIPO nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	LATITUD float NULL,
	LONGITUD float NULL,
	[Geo Municipio] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);