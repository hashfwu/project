-- Para ver nombre de columnas hacemos
-- select column_name from information_schema.columns where table_name = 'Recurso';C

-- Esto es para que por defecto un recurso este disponible al insertarse
ALTER TABLE Recurso
ADD CONSTRAINT DF_Recurso_Disponibilidad
DEFAULT 'disponible' FOR disponibilidad;
GO


CREATE PROCEDURE registrar_medicamento(
    @nombre_recurso VARCHAR(100),
    @descripcion_recurso VARCHAR(100),
    @marca_recurso VARCHAR(50),
    @estado_recurso VARCHAR(20),
    @tipo_uso_medicamento VARCHAR(20),
    @fecha_vencimiento_medicamento DATE,
    @unidad_medida_medicamento VARCHAR(10),
    @cantidad_unidad_medicamento DECIMAL(10,2),
    @num_unidades_medicamento INT,
    @contraindicaciones_medicamento VARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @next_id_recurso INT;
        DECLARE @next_id_medicamento INT;

        SELECT @next_id_recurso = ISNULL(MAX(id_recurso), 0) + 1 FROM Recurso WITH (TABLOCKX);

        INSERT INTO Recurso (id_recurso, nombre, descripcion, marca, estado)
        VALUES (
            @next_id_recurso,
            @nombre_recurso,
            @descripcion_recurso,
            @marca_recurso,
            @estado_recurso
        );

        SELECT @next_id_medicamento = ISNULL(MAX(id_medicamento), 0) + 1 FROM Medicamento WITH (TABLOCKX);

        INSERT INTO Medicamento (
            id_medicamento,
            id_recurso,
            tipo_uso,
            fecha_vencimiento,
            unidad_medida,
            cantidad_unidad,
            num_unidades,
            contraindicaciones
        )
        VALUES (
            @next_id_medicamento,
            @next_id_recurso, -- Usar el id_recurso que acabamos de generar
            @tipo_uso_medicamento,
            @fecha_vencimiento_medicamento,
            @unidad_medida_medicamento,
            @cantidad_unidad_medicamento,
            @num_unidades_medicamento,
            @contraindicaciones_medicamento
        );

        COMMIT TRANSACTION;

        SELECT 'Medicamento registrado exitosamente.' AS Mensaje,
               @next_id_recurso AS ID_Recurso_Generado,
               @next_id_medicamento AS ID_Medicamento_Generado;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE() + ' Línea: ' + CAST(ERROR_LINE() AS NVARCHAR(5)), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

EXEC registrar_medicamento
    'Amoxicilina', -- @nombre_recurso
    'Medicemto', -- @descripcion_recurso
    'Bago', -- @marca_recurso
    'Bueno', -- @estado_recurso
    'Oral', -- @tipo_uso_medicamento
    '05/20/2025',-- @fecha_vencimiento_medicamento
    'ml', -- @unidad_medida_medicamento
    100, -- @cantidad_unidad_medicamento
    2, -- @num_unidades_medicamento
    'Ninguna'-- @contraindicaciones_medicamento
go

CREATE PROCEDURE registrar_vivere(
    @nombre_recurso VARCHAR(100),
    @descripcion_recurso VARCHAR(100),
    @marca_recurso VARCHAR(50),
    @estado_recurso VARCHAR(20),
    @unidad_medida_vivere VARCHAR(10),
    @cantidad_unidad_vivere DECIMAL(10,2),
    @num_unidades_vivere INT,
    @categoria_vivere VARCHAR(30),
    @fecha_vencimiento_vivere DATE
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @next_id_recurso INT;
        DECLARE @next_id_vivere INT;

        SELECT @next_id_recurso = ISNULL(MAX(id_recurso), 0) + 1 FROM Recurso WITH (TABLOCKX);

        INSERT INTO Recurso (id_recurso, nombre, descripcion, marca, estado)
        VALUES (
            @next_id_recurso,
            @nombre_recurso,
            @descripcion_recurso,
            @marca_recurso,
            @estado_recurso
        );

        SELECT @next_id_vivere = ISNULL(MAX(id_vivere), 0) + 1 FROM Viveres WITH (TABLOCKX);

        INSERT INTO Viveres (
            id_vivere,
            id_recurso,
            unidad_medida,
            cantidad_unidad,
            num_unidades,
            categoria,
            fecha_vencimiento
        )
        VALUES (
            @next_id_vivere,
            @next_id_recurso,
            @unidad_medida_vivere,
            @cantidad_unidad_vivere,
            @num_unidades_vivere,
            @categoria_vivere,
            @fecha_vencimiento_vivere
        );

        COMMIT TRANSACTION;

        SELECT 'Vivere registrado exitosamente.' AS Mensaje,
               @next_id_recurso AS ID_Recurso_Generado,
               @next_id_vivere AS ID_Vivere_Generado;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE() + ' Línea: ' + CAST(ERROR_LINE() AS NVARCHAR(5)), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

EXEC registrar_vivere
    'Arroz', -- nombre_recurso,
    'Arroz grano de oro', -- descripcion_recurso,
    'Emapa', -- marca_recurso,
    'Bueno', -- estado_recurso,
    'Kg', -- unidad_medida_vivere,
    100, -- cantidad_unidad_vivere,
    1,-- num_unidades_vivere,
    'Grano', -- categoria_vivere,
    '01-02-2026';-- fecha_vencimiento_vivere;
GO

CREATE PROCEDURE registrar_vehiculo(
    @nombre_recurso VARCHAR(100),
    @descripcion_recurso VARCHAR(100),
    @marca_recurso VARCHAR(50),
    @estado_recurso VARCHAR(20),
    @placa_vehiculo varchar(20),
    @tipo_vehiculo varchar(50),
    @modelo_vehiculo varchar(50),
    @ano_modelo_vehiculo int,
    @color_vehiculo varchar(30)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @next_id_recurso INT;

        SELECT @next_id_recurso = ISNULL(MAX(id_recurso), 0) + 1 FROM Recurso WITH (TABLOCKX);

        INSERT INTO Recurso (id_recurso, nombre, descripcion, marca, estado)
        VALUES (
            @next_id_recurso,
            @nombre_recurso,
            @descripcion_recurso,
            @marca_recurso,
            @estado_recurso
        );

        INSERT INTO Vehiculo (
            placa,
            id_recurso,
            tipo,
            modelo,
            ano_modelo,
            color
        )
        VALUES (
            @placa_vehiculo,
            @next_id_recurso,
            @tipo_vehiculo,
            @modelo_vehiculo,
            @ano_modelo_vehiculo,
            @color_vehiculo
        );

        COMMIT TRANSACTION;

        SELECT 'Vehiculo registrado exitosamente.' AS Mensaje,
               @next_id_recurso AS ID_Recurso_Generado,
               @placa_vehiculo AS ID_Vivere_Generado;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE() + ' Línea: ' + CAST(ERROR_LINE() AS NVARCHAR(5)), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO


EXEC registrar_vehiculo
    'Toyota Hylux', -- nombre_recurso
    'Camionte de carga',-- descripcion_recurso
    'Toyota', -- marca_recurso
    'Bueno', -- estado_recurso
    'IEN-239', -- placa_vehiculo
    'Camioneta', -- tipo_vehiculo
    'Hylux', -- modelo_vehiculo
    '2020', -- ano_modelo_vehiculo
    'Rojo'; -- color_vehiculo
GO

DROP PROCEDURE registrar_herramienta;
GO

CREATE PROCEDURE registrar_herramienta(
    @nombre_recurso VARCHAR(100),
    @descripcion_recurso VARCHAR(100),
    @marca_recurso VARCHAR(50),
    @estado_recurso VARCHAR(20),
    @cantidad_herramienta INT,
    @serie_herramienta VARCHAR(50),
    @tipo_herramienta VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @next_id_recurso INT;
        DECLARE @next_id_herramienta INT;

        SELECT @next_id_recurso = ISNULL(MAX(id_recurso), 0) + 1 FROM Recurso WITH (TABLOCKX);

        INSERT INTO Recurso (id_recurso, nombre, descripcion, marca, estado)
        VALUES (
            @next_id_recurso,
            @nombre_recurso,
            @descripcion_recurso,
            @marca_recurso,
            @estado_recurso
        );

        SELECT @next_id_herramienta = ISNULL(MAX(id_herramienta), 0) + 1 FROM Herramientas WITH (TABLOCKX);

        INSERT INTO Herramientas (
            id_herramienta,
            id_recurso,
            cantidad,
            serie,
            tipo
        )
        VALUES (
            @next_id_recurso,
            @next_id_herramienta,
            @cantidad_herramienta,
            @serie_herramienta,
            @tipo_herramienta
        );

        COMMIT TRANSACTION;

        SELECT 'Herramienta registrada exitosamente.' AS Mensaje,
               @next_id_recurso AS ID_Recurso_Generado,
               @next_id_herramienta AS ID_Herramienta_Generado;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE() + ' Línea: ' + CAST(ERROR_LINE() AS NVARCHAR(5)), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO


EXEC registrar_herramienta
    'Exintor', -- nombre_recurso
    'Exintor rojo mediano', -- descripcion_recurso
    'Huy', -- marca_recurso
    'Bueno', -- estado_recurso
    1, -- cantidad_herramienta
    'EJNC8E', -- serie_herramienta
    'Extintor'; -- tipo_herramienta
