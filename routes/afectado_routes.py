from flask import Blueprint, render_template, request, redirect, url_for
from database.connection import get_connection

afectado_bp = Blueprint('afectado', __name__)

@afectado_bp.route('/registrarse', methods=['GET', 'POST'])
def registrarse():
    if request.method == 'POST':
        # Procesar formulario de registro
        ci = request.form['ci']
        expedido = request.form['expedido']
        paterno = request.form['paterno']
        # ... otros campos
        
        conn = get_connection()
        cursor = conn.cursor()
        try:
            # Insertar persona
            cursor.execute(
                "INSERT INTO Persona (ci, expedido, paterno, materno, nombre, sexo, fecha_nacimiento) "
                "VALUES (?, ?, ?, ?, ?, ?, ?)",
                (ci, expedido, paterno, request.form['materno'], 
                 request.form['nombre'], request.form['sexo'], 
                 request.form['fecha_nacimiento'])
            )
            
            # Insertar afectado
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
