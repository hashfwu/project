-- Incendio

-- Declaración de variables para almacenar los "arrays" de datos
DECLARE @tipos TABLE (valor NVARCHAR(50));
DECLARE @magnitudes TABLE (valor NVARCHAR(50));
DECLARE @descripciones TABLE (valor NVARCHAR(255));
DECLARE @causas TABLE (valor NVARCHAR(50));

-- Insertar los valores en las tablas temporales
INSERT INTO @tipos (valor) VALUES ('superficie'), ('copa'), ('subterraneo');
INSERT INTO @magnitudes (valor) VALUES ('leve'), ('grave'), ('medio');
INSERT INTO @descripciones (valor) VALUES
('Incendio forestal en el Parque Nacional Madidi, afectando biodiversidad'),
('Fuego incontrolable en el área protegida de San Matías, cerca de la frontera'),
('Quema descontrolada en tierras agrícolas cerca de Santa Cruz de la Sierra'),
('Incendio en la Amazonía boliviana, con riesgo para comunidades indígenas'),
('Conato de incendio en el Bosque Seco Chiquitano, bajo control'),
('Varios focos de calor detectados en el departamento de Beni'),
('Incendio provocado por chaqueo ilegal en la zona del Chaco boliviano'),
('Humo denso por incendios en la región de los Yungas, afectando visibilidad'),
('Incendio de pastizales en el altiplano, cerca de Oruro'),
('Emergencia por incendio en zona de amortiguamiento del Parque Noel Kempff Mercado'),
('Fuego en la serranía de Sama, Tarija, con riesgo para fuentes de agua'),
('Incendio en zonas de interfase urbano-forestal en Cochabamba'),
('Reporte de quemas en el Pantanal boliviano, impactando fauna local'),
('Incendio en área protegida de Kaa-Iya del Gran Chaco, difícil acceso'),
('Rebrotes de fuego en zonas previamente afectadas por incendios en 2019');
INSERT INTO @descripciones (valor) VALUES ('Incendio en la Chiquitania'), ('Incendio cerca de pueblos'), ('Incendio en reserva');
INSERT INTO @causas (valor) VALUES ('chaqueo'), ('loteo'), ('desconocido');

-- Número de registros a insertar
DECLARE @num_registros INT = 20;
DECLARE @contador INT = 1;

-- Bucle para insertar los registros
WHILE @contador <= @num_registros
BEGIN
    -- Declarar variables para los datos de cada registro
    DECLARE @tipo NVARCHAR(50);
    DECLARE @magnitud NVARCHAR(50);
    DECLARE @fecha_inicio DATETIME;
    DECLARE @fecha_fin DATETIME;
    DECLARE @descripcion NVARCHAR(255);
    DECLARE @causa NVARCHAR(50);

    -- Seleccionar un valor aleatorio de cada "array"
    SELECT TOP 1 @tipo = valor FROM @tipos ORDER BY NEWID();
    SELECT TOP 1 @magnitud = valor FROM @magnitudes ORDER BY NEWID();
    SELECT TOP 1 @descripcion = valor FROM @descripciones ORDER BY NEWID();
    SELECT TOP 1 @causa = valor FROM @causas ORDER BY NEWID();

    -- Generar fechas aleatorias
    -- Fecha de inicio entre 2010 y 2025
    SET @fecha_inicio = DATEADD(day, ABS(CHECKSUM(NEWID())) % (365 * 16), '2010-01-01'); 
    
    -- Fecha de fin entre 1 mes y 1 año después de la fecha de inicio
    SET @fecha_fin = DATEADD(month, 1 + ABS(CHECKSUM(NEWID())) % 12, @fecha_inicio);

    -- Insertar el registro en la tabla Incendio
    INSERT INTO Incendio
    (
        tipo,
        magnitud,
        fecha_incio,
        fecha_fin,
        descripcion,
        causa
    )
    VALUES 
    (
        @tipo,
        @magnitud,
        @fecha_inicio,
        @fecha_fin,
        @descripcion,
        @causa
    );

    SET @contador = @contador + 1;
END;

-- Opcional: Verificar los datos insertados
SELECT * FROM Incendio;
GO
