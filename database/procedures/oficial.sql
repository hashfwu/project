CREATE OR ALTER PROCEDURE register_oficial_sp(
    -- Persona
    @ci_persona varchar(15),
    @expedido_persona varchar(50),
    @paterno_persona varchar(50),
    @materno_persona varchar(50),
    @nombre_persona varchar(100),
    @sexo_persona varchar(10),
    @fecha_nacimiento_persona date,
    -- Bombero
    @telefono_bombero varchar(20),
    @ubicacion_domicilio_bombero varchar(150),
    @email_bombero varchar(100),
    @tipo_sangre_bombero varchar(10),
    @telefono_emergencia_bombero varchar(20),
    @nombre_emergencia_bombero varchar(100),
    -- Oficial
    @rango_oficial varchar(20)
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

        INSERT INTO Bombero (ci, telefono, ubicacion_domicilio, email, tipo_sangre, telefono_emergencia, nombre_emergencia)
        VALUES (
            @ci_persona,
            @telefono_bombero,
            @ubicacion_domicilio_bombero,
            @email_bombero,
            @tipo_sangre_bombero,
            @telefono_emergencia_bombero,
            @nombre_emergencia_bombero
        );

        DECLARE @new_id_bombero INT = SCOPE_IDENTITY();

        INSERT INTO Oficial (id_bombero, rango)
        VALUES (
            @new_id_bombero,
            @rango_oficial
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


