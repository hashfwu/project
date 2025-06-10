CREATE OR ALTER VIEW area_afectada_municipio_departamento_actual_vw AS
SELECT Area_Afectada.id_area, Area_Afectada.coordenadas, Municipio.nombre as municipio, Gobernacion.departamento, Area_Afectada.descripcion, Area_Afectada.tipo_vegetacion
FROM Area_Afectada
JOIN Municipio ON Area_Afectada.id_municipio = Municipio.id_municipio
JOIN Alcaldia ON Alcaldia.id_alcaldia = Municipio.id_alcaldia
JOIN Gobernacion ON Gobernacion.id_gobernacion = Alcaldia.id_gobernacion
JOIN Es_Afectado ON Area_Afectada.id_area = Es_Afectado.id_area
JOIN Incendio ON Incendio.id_incendio = Es_Afectado.id_incendio
WHERE Incendio.id_incendio IS NULL OR Incendio.fecha_fin >= DATEADD(month, -1, GETDATE());
GO

CREATE OR ALTER VIEW area_afectada_municipio_departamento_vw AS
SELECT Area_Afectada.id_area, Area_Afectada.coordenadas, Municipio.nombre as municipio, Gobernacion.departamento, Area_Afectada.descripcion, Area_Afectada.tipo_vegetacion
FROM Area_Afectada
JOIN Municipio ON Area_Afectada.id_municipio = Municipio.id_municipio
JOIN Alcaldia ON Alcaldia.id_alcaldia = Municipio.id_alcaldia
JOIN Gobernacion ON Gobernacion.id_gobernacion = Alcaldia.id_gobernacion
JOIN Es_Afectado ON Area_Afectada.id_area = Es_Afectado.id_area
JOIN Incendio ON Incendio.id_incendio = Es_Afectado.id_incendio
GO