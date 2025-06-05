from datetime import datetime, timedelta
import string
import random

def generar_telefono():
    digitos_aleatorios = [str(random.randint(0, 9)) for _ in range(7)]
    numero_telefono = '7' + ''.join(digitos_aleatorios)
    return numero_telefono

def obtener_siglas(cadena_texto):
    palabras = cadena_texto.split()
    iniciales = [palabra[0] for palabra in palabras]
    siglas_unidas = "".join(iniciales)
    siglas_finales = siglas_unidas.upper()
    return siglas_finales

def generar_email_aleatorio(usuario):
    dominios_email = ['@gmail.com', '@outlook.com', '@hotmail.com', '@eco.org.bo', '@medioambiente.bo']
    username = usuario.lower().replace(' ', '_').replace('ñ', 'n')
    email_aleatorio = username + random.choice(dominios_email)
    return email_aleatorio

def generar_ubicacion_aleatoria():
    zonas = [
        "Centro", "Sopocachi", "Miraflores", "San Pedro", "Calacoto",
        "Achumani", "Obrajes", "Zona Sur", "Villa Fátima", "El Tejar",
        "Cota Cota", "San Miguel", "Irpavi", "Mallasa", "Mallasilla",
        "Següencoma", "San Antonio", "Pura Pura", "Vino Tinto", "San Jorge",
        "Tembladerani", "Alto Sopocachi", "Pasankeri", "Bajo Sopocachi", "Ciudadela Ferroviaria",
        "Achachicala", "Chuquiaguillo", "Llojeta", "Callapa", "Aranjuez"
    ]
    avenidas = [
        "16 de Julio", "Arce", "Saavedra", "Montes", "Busch",
        "Hernando Siles", "Costanera", "Libertador", "América", "Landaeta",
        "Mariscal Santa Cruz", "Camacho", "Illimani", "Bustamante", "Perú",
        "Brasil", "Del Poeta", "República", "Las Américas", "Argentina",
        "Washington", "6 de Agosto", "Bolívar", "Héctor Ormachea", "Fray Saracho",
        "Guillermo Franco", "Buenos Aires", "Simón Bolívar", "Jaime Mendoza", "Estado Plurinacional"
    ]

    zona_elegida = random.choice(zonas)
    avenida_elegida = random.choice(avenidas)
    numero_puerta = random.randint(1, 999)
    ubicacion_aleatoria = (
        f"Zona {zona_elegida}, Avenida {avenida_elegida} N {numero_puerta}"
    )

    return ubicacion_aleatoria


gobernaciones = [
    {
        'nombre': 'Gobernación de La Paz',
        'sigla': 'GDL',
        'telefono': '22812345',
        'ubicacion': 'Av. Mariscal Santa Cruz, Edificio Central, La Paz',
        'email': 'contacto@lapaz.gob.bo',
        'nombre_autoridad': 'Juan Carlos Aguilar',
        'departamento': 'La Paz',
        'num_provincias': 20,
        'superficies': 133985.0
    },
    {
        'nombre': 'Gobernación de Santa Cruz',
        'sigla': 'GDSC',
        'telefono': '33567890',
        'ubicacion': 'Av. Omar Chávez Ortiz, Santa Cruz de la Sierra',
        'email': 'contacto@santacruz.gob.bo',
        'nombre_autoridad': 'Luis Fernando Camacho',
        'departamento': 'Santa Cruz',
        'num_provincias': 15,
        'superficies': 370621.0
    },
    {
        'nombre': 'Gobernación de Cochabamba',
        'sigla': 'GDC',
        'telefono': '42567891',
        'ubicacion': 'Plaza Colón, Edificio Gobernación, Cochabamba',
        'email': 'contacto@cochabamba.gob.bo',
        'nombre_autoridad': 'Humberto Sánchez',
        'departamento': 'Cochabamba',
        'num_provincias': 16,
        'superficies': 55531.0
    },
    {
        'nombre': 'Gobernación de Oruro',
        'sigla': 'GDO',
        'telefono': '52812347',
        'ubicacion': 'Calle Presidente Montes, Oruro',
        'email': 'contacto@oruro.gob.bo',
        'nombre_autoridad': 'Jhonny Vedia Rodríguez',
        'departamento': 'Oruro',
        'num_provincias': 16,
        'superficies': 53588.0
    },
    {
        'nombre': 'Gobernación de Potosí',
        'sigla': 'GDP',
        'telefono': '63812348',
        'ubicacion': 'Calle Bolívar esquina Ayacucho, Potosí',
        'email': 'contacto@potosi.gob.bo',
        'nombre_autoridad': 'Marco Copa',
        'departamento': 'Potosí',
        'num_provincias': 16,
        'superficies': 118218.0
    },
    {
        'nombre': 'Gobernación de Chuquisaca',
        'sigla': 'GDCQ',
        'telefono': '46456789',
        'ubicacion': 'Plaza 25 de Mayo, Sucre',
        'email': 'contacto@chuquisaca.gob.bo',
        'nombre_autoridad': 'Damián Condori',
        'departamento': 'Chuquisaca',
        'num_provincias': 10,
        'superficies': 51424.0
    },
    {
        'nombre': 'Gobernación de Tarija',
        'sigla': 'GDT',
        'telefono': '46678901',
        'ubicacion': 'Av. La Madrid, Tarija',
        'email': 'contacto@tarija.gob.bo',
        'nombre_autoridad': 'Oscar Montes',
        'departamento': 'Tarija',
        'num_provincias': 6,
        'superficies': 37623.0
    },
    {
        'nombre': 'Gobernación de Beni',
        'sigla': 'GDB',
        'telefono': '38812346',
        'ubicacion': 'Calle Bolívar, Trinidad',
        'email': 'contacto@beni.gob.bo',
        'nombre_autoridad': 'Alejandro Unzueta',
        'departamento': 'Beni',
        'num_provincias': 8,
        'superficies': 213564.0
    },
    {
        'nombre': 'Gobernación de Pando',
        'sigla': 'GDPD',
        'telefono': '38212349',
        'ubicacion': 'Av. 9 de Febrero, Cobija',
        'email': 'contacto@pando.gob.bo',
        'nombre_autoridad': 'Regis Germán Richter',
        'departamento': 'Pando',
        'num_provincias': 5,
        'superficies': 63927.0
    }
]

municipios = [
    'Sucre',
    'Yotala',
    'Poroma',
    'Azurduy',
    'Tarvita',
    'Villa Zudáñez',
    'Presto',
    'Villa Mojocoya',
    'Icla',
    'Padilla',
    'Tomina',
    'Sopachuy',
    'Villa Alcalá',
    'El Villar',
    'Monteagudo',
    'Huacareta',
    'Tarabuco',
    'Yamparáez',
    'Camargo',
    'San Lucas',
    'Incahuasi',
    'Villa Charcas',
    'Villa Serrano',
    'Villa Abecia',
    'Culpina',
    'Las Carreras',
    'Villa Vaca Guzmán (Muyupampa)',
    'Huacaya',
    'Macharetí',
    'La Paz',
    'Palca',
    'Mecapaca',
    'Achocalla',
    'El Alto',
    'Achacachi',
    'Ancoraimes',
    'Chua Cocani',
    'Huarina',
    'Santiago de Huata',
    'Huatajata',
    'Coro Coro',
    'Caquiaviri',
    'Calacoto',
    'Comanche',
    'Charaña',
    'Waldo Ballivián',
    'Nazacara de Pacajes',
    'Callapa',
    'Puerto Acosta',
    'Mocomoco',
    'Puerto Carabuco',
    'Humanata',
    'Escoma',
    'Chuma',
    'Ayata',
    'Aucapata',
    'Sorata',
    'Guanay',
    'Tacacoma',
    'Quiabaya',
    'Combaya',
    'Tipuani',
    'Mapiri',
    'Teoponte',
    'Apolo',
    'Pelechuco',
    'Viacha',
    'Guaqui',
    'Tiahuanaco',
    'Desaguadero',
    'San Andrés de Machaca',
    'Jesús de Machaca',
    'Taraco',
    'Luribay',
    'Sapahaqui',
    'Yaco',
    'Malla',
    'Cairoma',
    'Inquisivi',
    'Quime',
    'Cajuata',
    'Colquiri',
    'Ichoca',
    'Licoma Pampa',
    'Chulumani',
    'Irupana',
    'Yanacachi',
    'Palos Blancos',
    'La Asunta',
    'Pucarani',
    'Laja',
    'Batallas',
    'Puerto Pérez',
    'Sica Sica',
    'Umala',
    'Ayo Ayo',
    'Calamarca',
    'Patacamaya',
    'Colquencha',
    'Collana',
    'Coroico',
    'Coripata',
    'Ixiamas',
    'San Buenaventura',
    'Charazani',
    'Curva',
    'Copacabana',
    'San Pedro de Tiquina',
    'Tito Yupanqui',
    'San Pedro de Curahuara',
    'Papel Pampa',
    'Chacarilla',
    'Santiago de Machaca',
    'Catacora',
    'Caranavi',
    'Alto Beni',
    'Cochabamba',
    'Aiquile',
    'Pasorapa',
    'Omereque',
    'Independencia',
    'Morochata',
    'Cocapata',
    'Tarata',
    'Anzaldo',
    'Arbieto',
    'Sacabamba',
    'Arani',
    'Vacas',
    'Arque',
    'Tacopaya',
    'Capinota',
    'Santiváñez',
    'Sicaya',
    'Cliza',
    'Toco',
    'Tolata',
    'Quillacollo',
    'Sipe Sipe',
    'Tiquipaya',
    'Vinto',
    'Colcapirhua',
    'Sacaba',
    'Colomi',
    'Villa Tunari',
    'Tapacarí',
    'Totora',
    'Pojo',
    'Pocona',
    'Chimoré',
    'Puerto Villarroel',
    'Entre Ríos',
    'Mizque',
    'Vila Vila',
    'Alalay',
    'Punata',
    'Villa Rivero',
    'San Benito',
    'Tacachi',
    'Cuchumuela',
    'Bolívar',
    'Tiraque',
    'Shinahota',
    'Oruro',
    'Caracollo',
    'El Choro',
    'Paria',
    'Challapata',
    'Santuario de Quillacas',
    'Corque',
    'Choquecota',
    'Curahuara de Carangas',
    'Turco',
    'Huachacalla',
    'Escara',
    'Cruz de Machacamarca',
    'Yunguyo de Litoral',
    'Esmeralda',
    'Poopó',
    'Pazña',
    'Antequera',
    'Huanuni',
    'Machacamarca',
    'Salinas de Garci Mendoza',
    'Pampa Aullagas',
    'Sabaya',
    'Coipasa',
    'Chipaya',
    'Toledo',
    'Eucaliptus',
    'Santiago de Andamarca',
    'Belén de Andamarca',
    'Totora',
    'Santiago de Huari',
    'La Rivera',
    'Todos Santos',
    'Carangas',
    'Huayllamarca',
    'Potosí',
    'Tinguipaya',
    'Yocalla',
    'Urmiri',
    'Uncía',
    'Chayanta',
    'Llallagua',
    'Chuquihuta',
    'Betanzos',
    'Chaquí',
    'Tacobamba',
    'Colquechaca',
    'Ravelo',
    'Pocoata',
    'Ocurí',
    'San Pedro de Macha',
    'San Pedro de Buena Vista',
    'Toro Toro',
    'Santiago de Cotagaita',
    'Vitichi',
    'Sacaca',
    'Caripuyo',
    'Tupiza',
    'Atocha',
    'Colcha K',
    'San Pedro de Quemes',
    'San Pablo de Lípez',
    'Mojinete',
    'San Antonio de Esmoruco',
    'Puna',
    'Caiza D',
    'Ckochas',
    'Uyuni',
    'Tomave',
    'Porco',
    'Arampampa',
    'Acasio',
    'Llica',
    'Tahua',
    'Villazón',
    'San Agustín',
    'Tarija',
    'Padcaya',
    'Bermejo',
    'Yacuiba',
    'Caraparí',
    'Villa Montes',
    'Uriondo',
    'Yunchará',
    'San Lorenzo',
    'El Puente',
    'Entre Ríos',
    'Santa Cruz de la Sierra',
    'Cotoca',
    'Porongo',
    'La Guardia',
    'El Torno',
    'Warnes',
    'Okinawa Uno',
    'San Ignacio de Velasco',
    'San Miguel de Velasco',
    'San Rafael de Velasco',
    'Buena Vista',
    'San Carlos',
    'Villa Yapacaní',
    'San Juan de Yapacaní',
    'San José de Chiquitos',
    'Pailón',
    'Roboré',
    'Portachuelo',
    'Santa Rosa del Sara',
    'Colpa Bélgica',
    'Lagunillas',
    'Charagua',
    'Cabezas',
    'Cuevo',
    'Gutiérrez (Kereimba Iyambae)',
    'Camiri',
    'Boyuibe',
    'Vallegrande',
    'El Trigal',
    'Moro Moro',
    'Postrervalle',
    'Pucará',
    'Samaipata',
    'Pampagrande',
    'Mairana',
    'Quirusillas',
    'Montero',
    'General Saavedra',
    'Mineros',
    'Fernández Alonso',
    'San Pedro',
    'Concepción',
    'San Javier',
    'San Ramón',
    'San Julián',
    'San Antonio de Lomerío',
    'Cuatro Cañadas',
    'San Matías',
    'Comarapa',
    'Saipina',
    'Puerto Suárez',
    'Puerto Quijarro',
    'El Carmen Rivero Tórrez',
    'Ascensión de Guarayos',
    'Urubichá',
    'El Puente',
    'Trinidad',
    'San Javier',
    'Riberalta',
    'Guayaramerín',
    'Reyes',
    'San Borja',
    'Santa Rosa',
    'Rurrenabaque',
    'Santa Ana del Yacuma',
    'Exaltación',
    'San Ignacio de Moxos',
    'Loreto',
    'San Andrés',
    'San Joaquín',
    'San Ramón',
    'Puerto Siles',
    'Magdalena',
    'Baures',
    'Huacaraje',
    'Cobija',
    'Porvenir',
    'Bolpebra',
    'Bella Flor',
    'Puerto Rico',
    'San Pedro',
    'Filadelfia',
    'Puerto Gonzalo Moreno',
    'San Lorenzo',
    'Sena',
    'Santa Rosa del Abuná',
    'Ingavi',
    'Nueva Esperanza',
    'Villa Nueva',
    'Santos Mercado'
]
apellidos = [
    'Torres',
    'Iturral',
    'Iberia',
    'Uriburu',
    'Vargas',
    'Zalles',
    'Ruiz',
    'Salinas',
    'Rojas',
    'Romero',
    'Cabrera',
    'Pacheco',
    'Rodriguez',
    'Decabrera',
    'Patino',
    'Aguirre',
    'Uriondo',
    'Arce',
    'Aparicio',
    'Quiroga',
    'Iturralde',
    'Guerrero',
    'Hurtado',
    'Diezde',
    'Medina',
    'Flores',
    'Castelo',
    'Saabedra',
    'Moscoso',
    'Daza',
    'Delatorre',
    'Otero',
    'Ychaso',
    'Estrada',
    'Miranda',
    'Baca',
    'Canedo',
    'Rivero',
    'Aramayo',
    'Picard',
    'Medeiro',
    'Rivera',
    'Segovia',
    'Molina',
    'Arze',
    'Detorres',
    'Fernandez',
    'Lealdeayala',
    'Rivero',
    'Villarroel',
    'Zamora',
    'Aguilera',
    'Castillo',
    'Castellanos',
    'Morales',
    'Tapia',
    'Trigo',
    'Caballero',
    'Mercado',
    'Ortiz',
    'Ramallo',
    'Ruiz',
    'Sanchez',
    'Urioste',
    'Granier',
    'Torrico',
    'Velasco',
    'Barrientos',
    'Mendoza',
    'Ramos',
    'Angulo',
    'Castillo',
    'Guerra',
    'Palacios',
    'Pizarro',
    'Arce',
    'Reyes',
    'Dearce',
    'Sisa',
    'Calvo',
    'Carrasco',
    'Castro',
    'Deaguilar',
    'Rocha',
    'Saavedra',
    'Tejada',
    'Camacho',
    'Delemoine',
    'Lescano',
    'Lopez',
    'Salazar',
    'Urquidi',
    'Arenas',
    'Gutierrez',
    'Delizarazu',
    'Manrique',
    'Segarra',
    'Vega',
    'Lalonde',
    'Mealla',
    'Maldonado',
    'Paz'
]
nombres_masculinos = [
    'Benjamín',
    'Bautista',
    'Felipe',
    'Valentino',
    'Benicio',
    'Juan Carlos',
    'José Luis',
    'Marco Antonio',
    'Miguel Ángel',
    'Juan',
    'Mateo',
    'Agustín',
    'Benjamín',
    'Joaquín',
    'Vicente',
    'Santiago',
    'Matías',
    'Samuel',
    'Jerónimo',
    'Emmanuel',
    'Dylan',
    'Luis',
    'José',
    'Juan',
    'Thiago',
    'Ramón',
    'Juan',
    'José',
    'Antonio',
    'Carlos',
    'Thiago',
    'Liam',
    'Dylan',
    'Luis',
    'Juan',
    'Benjamín',
    'Mateo',
    'Santino',
    'Thiago',
    'Joaquín',
    'Alejandro',
    'Diego',
    'Gabriel',
    'Samuel',
    'Santiago'
]
nombres_femeninos = [
    'Isabella',
    'Martina',
    'Catalina',
    'Sofía',
    'Olivia',
    'Martha',
    'Roxana',
    'Ana María',
    'Elizabeth',
    'Sonia',
    'Sofía',
    'Agustina',
    'Emilia',
    'Isidora',
    'Florencia',
    'Salomé',
    'Isabella',
    'Mariana',
    'Gabriela',
    'María',
    'Emily',
    'Danna',
    'Mía',
    'Domenica',
    'Elizabeth',
    'Beatriz',
    'Ramona',
    'Liz',
    'Camila',
    'Briana',
    'María',
    'Mía',
    'Sofía',
    'Martina',
    'Mía',
    'Emma',
    'Camila',
    'Sofía',
    'Valentina',
    'Isabella',
    'Victoria'
]
def generar_nombre_completo_aleatorio():
    nombre = random.choice(random.choice([nombres_masculinos, nombres_femeninos]))
    paterno = random.choice(apellidos)
    materno = random.choice(apellidos)
    
    return nombre + ' ' + paterno + ' ' + materno

def generar_coordenadas():
    lat = round(random.uniform(-22.0, -9.0), 6)   # Latitudes típicas de Bolivia
    lon = round(random.uniform(-69.0, -57.0), 6)  # Longitudes típicas de Bolivia
    return f"{lat}, {lon}"

def generar_superficie():
    return round(random.uniform(10.0, 5000.0), 2)  # Superficie en hectáreas
def generar_persona():
    sexo = random.choice(['femenino', 'masculino'])
    if sexo == 'femenino':
        nombre = random.choice(nombres_femeninos)
    else:
        nombre = random.choice(nombres_masculinos)
    rand_date = datetime(1980, 1, 1) + timedelta(days=random.randint(0, 365 * 20))
    fecha_nac = rand_date.strftime('%Y-%m-%d')
    paterno = random.choice(apellidos)
    materno = random.choice(apellidos)
    persona = {
        'ci': random.randint(10000000, 99999999),
        'expedido': random.choice(['LP', 'SCZ', 'CBBA', 'OR', 'PT', 'CH', 'TJA', 'BE', 'PD', 'EX']),
        'paterno': paterno,
        'materno': materno,
        'nombre': nombre,
        'sexo': sexo,
        'fecha_nacimiento': fecha_nac,
        'email': generar_email_aleatorio(nombre+' '+paterno+' '+materno+' '+str(random.randint(0000,9999))),
        'telefono': generar_telefono()
    }
    return persona

def generar_fecha_aleatoria(fecha_inicio_str, fecha_fin_str):
    """
    Genera una fecha aleatoria entre dos fechas dadas (inclusive).

    Args:
        fecha_inicio_str (str): La fecha de inicio en formato 'YYYY-MM-DD'.
        fecha_fin_str (str): La fecha de fin en formato 'YYYY-MM-DD'.

    Returns:
        str: Una fecha aleatoria en formato 'YYYY-MM-DD'.
    """
    fecha_inicio = datetime.strptime(fecha_inicio_str, '%Y-%m-%d')
    fecha_fin = datetime.strptime(fecha_fin_str, '%Y-%m-%d')
    diferencia_dias = (fecha_fin - fecha_inicio).days
    dias_aleatorios = random.randint(0, diferencia_dias)
    fecha_aleatoria = fecha_inicio + timedelta(days=dias_aleatorios)
    return fecha_aleatoria.strftime('%Y-%m-%d')

nombre_brigadas = [
    "Brigada Llama Eterna",
    "Regimiento Guardabosques del Sol",
    "Brigada Fénix del Alba",
    "Regimiento Cima Ígnea",
    "Brigada Centinelas del Arrayán",
    "Regimiento Dracos Salvavidas",
    "Brigada Eco Escudo",
    "Regimiento Halcones del Monte",
    "Brigada Raíces Resilientes",
    "Regimiento Cóndor Andino",
    "Brigada Lumbre Silvestre",
    "Regimiento Centellas del Bosque",
    "Brigada Escudo Verde",
    "Regimiento Alas de Condor",
    "Brigada Centinelas del Viento",
    "Regimiento Apaguemos el Fuego",
    "Brigada Custodios del Roble",
    "Brigada Vértice Guardián",
    "Regimiento Serpiente de Humo",
    "Brigada San Agustín",
    "Brigada Puerto Suárez",
    "Regimiento Santa Cruz",
    "Brigada Ayacucho Verde",
    "Regimiento Valle de los Tobas",
    "Brigada Guardianes del Pantanal",
    "Brigada Llamas del Chaco",
    "Regimiento Cóndores de Samaipata",
    "Brigada Monte Ichilo",
    "Regimiento Fuego de Potosí",
    "Brigada Espíritu de la Amazonía",
    "Regimiento Tacanas del Bosque",
    "Brigada Yuracaré",
    "Brigada Candelaria Forestal",
    "Regimiento Río Grande"
]

viveres = [
    {
        'nombre':'Agua embotellada',
        'descripcion':'Botellas de agua purificada',
        'marca':'Vishuddha',
        'categoria':'liquido',
        'medida':'ml'
    },
    {
        'nombre':'Fideos tipo espagueti',
        'descripcion':'Paquetes de pasta seca',
        'marca':'Regal',
        'categoria':'cereal',
        'medida':'g'
    },
    {
        'nombre':'Arroz blanco grano largo',
        'descripcion':'Paquetes de arroz blanco',
        'marca':'Sello de Oro',
        'categoria':'grano',
        'medida':'kg'
    },
    {
        'nombre':'Latas de atún en aceite',
        'descripcion':'Latas de atún conservado',
        'marca':'Real',
        'categoria':'pescado',
        'medida':'g'
    },
    {
        'nombre':'Frijol negro seco',
        'descripcion':'Bolsas de frijol negro',
        'marca':'Don Frijol',
        'categoria':'cereal',
        'medida':'g'
    },
    {
        'nombre':'Leche en polvo entera',
        'descripcion':'Bolsas de leche en polvo',
        'marca':'Pil',
        'categoria':'liquido',
        'medida':'l'
    },
    {
        'nombre':'Barras energéticas de cereal',
        'descripcion':'Barras nutritivas de avena y frutas',
        'marca':'PowerBar',
        'categoria':'cereal',
        'medida':'g'
    },
    {
        'nombre':'Galletas de soda paquete',
        'descripcion':'Paquetes de galletas saladas',
        'marca':'Nawab',
        'categoria':'cereal',
        'medida':'g'
    },
    {
        'nombre':'Aceite vegetal',
        'descripcion':'Botellas de aceite de girasol',
        'marca':'Fino',
        'categoria':'liquido',
        'medida':'ml'
    },
    {
        'nombre': 'Sal fina yodada',
        'descripcion': 'Bolsas de sal refinada yodada',
        'marca': 'Sal Lobos',
        'categoria':'mineral',
        'medida':'kg'
    },
    {
        'nombre': 'Harina de trigo',
        'descripcion': 'Bolsas de harina de trigo blanca',
        'marca': 'Don Mario',
        'categoria':'cereal',
        'medida':'kg'
    },
    {
        'nombre': 'Lentejas secas',
        'descripcion': 'Bolsas de lentejas seleccionadas',
        'marca': 'La Granja',
        'categoria':'cereal',
        'medida':'kg'
    },
    {
        'nombre': 'Sopa instantánea en sobre',
        'descripcion': 'Sobres de sopa de fideos instantánea',
        'marca': 'Maggi',
        'categoria':'proteina',
        'medida':'g'
    },
    {
        'nombre': 'Café instantáneo',
        'descripcion': 'Frascos de café soluble',
        'marca': 'Nescafé',
        'categoria':'grano',
        'medida':'g'
    },
    {
        'nombre': 'Té negro en sobres',
        'descripcion': 'Cajas con bolsitas de té',
        'marca': 'Hornimans',
        'categoria':'liquido',
        'medida':'g'
    },
    {
        'nombre': 'Conserva de duraznos en almíbar',
        'descripcion': 'Latas de duraznos en conserva',
        'marca': 'La Costeña',
        'categoria':'envasado',
        'medida':'g'
    },
    {
        'nombre': 'Jugo en caja',
        'descripcion': 'Caja de jugo de frutas',
        'marca': 'Del Valle',
        'categoria':'liquido',
        'medida':'l'
    },
    {
        'nombre': 'Pan tostado en paquete',
        'descripcion': 'Paquetes de pan crujiente tostado',
        'marca': 'Bimbo',
        'categoria':'cereal',
        'medida':'g'
    },
    {
        'nombre': 'Mermelada de fresa',
        'descripcion': 'Frascos de mermelada artesanal',
        'marca': 'La Campagnola',
        'categoria':'postre',
        'medida':'g'
    }
]
medicamentos = [
    {
        'nombre': 'Omeprazol',
        'descripcion': 'Inhibidor de la bomba de protones',
        'medida': 'mg',
        'contraindicaciones': 'Hipersensibilidad al omeprazol, insuficiencia hepática severa, embarazo sin indicación médica.',
        'uso': 'vía oral, antes de las comidas'
    },
    {
        'nombre': 'Amoxicilina',
        'descripcion': 'Antibiótico de amplio espectro',
        'medida': 'mg',
        'contraindicaciones': 'Alergia a penicilinas o cefalosporinas, insuficiencia renal grave sin ajuste de dosis.',
        'uso': 'vía oral, cada 8 horas'
    },
    {
        'nombre': 'Ibuprofeno',
        'descripcion': 'Antiinflamatorio no esteroideo',
        'medida': 'mg',
        'contraindicaciones': 'Úlcera gástrica activa, insuficiencia renal o hepática severa, antecedentes de sangrado gastrointestinal.',
        'uso': 'vía oral, con alimentos'
    },
    {
        'nombre': 'Jarabe para la tos',
        'descripcion': 'Alivia la tos seca y con flema',
        'medida': 'ml',
        'contraindicaciones': 'Asma no controlada, hipersensibilidad a los componentes, uso simultáneo con inhibidores de la MAO.',
        'uso': 'vía oral, según dosis recomendada por edad'
    },
    {
        'nombre': 'Paracetamol',
        'descripcion': 'Analgésico y antipirético',
        'medida': 'mg',
        'contraindicaciones': 'Enfermedad hepática severa, consumo excesivo de alcohol, alergia conocida al paracetamol.',
        'uso': 'vía oral, cada 6-8 horas según necesidad'
    },
    {
        'nombre': 'Salbutamol Inhalador',
        'descripcion': 'Broncodilatador de acción rápida',
        'medida': 'mcg/dosis',
        'contraindicaciones': 'Arritmias severas, hipersensibilidad al salbutamol, hipertiroidismo no controlado.',
        'uso': 'inhalar según indicación médica'
    },
    {
        'nombre': 'Diclofenaco Inyectable',
        'descripcion': 'Analgésico y antiinflamatorio inyectable',
        'medida': 'mg',
        'contraindicaciones': 'Úlcera péptica activa, insuficiencia cardíaca grave, antecedentes de reacciones alérgicas a AINEs.',
        'uso': 'administrar por vía intramuscular'
    },
    {
        'nombre': 'Solución Salina Isotónica',
        'descripcion': 'Solución para administración intravenosa',
        'medida': 'ml',
        'contraindicaciones': 'Hipernatremia, edema pulmonar, insuficiencia renal sin control de electrolitos.',
        'uso': 'administrar por vía intravenosa'
    },
    {
        'nombre': 'Insulina NPH',
        'descripcion': 'Insulina de acción intermedia',
        'medida': 'UI',
        'contraindicaciones': 'Hipoglucemia, hipersensibilidad a insulinas humanas o excipientes.',
        'uso': 'administrar por vía subcutánea, según indicación médica'
    },
    {
        'nombre': 'Crema para quemaduras',
        'descripcion': 'Crema para aliviar quemaduras leves',
        'medida': 'g',
        'contraindicaciones': 'Alergia a sulfadiazina de plata u otros componentes; no usar en recién nacidos prematuros.',
        'uso': 'aplicar sobre la piel limpia en la zona afectada'
    },
    {
        'nombre':'Loratadina',
        'descripcion':'Antihistamínico para alergias',
        'medida':'mg',
        'contraindicaciones':'Hipersensibilidad a la loratadina; precaución en insuficiencia hepática severa.',
        'uso':'vía oral, una vez al día'
    },
    {
        'nombre':'Metformina',
        'descripcion':'Hipoglucemiante oral para diabetes tipo 2',
        'medida':'mg',
        'contraindicaciones':'Insuficiencia renal, acidosis metabólica, alcoholismo crónico.',
        'uso':'vía oral, con alimentos'
    },
    {
        'nombre':'Ranitidina',
        'descripcion':'Antagonista H2 para reducir la acidez estomacal',
        'medida':'mg',
        'contraindicaciones':'Hipersensibilidad a ranitidina; uso prolongado sin diagnóstico médico puede enmascarar enfermedades graves.',
        'uso':'vía oral, antes o después de las comidas'
    },
    {
        'nombre':'Loperamida',
        'descripcion':'Antidiarreico de acción periférica',
        'medida':'mg',
        'contraindicaciones':'Colitis ulcerosa aguda, diarrea causada por infecciones, niños menores de 2 años.',
        'uso':'vía oral, después de cada evacuación'
    },
    {
        'nombre':'Dexametasona',
        'descripcion':'Corticosteroide antiinflamatorio y antialérgico',
        'medida':'mg',
        'contraindicaciones':'Infecciones sistémicas no tratadas, úlcera péptica activa, diabetes descompensada.',
        'uso':'vía oral o inyectable, según prescripción médica'
    },
    {
        'nombre':'Diazepam',
        'descripcion':'Ansiolítico y anticonvulsivante',
        'medida':'mg',
        'contraindicaciones':'Insuficiencia respiratoria severa, apnea del sueño, glaucoma de ángulo cerrado, dependencia a benzodiacepinas.',
        'uso':'vía oral, antes de dormir o según necesidad'
    },
    {
        'nombre':'Clorfenamina',
        'descripcion':'Antihistamínico para alergias y resfriados',
        'medida':'mg',
        'contraindicaciones':'Glaucoma, hipertrofia prostática, úlcera péptica estenosante, asma bronquial.',
        'uso':'vía oral, cada 6 a 8 horas'
    },
    {
        'nombre':'Ácido acetilsalicílico (Aspirina)',
        'descripcion':'Analgésico, antipirético y antiinflamatorio',
        'medida':'mg',
        'contraindicaciones':'Úlcera activa, trastornos hemorrágicos, niños con infecciones virales (riesgo de síndrome de Reye).',
        'uso':'vía oral, después de los alimentos'
    },
    {
        'nombre':'Clotrimazol crema',
        'descripcion':'Antifúngico tópico',
        'medida':'g',
        'contraindicaciones':'Hipersensibilidad al clotrimazol o a cualquiera de sus componentes; no usar en mucosas sin indicación médica.',
        'uso':'aplicar sobre la piel limpia, 2 veces al día'
    },
    {
        'nombre':'Carbón activado',
        'descripcion':'Tratamiento de intoxicaciones orales',
        'medida':'g',
        'contraindicaciones':'Obstrucción intestinal, ingestión de sustancias corrosivas o hidrocarburos.',
        'uso':'vía oral, disuelto en agua, según dosis de emergencia'
    }
]
marca_medicamentos = [
    'La Sante',
    'MK',
    'Chile',
    'Takeda',
    'Genfar',
    'Sandoz',
    'Baxter',
    'Novo Nordisk',
    'Dermaplast',
]
herramientas = [
    {
        'nombre': 'Motosierra Stihl MS 271',
        'descripcion': 'Motosierra para corte de madera',
        'tipo': 'corte y remoción'
    },
    {
        'nombre': 'Pala de bombero con mango de fibra',
        'descripcion': 'Pala resistente para remover escombros',
        'tipo': 'remoción de escombros'
    },
    {
        'nombre': 'Hacha de bombero con cabeza de acero',
        'descripcion': 'Hacha para abrirse paso y cortar',
        'tipo': 'penetración y corte'
    },
    {
        'nombre': 'Manguera contra incendios de 15 metros',
        'descripcion': 'Manguera de alta presión con conexiones',
        'tipo': 'control de incendios'
    },
    {
        'nombre': 'Casco de bombero con visor',
        'descripcion': 'Equipo de protección personal',
        'tipo': 'protección personal'
    },
    {
        'nombre': 'Linterna frontal LED de alta potencia',
        'descripcion': 'Iluminación manos libres',
        'tipo': 'iluminación'
    },
    {
        'nombre': 'Radio portátil de comunicación bidireccional',
        'descripcion': 'Comunicación entre equipos',
        'tipo': 'comunicación'
    },
    {
        'nombre': 'Kit de herramientas de rescate hidráulico',
        'descripcion': 'Equipo para abrir vehículos accidentados',
        'tipo': 'rescate vehicular'
    },
    {
        'nombre': 'Detector de gases multi-gas',
        'descripcion': 'Equipo para medir niveles de gases peligrosos',
        'tipo': 'detección de gases'
    },
    {
        'nombre': 'Botiquín de primeros auxilios avanzado',
        'descripcion': 'Kit completo para atención inicial',
        'tipo': 'atención médica inicial'
    },
    {
        'nombre': 'Camilla rígida tipo cuchara',
        'descripcion': 'Camilla para inmovilización y transporte de heridos',
        'tipo': 'traslado de víctimas'
    },
    {
        'nombre': 'Guantes de trabajo resistentes al corte',
        'descripcion': 'Guantes de protección para manipulación de objetos peligrosos',
        'tipo': 'protección personal'
    },
    {
        'nombre': 'Cuerda de rescate de 30 metros',
        'descripcion': 'Cuerda resistente para operaciones de rescate y descenso',
        'tipo': 'rescate vertical'
    },
    {
        'nombre': 'Toldo impermeable de emergencia',
        'descripcion': 'Protección temporal contra clima extremo',
        'tipo': 'refugio temporal'
    },
    {
        'nombre': 'Extintor portátil ABC de 6 kg',
        'descripcion': 'Extintor para múltiples tipos de fuego',
        'tipo': 'control de incendios'
    },
    {
        'nombre': 'Cizalla hidráulica portátil',
        'descripcion': 'Herramienta para cortar metales en operaciones de rescate',
        'tipo': 'rescate vehicular'
    },
    {
        'nombre': 'GPS portátil resistente al agua',
        'descripcion': 'Sistema de localización para operaciones en campo',
        'tipo': 'navegación y localización'
    },
    {
        'nombre': 'Equipo de respiración autónomo (ERA)',
        'descripcion': 'Proporciona aire limpio en zonas con humo o gases tóxicos',
        'tipo': 'protección respiratoria'
    },
    {
        'nombre': 'Martillo multipropósito de emergencia',
        'descripcion': 'Martillo con funciones de rompedor de vidrios y cortacinturones',
        'tipo': 'rescate y evacuación'
    },
    {
        'nombre': 'Bolsa seca impermeable 20L',
        'descripcion': 'Bolsa para proteger equipos sensibles al agua',
        'tipo': 'almacenamiento seguro'
    }
]

marca_herramientas = [
    'Stihl',
    'Truper',
    'Estwing',
    'Angus Fire',
    'MSA',
    'Petzl',
    'Motorola',
    'Lukas',
    'BW Technologies',
    'Curad'
]

def generar_cadena_aleatoria(longitud):
    caracteres = string.ascii_letters + string.digits
    cadena = ''.join(random.choice(caracteres) for _ in range(longitud))
    return cadena

def generar_numero_serie():
    serie_uno = str(random.randint(1000, 9999))
    serie_dos = generar_cadena_aleatoria(4)
    return serie_uno + '-' + serie_dos

def generar_placa():
    serie_uno = str(random.randint(1000, 9999))
    serie_dos = generar_cadena_aleatoria(4).upper()
    return serie_uno + '-' + serie_dos

vehiculos = [
    {
        'descripcion':'Helicóptero para descarga de agua',
        'tipo':'helicoptero'
    },
    {
        'descripcion':'Camión para transporte y descarga de agua',
        'tipo':'camion'
    },
    {
        'descripcion':'Avión de carga para extinción aérea',
        'tipo':'avion'
    },
    {
        'descripcion':'Vehículo ligero para acceso rápido',
        'tipo':'todoterreno'
    },
    {
        'descripcion':'Maquinaria pesada para limpieza de áreas',
        'tipo':'maquinaria'
    },
    {
        'descripcion':'Camión para transporte de madera quemada',
        'tipo':'camion'
    },
    {
        'descripcion':'Vehículo ágil para inspección de áreas',
        'tipo':'todoterreno'
    },
    {
        'descripcion':'Vehículo para atención médica de emergencia',
        'tipo':'ambulancia'
    },
    {
        'descripcion':'Maquinaria para crear cortafuegos',
        'tipo':'camnion bombero'
    },
    {
        'descripcion':'Vehículo aéreo no tripulado para vigilancia',
        'tipo':'dron'
    },
    {
        'descripcion': 'Camión cisterna para abastecimiento de agua en zonas remotas',
        'tipo': 'camion'
    },
    {
        'descripcion': 'Vehículo de rescate técnico con equipo hidráulico',
        'tipo': 'rescate'
    },
    {
        'descripcion': 'Quad o ATV para acceso en terrenos difíciles',
        'tipo': 'atv'
    },
    {
        'descripcion': 'Camión escalera para rescate en alturas',
        'tipo': 'camion bombero'
    },
    {
        'descripcion': 'Ambulancia todoterreno para evacuación en campo',
        'tipo': 'ambulancia'
    },
    {
        'descripcion': 'Motocicleta de primeros auxilios rápida',
        'tipo': 'motocicleta'
    },
    {
        'descripcion': 'Vehículo comando móvil para coordinación en sitio',
        'tipo': 'comando'
    },
    {
        'descripcion': 'Barco de rescate para operaciones en zonas inundadas',
        'tipo': 'lancha'
    },
    {
        'descripcion': 'Bulldozer para remoción de escombros y apertura de caminos',
        'tipo': 'maquinaria'
    },
    {
        'descripcion': 'Helicóptero de evacuación médica con soporte vital',
        'tipo': 'helicoptero'
    }
]

modelo_vehiculos = [
    'Haylux'
    'Actros 2645'
    'AT-802F'
    'Hilux'
    'D7R'
    'FH16'
    'CRF250L'
    'Transit'
    '8345R'
    'Mavic 3T'
    'CAT 320D',
    'Komatsu D155AX',
    'JCB 3CX',
    'Volvo L120H',
    'John Deere 772GP',
    'Hamm HD+ 90i',
    'Liebherr LR 1300',
    'Case IH Axial-Flow 7150',
    'Terex RT 100',
    'Bobcat S770'
]
marca_vehiculos = [
    'Toyota',
    'Mercedes-Benz',
    'Air Tractor',
    'Caterpillar',
    'Volvo',
    'Honda',
    'Ford',
    'John Deere',
    'DJI',
    'Komatsu',
    'JCB',
    'Liebherr',
    'Case IH',
    'Terex',
    'Bobcat',
    'Man',
    'Scania',
    'Iveco',
    'Oshkosh',
    'Rosenbauer',
    'Bell Helicopter',
    'Eurocopter (Airbus Helicopters)',
    'Zodiac Milpro',
    'Polaris',
    'Can-Am',
    'Chevrolet',
    'Nissan'
]
colores = [
    'azul',
    'verde',
    'naranja',
    'rojo',
    'celeste',
    'plomo',
    'negro',
    'gris',
    'blanco',
    'amarillo',
    'lima'
]
enfermedades = [
    'Neumonía',
    'Pérdida auditiva',
    'Visión leve',
    'Diabetes',
    'Enfermedades cardíacas',
    'Asma y otras enfermedades respiratorias crónicas',
    'Problemas musculoesqueléticos crónicos',
    'Trastornos de estrés postraumático (TEPT)',
    'Enfermedades renales crónicas',
    'Epilepsia u otros trastornos convulsivos',
    'Hipertensión no controlada',
    'Trastornos de ansiedad severa',
    'Depresión mayor no controlada',
    'Trastornos del equilibrio o vértigo crónico',
    'Trastornos autoinmunes debilitantes (como lupus o esclerosis múltiple)',
    'Cáncer en tratamiento activo',
    'Obesidad mórbida',
    'Alergias graves (anafilaxia, especialmente a picaduras de insectos o medicamentos)',
    'Trastornos de coagulación sanguínea',
    'Trastornos neurológicos degenerativos (como Parkinson o esclerosis lateral amiotrófica)',
    'Insuficiencia hepática avanzada',
    'Síndrome de apnea del sueño severo no tratado'
]
tipos_bien = [
    'Catre',
    'Vivienda',
    'Televisor',
    'Mesa',
    'Computadora',
    'Ropa',
    'Sofa',
    'Celular',
    'Plantacion',
    'Vajilla',
    'Comoda',
    'Maquina de coser',
    'Mascota',
    'Mercancia',
    'Refrigerador',
    'Documentos personales (DNI, pasaporte, títulos, etc.)',
    'Libros',
    'Herramientas de trabajo',
    'Juguetes',
    'Cama',
    'Motocicleta o bicicleta',
    'Alimentos almacenados',
    'Cortinas y alfombras',
    'Lámparas',
    'Equipos electrónicos (consolas, routers, etc.)',
    'Dinero en efectivo',
    'Instrumentos musicales',
    'Obras de arte o decoraciones',
    'Fotografías familiares',
    'Joyas o relojes de valor',
    'Sillas',
    'Colchones',
    'Microondas',
    'Estufa',
    'Horno',
    'Lavadora',
    'Secadora',
    'Aire acondicionado o ventilador',
    'Calefactor',
    'Tanques de gas',
    'Relojes de pared',
    'Ropa de cama (sábanas, cobijas)',
    'Material escolar',
    'Archivos o carpetas laborales',
    'Medicamentos o botiquines',
    'Toldos o pérgolas',
    'Maletas o mochilas',
    'Cubiertos y utensilios de cocina',
    'Cuna o coche de bebé',
    'Paneles solares',
    'Ropa de trabajo o uniformes',
    'Antigüedades o reliquias familiares',
    'Decoraciones festivas',
    'Pinturas murales o papel tapiz',
    'Bebidas o productos perecederos',
    'Bicicletas estáticas o equipos de ejercicio',
    'Tanques de agua',
    'Carpas o equipos de camping'
]