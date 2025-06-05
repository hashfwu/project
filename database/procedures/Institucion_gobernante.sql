CREATE OR ALTER PROCEDURE register_provee_dinero_sp (
    -- Institucion Gobernante
    @id_institucion_gobernante int,
    -- Provee
    @fecha_provee date,
    -- Recurso
    @nombre_recurso VARCHAR(100),
    @disponibilidad VARCHAR(20),
    @descripcion VARCHAR(100),
    @marca VARCHAR(50),
    @estado VARCHAR(20),
    -- Dinero
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
        
        INSERT INTO Provee (
            id_recurso,
            id_intitucion_gobernante,
            fecha
        ) VALUES (
            @new_id_recurso,
            @id_institucion_gobernante,
            @fecha_provee
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

CREATE OR ALTER PROCEDURE register_provee_herramienta_sp(
    -- Institucion Gobernante
    @id_institucion_gobernante int,
    -- Provee
    @fecha_provee date,
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

        INSERT INTO Provee (
            id_recurso,
            id_intitucion_gobernante,
            fecha
        ) VALUES (
            @new_id_recurso,
            @id_institucion_gobernante,
            @fecha_provee
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

CREATE OR ALTER PROCEDURE register_provee_medicamento_sp (
    -- Institucion Gobernante
    @id_institucion_gobernante int,
    -- Provee
    @fecha_provee date,
    -- Datos para la tabla Recurso
    @nombre_recurso varchar(100),
    @disponibilidad varchar(20),
    @descripcion varchar(100),
    @marca varchar(50),
    @estado varchar(20),

    -- Datos para la tabla Medicamento
    @tipo_uso varchar(20),
    @fecha_vencimiento date,
    @unidad_medida varchar(10),
    @cantidad_unidad decimal(10,2),
    @num_unidades int,
    @contraindicaciones varchar(100)
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

        -- Insertar en Medicamento
        INSERT INTO Medicamento (
            id_recurso,
            tipo_uso,
            fecha_vencimiento,
            unidad_medida,
            cantidad_unidad,
            num_unidades,
            contraindicaciones
        ) VALUES (
            @new_id_recurso,
            @tipo_uso,
            @fecha_vencimiento,
            @unidad_medida,
            @cantidad_unidad,
            @num_unidades,
            @contraindicaciones
        );

        INSERT INTO Provee (
            id_recurso,
            id_intitucion_gobernante,
            fecha
        ) VALUES (
            @new_id_recurso,
            @id_institucion_gobernante,
            @fecha_provee
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

CREATE OR ALTER PROCEDURE register_provee_vehiculo_sp(
    -- Institucion Gobernante
    @id_institucion_gobernante int,
    -- Provee
    @fecha_provee date,
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

        INSERT INTO Provee (
            id_recurso,
            id_intitucion_gobernante,
            fecha
        ) VALUES (
            @new_id_recurso,
            @id_institucion_gobernante,
            @fecha_provee
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

CREATE OR ALTER PROCEDURE register_provee_vivere_sp(
    -- Institucion Gobernante
    @id_institucion_gobernante int,
    -- Provee
    @fecha_provee date,
    -- Datos de Recurso
    @nombre_recurso varchar(100),
    @disponibilidad varchar(20),
    @descripcion varchar(100),
    @marca varchar(50),
    @estado varchar(20),

    -- Datos de Vivere
    @unidad_medida varchar(10),
    @cantidad_unidad decimal(10,2),
    @num_unidades int,
    @categoria varchar(30),
    @fecha_vencimiento date
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

        -- Obtener el ID recién insertado
        DECLARE @new_id_recurso INT = SCOPE_IDENTITY();

        -- Insertar en Vivere
        INSERT INTO Vivere (
            id_recurso,
            unidad_medida,
            cantidad_unidad,
            num_unidades,
            categoria,
            fecha_vencimiento
        ) VALUES (
            @new_id_recurso,
            @unidad_medida,
            @cantidad_unidad,
            @num_unidades,
            @categoria,
            @fecha_vencimiento
        );

        INSERT INTO Provee (
            id_recurso,
            id_intitucion_gobernante,
            fecha
        ) VALUES (
            @new_id_recurso,
            @id_institucion_gobernante,
            @fecha_provee
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