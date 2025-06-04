CREATE OR ALTER PROCEDURE register_herramienta_sp(
    -- Recurso
    @nombre_recurso VARCHAR(100),
    @disponibilidad VARCHAR(20),
    @descripcion VARCHAR(100),
    @marca VARCHAR(50),
    @estado VARCHAR(20),
    -- Herramienta
    @cantidad INT,
    @serie VARCHAR(50),
    @tipo VARCHAR(50)
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

        -- Obtener el ID generado del recurso
        DECLARE @new_id_recurso INT = SCOPE_IDENTITY();

        -- Insertar en Herramienta
        INSERT INTO Herramienta (
            id_recurso,
            cantidad,
            serie,
            tipo
        ) VALUES (
            @new_id_recurso,
            @cantidad,
            @serie,
            @tipo
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