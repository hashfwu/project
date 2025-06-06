CREATE OR ALTER FUNCTION perdidas_incendios_sf (@v_id_afectado INT)
RETURNS TABLE
AS
RETURN
(
        SELECT bien.id_bien, bien.tipo, bien.magnitud_dano, bien.costo_dano, gobernacion.departamento, municipio.nombre as municipio, incendio.descripcion, incendio.fecha_incio, incendio.fecha_fin
        FROM bien
        join Afectado on bien.id_afectado = Afectado.id_afectado
        join Area_Afectada on Afectado.id_area = Area_Afectada.id_area
        join Es_Afectado on Es_Afectado.id_area = Area_Afectada.id_area
        join Incendio on Es_Afectado.id_incendio = Incendio.id_incendio
        join Municipio on Area_Afectada.id_municipio = Municipio.id_municipio
        join Alcaldia on Alcaldia.id_alcaldia = Municipio.id_alcaldia
        join Gobernacion on Gobernacion.id_gobernacion = Alcaldia.id_gobernacion
        where Afectado.id_afectado = @v_id_afectado
        group by bien.id_bien, bien.tipo, bien.magnitud_dano, bien.costo_dano, gobernacion.departamento, municipio.nombre, incendio.id_incendio, incendio.descripcion, incendio.fecha_incio, incendio.fecha_fin
);
GO

--1, 9, 98, 102, 80, 77, 38, 80, 102, 77, 104, 77, 5, 88, 73, 100, 22, 72, 104, 107

CREATE OR ALTER FUNCTION perdidas_sf (@v_id_afectado INT)
RETURNS TABLE
AS
RETURN
(
        SELECT Bien.id_bien, Bien.tipo, Bien.magnitud_dano, Bien.costo_dano
        FROM Bien
        JOIN Afectado ON Bien.id_afectado = Afectado.id_afectado
        where Afectado.id_afectado = @v_id_afectado
);
GO