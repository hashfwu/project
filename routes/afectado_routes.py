from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from database.connection import get_connection
from routes.settings import NAVBARS

afectado_bp = Blueprint('afectado', __name__)

@afectado_bp.route('/')
def home():
    return render_template('afectado/home.html', nav_secction='empty-afectado', NAVBARS=NAVBARS)

@afectado_bp.route('/buscar_ci', methods=['GET'])
def buscar_ci():
    ci = request.args.get('ci')
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "SELECT expedido, paterno, materno, nombre, sexo, fecha_nacimiento FROM Persona WHERE ci = ?",
            (ci,)
        )
        persona = cursor.fetchone()
        if persona:
            # persona = (expedido, paterno, materno, nombre, sexo, nacimiento)
            return jsonify({
                'expedido': persona[0],
                'paterno': persona[1],
                'materno': persona[2],
                'nombre': persona[3],
                'sexo': persona[4],
                'nacimiento': persona[5].strftime('%Y-%m-%d')
            })
        else:
            return jsonify({}), 404
    except Exception as e:
        conn.rollback()
        return f"Error al registrar: {str(e)}", 500
    finally:
        conn.close()

@afectado_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        id_afectado = request.form['password']
        conn = get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "SELECT ci FROM Afectado WHERE Afectado.id_afectado = ?", (id_afectado,)
            )
            afectado = cursor.fetchone()
            if afectado:
                flash('¡Inicio de sesión exitoso!', 'success')
                return redirect(url_for('afectado.perfil', id_afectado=id_afectado))
            else:
                flash('Correo o contraseña incorrectos', 'error')
                return redirect(url_for('afectado.home'))
        except Exception as e:
            conn.rollback()
            return f"Error al registrar: {str(e)}"
        finally:
            conn.close()

    return redirect(url_for('afectado.home'))

@afectado_bp.route('/<int:id_afectado>')
def perfil(id_afectado):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "SELECT * FROM perdidas_sf(?)", (id_afectado,)
        )
        perdidas = cursor.fetchall()

        if not perdidas:
            flash(f'No se encontraron datos de pérdidas para el ID {id_afectado}.', 'info')

        return render_template('afectado/perfil.html', datos_perdidas=perdidas, id_afectado=id_afectado, nav_secction='empty-afectado', NAVBARS=NAVBARS)
    except Exception as e:
        conn.rollback()
        print(f"Error al ejecutar consulta: {str(e)}")
        flash(f"Error al cargar el perfil: {str(e)}", 'error')
        return redirect(url_for('afectado.home'))
    finally:
        if conn:
            conn.close()

@afectado_bp.route('/<int:id_afectado>/eliminar_perdida/<int:id_bien>', methods=['POST'])
def eliminar_perdida(id_bien, id_afectado):
    conn = get_connection()
    conn.execute('DELETE FROM Bien WHERE id_bien = ?', (id_bien,))
    conn.commit()
    conn.close()
    flash('Registro eliminado exitosamente.', 'success')
    return redirect(url_for('afectado.perfil', id_afectado=id_afectado))

@afectado_bp.route('/<int:id_afectado>/editar_perdida/<int:id_bien>', methods=['POST'])
def editar_perdida(id_bien, id_afectado):
    conn = get_connection()
    try:
        bien = request.form['bien']
        magnitud = request.form['magnitud']
        costo = request.form['costo']
        conn.execute("""
            UPDATE Bien SET tipo = ?, magnitud_dano = ?, costo_dano = ?
            WHERE id_bien =  ?
        """, (bien, magnitud, costo, id_bien))
        conn.commit()
        conn.close()
        flash('Registro actualizado exitosamente.', 'success')
        return redirect(url_for('afectado.perfil', id_afectado=id_afectado))
    except Exception as e:
        conn.rollback()
        flash(f"Error al editar el registro: {str(e)}", 'error')
        return redirect(url_for('afectado.perfil', id_afectado=id_afectado))
    finally:
        conn.close()

@afectado_bp.route('/<int:id_afectado>/registrar_perdida', methods=['POST'])
def registrar_perdida(id_afectado):
    bien = request.form['bien']
    magnitud = request.form['magnitud']
    costo = request.form['costo']
    conn = get_connection()
    conn.execute("""
        INSERT INTO Bien (tipo, magnitud_dano, costo_dano, id_afectado)
        VALUES (?, ?, ?, ?)
    """, (bien, magnitud, costo, id_afectado))
    conn.commit()
    conn.close()
    flash('Nueva pérdida registrada exitosamente.', 'success')
    return redirect(url_for('afectado.perfil', id_afectado=id_afectado))

@afectado_bp.route('/register', methods=['GET', 'POST'])
def register():
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
