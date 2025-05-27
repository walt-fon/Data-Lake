-- Explicación
-- MERGE ... AS target: Indica que vamos a modificar esta tabla (DIM_Meses), y le damos el alias target.
-- USING: Define los datos que queremos comparar con la tabla destino.
-- Aquí usamos VALUES para crear una tabla en memoria (temporal) llamada source, con las columnas NomMes y NomCortoMes.
-- El ON: 
-- Esta es la condición de coincidencia (match).
-- Compara cada fila del source con las filas existentes en target (la tabla real).
-- Si ya existe una fila con el mismo NomMes, se considera que "coincide" y no se hace nada.
-- El WHEN:
-- Si no hay coincidencia (es decir, ese día no existe en la tabla), se ejecuta esta parte.
-- Inserta el día y su abreviatura en la tabla.
MERGE dbo.DIM_Meses AS target
USING (VALUES
	('Enero', 'ENE'),
	('Febrero', 'FEB'),
	('Marzo', 'MAR'),
	('Abril', 'ABR'),
	('Mayo', 'MAY'),
	('Junio', 'JUN'),
	('Julio', 'JUL'),
	('Agosto', 'AGO'),
	('Septiembre', 'SEP'),
	('Octubre', 'OCT'),
	('Noviembre', 'NOV'),
	('Diciembre', 'DIC')
) AS source (NomMes, NomCortoMes)
ON target.NomMes = source.NomMes
WHEN NOT MATCHED THEN
    INSERT (NomMes, NomCortoMes)
    VALUES (source.NomMes, source.NomCortoMes);