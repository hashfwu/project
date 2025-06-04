CREATE OR ALTER PROCEDURE register_instructor_sp(
    -- Persona
    @ci_persona varchar(15),
    @expedido_persona varchar(50),
    @paterno_persona varchar(50),
    @materno_persona varchar(50),
    @nombre_persona varchar(100),
    @sexo_persona varchar(10),
    @fecha_nacimiento_persona date,
    -- Instructor 
    @telefono_instructor varchar(20),
    @email_instructor varchar(100)
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

    INSERT INTO Instructor (ci, telefono, email)
        VALUES (
            @ci_persona,
            @telefono_instructor,
            @email_instructor
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