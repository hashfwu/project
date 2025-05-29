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
