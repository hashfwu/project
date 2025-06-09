from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from database.connection import get_connection
from routes.settings import NAVBARS
import math

afectado_bp = Blueprint('afectado', __name__)

@afectado_bp.route('/')
def home():
    return render_template('afectado/home.html', nav_secction='home-afectado', NAVBARS=NAVBARS)

@afectado_bp.route('/buscar_ci', methods=['GET'])
def buscar_ci():
    ci = request.args.get('ci')
    conn = get_connection()
    cursor = conn.cursor()
    try:
        print(f"Buscando CI: {ci}")
        cursor.execute(
            "SELECT expedido, paterno, materno, nombre, sexo, fecha_nacimiento FROM Persona WHERE ci = ?",
            (ci,)
        )
        persona = cursor.fetchone()
        if persona:
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
        return render_template('afectado/home.html', nav_secction='home-afectado', NAVBARS=NAVBARS)
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
        materno = request.form['materno']
        nombre = request.form['nombre']
        sexo = request.form['sexo']
        nacimiento = request.form['nacimiento']
        id_area = request.form['id_area']
        telefono = request.form['telefono']
        email = request.form['email']
        ubicacion = request.form['ubicacion']
        condicion = request.form['condicion']
        
        conn = get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "EXEC register_afectado_sp "
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?",
                (
                    ci,
                    expedido,
                    paterno,
                    materno,
                    nombre,
                    sexo,
                    nacimiento,
                    id_area,
                    telefono,
                    email,
                    ubicacion,
                    condicion
                )
            )
            result = cursor.fetchone()
            new_afectado_id = None
            if result:
                new_afectado_id = result[0]

            conn.commit()

            if new_afectado_id is not None:
                flash(f'Se registró exitosamente al afectado con ID: {int(new_afectado_id)}.', 'success')
            else:
                flash('Se registró exitosamente (ID no disponible).', 'success')
            return render_template('afectado/home.html', nav_secction='home-afectado', NAVBARS=NAVBARS)
        except Exception as e:
            conn.rollback()
            return f"Error al registrar: {str(e)}"
        finally:
            conn.close()

    try:
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute(
            "SELECT TOP 50 * FROM area_afectada_municipio_departamento_vw"
        )
        result = cursor.fetchall()

        min_orig_lat = -22.0
        max_orig_lat = -9.0
        min_orig_lon = -69.0
        max_orig_lon = -57.0

        R_circulo = 30
        centro_circulo_x = 40
        centro_circulo_y = 54

        AREAS = dict()
        for r in result:
            lat, lon = map(float, r[1].split(', '))

            lat_norm = (lat - min_orig_lat) / (max_orig_lat - min_orig_lat)
            lon_norm = (lon - min_orig_lon) / (max_orig_lon - min_orig_lon)

            theta = lon_norm * 2 * math.pi
            radio = lat_norm * R_circulo

            x_circulo = centro_circulo_x + radio * math.cos(theta)
            y_circulo = centro_circulo_y + radio * math.sin(theta)

            AREAS[r[0]] = {
                # "coordenadas": r[1],
                "coordenadas": r[1],
                "municipio": r[2],
                "departamento": r[3],
                "descripcion": r[4],
                "tipo_vegetacion": r[5],
                "x": x_circulo,
                "y": y_circulo
            }

        return render_template('afectado/registrar.html', nav_secction='empty-afectado', NAVBARS=NAVBARS, areas=AREAS)
    except Exception as e:
        conn.rollback()
        return f"Error al registrar: {str(e)}"
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

    return render_template('afectado/iniciar_sesion.html', nav_secction='empty-afectado', NAVBARS=NAVBARS)

@afectado_bp.route('/eliminar/<int:id_afectado>')
def delete(id_afectado):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "EXEC delete_afectado_sp ?", (id_afectado,)
        )
        conn.commit()
        flash(f'Se elimino usuario', 'success')
        return render_template('afectado/home.html', nav_secction='home-afectado', NAVBARS=NAVBARS)
    except Exception as e:
        conn.rollback()
        print(f"Error al ejecutar consulta: {str(e)}")
        flash(f"Error al cargar el perfil: {str(e)}", 'error')
        return render_template('afectado/home.html', nav_secction='home-afectado', NAVBARS=NAVBARS)
    finally:
        if conn:
            conn.close()