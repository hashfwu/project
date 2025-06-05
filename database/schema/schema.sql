CREATE DATABASE Bomberos;
GO

USE Bomberos;
GO

-- Tabla Curso

CREATE TABLE Curso (
	id_curso int IDENTITY(1,1) NOT NULL,
	nombre varchar(100),
	horas int,
	costo decimal(10,2),
	PRIMARY KEY (id_curso)
);
GO

-- Tabla Incendio

CREATE TABLE Incendio (
	id_incendio int IDENTITY(1,1) NOT NULL,
	tipo varchar(30),
	magnitud varchar(50),
	fecha_incio date,
	fecha_fin date,
	descripcion varchar(100),
	causa varchar(30),
	PRIMARY KEY (id_incendio)
);
GO

-- Tabla Institucion_Gobernante

CREATE TABLE Institucion_Gobernante (
	id_intitucion_gobernante int IDENTITY(1,1) NOT NULL,
	nombre varchar(100),
	sigla varchar(20),
	telefono varchar(20),
	ubicacion_sede varchar(150),
	email varchar(100),
	nombre_autoridad varchar(100),
	PRIMARY KEY (id_intitucion_gobernante)
);
GO

-- Tabla Organizacion

CREATE TABLE Organizacion (
	id_organizacion int IDENTITY(1,1) NOT NULL,
	telefono varchar(20),
	email varchar(100),
	ubicacion varchar(150),
	fecha_creacion date,
	tipo varchar(30),
	nombre varchar(100),
	PRIMARY KEY (id_organizacion)
);
GO

-- Tabla Persona

CREATE TABLE Persona (
	ci varchar(15) NOT NULL,
	expedido varchar(50),
	paterno varchar(50),
	materno varchar(50),
	nombre varchar(100),
	sexo varchar(10),
	fecha_nacimiento date,
	PRIMARY KEY (ci)
);
GO

CREATE TABLE Bombero (
	id_bombero int IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	telefono varchar(20),
	ubicacion_domicilio varchar(150),
	email varchar(100),
	tipo_sangre varchar(10),
	telefono_emergencia varchar(20),
	nombre_emergencia varchar(100),
	PRIMARY KEY (id_bombero),
	FOREIGN KEY (ci) REFERENCES Persona(ci)
);

-- Tabla Recurso

CREATE TABLE Recurso (
	id_recurso int IDENTITY(1,1) NOT NULL,
	nombre varchar(100),
	disponibilidad varchar(20),
	descripcion varchar(100),
	marca varchar(50),
	estado varchar(20),
	PRIMARY KEY (id_recurso)
);
GO

-- Tabla Brigada

CREATE TABLE Brigada (
	id_brigada int IDENTITY(1,1) NOT NULL,
	id_organizacion int,
	nombre varchar(100),
	fecha_creacion date,
	ubicacion_base_operaciones varchar(150),
	PRIMARY KEY (id_brigada),
	FOREIGN KEY (id_organizacion) REFERENCES Organizacion(id_organizacion)
);
GO

-- Tabla Dinero

CREATE TABLE Dinero (
	id_dinero int IDENTITY(1,1) NOT NULL,
	id_recurso int,
	cantidad int,
	moneda varchar(50),
	PRIMARY KEY (id_dinero),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Donante

CREATE TABLE Donante (
	id_donante int IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	telefono varchar(20),
	email varchar(100),
	PRIMARY KEY (id_donante),
	FOREIGN KEY (ci) REFERENCES Persona(ci)
);
GO

-- Tabla Enfermedad_Base

CREATE TABLE Enfermedad_Base (
	id_enfermedad_Base int IDENTITY(1,1) NOT NULL,
	id_bombero int,
	descripcion varchar(100),
	PRIMARY KEY (id_enfermedad_Base),
	FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero)
);
GO

-- Tabla Gobernacion

CREATE TABLE Gobernacion (
	id_gobernacion int IDENTITY(1,1) NOT NULL,
	id_intitucion_gobernante int,
	departamento varchar(50),
	num_provincias int,
	superficies decimal(10,2),
	PRIMARY KEY (id_gobernacion),
	FOREIGN KEY (id_intitucion_gobernante) REFERENCES Institucion_Gobernante(id_intitucion_gobernante)
);
GO

-- Tabla Herramienta

CREATE TABLE Herramienta (
	id_herramienta int IDENTITY(1,1) NOT NULL,
	id_recurso int,
	cantidad int,
	serie varchar(50),
	tipo varchar(50),
	PRIMARY KEY (id_herramienta),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Instructor

CREATE TABLE Instructor (
	id_instructor int IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	telefono varchar(20),
	email varchar(100),
	PRIMARY KEY (id_instructor),
	FOREIGN KEY (ci) REFERENCES Persona(ci)
);
GO

-- Tabla Medicamento

CREATE TABLE Medicamento (
	id_medicamento int IDENTITY(1,1) NOT NULL,
	id_recurso int,
	tipo_uso varchar(20),
	fecha_vencimiento date,
	unidad_medida varchar(10),
	cantidad_unidad decimal(10,2),
	num_unidades int,
	contraindicaciones varchar(100),
	PRIMARY KEY (id_medicamento),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Oficial

CREATE TABLE Oficial (
	id_oficial int IDENTITY(1,1) NOT NULL,
	id_bombero int,
	rango varchar(20),
	PRIMARY KEY (id_oficial),
	FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero)
);
GO

-- Tabla Provee

CREATE TABLE Provee (
	id_recurso int NOT NULL,
	id_intitucion_gobernante int NOT NULL,
	fecha date,
	PRIMARY KEY (id_intitucion_gobernante,id_recurso),
	FOREIGN KEY (id_intitucion_gobernante) REFERENCES Institucion_Gobernante(id_intitucion_gobernante),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Registro_Brigada

CREATE TABLE Registro_Brigada (
	id_registro_brigada int IDENTITY(1,1) NOT NULL,
	id_brigada int,
	id_bombero int,
	fecha date,
	tipo_registro varchar(20),
	rango varchar(20),
	disponibilidad varchar(20),
	PRIMARY KEY (id_registro_brigada),
	FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero),
	FOREIGN KEY (id_brigada) REFERENCES Brigada(id_brigada)
);
GO

-- Tabla Reporte

CREATE TABLE Reporte (
	id_reporte int IDENTITY(1,1) NOT NULL,
	id_incendio int,
	id_gobernacion int,
	caracter varchar(20),
	mensaje varchar(20),
	fecha date,
	PRIMARY KEY (id_reporte),
	FOREIGN KEY (id_incendio) REFERENCES Incendio(id_incendio),
	FOREIGN KEY (id_gobernacion) REFERENCES Gobernacion(id_gobernacion)
);
GO

-- Tabla Respuesta

CREATE TABLE Respuesta (
	id_respuesta int IDENTITY(1,1) NOT NULL,
	id_brigada int,
	id_incendio int,
	evaluacion_respuesta varchar(100),
	fecha_incursion date,
	fecha_retirada date,
	resultado_operacion varchar(100),
	PRIMARY KEY (id_respuesta),
	FOREIGN KEY (id_brigada) REFERENCES Brigada(id_brigada),
	FOREIGN KEY (id_incendio) REFERENCES Incendio(id_incendio)
);
GO

-- Tabla Vehiculo

CREATE TABLE Vehiculo (
	placa varchar(20) NOT NULL,
	id_recurso int,
	tipo varchar(50),
	modelo varchar(50),
	ano_modelo int,
	color varchar(30),
	PRIMARY KEY (placa),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Vivere

CREATE TABLE Vivere (
	id_vivere int IDENTITY(1,1) NOT NULL,
	id_recurso int,
	unidad_medida varchar(10),
	cantidad_unidad decimal(10,2),
	num_unidades int,
	categoria varchar(30),
	fecha_vencimiento date,
	PRIMARY KEY (id_vivere),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Voluntario

CREATE TABLE Voluntario (
	id_voluntario int IDENTITY(1,1) NOT NULL,
	id_bombero int,
	disponibilidad varchar(20),
	PRIMARY KEY (id_voluntario),
	FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero)
);
GO

-- Tabla Alcaldia

CREATE TABLE Alcaldia (
	id_alcaldia int IDENTITY(1,1) NOT NULL,
	id_intitucion_gobernante int,
	id_gobernacion int,
	num_consejales int,
	PRIMARY KEY (id_alcaldia),
	FOREIGN KEY (id_gobernacion) REFERENCES Gobernacion(id_gobernacion),
	FOREIGN KEY (id_intitucion_gobernante) REFERENCES Institucion_Gobernante(id_intitucion_gobernante)
);
GO

-- Tabla Alerta

CREATE TABLE Alerta (
	id_organizacion int NOT NULL,
	id_reporte int NOT NULL,
	fecha date,
	respuesta varchar(30),
	PRIMARY KEY (id_organizacion,id_reporte),
	FOREIGN KEY (id_organizacion) REFERENCES Organizacion(id_organizacion),
	FOREIGN KEY (id_reporte) REFERENCES Reporte(id_reporte)
);
GO

-- Tabla Capacita

CREATE TABLE Capacita (
	id_curso int NOT NULL,
	id_voluntario int NOT NULL,
	nota decimal(5,2),
	fecha_inscripcion date,
	terminado varchar(2),
	pagado varchar(2),
	PRIMARY KEY (id_curso,id_voluntario),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
	FOREIGN KEY (id_voluntario) REFERENCES Voluntario(id_voluntario)
);
GO

-- Tabla Dicta

CREATE TABLE Dicta (
	id_instructor int NOT NULL,
	id_curso int NOT NULL,
	fecha_inicio date,
	fecha_fin date,
	PRIMARY KEY (id_instructor,id_curso),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
	FOREIGN KEY (id_instructor) REFERENCES Instructor(id_instructor)
);
GO

-- Tabla Dona

CREATE TABLE Dona (
	id_donacion int IDENTITY(1,1) NOT NULL,
	id_recurso int NOT NULL,
	id_donante int,
	fecha date,
	metodo varchar(20),
	PRIMARY KEY (id_donacion),
	FOREIGN KEY (id_donante) REFERENCES Donante(id_donante),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso)
);
GO

-- Tabla Municipio

CREATE TABLE Municipio (
	id_municipio int IDENTITY(1,1) NOT NULL,
	id_alcaldia int,
	nombre varchar(100),
	clima varchar(50),
	superficie decimal(10,2),
	altitud int,
	PRIMARY KEY (id_municipio),
	FOREIGN KEY (id_alcaldia) REFERENCES Alcaldia(id_alcaldia)
);
GO

-- Tabla Participacion_Bombero

CREATE TABLE Participacion_Bombero (
	id_bombero int,
	id_participacion_bombero int IDENTITY(1,1) NOT NULL,
	id_respuesta int,
	inicio_incursion date,
	fin_incursion date,
	PRIMARY KEY (id_participacion_bombero),
	FOREIGN KEY (id_bombero) REFERENCES Bombero(id_bombero),
	FOREIGN KEY (id_respuesta) REFERENCES Respuesta(id_respuesta)
);
GO

-- Tabla Registro_Recurso

CREATE TABLE Registro_Recurso (
	id_registro_recurso int IDENTITY(1,1) NOT NULL,
	id_recurso int,
	id_respuesta int,
	tipo varchar(20),
	fecha date,
	PRIMARY KEY (id_registro_recurso),
	FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso),
	FOREIGN KEY (id_respuesta) REFERENCES Respuesta(id_respuesta)
);
GO

-- Tabla Area_Afectada

CREATE TABLE Area_Afectada (
	id_area int IDENTITY(1,1) NOT NULL,
	id_municipio int,
	tipo_vegetacion varchar(30),
	descripcion varchar(100),
	coordenadas varchar(100),
	superficie decimal(10,2),
	PRIMARY KEY (id_area),
	FOREIGN KEY (id_municipio) REFERENCES Municipio(id_municipio)
);
GO

-- Tabla Es_Afectado

CREATE TABLE Es_Afectado (
	id_area int,
	id_incendio int,
	costo_dano decimal(10,2),
	FOREIGN KEY (id_area) REFERENCES Area_Afectada(id_area),
	FOREIGN KEY (id_incendio) REFERENCES Incendio(id_incendio)
);
GO

-- Tabla Afectado

CREATE TABLE Afectado (
	id_afectado int IDENTITY(1,1) NOT NULL,
	ci varchar(15),
	id_area int,
	telefono varchar(20),
	email varchar(100),
	ubicacion_domicilio varchar(150),
	condicion varchar(20),
	PRIMARY KEY (id_afectado),
	FOREIGN KEY (ci) REFERENCES Persona(ci),
	FOREIGN KEY (id_area) REFERENCES Area_Afectada(id_area)
);
GO

-- Tabla Bien

CREATE TABLE Bien (
	id_bien int IDENTITY(1,1) NOT NULL,
	id_afectado int,
	tipo varchar(20),
	magnitud_dano varchar(20),
	costo_dano decimal(10,2),
	PRIMARY KEY (id_bien),
	FOREIGN KEY (id_afectado) REFERENCES Afectado(id_afectado)
);
GO
