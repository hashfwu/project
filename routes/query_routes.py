from flask import Blueprint, render_template, request, redirect, url_for
from database.connection import get_connection

query_bp = Blueprint('query', __name__)

@query_bp.route('/query', methods=['GET', 'POST'])
def query_runner():
    mensaje = None
    error = None
    
    if request.method == 'POST':
        consulta = request.form.get('consulta', '').strip()
        
        if not consulta:
            error = "Por favor ingrese una consulta SQL"
        else:
            try:
                # Conexión a la base de datos (ajusta según tu DB)
                conn = get_connection()
                cursor = conn.cursor()
                
                # Validación básica de seguridad (solo SELECT para usuarios normales)
                if not consulta.lower().startswith('select'):
                    raise ValueError("Solo se permiten consultas SELECT")
                
                # Ejecutar consulta
                cursor.execute(consulta)
                
                # Si es SELECT, mostrar resultados (opcional)
                if consulta.lower().startswith('select'):
                    resultados = cursor.fetchall()
                    mensaje = f"Consulta ejecutada correctamente. Resultados: {len(resultados)} filas"
                else:
                    conn.commit()
                    mensaje = "Operación ejecutada correctamente"
                    
            except Exception as e:
                error = str(e)
            finally:
                if 'conn' in locals():
                    conn.close()
    
    return render_template('query.html', mensaje=mensaje, error=error)