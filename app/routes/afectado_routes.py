from flask import Blueprint, render_template, request, redirect, url_for
from app.database.connection import get_connection

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

@afectado_bp.route('/iniciar_sesion', methods=['GET', 'POST'])
def iniciar_sesion():
    if request.method == 'POST':
        ci = request.form['ci']
        
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute(
            "SELECT a.id_afectado FROM Afectado a "
            "JOIN Persona p ON a.ci = p.ci "
            "WHERE a.ci = ?", 
            (ci,)
        )
        afectado = cursor.fetchone()
        conn.close()
        
        if afectado:
            return redirect(url_for('afectado.dashboard', id_afectado=afectado.id_afectado))
        else:
            return "Credenciales incorrectas", 401
    
    return render_template('afectado/login.html')

@afectado_bp.route('/<int:id_afectado>')
def dashboard(id_afectado):
    conn = get_connection()
    cursor = conn.cursor()
    
    # Obtener datos del afectado
    cursor.execute(
        "SELECT p.*, a.* FROM Afectado a "
        "JOIN Persona p ON a.ci = p.ci "
        "WHERE a.id_afectado = ?", 
        (id_afectado,)
    )
    afectado = cursor.fetchone()
    
    # Obtener bienes del afectado
    cursor.execute(
        "SELECT * FROM Bien WHERE id_afectado = ?",
        (id_afectado,)
    )
    bienes = cursor.fetchall()
    
    conn.close()
    
    return render_template('afectado/dashboard.html', afectado=afectado, bienes=bienes)

@afectado_bp.route('/<int:id_afectado>/editar', methods=['GET', 'POST'])
def editar_datos(id_afectado):
    if request.method == 'POST':
        # Actualizar datos
        conn = get_connection()
        cursor = conn.cursor()
        try:
            # Actualizar Persona
            cursor.execute(
                "UPDATE Persona SET paterno=?, materno=?, nombre=?, sexo=?, fecha_nacimiento=? "
                "WHERE ci = (SELECT ci FROM Afectado WHERE id_afectado=?)",
                (request.form['paterno'], request.form['materno'], 
                 request.form['nombre'], request.form['sexo'], 
                 request.form['fecha_nacimiento'], id_afectado)
            )
            
            # Actualizar Afectado
            cursor.execute(
                "UPDATE Afectado SET telefono=?, ubicacion_domicilio=?, email=?, condicion=?, idioma=? "
                "WHERE id_afectado=?",
                (request.form['telefono'], request.form['ubicacion'], 
                 request.form['email'], request.form['condicion'], 
                 request.form['idioma'], id_afectado)
            )
            
            conn.commit()
            return redirect(url_for('afectado.dashboard', id_afectado=id_afectado))
        except Exception as e:
            conn.rollback()
            return f"Error al actualizar: {str(e)}"
        finally:
            conn.close()
    
    # Obtener datos para mostrar en el formulario
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT p.*, a.* FROM Afectado a "
        "JOIN Persona p ON a.ci = p.ci "
        "WHERE a.id_afectado = ?", 
        (id_afectado,)
    )
    afectado = cursor.fetchone()
    conn.close()
    
    return render_template('afectado/editar.html', afectado=afectado)

@afectado_bp.route('/<int:id_afectado>/bien/registrar', methods=['GET', 'POST'])
def registrar_bien(id_afectado):
    if request.method == 'POST':
        conn = get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO Bien (id_afectado, tipo, magnitud_dano, costo_dano) "
                "VALUES (?, ?, ?, ?)",
                (id_afectado, request.form['tipo'], 
                 request.form['magnitud'], request.form['costo'])
            )
            conn.commit()
            return redirect(url_for('afectado.listar_bienes', id_afectado=id_afectado))
        except Exception as e:
            conn.rollback()
            return f"Error al registrar bien: {str(e)}"
        finally:
            conn.close()
    
    return render_template('afectado/bienes/registrar.html')

@afectado_bp.route('/<int:id_afectado>/bien/listar')
def listar_bienes(id_afectado):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT * FROM Bien WHERE id_afectado = ?",
        (id_afectado,)
    )
    bienes = cursor.fetchall()
    conn.close()
    
    return render_template('afectado/bienes/listar.html', bienes=bienes)

@afectado_bp.route('/<int:id_afectado>/bien/<int:id_bien>/editar', methods=['GET', 'POST'])
def editar_bien(id_afectado, id_bien):
    if request.method == 'POST':
        conn = get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "UPDATE Bien SET tipo=?, magnitud_dano=?, costo_dano=? "
                "WHERE id_bien=? AND id_afectado=?",
                (request.form['tipo'], request.form['magnitud'], 
                 request.form['costo'], id_bien, id_afectado)
            )
            conn.commit()
            return redirect(url_for('afectado.listar_bienes', id_afectado=id_afectado))
        except Exception as e:
            conn.rollback()
            return f"Error al actualizar bien: {str(e)}"
        finally:
            conn.close()
    
    # Obtener datos del bien para mostrar en el formulario
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT * FROM Bien WHERE id_bien = ? AND id_afectado = ?",
        (id_bien, id_afectado)
    )
    bien = cursor.fetchone()
    conn.close()
    
    if not bien:
        return "Bien no encontrado", 404
    
    return render_template('afectado/bienes/editar.html', bien=bien)

@afectado_bp.route('/<int:id_afectado>/bien/<int:id_bien>/eliminar', methods=['POST'])
def eliminar_bien(id_afectado, id_bien):
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "DELETE FROM Bien WHERE id_bien = ? AND id_afectado = ?",
            (id_bien, id_afectado)
        )
        conn.commit()
        return redirect(url_for('afectado.listar_bienes', id_afectado=id_afectado))
    except Exception as e:
        conn.rollback()
        return f"Error al eliminar bien: {str(e)}"
    finally:
        conn.close()