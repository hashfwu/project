insert into Persona (ci, expedido, paterno, materno, nombre, sexo)
VALUES
('1234567', 'LP'  , 'Flores'    , 'Mamani'  , 'Ana María'    , 'Femenino'),
('9876543', 'CBBA', 'Pérez'     , 'Gonzales', 'Juan Carlos'  , 'Masculino'),
('5555555', 'SCZ' , 'Vargas'    , 'Valda'   , 'Laura'        , 'Femenino'),
('1122334', 'OR'  , 'Mamani'    , 'Quispe'  , 'Pedro José'   , 'Masculino'),
('6789012', 'PT'  , 'Rojas'     , 'Soto'    , 'Carmen Elena' , 'Femenino'),
('9873543', 'SCZ' , 'Rojas'     , 'Vargas'  , 'Carla'        , 'Femenino'),
('1123334', 'CBBA', 'Pérez'     , 'Gómez'   , 'Andrés'       , 'Masculino'),
('5556667', 'OR'  , 'Flores'    , 'Mamani'  , 'Elena'        , 'Femenino'),
('8899001', 'TJA' , 'Castro'    , 'Ruiz'    , 'Daniel'       , 'Masculino'),
('2233445', 'PT'  , 'Quispe'    , 'Condori' , 'Lucía'        , 'Femenino'),
('7777111', 'LP'  , 'Sánchez'   , 'Lima'    , 'Sofia'        , 'Femenino'),
('3334445', 'CH'  , 'Torres'    , 'Herrera' , 'Pablo'        , 'Masculino'),
('4445556', 'BE'  , 'Suárez'    , 'Díaz'    , 'Natalia'      , 'Femenino'),
('6667778', 'PD'  , 'Villarroel', 'Méndez'  , 'Ricardo'      , 'Masculino'),
('2228889', 'TJA' , 'Guzmán'    , 'Navia'   , 'Adriana'      , 'Femenino'),
('7777888', 'LP'  , 'Sánchez'   , 'Herrera' , 'Sofia Isabel' , 'Femenino'),
('4455667', 'CH'  , 'Torres'    , 'Miranda' , 'Gabriel'      , 'Masculino'),
('3322110', 'BE'  , 'Rivera'    , 'Jiménez' , 'Paola Andrea' , 'Femenino'),
('6655443', 'PD'  , 'Velasco'   , 'Mendoza' , 'Luis Fernando', 'Masculino'),
('1011121', 'TJA' , 'Gutierrez' , 'Paredes' , 'Claudia Ruth' , 'Femenino');
GO

insert into Curso (id_curso, nombre, horas, costo, fecha_certificacion, fecha_fin, fecha_inicio) values
(1, 'Primeros auxilios'              , 40, 250.00, '2025-12-15', '2025-12-05', '2025-11-01'),
(2, 'Rescate'                        , 60, 180.50, '2026-03-30', '2026-03-20', '2026-01-15'),
(3, 'Como actuar frente a un incedio', 35, 320.75, '2025-10-20', '2025-10-10', '2025-09-01'),
(4, 'Prevension de incendios'        , 50, 280.99, '2026-05-25', '2026-05-15', '2026-04-01'),
(5, 'Zonas y ares protegidas'        , 45, 215.00, '2025-11-22', '2025-11-12', '2025-10-05');
GO

insert into Institución_Gobernante (id_intitución_gobernante, nombre, sigla, telefono, ubicacion_sede, email, nombre_autoridad)
values
(6 , 'Gobierno Autónomo Municipal de Viacha'                , 'GAMV'     , '72720350', 'Plaza Principal             , Viacha                , La Paz'    , 'info@viacha.gob.bo'             , 'Napoleón Yahuasi'),
(7 , 'Gobierno Autónomo Departamental de Pando'             , 'GAD Pando', '78220320', 'Av. Costanera s/n           , Cobija                , Pando'     , 'gobernacion@pando.gob.bo'       , 'Luis Adolfo Flores Roberts'),
(8 , 'Gobierno Autónomo Municipal de Uncía'                 , 'GAMU'     , '75420335', 'Plaza 27 de Mayo            , Uncía                 , Potosí'    , 'municiplidaduncia@gmail.com'    , 'Dionisio Piza'),
(9 , 'Gobierno Autónomo Municipal de San Ignacio de Velasco', 'GAMSIV'   , '79222322', 'Calle Bolívar esq. Ballivián, San Ignacio de Velasco, Santa Cruz', 'info@sanignaciodevelasco.gob.bo', 'Moisés Salces Salces'),
(10, 'Gobierno Autónomo Municipal de Tupiza'                , 'GAMT'     , '76420322', 'Calle Comercio s/n          , Tupiza                , Potosí'    , 'municipio.tupiza@hotmail.com'   , 'Daisy Ayaviri Machuca');
GO

insert into Incendio (id_incendio, tipo, magnitud, fecha_incio, fecha_fin, descripción, origen)
values
(101, 'superficie' , 'moderado', '2025-05-15', '2025-05-18', 'Incendio en pastizales cerca de la carretera principal.', 'antrópico'),
(102, 'copa'       , 'severo'  , '2025-05-20', NULL        , 'Incendio forestal activo en la zona montañosa.'         , 'natural'),
(103, 'subterráneo', 'leve'    , '2025-04-28', '2025-05-02', 'Quema lenta de materia orgánica bajo la superficie.'    , 'antrópico'),
(104, 'superficie' , 'leve'    , '2025-05-01', '2025-05-01', 'Pequeño incendio controlado en área agrícola.'          , 'antrópico'),
(105, 'copa'       , 'moderado', '2025-05-05', '2025-05-09', 'Incendio forestal en zona de alta biodiversidad.'       , 'natural');
GO

insert into Organización (id_organización, telefono, email, ubicación, fecha_creación, tipo, nombre)
values
(1 , '78901234', 'proteccionanimal@email.com'     , 'La Paz    , La Paz                 , Ciudad Satélite   , Avenida Principal', '2023-08-15', 'voluntario', 'Protectores Unidos de Animales'),
(2 , '65432109', 'gestionriesgoslp@gob.bo'        , 'La Paz    , El Alto                , Zona Villa Dolores, Calle 10'         , '2020-03-10', 'estatal'   , 'Unidad Municipal de Gestión de Riesgos - El Alto'),
(3 , '77788990', 'arteculturaviva@gmail.com'      , 'La Paz    , La Paz                 , Centro            , Calle Indaburo'   , '2024-11-22', 'voluntario', 'Asociación Cultural Sembrando Arte'),
(4 , '60123456', 'saludparatodos@minsalud.gob.bo' , 'La Paz    , Viacha                 , Zona Central      , Plaza Principal'  , '2019-07-01', 'estatal'   , 'Centro de Salud Integral Viacha'),
(5 , '72345678', 'jovenesemprendedores@gmail.com' , 'La Paz    , Achocalla              , Zona Bella Vista  , Avenida Los Pinos', '2025-01-05', 'voluntario', 'Club de Emprendedores Achocalla'),
(6 , '78901234', 'proteccionanimal@email.com'     , 'La Paz    , La Paz                 , Miraflores        , Av. Busch'        , '2023-11-15', 'voluntario', 'Huellitas Felices'),
(7 , '72345378', 'jovenecontraincendio@gmail.com' , 'La Paz    , Achocalla              , Zona Valle Bajo   , Avenida Central'  , '2025-02-05', 'voluntario', 'Club Juvenil Achocalla'),
(8 , '77778888', 'arteculturabolivia@asoc.org'    , 'Cochabamba, Cercado                , Zona Central      , Calle Bolívar'    , '2018-07-20', 'voluntario', 'Asociación Cultural Sembrando Arte'),
(9 , '60011223', 'saludparatodos@minsalud.gob.bo' , 'Santa Cruz, Santa Cruz de la Sierra, Equipetrol        , Av. San Martín'   , '2024-01-10', 'estatal'   , 'Programa Nacional de Salud Comunitaria'),
(10, '72233445', 'defensoresdelagua@fundacion.org', 'Oruro     , Oruro                  , Zona Norte        , Calle Sucre'      , '2022-05-25', 'voluntario', 'Fundación Agua Viva');
GO

insert into Bombero (id_bombero, ci, fecha_nac, fecha_registro, telefono, ubicación_domicilio, email, tipo_sangre, telefono_emergencia, nombre_emergencia, fecha_inicio_actividades, descripción_enfermedad_base)
values
(1, '1234567', '1990-05-10', '2022-08-20', '77112233', 'El Alto, Villa Adela    , Calle 5'           , 'juan.perez@bomberos.bo'   , 'O+' , '70001122', 'Maria Perez Vargas'    , '2022-09-01', 'ninguna'),
(2, '9876543', '1985-12-01', '2023-01-15', '65443322', 'La Paz , Miraflores     , Avenida Saavedra'  , 'ana.rodriguez@bomberos.bo', 'A-' , '71223344', 'Carlos Rodriguez Lopez', '2023-02-01', 'Asma leve'),
(3, '5555555', '1993-07-25', '2024-05-03', '76554433', 'El Alto, Ciudad Satélite, Calle 12'          , 'luis.gonzales@bomberos.bo', 'B+' , '78990011', 'Sofia Mamani Quispe'   , '2024-05-15', 'ninguna'),
(4, '1122334', '1988-03-18', '2021-11-10', '60112233', 'La Paz , Sopocachi      , Calle Aspiazu'     , 'elena.flores@bomberos.bo' , 'AB+', '72334455', 'Pedro Flores Rocha'    , '2021-12-01', 'ninguna'),
(5, '6789012', '1995-09-01', '2025-03-28', '79988776', 'El Alto, Río Seco       , Avenida Cochabamba', 'david.castro@bomberos.bo' , 'O-' , '75445566', 'Laura Vargas Soliz'    , '2025-04-10', 'Alergia al polvo');
GO

insert into Voluntario (id_voluntario, ci, fecha_nac, fecha_registro, telefono, email, nombre_emergencia, telefono_emergencia, descripción_enfermedad_base, tipo_sangre, ubicacion_domicilio)
values
(1, '9873543', '1995-03-12', '2024-09-01', '77112233', 'ana.perez@email.com'       , 'Luis Perez Vargas'   , '66554433', 'ninguna'         , 'O+' , 'El Alto   , Villa Adela      , Calle 5'),
(2, '1123334', '1988-11-25', '2024-10-15', '60123456', 'carlos.rodriguez@email.com', 'Sofia Mamani Flores' , '70099887', 'Asma leve'       , 'A-' , 'La Paz    , Miraflores       , Avenida San Martín'),
(3, '5556667', '2002-07-08', '2025-01-20', '79988776', 'laura.gonzales@email.com'  , 'Pedro Gonzales Rocha', '69900112', 'ninguna'         , 'B+' , 'Cochabamba, Cala Cala        , Calle Los Pinos'),
(4, '8899001', '1990-05-18', '2025-03-05', '68877665', 'javier.lopez@email.com'    , 'Maria Lopez Suarez'  , '75544332', 'Alergia al polen', 'AB+', 'Oruro     , Zona Central     , Calle Bolívar'),
(5, '2233445', '1998-09-30', '2025-04-10', '71122334', 'elena.vargas@email.com'    , 'Juan Vargas Quispe'  , '67788990', 'ninguna'         , 'O-' , 'Potosí    , Villa Magisterial, Avenida Universitaria');
GO

insert into Instructor (id_instructor, id_organización, ci, telefono, email)
values
(1, 1, '7777111', '7777-8888', 'ana.rodriguez@email.com'),
(2, 2, '3334445', '6666-5555', 'luis.perez@email.com'),
(3, 3, '4445556', '7000-1111', 'maria.gomez@email.com'),
(4, 4, '6667778', '6000-9999', 'pedro.silva@email.com'),
(5, 5, '2228889', '7500-2222', 'sofia.vargas@email.com');
GO

insert into Brigada (id_brigada, id_organización, nombre, fecha_creacion, ubicación_base_operaciones)
values
( 1, 10, 'Brigada de Rescate Cordillera Real'    , '2023-08-15', 'La Paz          , El Alto    , Zona Villa Dolores    , Calle 5'),
( 2, 1 , 'Brigada Juvenil de Prevención'         , '2024-01-20', 'Oruro           , Cercado    , Avenida del Ejército  , Edificio Central'),
( 3, 8 , 'Brigada de Apoyo Psicológico Esperanza', '2022-11-01', 'Santa Cruz      , Warnes     , Carretera al Norte    , Km 12'),
( 4, 2 , 'Brigada de Comunicación de Emergencias', '2023-05-10', 'Cochabamba      , Quillacollo, Avenida Suárez Miranda, Barrio Ferroviario'),
( 5, 7 , 'Brigada Canina de Búsqueda y Rescate'  , '2024-03-25', 'Tarija          , Cercado    , Calle Bolívar         , Zona Central'),
( 6, 3 , 'Brigada de Logística Humanitaria'      , '2023-09-01', 'Potosí          , Ciudad     , Avenida Sevilla       , Barrio Minero'),
( 7, 3 , 'Brigada de Evaluación de Daños'        , '2022-12-18', 'Sucre           , Ciudad     , Calle España          , Zona Universitaria'),
( 8, 5 , 'Brigada Médica de Respuesta Rápida'    , '2024-02-12', 'Beni            , Trinidad   , Avenida 6 de Agosto   , Barrio Central'),
( 9, 2 , 'Brigada de Seguridad y Evacuación'     , '2023-06-30', 'Pando           , Cobija     , Avenida Internacional , Zona Franca'),
(10, 4 , 'Brigada de Voluntarios Ambientales'    , '2024-04-05', 'Chuquisaca Norte, Monteagudo , Calle Principal       , Barrio Nuevo');
GO

insert into Recurso (id_recurso, nombre, disponibilidad, descripcion, marca, estado)
values
-- medicamento
(1            , 'Omeprazol 250mg'                             , 'disponible', 'Inhibidor de la bomba de protones'            , 'La Sante'             , 'bueno'),
(2            , 'Amoxicilina 1g'                              , 'disponible', 'Antibiótico de amplio espectro'               , 'MK'                   , 'bueno'),
(3            , 'Ibuprofeno 25mcg'                            , 'agotado'   , 'Antiinflamatorio no esteroideo'               , 'Chile'                , 'bueno'),
(4            , 'Jarabe para la tos'                          , 'disponible', 'Alivia la tos seca y con flema'               , 'Takeda'               , 'bueno'),
(5            , 'Paracetamol 500mg'                           , 'disponible', 'Analgésico y antipirético'                    , 'Genfar'               , 'bueno'),
(6            , 'Salbutamol Inhalador'                        , 'agotado'   , 'Broncodilatador de acción rápida'             , 'GlaxoSmithKline'      , 'bueno'),
(7            , 'Diclofenaco Inyectable'                      , 'disponible', 'Analgésico y antiinflamatorio inyectable'     , 'Sandoz'               , 'regular'),
(8            , 'Solución Salina Isotónica'                   , 'disponible', 'Solución para administración intravenosa'     , 'Baxter'               , 'bueno'),
(9            , 'Insulina NPH'                                , 'disponible', 'Insulina de acción intermedia'                , 'Novo Nordisk'         , 'bueno'),
(10           , 'Crema para quemaduras'                       , 'agotado'   , 'Crema para aliviar quemaduras leves'          , 'Dermaplast'           , 'bueno'),
--viveres
(11           , 'Agua embotellada 500ml'                      , 'disponible', 'Botellas de agua purificada'                  , 'Vishuddha'            , 'bueno'),
(12           , 'Fideos tipo espagueti 500g'                  , 'disponible', 'Paquetes de pasta seca'                       , 'Regal'                , 'bueno'),
(13           , 'Arroz blanco grano largo 1kg'                , 'disponible', 'Paquetes de arroz blanco'                     , 'Sello de Oro'         , 'bueno'),
(14           , 'Latas de atún en aceite 170g'                , 'disponible', 'Latas de atún conservado'                     , 'Real'                 , 'bueno'),
(15           , 'Frijol negro seco 1kg'                       , 'disponible', 'Bolsas de frijol negro'                       , 'Don Frijol'           , 'bueno'),
(16           , 'Leche en polvo entera 400g'                  , 'disponible', 'Bolsas de leche en polvo'                     , 'Pil'                  , 'bueno'),
(17           , 'Barras energéticas de cereal'                , 'disponible', 'Barras nutritivas de avena y frutas'          , 'PowerBar'             , 'bueno'),
(18           , 'Galletas de soda paquete'                    , 'disponible', 'Paquetes de galletas saladas'                 , 'Nawab'                , 'bueno'),
(19           , 'Aceite vegetal 1 litro'                      , 'disponible', 'Botellas de aceite de girasol'                , 'Fino'                 , 'bueno'),
(20           , 'Azúcar blanca granulada 1kg'                 , 'disponible', 'Bolsas de azúcar blanca'                      , 'Unagro'               , 'bueno'),
-- vehiculo
(21           , 'Helicóptero de extinción Bambi Bucket'       , 'disponible', 'Helicóptero para descarga de agua'            , 'Bell Helicopter'      , 'bueno'),
(22           , 'Camión cisterna 10000 litros'                , 'disponible', 'Camión para transporte y descarga de agua'    , 'Mercedes-Benz'        , 'bueno'),
(23           , 'Avión cisterna Air Tractor AT-802'           , 'disponible', 'Avión de carga para extinción aérea'          , 'Air Tractor'          , 'bueno'),
(24           , 'Camioneta 4x4 de intervención rápida'        , 'disponible', 'Vehículo ligero para acceso rápido'           , 'Toyota'               , 'bueno'),
(25           , 'Bulldozer D7 para remoción de escombros'     , 'disponible', 'Maquinaria pesada para limpieza de áreas'     , 'Caterpillar'          , 'regular'),
(26           , 'Camión forestal con grúa'                    , 'disponible', 'Camión para transporte de madera quemada'     , 'Volvo'                , 'bueno'),
(27           , 'Motocicleta todoterreno para reconocimiento' , 'disponible', 'Vehículo ágil para inspección de áreas'       , 'Honda'                , 'bueno'),
(28           , 'Ambulancia 4x4 equipada'                     , 'disponible', 'Vehículo para atención médica de emergencia'  , 'Ford'                 , 'bueno'),
(29           , 'Tractor oruga con arado'                     , 'disponible', 'Maquinaria para crear cortafuegos'            , 'John Deere'           , 'bueno'),
(30           , 'Dron de reconocimiento con cámara térmica'   , 'disponible', 'Vehículo aéreo no tripulado para vigilancia'  , 'DJI'                  , 'bueno'),
-- herramienta
(31           , 'Motosierra Stihl MS 271'                     , 'disponible', 'Motosierra para corte de madera'              , 'Stihl'                , 'bueno'),
(32           , 'Pala de bombero con mango de fibra'          , 'disponible', 'Pala resistente para remover escombros'       , 'Truper'               , 'bueno'),
(33           , 'Hacha de bombero con cabeza de acero'        , 'disponible', 'Hacha para abrirse paso y cortar'             , 'Estwing'              , 'bueno'),
(34           , 'Manguera contra incendios de 15 metros'      , 'disponible', 'Manguera de alta presión con conexiones'      , 'Angus Fire'           , 'bueno'),
(35           , 'Casco de bombero con visor'                  , 'disponible', 'Equipo de protección personal'                , 'MSA'                  , 'bueno'),
(36           , 'Linterna frontal LED de alta potencia'       , 'disponible', 'Iluminación manos libres'                     , 'Petzl'                , 'bueno'),
(37           , 'Radio portátil de comunicación bidireccional', 'disponible', 'Comunicación entre equipos'                   , 'Motorola'             , 'bueno'),
(38           , 'Kit de herramientas de rescate hidráulico'   , 'disponible', 'Equipo para abrir vehículos accidentados'     , 'Lukas'                , 'bueno'),
(39           , 'Detector de gases multi-gas'                 , 'disponible', 'Equipo para medir niveles de gases peligrosos', 'BW Technologies'      , 'bueno'),
(40           , 'Botiquín de primeros auxilios avanzado'      , 'disponible', 'Kit completo para atención inicial'           , 'Curad'                , 'bueno');
GO

insert into Registro_Recurso (id_registro_recurso, id_brigada, id_recurso, tipo, fecha)
values
( 1, 2 , 5 , 'extracción', '2025-01-08'),
( 2, 1 , 8 , 'devolución', '2025-01-09'),
( 3, 8 , 22, 'extracción', '2025-01-09'),
( 4, 7 , 17, 'extracción', '2025-01-10'),
( 5, 4 , 31, 'devolución', '2025-01-10'),
( 6, 10, 29, 'extracción', '2025-01-11'),
( 7, 7 , 4 , 'devolución', '2025-01-11'),
( 8, 2 , 16, 'extracción', '2025-01-12'),
( 9, 4 , 23, 'extracción', '2025-01-12'),
(10, 9 , 10, 'devolución', '2025-02-13'),
(11, 2 , 25, 'extracción', '2025-02-08'),
(12, 7 , 38, 'devolución', '2025-02-09'),
(13, 3 , 2 , 'extracción', '2025-02-09'),
(14, 10, 27, 'extracción', '2025-02-10'),
(15, 4 , 21, 'devolución', '2025-02-10'),
(16, 7 , 39, 'extracción', '2025-02-11'),
(17, 10, 14, 'devolución', '2025-03-11'),
(18, 8 , 6 , 'extracción', '2025-03-12'),
(19, 4 , 23, 'extracción', '2025-03-12'),
(20, 1 , 10, 'devolución', '2025-03-13'),
(21, 2 , 35, 'extracción', '2025-03-08'),
(22, 1 , 8 , 'devolución', '2025-03-09'),
(23, 8 , 33, 'extracción', '2025-03-09'),
(24, 7 , 7 , 'extracción', '2025-03-10'),
(25, 4 , 1 , 'devolución', '2025-04-10'),
(26, 10, 29, 'extracción', '2025-04-11'),
(27, 7 , 34, 'devolución', '2025-04-11'),
(28, 2 , 26, 'extracción', '2025-04-12'),
(29, 4 , 3 , 'extracción', '2025-04-12'),
(30, 9 , 10, 'devolución', '2025-04-13'),
(31, 2 , 5 , 'extracción', '2025-04-08'),
(32, 7 , 8 , 'devolución', '2025-04-09'),
(33, 3 , 22, 'extracción', '2025-05-09'),
(34, 10, 7 , 'extracción', '2025-05-10'),
(35, 4 , 21, 'devolución', '2025-05-10'),
(36, 7 , 9 , 'extracción', '2025-05-11'),
(37, 10, 40, 'devolución', '2025-05-11'),
(38, 8 , 6 , 'extracción', '2025-05-12'),
(39, 4 , 3 , 'extracción', '2025-05-12'),
(40, 1 , 10, 'devolución', '2025-05-13');
GO


insert into Registro_Brigada (id_registro_brigada, id_brigada, id_voluntario, id_bombero, fecha, tipo_registro, rango)
values
(1 , 2 , 1   , null, '2025-05-10', 'inscripcion', 'ayudante'),
(2 , 3 , null, 1   , '2025-05-10', 'inscripcion', 'bombero'),
(3 , 4 , null, 2   , '2025-05-11', 'inscripcion', 'capitan'),
(4 , 6 , 2   , null, '2025-05-12', 'inscripcion', 'ayudante'),
(5 , 7 , 3   , null, '2025-05-13', 'inscripcion', 'asistente'),
(6 , 1 , null, 3   , '2025-05-13', 'inscripcion', 'teniente'),
(7 , 3 , 4   , null, '2025-05-14', 'inscripcion', 'ayudante'),
(8 , 2 , null, 4   , '2025-05-15', 'inscripcion', 'capitan'),
(9 , 9 , 5   , null, '2025-05-16', 'inscripcion', 'ayudante'),
(10, 8 , null, 5   , '2025-05-18', 'inscripcion', 'teniente'),
(11, 3 , null, 1   , '2025-05-21', 'salida'     , 'bombero'),
(12, 8 , null, 2   , '2025-05-22', 'salida'     , 'bombero'),
(13, 3 , null, 3   , '2025-05-23', 'salida'     , 'bombero'),
(14, 2 , null, 4   , '2025-05-24', 'salida'     , 'bombero'),
(15, 2 , 1   , null, '2025-05-10', 'salida'     , 'ayudante'),
(16, 3 , 2   , null, '2025-05-10', 'salida'     , 'bombero'),
(17, 4 , 3   , null, '2025-05-11', 'salida'     , 'capitan'),
(18, 6 , 4   , null, '2025-05-12', 'salida'     , 'ayudante');
GO

insert into Medicamento (id_medicamento, id_recurso, tipo_uso, fecha_vencimiento, unidad_medida, cantidad_unidad, num_unidades, contraindicaciones)
values
( 1, 1, 'oral', '2026-09-05', 'mg', 250.00, 40, 'Ulcera péptica activa'),
( 2, 2, 'oral', '2027-03-01', 'g', 1.00, 30, 'Menores de 6 años'),
( 3, 3, 'oral', '2025-11-25', 'mcg', 25.00, 50, 'Embarazo'),
( 4, 4, 'oral', '2028-01-22', 'ml', 5.00, 15, 'Alergia a alguno de sus componentes'),
( 5, 5, 'oral', '2026-01-15', 'mg', 500.00, 20, 'Hipersensibilidad al principio activo'),
( 6, 6, 'inhalatoria', '2026-04-12', 'dosis', 200.00, 1, 'No utilizar en crisis asmáticas agudas'),
( 7, 7, 'intramuscular', '2027-02-18', 'ml', 2.00, 12, 'Problemas de coagulación'),
( 8, 8, 'intravenosa', '2025-12-20', 'ml', 100.00, 5, 'Insuficiencia renal grave'),
( 9, 9, 'subcutánea', '2025-10-30', 'UI', 100.00, 8, null),
(10, 10, 'tópica', '2026-06-10', 'g', 30.00, 10, 'Piel irritada o con heridas');
GO

insert into Viveres (id_vivere, id_recurso, unidad_medida, cantidad_unidad, num_unidades, categoria, fecha_vencimiento)
values
(1 , 11, 'ml'     , 500.00, 100, 'bebida'    , '2026-05-01'),
(2 , 12, 'g'      , 500.00, 50 , 'cereal'    , '2025-12-15'),
(3 , 13, 'kg'     , 1.00  , 40 , 'grano'     , '2026-08-20'),
(4 , 14, 'g'      , 170.00, 60 , 'carne'     , '2027-01-10'),
(5 , 15, 'kg'     , 1.00  , 30 , 'grano'     , '2026-03-25'),
(6 , 16, 'g'      , 400.00, 25 , 'lácteo'    , '2025-11-30'),
(7 , 17, 'unidad' , 45.00 , 80 , 'cereal'    , '2025-09-05'),
(8 , 18, 'paquete', 200.00, 70 , 'panadería' , '2025-07-18'),
(9 , 19, 'litro'  , 1.00  , 35 , 'aceite'    , '2026-06-01'),
(10, 20, 'kg'     , 1.00  , 45 , 'endulzante', '2027-02-28');
GO

insert into Vehiculo (placa, id_recurso, tipo, modelo, ano_modelo, color)
values
('ABC-456', 22, 'terrestre', 'Actros 2645', 2018, 'amarillo'),
('N123AC' , 23, 'aéreo'    , 'AT-802F'    , 2020, 'blanco y rojo'),
('DEF-789', 24, 'terrestre', 'Hilux'      , 2022, 'blanco'),
('GHI-012', 25, 'terrestre', 'D7R'        , 2010, 'amarillo'),
('JKL-345', 26, 'terrestre', 'FH16'       , 2017, 'verde'),
('MNO-678', 27, 'terrestre', 'CRF250L'    , 2021, 'rojo'),
('PQR-901', 28, 'terrestre', 'Transit'    , 2019, 'blanco'),
('STU-234', 29, 'terrestre', '8345R'      , 2016, 'verde'),
('VWX-567', 30, 'aéreo'    , 'Mavic 3T'   , 2023, 'gris');
GO

insert into Herramientas (id_herramienta, id_recurso, cantidad, serie, tipo)
values
(1 , 31, 5 , 'MS271-001'   , 'motosierra'),
(2 , 32, 10, 'PB-FIB-001'  , 'pala'),
(3 , 33, 8 , 'HB-AC-001'   , 'hacha'),
(4 , 34, 20, 'MANG-15M-01' , 'manguera'),
(5 , 35, 15, 'CASCO-001'   , 'casco'),
(6 , 36, 12, 'LF-LED-01'   , 'linterna'),
(7 , 37, 6 , 'RADIO-001'   , 'radio'),
(8 , 38, 1 , 'KIT-HID-01'  , 'equipo de rescate'),
(9 , 39, 3 , 'DG-MULTI-01' , 'detector de gases'),
(10, 40, 7 , 'BOT-AVANZ-01', 'botiquín');
GO

insert into Donante (id_donante, ci, telefono, email)
values
(1, '7777888', '77778888', 'ana.rodriguez@email.com'),
(2, '4455667', '66554433', 'luis.perez@email.net'),
(3, '3322110', '70001111', 'maria.gonzales@email.org'),
(4, '6655443', '60606060', 'pedro.vargas@email.bo'),
(5, '1011121', '75757575', 'sofia.mamani@email.com');
GO

insert into Dona (id_donacion, id_recurso, id_donante, fecha, metodo)
values
( 1, 23, 3, '2024-08-15', 'fisico'),
( 2, 5 , 2, '2024-09-01', 'virtual'),
( 3, 31, 3, '2024-09-20', 'fisico'),
( 4, 7 , 3, '2024-10-05', 'virtual'),
( 5, 2 , 5, '2024-10-18', 'fisico'),
( 6, 38, 1, '2024-11-02', 'virtual'),
( 7, 4 , 1, '2024-11-16', 'fisico'),
( 8, 40, 3, '2024-12-01', 'virtual'),
( 9, 16, 1, '2024-12-15', 'fisico'),
(10, 10, 5, '2025-01-05', 'virtual');
GO


insert into Dicta (id_instructor, id_curso)
values
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 3),
(1, 5),
(2, 4),
(4, 5),
(5, 2);
GO

insert into Capacita (id_curso, id_voluntario, nota, fecha_inscripción, terminado)
values
(3, 5, 85.50, '2024-07-10', 'SI'),
(1, 2, 92.75, '2024-08-01', 'SI'),
(5, 1, 78.00, '2024-08-15', 'NO'),
(2, 2, 95.20, '2024-09-05', 'SI'),
(4, 2, 88.90, '2024-09-20', 'SI'),
(3, 3, 76.30, '2024-10-01', 'NO'),
(1, 4, 91.50, '2024-10-15', 'SI'),
(5, 5, 80.15, '2024-11-01', 'SI'),
(2, 3, 89.60, '2024-11-15', 'NO'),
(4, 3, 93.45, '2024-12-01', 'SI');
GO


-----------------
-----------------


-- Insertar datos en la tabla Gobernacion (referencian instituciones 6-10)
INSERT INTO Gobernacion (id_gobernación, id_intitución_gobernante, id_reporte, departamento, num_provincias, superficies)
VALUES
(1, 6, NULL, 'La Paz', 20, 133985.00),
(2, 7, NULL, 'Pando', 5, 63827.00),
(3, 8, NULL, 'Potosí', 16, 118218.00),
(4, 9, NULL, 'Santa Cruz', 15, 370621.00),
(5, 10, NULL, 'Potosí', 16, 118218.00);
GO

-- Insertar datos en la tabla Alcaldia (referencian gobernaciones 1-5)
INSERT INTO Alcaldia (id_alcaldia, id_intitución_gobernante, id_gobernación, num_consejales)
VALUES
(1, 6, 1, 11),
(2, 7, 2, 9),
(3, 8, 3, 7),
(4, 9, 4, 13),
(5, 10, 5, 8);
GO

-- Insertar datos en la tabla Municipio (referencian alcaldías 1-5)
INSERT INTO Municipio (id_municipio, id_alcaldia, nombre, clima, superficie, altitud)
VALUES
(1, 1, 'Viacha', 'Templado', 2280.50, 3850),
(2, 2, 'Cobija', 'Tropical', 4010.75, 280),
(3, 3, 'Uncía', 'Frío', 1250.25, 3750),
(4, 4, 'San Ignacio de Velasco', 'Cálido', 3560.80, 410),
(5, 5, 'Tupiza', 'Seco', 1890.30, 2950);
GO

-- Insertar datos en la tabla Reporte (no tiene dependencias)
INSERT INTO Reporte (id_reporte, id_incendio, carácter, mensaje)
VALUES
(1, 101, 'urgente', 'Incendio en viacha'),
(2, 102, 'prioritario', 'Fuego en cobija'),
(3, 103, 'rutinario', 'Reporte de humo'),
(4, 104, 'prioritario', 'Quema controlada'),
(5, 105, 'urgente', 'Emergencia en parque');
GO

-- Actualizar Gobernacion con los reportes (ahora que existen)
UPDATE Gobernacion SET id_reporte = 1 WHERE id_gobernación = 1;
UPDATE Gobernacion SET id_reporte = 2 WHERE id_gobernación = 2;
UPDATE Gobernacion SET id_reporte = 3 WHERE id_gobernación = 3;
UPDATE Gobernacion SET id_reporte = 4 WHERE id_gobernación = 4;
UPDATE Gobernacion SET id_reporte = 5 WHERE id_gobernación = 5;

-- Insertar datos en la tabla Area_Afectada (referencian municipios 1-5 e incendios 101-105)
INSERT INTO Area_Afectada (id_area, id_municipio, id_incendio, tipo_vegetacion, descripción, costo_daño, coordenadas, superficie)
VALUES
(1, 1, 101, 'forestal', 'Zona boscosa cercana a la carretera principal', 25000.00, '-16.6543, -68.3012', 15.50),
(2, 2, 102, 'urbana', 'Área residencial en las afueras de la ciudad', 180000.00, '-11.0333, -68.7333', 8.75),
(3, 3, 103, 'forestal', 'Reserva natural con vegetación densa', 75000.00, '-18.4667, -66.5667', 22.30),
(4, 4, 104, 'forestal', 'Terrenos agrícolas y pastizales', 15000.00, '-16.3667, -60.9500', 5.80),
(5, 5, 105, 'urbana', 'Parque municipal y zonas aledañas', 45000.00, '-21.4333, -65.7167', 12.40);
GO

-- Insertar datos en la tabla Afectado (referencian áreas 1-5 y personas existentes)
INSERT INTO Afectado (id_afectado, ci, id_area, telefono, ubicacion_domicilio, email, condición, idioma)
VALUES
(1, '7777111', 1, '77778888', 'Viacha, Zona Central, Calle Bolívar', 'juan.perez@email.com', 'herido', 'Español'),
(2, '3334445', 2, '66554433', 'Cobija, Barrio 2 de Febrero, Av. Internacional', 'maria.gomez@email.com', 'bueno', 'Español'),
(3, '4445556', 3, '70001111', 'Uncía, Zona Minera, Calle Principal', 'carlos.rodriguez@email.com', 'crítico', 'Quechua'),
(4, '6667778', 4, '60606060', 'San Ignacio de Velasco, Barrio Central, Calle Sucre', 'laura.flores@email.com', 'herido', 'Español'),
(5, '2228889', 5, '75757575', 'Tupiza, Villa Magisterial, Av. Universitaria', 'pedro.vargas@email.com', 'bueno', 'Español'),
(6, '7777888', 1, '77778888', 'Viacha, Zona Norte, Calle Junín', 'sofia.mamani@email.com', 'herido', 'Aymara'),
(7, '4455667', 2, '66554433', 'Cobija, Barrio El Progreso, Calle 18 de Noviembre', 'gabriel.torres@email.com', 'muerte', 'Español'),
(8, '3322110', 3, '70001111', 'Uncía, Zona Sur, Calle Potosí', 'paola.rivera@email.com', 'crítico', 'Quechua'),
(9, '6655443', 4, '60606060', 'San Ignacio de Velasco, Barrio Nuevo, Calle Cochabamba', 'luis.velasco@email.com', 'herido', 'Español'),
(10, '1011121', 5, '75757575', 'Tupiza, Barrio Ferroviario, Calle Estación', 'claudia.gutierrez@email.com', 'bueno', 'Español');
GO

-- Insertar datos en la tabla Bien (referencian afectados 1-10)
INSERT INTO Bien (id_bien, id_afectado, tipo, magnitud_dano, costo_dano)
VALUES
(1, 1, 'inmueble', 'severo', 15000.00),
(2, 1, 'mueble', 'leve', 2500.00),
(3, 2, 'inmueble', 'severo', 80000.00),
(4, 3, 'mueble', 'severo', 12000.00),
(5, 4, 'inmueble', 'leve', 5000.00),
(6, 5, 'mueble', 'leve', 1500.00),
(7, 6, 'inmueble', 'severo', 18000.00),
(8, 7, 'inmueble', 'severo', 95000.00),
(9, 8, 'mueble', 'severo', 8000.00),
(10, 9, 'inmueble', 'leve', 3000.00),
(11, 10, 'mueble', 'leve', 2000.00);
GO

-- Insertar datos en la tabla Acude (referencian brigadas 1-10 y áreas 1-5)
INSERT INTO Acude (id_brigada, id_area, evaluacion_respuesta, fecha_incursion, fecha_retirada)
VALUES
(1, 1, 'suficiente', '2025-05-15', '2025-05-18'),
(2, 2, 'insuficiente', '2025-05-20', NULL),
(3, 3, 'suficiente', '2025-04-28', '2025-05-02'),
(4, 4, 'suficiente', '2025-05-01', '2025-05-01'),
(5, 5, 'insuficiente', '2025-05-05', '2025-05-09'),
(6, 1, 'suficiente', '2025-05-16', '2025-05-18'),
(7, 2, 'insuficiente', '2025-05-21', NULL),
(8, 3, 'suficiente', '2025-04-30', '2025-05-02'),
(9, 4, 'suficiente', '2025-05-02', '2025-05-03'),
(10, 5, 'insuficiente', '2025-05-07', '2025-05-10');
GO

-- Insertar datos en la tabla Alerta (referencian organizaciones 1-10 y reportes 1-5)
INSERT INTO Alerta (id_organización, id_reporte, fecha, respuesta)
VALUES
(1, 1, '2025-05-15', 'aceptada'),
(2, 2, '2025-05-20', 'aceptada'),
(3, 3, '2025-04-28', 'rechazada'),
(4, 4, '2025-05-01', 'aceptada'),
(5, 5, '2025-05-05', 'aceptada'),
(6, 1, '2025-05-16', 'aceptada'),
(7, 2, '2025-05-21', 'pendiente'),
(8, 3, '2025-04-29', 'rechazada'),
(9, 4, '2025-05-02', 'aceptada'),
(10, 5, '2025-05-06', 'pendiente');
GO
