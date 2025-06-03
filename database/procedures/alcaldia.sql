CREATE OR ALTER PROCEDURE register_alcaldia_sp(
    -- Institución Gobernante
    @nombre_institucion varchar(100),
    @sigla_institucion varchar(20),
    @telefono_institucion varchar(20),
    @ubicacion_sede_institucion varchar(150),
    @email_institucion varchar(100),
    @nombre_autoridad_institucion varchar(100),
    -- Alcaldia
    @id_gobernacion_alcaldia int,
    @num_consejales_alcaldia int,
    -- Municipio
    @nombre_municipio varchar(100),
    @clima_municipio varchar(50),
    @superficie_municipio decimal(10,2),
    @altitud_municipio int
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

        -- Insertar en Alcaldia
        INSERT INTO Alcaldia (
            id_intitucion_gobernante,
            id_gobernacion,
            num_consejales
        ) VALUES (
            @new_id_institucion,
            @id_gobernacion_alcaldia,
            @num_consejales_alcaldia
        );

        DECLARE @new_id_alcaldia INT = SCOPE_IDENTITY();

        -- Insertar en Municipio
        INSERT INTO Municipio (
            id_alcaldia,
            nombre,
            clima,
            superficie,
            altitud
        ) VALUES (
            @new_id_alcaldia,
            @nombre_municipio,
            @clima_municipio,
            @superficie_municipio,
            @altitud_municipio
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