CREATE OR ALTER PROCEDURE register_donante_sp(
    -- Persona
    @ci_persona varchar(15),
    @expedido_persona varchar(50),
    @paterno_persona varchar(50),
    @materno_persona varchar(50),
    @nombre_persona varchar(100),
    @sexo_persona varchar(10),
    @fecha_nacimiento_persona date,
    -- Donante 
    @telefono_donante varchar(20),
    @email_donante varchar(100)
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Persona (ci, expedido, paterno, materno, nombre, sexo, fecha_nacimiento)
        VALUES (
            @ci_persona,
            @expedido_persona,
            @paterno_persona,
            @materno_persona,
            @nombre_persona,
            @sexo_persona,
            @fecha_nacimiento_persona
        );

    INSERT INTO Donante (ci, telefono, email)
        VALUES (
            @ci_persona,
            @telefono_donante,
            @email_donante
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