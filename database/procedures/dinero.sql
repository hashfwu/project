CREATE OR ALTER PROCEDURE insertar_dinero_sp (
    @nombre_recurso VARCHAR(100),
    @disponibilidad VARCHAR(20),
    @descripcion VARCHAR(100),
    @marca VARCHAR(50),
    @estado VARCHAR(20),
    @cantidad INT,
    @moneda VARCHAR(50)
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

        -- Insertar en Dinero
        INSERT INTO Dinero (
            id_recurso,
            cantidad,
            moneda
        ) VALUES (
            @new_id_recurso,
            @cantidad,
            @moneda
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