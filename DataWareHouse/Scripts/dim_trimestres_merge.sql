-- Explicación
-- MERGE ... AS target: Indica que vamos a modificar esta tabla (DIM_Trimestres), y le damos el alias target.
-- USING: Define los datos que queremos comparar con la tabla destino.
-- Aquí usamos VALUES para crear una tabla en memoria (temporal) llamada source, con las columnas NomTrimestre y NomCortoTrimestre.
-- El ON: 
-- Esta es la condición de coincidencia (match).
-- Compara cada fila del source con las filas existentes en target (la tabla real).
-- Si ya existe una fila con el mismo NomTrimestre, se considera que "coincide" y no se hace nada.
-- El WHEN:
-- Si no hay coincidencia (es decir, ese día no existe en la tabla), se ejecuta esta parte.
-- Inserta el día y su abreviatura en la tabla.
MERGE dbo.DIM_Trimestres AS target
USING (VALUES
	('Trimestre 1', 'TRIM 1'),
	('Trimestre 2', 'TRIM 2'),
	('Trimestre 3', 'TRIM 3'),
	('Trimestre 4', 'TRIM 4')
) AS source (NomTrimestre, NomCortoTrimestre)
ON target.NomTrimestre = source.NomTrimestre
WHEN NOT MATCHED THEN
    INSERT (NomTrimestre, NomCortoTrimestre)
    VALUES (source.NomTrimestre, source.NomCortoTrimestre);