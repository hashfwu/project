ALTER TABLE persona
ADD CONSTRAINT CHK_persona_genero CHECK (sexo IN ('masculino', 'femenino', 'otro'));