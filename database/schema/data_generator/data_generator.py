import random
import string
from datetime import datetime, timedelta
from funtions_and_data import *


def generate_random_incendio_data(num_records=20):

    result = '-- Incendio\n'
    
    tipos = ['superficie', 'copa', 'subterraneo']
    magnitudes = ['leve', 'grave', 'medio']
    descripciones = [
        'Incendio forestal en el Parque Nacional Madidi, afectando biodiversidad',
        'Fuego incontrolable en el área protegida de San Matías, cerca de la frontera',
        'Quema descontrolada en tierras agrícolas cerca de Santa Cruz de la Sierra',
        'Incendio en la Amazonía boliviana, con riesgo para comunidades indígenas',
        'Conato de incendio en el Bosque Seco Chiquitano, bajo control',
        'Varios focos de calor detectados en el departamento de Beni',
        'Incendio provocado por chaqueo ilegal en la zona del Chaco boliviano',
        'Humo denso por incendios en la región de los Yungas, afectando visibilidad',
        'Incendio de pastizales en el altiplano, cerca de Oruro',
        'Emergencia por incendio en zona de amortiguamiento del Parque Noel Kempff Mercado',
        'Fuego en la serranía de Sama, Tarija, con riesgo para fuentes de agua',
        'Incendio en zonas de interfase urbano-forestal en Cochabamba',
        'Reporte de quemas en el Pantanal boliviano, impactando fauna local',
        'Incendio en área protegida de Kaa-Iya del Gran Chaco, difícil acceso',
        'Rebrotes de fuego en zonas previamente afectadas por incendios en 2019',
        'Incendio en la Chiquitania',
        'Incendio cerca de pueblos',
        'Incendio en reserva'
    ]
    causas = ['chaqueo', 'loteo', 'desconocido']

    sql_statements = []

    for _ in range(num_records):
        tipo = random.choice(tipos)
        magnitud = random.choice(magnitudes)
        descripcion = random.choice(descripciones)
        causa = random.choice(causas)

        # Generate random start date between 2010 and 2025
        start_date = datetime(2010, 1, 1) + timedelta(days=random.randint(0, 365 * 16))

        # Generate end date between 1 month and 1 year after start date
        end_date = start_date + timedelta(days=random.randint(30, 365))

        # Format dates for SQL
        fecha_incio_str = start_date.strftime('%Y-%m-%d')
        fecha_fin_str = end_date.strftime('%Y-%m-%d')

        insert_statement = (
            f"INSERT INTO Incendio (tipo, magnitud, fecha_incio, fecha_fin, descripcion, causa) "
            f"VALUES ('{tipo}', '{magnitud}', '{fecha_incio_str}', '{fecha_fin_str}', '{descripcion}', '{causa}');"
        )
        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement
    
    result += '\n'

    return result

def generate_random_curso_data(num_records=20):
    result = '-- Curso\n'

    nombres_curso = [
        'Manejo de incendios forestales',
        'Educación ambiental y conservación',
        'Cartografía y sistemas de información geográfica',
        'Técnicas de reforestación y restauración ecológica',
        'Uso de drones para monitoreo ambiental',
        'Capacitación en brigadas contra incendios',
        'Gestión de áreas protegidas',
        'Prevención de quemas y chaqueos ilegales',
        'Botánica básica para guardaparques',
        'Cambio climático y resiliencia comunitaria',
        'Ecología del fuego',
        'Evaluación de daños post-incendio',
        'Sistemas de alerta temprana',
        'Comunicación ambiental efectiva',
        'Leyes y políticas ambientales de Bolivia',
        'Educación ambiental para niños',
        'Técnicas de supervivencia en la selva',
        'Primeros auxilios en áreas rurales',
        'Taller de reciclaje y residuos sólidos',
        'Liderazgo comunitario para conservación'
    ]

    sql_statements = []

    for _ in range(num_records):
        nombre = random.choice(nombres_curso)

        # Generar horas entre 10 y 100
        horas = random.randint(10, 100)

        # Generar costo entre 100.00 y 1500.00
        costo = round(random.uniform(100.0, 1500.0), 2)

        insert_statement = (
            f"INSERT INTO Curso (nombre, horas, costo) "
            f"VALUES ('{nombre}', {horas}, {costo});"
        )
        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_gobernacion_data():
    result = '-- Gobernacion\n'

    sql_statements = []

    for gobernacion in gobernaciones:

        insert_statement = (
            f"EXEC register_gobernacion_sp\n"
            f"    @nombre_institucion = '{gobernacion['nombre']}',\n"
            f"    @sigla_institucion = '{gobernacion['sigla']}',\n"
            f"    @telefono_institucion = '{gobernacion['telefono']}',\n"
            f"    @ubicacion_sede_institucion = '{gobernacion['ubicacion']}',\n"
            f"    @email_institucion = '{gobernacion['email']}',\n"
            f"    @nombre_autoridad_institucion = '{gobernacion['nombre_autoridad']}',\n"
            f"    @departamento_gobernacion = '{gobernacion['departamento']}',\n"
            f"    @num_provincias = '{gobernacion['num_provincias']}',\n"
            f"    @superficies = '{gobernacion['superficies']}';\n"
            f"    GO"

        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_alcaldia_data():
    result = '-- Alcaldia\n'
    
    climas_municipios = ['calido', 'templado', 'frio']
    sql_statements = []

    for municipio in municipios:
        nombre_alcaldia = f"Alcaldia Municipal de {municipio}"
        
        insert_statement = (
            f"EXEC register_alcaldia_sp\n"
            f"    @nombre_institucion = '{nombre_alcaldia}',\n"
            f"    @sigla_institucion = '{obtener_siglas(nombre_alcaldia)}',\n"
            f"    @telefono_institucion = '{generar_telefono()}',\n"
            f"    @ubicacion_sede_institucion = '{generar_ubicacion_aleatoria()}',\n"
            f"    @email_institucion = '{generar_email_aleatorio(nombre_alcaldia)}',\n"
            f"    @nombre_autoridad_institucion = '{generar_nombre_completo_aleatorio()}',\n"
            f"    @id_gobernacion_alcaldia = {random.randint(1,9)},\n"
            f"    @num_consejales_alcaldia = {random.randint(2,15)},\n"
            f"    @nombre_municipio = '{municipio}',\n"
            f"    @clima_municipio = '{random.choice(climas_municipios)}',\n"
            f"    @superficie_municipio = {generar_superficie()},\n"
            f"    @altitud_municipio = {random.randint(2500, 4500)};\n"
            f"    GO"
            
        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_organizacion_data(num_records=20):
    result = '-- Organizacion\n'
    
    tipos = ['ONG', 'gubernamental', 'internacional', 'local']
    nombres = [
        'Fundación Amigos de la Naturaleza',
        'Bolivia Verde',
        'Rescate Amazonía',
        'Protección del Bosque Chiquitano',
        'Sociedad para la Conservación del Pantanal',
        'Red Ambiental Andina',
        'Defensores del Gran Chaco',
        'EcoGuardianes',
        'Brigadas Verdes Bolivia',
        'Observatorio Ambiental Nacional',
        'Instituto de Estudios Ecológicos',
        'Conservación y Desarrollo Sostenible',
        'Bosques Vivos',
        'Alianza por la Naturaleza',
        'Proyecto Vida Silvestre',
        'EcoBolivia',
        'Guardianes del Fuego',
        'Red de Protección Forestal',
        'Comunidad Verde',
        'Aliados del Medio Ambiente'
    ]

    sql_statements = []

    for i in range(num_records):
        tipo = random.choice(tipos)
        nombre = nombres[i % len(nombres)]
        ubicacion = generar_ubicacion_aleatoria()

        # Email a partir del nombre (formato simple)
        email = generar_email_aleatorio(nombre)

        # Teléfono ficticio boliviano (formato genérico)
        telefono = generar_telefono()

        # Fecha de creación aleatoria entre 1995 y 2023
        fecha_creacion = datetime(1995, 1, 1) + timedelta(days=random.randint(0, 365 * 28))
        fecha_creacion_str = fecha_creacion.strftime('%Y-%m-%d')

        insert_statement = (
            f"INSERT INTO Organizacion (telefono, email, ubicacion, fecha_creacion, tipo, nombre) "
            f"VALUES ('{telefono}', '{email}', '{ubicacion}', '{fecha_creacion_str}', '{tipo}', '{nombre}');"
        )
        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'

    return result

def generate_random_area_afectada_data(num_records=200, municipio_ids=range(1, 330)):
    result = '-- Area Afectada\n'
    
    tipo_vegetaciones = [
        'bosque seco', 'bosque húmedo', 'pampa', 'pantanal', 'sabana', 
        'selva amazónica', 'matorral', 'pastizal', 'bosque montano', 'chaparral'
    ]
    
    descripciones = [
        'Zona afectada por incendio reciente',
        'Área parcialmente quemada, regeneración en curso',
        'Vegetación completamente destruida',
        'Región con alto impacto ambiental',
        'Zona crítica de biodiversidad dañada',
        'Área fragmentada por focos de calor',
        'Pérdida significativa de cobertura vegetal',
        'Zona protegida con daños severos',
        'Área con riesgo de desertificación',
        'Evidencia de degradación ecológica avanzada'
    ]

    sql_statements = []

    for _ in range(num_records): 
        tipo_vegetacion = random.choice(tipo_vegetaciones)
        descripcion = random.choice(descripciones)
        coordenadas = generar_coordenadas()
        superficie = generar_superficie()
        id_municipio = random.choice(municipio_ids)

        insert_statement = (
            f"INSERT INTO Area_Afectada (id_municipio, tipo_vegetacion, descripcion, coordenadas, superficie) "
            f"VALUES ({id_municipio}, '{tipo_vegetacion}', '{descripcion}', '{coordenadas}', {superficie});"
        )
        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    return result

def generate_random_afectado_data(num_records=150, area_afectada_id=range(1, 200)):
    result = '-- Afectado\n'
    
    sql_statements = []
    
    for _ in range(num_records):
        persona = generar_persona()
        insert_statement = (
            f"EXEC register_afectado_sp\n"
            f"    @ci_persona = '{persona['ci']}',\n"
            f"    @expedido_persona = '{persona['expedido']}',\n"
            f"    @paterno_persona = '{persona['paterno']}',\n"
            f"    @materno_persona = '{persona['materno']}',\n"
            f"    @nombre_persona = '{persona['nombre']}',\n"
            f"    @sexo_persona = '{persona['sexo']}',\n"
            f"    @fecha_nacimiento_persona = '{persona['fecha_nacimiento']}',\n"
            f"    @id_area_afectado = {random.choice(area_afectada_id)},\n"
            f"    @telefono_afectado = '{generar_telefono()}',\n"
            f"    @email_afectado = '{persona['email']}',\n"
            f"    @ubicacion_domicilio_afectado = '{generar_ubicacion_aleatoria()}',\n"
            f"    @condicion_afectado = '{random.choice(['malo', 'herido', 'fallecido'])}';\n"
            f"    GO"
        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_donante_data(num_records=150):
    result = '-- Donante\n'
    
    sql_statements = []
    
    for _ in range(num_records):
        persona = generar_persona()
        insert_statement = (
            f"EXEC register_donante_sp\n"
            f"    @ci_persona = '{persona['ci']}',\n"
            f"    @expedido_persona = '{persona['expedido']}',\n"
            f"    @paterno_persona = '{persona['paterno']}',\n"
            f"    @materno_persona = '{persona['materno']}',\n"
            f"    @nombre_persona = '{persona['nombre']}',\n"
            f"    @sexo_persona = '{persona['sexo']}',\n"
            f"    @fecha_nacimiento_persona = '{persona['fecha_nacimiento']}',\n"
            f"    @telefono_donante = '{persona['telefono']}',\n"
            f"    @email_donante = '{persona['email']}';\n"
            f"    GO"
        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_instructor_data(num_records=150):
    result = '-- Instructor\n'
    
    sql_statements = []
    
    for _ in range(num_records):
        persona = generar_persona()
        insert_statement = (
            f"EXEC register_instructor_sp\n"
            f"    @ci_persona = '{persona['ci']}',\n"
            f"    @expedido_persona = '{persona['expedido']}',\n"
            f"    @paterno_persona = '{persona['paterno']}',\n"
            f"    @materno_persona = '{persona['materno']}',\n"
            f"    @nombre_persona = '{persona['nombre']}',\n"
            f"    @sexo_persona = '{persona['sexo']}',\n"
            f"    @fecha_nacimiento_persona = '{persona['fecha_nacimiento']}',\n"
            f"    @telefono_instructor = '{persona['telefono']}',\n"
            f"    @email_instructor = '{persona['email']}';\n"
            f"    GO"
        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_oficial_data(num_records=150):
    result = '-- Oficial\n'
    
    sql_statements = []
    
    for _ in range(num_records):
        persona = generar_persona()
        insert_statement = (
            f"EXEC register_oficial_sp\n"
            f"    @ci_persona = '{persona['ci']}',\n"
            f"    @expedido_persona = '{persona['expedido']}',\n"
            f"    @paterno_persona = '{persona['paterno']}',\n"
            f"    @materno_persona = '{persona['materno']}',\n"
            f"    @nombre_persona = '{persona['nombre']}',\n"
            f"    @sexo_persona = '{persona['sexo']}',\n"
            f"    @fecha_nacimiento_persona = '{persona['fecha_nacimiento']}',\n"
            f"    @telefono_bombero = '{persona['telefono']}',\n"
            f"    @ubicacion_domicilio_bombero = '{generar_ubicacion_aleatoria()}',\n"
            f"    @email_bombero = '{persona['email']}',\n"
            f"    @tipo_sangre_bombero = '{random.choice(['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'])}',\n"
            f"    @telefono_emergencia_bombero = '{generar_telefono()}',\n"
            f"    @nombre_emergencia_bombero = '{generar_nombre_completo_aleatorio()}',\n"
            f"    @rango_oficial = '{random.choice(["Aspirante", "Operador de Vehículos", "Teniente", "Capitán", "Jefe de Brigada", "Subjefe de Brigada", "Jefe de Bomberos"])}';\n"
            f"    GO"
        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_capacita_data(num_records=100):
    result = '-- Capacita\n'


    sql_statements = []

    for _ in range(num_records):
        insert_statement = (
            f"INSERT INTO Capacita"
            f" VALUES ("
            f"(SELECT TOP 1 id_curso FROM Curso ORDER BY NEWID()),"
            f"(SELECT TOP 1 id_voluntario FROM Voluntario ORDER BY NEWID()),"
            f"{random.randint(0, 100)},"
            f"'{generar_fecha_aleatoria('2015-01-01', '2025-01-01')}',"
            f"'{random.choice(['si', 'no'])}',"
            f"'{random.choice(['si', 'no'])}'"
            f");"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result


def generate_random_voluntario_data(num_records=150):
    result = '-- Voluntario\n'
    
    sql_statements = []
    
    for _ in range(num_records):
        persona = generar_persona()
        insert_statement = (
            f"EXEC register_voluntario_sp\n"
            f"    @ci_persona = '{persona['ci']}',\n"
            f"    @expedido_persona = '{persona['expedido']}',\n"
            f"    @paterno_persona = '{persona['paterno']}',\n"
            f"    @materno_persona = '{persona['materno']}',\n"
            f"    @nombre_persona = '{persona['nombre']}',\n"
            f"    @sexo_persona = '{persona['sexo']}',\n"
            f"    @fecha_nacimiento_persona = '{persona['fecha_nacimiento']}',\n"
            f"    @telefono_bombero = '{persona['telefono']}',\n"
            f"    @ubicacion_domicilio_bombero = '{generar_ubicacion_aleatoria()}',\n"
            f"    @email_bombero = '{persona['email']}',\n"
            f"    @tipo_sangre_bombero = '{random.choice(['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'])}',\n"
            f"    @telefono_emergencia_bombero = '{generar_telefono()}',\n"
            f"    @nombre_emergencia_bombero = '{generar_nombre_completo_aleatorio()}',\n"
            f"    @disponibilidad = '{random.choice(["diponible", "no diponible"])}';\n"
            f"    GO"
        )

        sql_statements.append(insert_statement)

    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_dicta_data(num_records=100):
    result = '-- Dicta\n'


    sql_statements = []

    for _ in range(num_records):
        fecha_inicio = generar_fecha_aleatoria('2015-01-01', '2024-01-01')
        fecha_fin = generar_fecha_aleatoria(fecha_inicio, '2024-01-01')
        insert_statement = (
            f"INSERT INTO Dicta"
            f" VALUES ("
            f"(SELECT TOP 1 id_instructor FROM Instructor ORDER BY NEWID()),"
            f"(SELECT TOP 1 id_curso FROM Curso ORDER BY NEWID()),"
            f"'{fecha_inicio}',"
            f"'{fecha_fin}'"
            f");"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_brigada_data():
    result = '-- Brigada\n'


    sql_statements = []

    for nombre_brigada in nombre_brigadas:
        insert_statement = (
            f"INSERT INTO Brigada"
            f" VALUES ("
            f"(SELECT TOP 1 id_organizacion FROM Organizacion ORDER BY NEWID()),"
            f"'{nombre_brigada}',"
            f"'{generar_fecha_aleatoria('2015-01-01', '2024-01-01')}',"
            f"'{generar_ubicacion_aleatoria()}'"
            f");"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_donacion_vivere_data(num_records=50):
    result = '-- Vivere donacion\n'

    sql_statements = []

    for _ in range(num_records):
        vivere = random.choice(viveres)
        insert_statement = (
            f"SELECT TOP 1 @v_id_donante = id_donante FROM Donante ORDER BY NEWID();\n"
            f"EXEC register_donacion_vivere_sp "
            f"@v_id_donante,"
            f"'{generar_fecha_aleatoria('2014-01-01', '2025-01-01')}',"
            f"'fisico',"
            f"'{vivere['nombre']}',"
            f"'{random.choice(['disponible', 'no disponible'])}',"
            f"'{vivere['descripcion']}',"
            f"'{vivere['marca']}',"
            f"'{random.choice(['bueno', 'malo', 'regular'])}',"
            f"'{vivere['medida']}',"
            f"{random.uniform(10,100):.2f},"
            f"{random.randint(2,100)},"
            f"'{vivere['categoria']}',"
            f"'{generar_fecha_aleatoria('2024-01-01', '2028-01-01')}'"
            f";"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_donacion_medicamento_data(num_records=50):
    result = '-- Medicamento donacion\n'

    sql_statements = []

    for _ in range(num_records):
        medicamento = random.choice(medicamentos)
        insert_statement = (
            f"SELECT TOP 1 @v_id_donante = id_donante FROM Donante ORDER BY NEWID();\n"
            f"EXEC register_donacion_medicamento_sp "
            f"@v_id_donante,"
            f"'{generar_fecha_aleatoria('2014-01-01', '2025-01-01')}',"
            f"'fisico',"
            f"'{medicamento['nombre']}',"
            f"'{random.choice(['disponible', 'no disponible'])}',"
            f"'{medicamento['descripcion']}',"
            f"'{random.choice(marca_medicamentos)}',"
            f"'{random.choice(['bueno', 'malo', 'regular'])}',"
            f"'{medicamento['uso']}',"
            f"'{generar_fecha_aleatoria('2024-01-01', '2028-01-01')}',"
            f"'{medicamento['medida']}',"
            f"{random.uniform(10,100):.2f},"
            f"{random.randint(2,100)},"
            f"'{medicamento['contraindicaciones']}'"
            f";"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_donacion_herramienta_data(num_records=50):
    result = '-- Herramienta donacion\n'

    sql_statements = []

    for _ in range(num_records):
        herramienta = random.choice(herramientas)
        insert_statement = (
            f"SELECT TOP 1 @v_id_donante = id_donante FROM Donante ORDER BY NEWID();\n"
            f"EXEC register_donacion_herramienta_sp "
            f"@v_id_donante,"
            f"'{generar_fecha_aleatoria('2014-01-01', '2025-01-01')}',"
            f"'fisico',"
            f"'{herramienta['nombre']}',"
            f"'{random.choice(['disponible', 'no disponible'])}',"
            f"'{herramienta['descripcion']}',"
            f"'{random.choice(marca_herramientas)}',"
            f"'{random.choice(['bueno', 'malo', 'regular'])}',"
            f"{random.randint(1,20)},"
            f"'{generar_numero_serie()}',"
            f"'{herramienta['tipo']}'"
            f";"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_donacion_vehiculo_data(num_records=50):
    result = '-- Vehiculo donacion\n'

    sql_statements = []

    for _ in range(num_records):
        vehiculo = random.choice(vehiculos)
        modelo = random.choice(modelo_vehiculos)
        nombre = vehiculo['tipo'] + ' ' + modelo
        insert_statement = (
            f"SELECT TOP 1 @v_id_donante = id_donante FROM Donante ORDER BY NEWID();\n"
            f"EXEC register_donacion_vehiculo_sp "
            f"@v_id_donante,"
            f"'{generar_fecha_aleatoria('2014-01-01', '2025-01-01')}',"
            f"'fisico',"
            f"'{nombre}',"
            f"'{random.choice(['disponible', 'no disponible'])}',"
            f"'{vehiculo['descripcion']}',"
            f"'{random.choice(marca_vehiculos)}',"
            f"'{random.choice(['bueno', 'malo', 'regular'])}',"
            f"'{generar_placa()}',"
            f"'{vehiculo['tipo']}',"
            f"'{modelo}',"
            f"{random.randint(1980, 2020)},"
            f"'{random.choice(colores)}'"
            f";"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

def generate_random_donacion_dinero_data(num_records=50):
    result = '-- Dinero donacion\n'

    sql_statements = []

    for _ in range(num_records):
        monto = random.randint(100, 5000)
        moneda = random.choice(['bolivianos', 'dolares', 'euros'])
        insert_statement = (
            f"SELECT TOP 1 @v_id_donante = id_donante FROM Donante ORDER BY NEWID();\n"
            f"EXEC register_donacion_dinero_sp "
            f"@v_id_donante,"
            f"'{generar_fecha_aleatoria('2014-01-01', '2025-01-01')}',"
            f"'fisico',"
            f"'Monto {moneda} {monto}',"
            f"'{random.choice(['disponible', 'no disponible'])}',"
            f"NULL,"
            f"NULL,"
            f"NULL,"
            f"'{monto}',"
            f"'{moneda}'"
            f";"
        )
        sql_statements.append(insert_statement)
    for statement in sql_statements:
        result += '\n' + statement

    result += '\n'
    
    return result

if __name__ == "__main__":
    
    file_name = 'output_data.sql'
    
    sql_statements = []
    
    sql_statements.append(generate_random_incendio_data(num_records=30))
    sql_statements.append(generate_random_curso_data(num_records=30))
    sql_statements.append(generate_random_gobernacion_data())
    sql_statements.append(generate_random_alcaldia_data())
    sql_statements.append(generate_random_organizacion_data())
    sql_statements.append(generate_random_area_afectada_data())
    sql_statements.append(generate_random_afectado_data())
    sql_statements.append(generate_random_donante_data())
    sql_statements.append(generate_random_instructor_data())
    sql_statements.append(generate_random_oficial_data())
    sql_statements.append(generate_random_voluntario_data())
    sql_statements.append(generate_random_capacita_data())
    sql_statements.append(generate_random_dicta_data())
    sql_statements.append(generate_random_brigada_data())
    sql_statements.append('\nDECLARE @v_id_donante INT;\n')
    sql_statements.append(generate_random_donacion_vivere_data())
    sql_statements.append(generate_random_donacion_medicamento_data())
    sql_statements.append(generate_random_donacion_herramienta_data())
    sql_statements.append(generate_random_donacion_vehiculo_data())
    sql_statements.append(generate_random_donacion_dinero_data())
    
    try:
        with open(f'database/schema/data_generator/{file_name}', 'w', encoding='utf-8') as f:
            for sql_statement in sql_statements:
                f.write(sql_statement + '\n')
        print(f"Successfully generated '{file_name}'")
    except IOError as e:
        print(f"Error writing to file: {e}")