from flask import Flask, render_template, request, redirect, url_for
import pyodbc
from config import DB_CONFIG

app = Flask(__name__)


def get_connection():
    # Windows Autentication
    # conn = pyodbc.connect(
    #     f"DRIVER={DB_CONFIG['driver']};"
    #     f"SERVER={DB_CONFIG['server']};"
    #     f"DATABASE={DB_CONFIG['database']};"
    #     f"Trusted_Connection={DB_CONFIG['trusted_connection']};"
    #     f"TrustServerCertificate={DB_CONFIG['trust_server_certificate']};"
    # )
    
    # SQL Server Autentication
    conn = pyodbc.connect(
        f"DRIVER={DB_CONFIG['driver']};"
        f"SERVER={DB_CONFIG['server']};"
        f"DATABASE={DB_CONFIG['database']};"
        f"UID={DB_CONFIG['username']};"
        f"PWD={DB_CONFIG['password']};"
        f"TrustServerCertificate={DB_CONFIG['trust_server_certificate']};"
    )
    return conn

#Menú principal
@app.route('/')
def home():
    return render_template('home.html')

@app.route('/query', methods=['GET', 'POST'])
def query():
    mensaje = ""
    error = ""
    if request.method == 'POST':
        consulta = request.form.get('consulta')
        try:
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute(consulta)
            conn.commit()
            mensaje = "Consulta realizada correctamente"
        except Exception as e:
            error = str(e)
        finally:
            cursor.close()
            conn.close()

    return render_template('/query.html', mensaje=mensaje, error=error)

#Seccion 1 Vistas
VISTA_TROFEOS = 'V_Trofeos_Ganados_Por_Club'  # Nombre actualizado
VISTA_CLUB_ESTADIO = 'V_Info_Principal_Club'   # Nombre actualizado

def fetch_view_data(conn, view_name):
    """Obtiene columnas y filas de una vista específica."""
    data = []
    column_names = []
    cursor = None
    try:
        if conn:
            cursor = conn.cursor()
            query = f"SELECT * FROM {view_name}" # Asume que view_name es seguro
            cursor.execute(query)
            # Obtener nombres de columnas
            if cursor.description:
                column_names = [column[0] for column in cursor.description]
            # Obtener todas las filas
            data = cursor.fetchall()
    except pyodbc.Error as ex:
        print(f"Error al ejecutar la consulta para la vista {view_name}: {ex}")
        # Retornar listas vacías en caso de error para no romper la plantilla
        return [], []
    finally:
        if cursor:
            cursor.close()
    return column_names, data

@app.route('/dashboard')
def dashboard():
    """Página principal que muestra datos de vistas específicas."""
    conn = get_connection()

    palmares_cols, palmares_data = [], []
    club_estadio_cols, club_estadio_data = [], []

    if conn:
        try:
            palmares_cols, palmares_data = fetch_view_data(conn, VISTA_TROFEOS)
            club_estadio_cols, club_estadio_data = fetch_view_data(conn, VISTA_CLUB_ESTADIO)
        finally:
            conn.close() # Asegurar cerrar la conexión
    else:
        # Manejar error de conexión si es necesario (e.g., mostrar mensaje en plantilla)
        print("No se pudo establecer conexión con la base de datos.")

    # Renderizar la plantilla única, pasando los datos de ambas vistas
    return render_template('Vistas/dashboard.html',
                           palmares_columnas=palmares_cols,
                           palmares_filas=palmares_data,
                           club_estadio_columnas=club_estadio_cols,
                           club_estadio_filas=club_estadio_data,
                           nombre_vista_trofeos=VISTA_TROFEOS,
                           nombre_vista_club_estadio=VISTA_CLUB_ESTADIO)
#Seccion 2 Procedimientos
@app.route('/procedimientos')
def procedimientos():
    return render_template('Procedimientos/procedimientos.html')


@app.route('/clubes_provincia', methods=['POST'])
def clubes_provincia():
    provincia = request.form['provincia']
    conn = get_connection()  
    cursor = conn.cursor()
    cursor.execute("EXEC clubesProvincias @prov = ?", provincia)
    resultados = cursor.fetchall()
    columnas = [col[0] for col in cursor.description]
    conn.close() 
    return render_template('Procedimientos/resultados.html', columnas=columnas, datos=resultados)


@app.route('/total_socios', methods=['POST'])
def total_socios():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC sociosClub")
    resultados = cursor.fetchall()
    columnas = [col[0] for col in cursor.description]
    conn.close() 
    return render_template('Procedimientos/resultados.html', columnas=columnas, datos=resultados)

@app.route('/mostrar_trofeos', methods=['POST'])
def mostrar_trofeos():
    nombre_club = request.form['nombre_club']
    
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("EXEC trofeosclubs @nombreClub = ?", (nombre_club,))
    resultados = cursor.fetchall()
    columnas = [col[0] for col in cursor.description]
    conn.close()
    
    return render_template('Procedimientos/resultados.html', columnas=columnas, datos=resultados)
#Seccion 3 Funciones
@app.route('/funciones')
def funciones():
    return render_template('Funciones/funciones.html')

# Ruta para obtener información del club
@app.route('/info_club', methods=['POST'])
def info_club():
    nombre_club = request.form['nombre_club']
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT dbo.infoClub2(?)", nombre_club)
        resultado = cursor.fetchone()[0]  # La función devuelve un solo valor
    except Exception as e:
        resultado = f"Error al obtener información del club: {str(e)}"
    finally:
        conn.close()
    return render_template('Funciones/resultados.html', mensaje=resultado)

# Ruta para obtener información del entrenador y trofeos
@app.route('/info_entrenador_trofeo', methods=['POST'])
def info_entrenador_trofeo():
    nombre_club = request.form['nombre_club']
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT dbo.infoEntrenadorTrofeo(?)", nombre_club)
        resultado = cursor.fetchone()[0]  # La función devuelve un solo valor
    except Exception as e:
        resultado = f"Error al obtener información del entrenador y trofeos: {str(e)}"
    finally:
        conn.close()
    return render_template('Funciones/resultados.html', mensaje=resultado)

#Seccion 4 Cursores
@app.route('/cursores', methods=['GET', 'POST'])
def cursores():
    socios = []
    error = ""
    mensaje = ""
    try:
        conn = get_connection()
        cursor = conn.cursor()
        
        if request.method == 'POST':
            p_porcentaje = request.form.get('p_porcentaje')
            q_porcentaje = request.form.get('q_porcentaje')
            r_porcentaje = request.form.get('r_porcentaje')
            s_porcentaje = request.form.get('s_porcentaje')
            t_porcentaje = request.form.get('t_porcentaje')

            cursor.execute("EXEC cambiar_cuota ?,?,?,?,?;",
                            p_porcentaje,
                            q_porcentaje,
                            r_porcentaje,
                            s_porcentaje,
                            t_porcentaje)
            socios = cursor.fetchall()
            conn.commit()
            mensaje = "Cuotas actualizadas correctamente."
    except Exception as e:
        error = str(e)
    finally:
        cursor.close()
        conn.close()
    return render_template('Cursores/tabla_cursores.html', socios=socios, mensaje=mensaje, error=error)
#Seccion 5 Triggers
@app.route('/expo_triggers')
def expo_triggers():
    return render_template('triggers/expo_triggers.html')

@app.route('/insertar_esponsor', methods=['GET', 'POST'])
def insertar_esponsor():
    mensaje = ""
    error = ""
    if request.method == 'POST':
        codEspon = request.form.get('codEspon')
        esponsor = request.form.get('esponsor')
        codClub = request.form.get('codClub')

        try:
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO esponsor (codEspon,esponsor,codClub) 
                VALUES (?, ?, ?)
            """, (codEspon,esponsor,codClub))
            conn.commit()
            mensaje = "Esponsor insertado correctamente."
        except Exception as e:
            error = str(e)
        finally:
            cursor.close()
            conn.close()

    return render_template('Triggers/insertar_esponsor.html', mensaje=mensaje, error=error)

@app.route('/insertar_socio', methods=['GET', 'POST'])
def insertar_socio():
    mensaje = ""
    error = ""
    if request.method == 'POST':
        Numsocio = request.form.get('numSocio')
        CodClub = request.form.get('codClub')
        Codpost = request.form.get('codPost')
        Nombre = request.form.get('nombre')
        Apellidos = request.form.get('apellidos')
        Direccion = request.form.get('direccion')
        Provincia = request.form.get('provincia')
        FechaAlta = request.form.get('fechaAlta')
        CuotaActual = request.form.get('cuotaActual')

        try:
            conn = get_connection()
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO socios (Numsocio,CodClub,Codpost,Nombre,Apellidos,Direccion,Provincia,FechaAlta,CuotaActual) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (Numsocio,CodClub,Codpost,Nombre,Apellidos,Direccion,Provincia,FechaAlta,CuotaActual))
            conn.commit()
            mensaje = "Socio insertado correctamente."
        except Exception as e:
            error = str(e)
        finally:
            cursor.close()
            conn.close()

    return render_template('Triggers/insertar_socio.html', mensaje=mensaje, error=error)

@app.route('/eliminar_esponsor', methods=['GET', 'POST'])
def eliminar_esponsor():
    mensaje = ""
    error = ""
    try:
        conn = get_connection()
        cursor = conn.cursor()

        if request.method == 'POST':
            codEspon = request.form.get('codEspon')
            esponsor = request.form.get('esponsor')
            codClub = request.form.get('codClub')

            cursor.execute("""
                DELETE FROM esponsor
                WHERE CodEspon = ?
            """, (codEspon))
            conn.commit()
            mensaje = "Esponsor eliminado correctamente."

        cursor.execute("SELECT * FROM esponsor")
        esponsor = cursor.fetchall()
    except Exception as e:
        error = str(e)
        esponsor = []
    finally:
        cursor.close()
        conn.close()

    return render_template('Triggers/eliminar_esponsor.html', esponsor=esponsor, mensaje=mensaje, error=error)

@app.route('/tabla_socios')
def tabla_socios():
    socios = []
    error = ""
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM socios")
        socios = cursor.fetchall()
    except Exception as e:
        error = str(e)
    finally:
        cursor.close()
        conn.close()
    return render_template('Triggers/tabla_socios.html', socios=socios, error=error)

@app.route('/tabla_esponsor')
def tabla_esponsor():
    esponsor = []
    error = ""
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM esponsor")
        esponsor = cursor.fetchall()
    except Exception as e:
        error = str(e)
    finally:
        cursor.close()
        conn.close()
    return render_template('Triggers/tabla_esponsor.html', esponsor=esponsor, error=error)

@app.route('/tabla_clubes')
def tabla_clubes():
    clubes = []
    error = ""
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT CodClub,club,Nombre,Presupuesto FROM clubes")
        clubes = cursor.fetchall()
    except Exception as e:
        error = str(e)
    finally:
        cursor.close()
        conn.close()
    return render_template('Triggers/tabla_clubes.html', clubes=clubes, error=error)

@app.route('/tabla_control')
def tabla_control():
    control = []
    error = ""
    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM control_presupuesto")
        control = cursor.fetchall()
    except Exception as e:
        error = str(e)
    finally:
        cursor.close()
        conn.close()
    return render_template('Triggers/tabla_control.html', control=control, error=error)

# FIN
if __name__ == '__main__':
    print(f"Driver encontrado:")
    print(pyodbc.drivers())

    connection = get_connection()

    if connection:
        print("¡Conexión disponible! Puedes empezar a ejecutar consultas.")
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT GETDATE() AS CurrentDateTime;")
            row = cursor.fetchone()
            print(f"Fecha y hora actual del servidor: {row.CurrentDateTime}")
        except pyodbc.Error as ex_query:
            print(f"Error al ejecutar consulta: {ex_query}")
        finally:
            if 'cursor' in locals() and cursor:
                cursor.close()
            connection.close()
            print("Conexión cerrada.")
            app.run(debug=True)
    else:
        print("No se pudo obtener una conexión. Revisa los detalles del error.")