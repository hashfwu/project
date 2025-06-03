CREATE OR ALTER PROCEDURE register_afectado_sp(
    -- Persona
    @ci_persona varchar(15),
    @expedido_persona varchar(50),
    @paterno_persona varchar(50),
    @materno_persona varchar(50),
    @nombre_persona varchar(100),
    @sexo_persona varchar(10),
    @fecha_nacimiento_persona date,
    -- Afectado
    @id_area_afectado int,
    @telefono_afectado varchar(20),
    @email_afectado varchar(100),
    @ubicacion_domicilio_afectado varchar(150),
    @condicion_afectado varchar(20)
)
AS
BEGIN
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

        INSERT INTO Afectado (ci, id_area, telefono, email, ubicacion_domicilio, condicion)
        VALUES (
            @ci_persona,
            @id_area_afectado,
            @telefono_afectado,
            @email_afectado,
            @ubicacion_domicilio_afectado,
            @condicion_afectado
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