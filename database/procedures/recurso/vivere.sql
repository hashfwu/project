CREATE OR ALTER PROCEDURE register_vivere_sp(
    -- Datos de Recurso
    @nombre_recurso varchar(100),
    @disponibilidad varchar(20),
    @descripcion varchar(100),
    @marca varchar(50),
    @estado varchar(20),

    -- Datos de Vivere
    @unidad_medida varchar(10),
    @cantidad_unidad decimal(10,2),
    @num_unidades int,
    @categoria varchar(30),
    @fecha_vencimiento date
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

        -- Obtener el ID recién insertado
        DECLARE @new_id_recurso INT = SCOPE_IDENTITY();

        -- Insertar en Vivere
        INSERT INTO Vivere (
            id_recurso,
            unidad_medida,
            cantidad_unidad,
            num_unidades,
            categoria,
            fecha_vencimiento
        ) VALUES (
            @new_id_recurso,
            @unidad_medida,
            @cantidad_unidad,
            @num_unidades,
            @categoria,
            @fecha_vencimiento
        );

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO