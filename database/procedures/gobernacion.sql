CREATE OR ALTER PROCEDURE register_gobernacion_sp(
    -- Institución Gobernante
    @nombre_institucion varchar(100),
    @sigla_institucion varchar(20),
    @telefono_institucion varchar(20),
    @ubicacion_sede_institucion varchar(150),
    @email_institucion varchar(100),
    @nombre_autoridad_institucion varchar(100),
    -- Gobernación
    @departamento_gobernacion varchar(50),
    @num_provincias int,
    @superficies decimal(10,2)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar en Institucion_Gobernante
        INSERT INTO Institucion_Gobernante (
            nombre,
            sigla,
            telefono,
            ubicacion_sede,
            email,
            nombre_autoridad
        ) VALUES (
            @nombre_institucion,
            @sigla_institucion,
            @telefono_institucion,
            @ubicacion_sede_institucion,
            @email_institucion,
            @nombre_autoridad_institucion
        );

        -- Obtener el ID generado
        DECLARE @new_id_institucion INT = SCOPE_IDENTITY();

        -- Insertar en Gobernacion
        INSERT INTO Gobernacion (
            id_intitucion_gobernante,
            departamento,
            num_provincias,
            superficies
        ) VALUES (
            @new_id_institucion,
            @departamento_gobernacion,
            @num_provincias,
            @superficies
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