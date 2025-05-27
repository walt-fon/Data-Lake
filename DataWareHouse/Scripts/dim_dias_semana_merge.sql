-- Explicación
-- MERGE ... AS target: Indica que vamos a modificar esta tabla (DIM_Dias_Semana), y le damos el alias target.
-- USING: Define los datos que queremos comparar con la tabla destino.
-- Aquí usamos VALUES para crear una tabla en memoria (temporal) llamada source, con las columnas NomDiaSemana y NomCortoDiaSemana.
-- El ON: 
-- Esta es la condición de coincidencia (match).
-- Compara cada fila del source con las filas existentes en target (la tabla real).
-- Si ya existe una fila con el mismo NomDiaSemana, se considera que "coincide" y no se hace nada.
-- El WHEN:
-- Si no hay coincidencia (es decir, ese día no existe en la tabla), se ejecuta esta parte.
-- Inserta el día y su abreviatura en la tabla.
MERGE dbo.DIM_Dias_Semana AS target
USING (VALUES
    ('Lunes', 'LUN'),
    ('Martes', 'MAR'),
    ('Miércoles', 'MIE'),
    ('Jueves', 'JUE'),
    ('Viernes', 'VIE'),
    ('Sábado', 'SAB'),
    ('Domingo', 'DOM')
) AS source (NomDiaSemana, NomCortoDiaSemana)
ON target.NomDiaSemana = source.NomDiaSemana
WHEN NOT MATCHED THEN
    INSERT (NomDiaSemana, NomCortoDiaSemana)
    VALUES (source.NomDiaSemana, source.NomCortoDiaSemana);