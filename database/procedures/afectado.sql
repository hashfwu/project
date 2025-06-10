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
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        IF NOT EXISTS (
            SELECT 1 FROM Persona
            WHERE Persona.ci = @ci_persona
        )

        BEGIN
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

        END;

        INSERT INTO Afectado (ci, id_area, telefono, email, ubicacion_domicilio, condicion)
        VALUES (
            @ci_persona,
            @id_area_afectado,
            @telefono_afectado,
            @email_afectado,
            @ubicacion_domicilio_afectado,
            @condicion_afectado
        );

        SELECT SCOPE_IDENTITY() AS NewAfectadoId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE delete_afectado_sp(
    @v_id_afectado INT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Bien WHERE Bien.id_afectado = @v_id_afectado;
        DELETE FROM Afectado WHERE Afectado.id_afectado = @v_id_afectado;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

        THROW;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE update_afectado_sp(
    @id_afectado_original int,
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
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

            DECLARE @ci_persona_original varchar(15);
            SELECT  @ci_persona_original = Persona.ci
                FROM Persona, Afectado
                WHERE Afectado.ci = Persona.ci
                and Afectado.id_afectado = @id_afectado_original;

            UPDATE Persona
            SET  
                Persona.ci = @ci_persona,
                Persona.expedido = @expedido_persona,
                Persona.paterno = @paterno_persona,
                Persona.materno = @materno_persona,
                Persona.nombre = @nombre_persona,
                Persona.sexo = @sexo_persona,
                Persona.fecha_nacimiento = @fecha_nacimiento_persona
            WHERE Persona.ci = @ci_persona_original;

            UPDATE Afectado
            SET  
                Afectado.ci = @ci_persona,
                Afectado.id_area = @id_area_afectado,
                Afectado.telefono = @telefono_afectado,
                Afectado.email = @email_afectado,
                Afectado.ubicacion_domicilio = @ubicacion_domicilio_afectado,
                Afectado.condicion = @condicion_afectado
            WHERE Afectado.id_afectado = @id_afectado_original;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(MAX), @ErrorSeverity INT, @ErrorState INT;        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO