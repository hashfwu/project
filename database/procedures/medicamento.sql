CREATE OR ALTER PROCEDURE register_medicamento_sp (
    -- Datos para la tabla Recurso
    @nombre_recurso varchar(100),
    @disponibilidad varchar(20),
    @descripcion varchar(100),
    @marca varchar(50),
    @estado varchar(20),

    -- Datos para la tabla Medicamento
    @tipo_uso varchar(20),
    @fecha_vencimiento date,
    @unidad_medida varchar(10),
    @cantidad_unidad decimal(10,2),
    @num_unidades int,
    @contraindicaciones varchar(100)
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar en Recurso
        INSERT INTO Recurso (
            nombre,
            disponibilidad,
            descripcion,
            marca,
            estado
        ) VALUES (
            @nombre_recurso,
            @disponibilidad,
            @descripcion,
            @marca,
            @estado
        );

        -- Obtener el ID del recurso recién insertado
        DECLARE @new_id_recurso INT = SCOPE_IDENTITY();

        -- Insertar en Medicamento
        INSERT INTO Medicamento (
            id_recurso,
            tipo_uso,
            fecha_vencimiento,
            unidad_medida,
            cantidad_unidad,
            num_unidades,
            contraindicaciones
        ) VALUES (
            @new_id_recurso,
            @tipo_uso,
            @fecha_vencimiento,
            @unidad_medida,
            @cantidad_unidad,
            @num_unidades,
            @contraindicaciones
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SELECT 
            @ErrorMessage = ERROR_MESSAGE(), 
            @ErrorSeverity = ERROR_SEVERITY(), 
            @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO