CREATE OR ALTER PROCEDURE register_vehiculo_sp(
    -- Datos del recurso
    @nombre_recurso varchar(100),
    @disponibilidad varchar(20),
    @descripcion varchar(100),
    @marca varchar(50),
    @estado varchar(20),
    
    -- Datos del vehículo
    @placa varchar(20),
    @tipo varchar(50),
    @modelo varchar(50),
    @ano_modelo int,
    @color varchar(30)
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

        -- Obtener el id_recurso generado
        DECLARE @new_id_recurso INT = SCOPE_IDENTITY();

        -- Insertar en Vehiculo
        INSERT INTO Vehiculo (
            placa,
            id_recurso,
            tipo,
            modelo,
            ano_modelo,
            color
        ) VALUES (
            @placa,
            @new_id_recurso,
            @tipo,
            @modelo,
            @ano_modelo,
            @color
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