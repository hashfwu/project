ALTER TABLE Persona
ADD CONSTRAINT CHK_persona_expedido CHECK (expedido IN ('LP', 'SCZ', 'CBBA', 'OR', 'PT', 'CH', 'TJA', 'BE', 'PD', 'EX'));
GO;

ALTER TABLE persona
ADD CONSTRAINT CHK_persona_genero CHECK (sexo IN ('masculino', 'femenino', 'otro'));
GO;