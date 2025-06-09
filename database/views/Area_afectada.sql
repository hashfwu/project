CREATE OR ALTER VIEW area_afectada_municipio_departamento_vw AS
SELECT Area_Afectada.id_area, Area_Afectada.coordenadas, Municipio.nombre as municipio, Gobernacion.departamento, Area_Afectada.descripcion, Area_Afectada.tipo_vegetacion
FROM Area_Afectada
JOIN Municipio ON Area_Afectada.id_municipio = Municipio.id_municipio
JOIN Alcaldia ON Alcaldia.id_alcaldia = Municipio.id_alcaldia
JOIN Gobernacion on Gobernacion.id_gobernacion = Alcaldia.id_gobernacion;