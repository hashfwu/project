ALTER TABLE Incendio
ADD CONSTRAINT CHK_persona_magnitud CHECK (magnitud IN ('grave', 'medio', 'leve'));

ALTER TABLE Incendio
ADD CONSTRAINT CHK_persona_tipo CHECK (tipo IN ('copa', 'subterraneo', 'superficie'));

ALTER TABLE Incendio
ADD CONSTRAINT CK_FechaFin_Mayor_FechaInicio
CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_incio);