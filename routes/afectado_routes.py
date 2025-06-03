from flask import Blueprint, render_template, request, redirect, url_for, flash
from database.connection import get_connection
from routes.settings import NAVBARS

afectado_bp = Blueprint('afectado', __name__)

@afectado_bp.route('/')
def dashboard():
    return render_template('afectado/login_register.html', nav_secction='afectado-narvar', NAVBARS=NAVBARS)

@afectado_bp.route('/login', methods=['POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        print(f"Intento de inicio de sesión - Email: {email}, Contraseña: {password}")

        conn = get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "SELECT * FROM Afectado WHERE Afectado.id_afectado = ?",
                (password,)
            )
            user = cursor.fetchone()
            if user:
                flash('¡Inicio de sesión exitoso!', 'success')
                return redirect(url_for('root.home'))
            else:
                flash('Credenciales incorrectas. Inténtalo de nuevo.', 'danger')
                return redirect(url_for('afectado.login'))
        except Exception as e:
            conn.rollback()
            return f"Error al ingresar: {str(e)}"
        finally:
            conn.close()

@afectado_bp.route('/register', methods=['GET', 'POST'])
def registrarse():
    if request.method == 'POST':
        ci = request.form['ci']
        expedido = request.form['expedido']
        paterno = request.form['paterno']
        
        conn = get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO Persona (ci, expedido, paterno, materno, nombre, sexo, fecha_nacimiento) "
                "VALUES (?, ?, ?, ?, ?, ?, ?)",
                (ci, expedido, paterno, request.form['materno'], 
                 request.form['nombre'], request.form['sexo'], 
                 request.form['fecha_nacimiento'])
            )
            cursor.execute(
                "INSERT INTO Afectado (ci, telefono, ubicacion_domicilio, email, condicion, idioma) "
                "VALUES (?, ?, ?, ?, ?, ?)",
                (ci, request.form['telefono'], request.form['ubicacion'], 
                 request.form['email'], request.form['condicion'], 
                 request.form['idioma'])
            )
            
            conn.commit()
            return redirect(url_for('afectado.iniciar_sesion'))
        except Exception as e:
            conn.rollback()
            return f"Error al registrar: {str(e)}"
        finally:
            conn.close()
    
    return render_template('afectado/registro.html')
