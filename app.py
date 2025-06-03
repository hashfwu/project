from flask import Flask, render_template, request, redirect, url_for, flash

from routes.root_routes import root_bp
from routes.afectado_routes import afectado_bp
from routes.query_routes import query_bp

app = Flask(__name__)
app.secret_key = 'clave-super-secreta-123' # Esto para que flash funcione

NAVBARS = {
    'afectado-narvar': {
        'title': 'Inicio',
        'items_exists': True,
        'items': {
            'editar_datos': {
                'title': 'Editar datos',
                'url': None,
                'subitems_exist': True,
                'subitems':
                    {
                        'eliminar':{
                            'title': 'Eliminar mis datos',
                            'url': 'home'
                        },
                        'editar':{
                            'title': 'Editar mis datos',
                            'url': 'home'
                        }
                    }
                }
        },
    }
}

app.register_blueprint(root_bp, url_prefix='/')
# app.register_blueprint(query_bp, url_prefix='/')
app.register_blueprint(afectado_bp, url_prefix='/afectado')

@app.route('/mensaje-prueba')
def mensaje_prueba():
    flash("Esto es un mensaje de prueba exitoso", "success")
    flash("Algo salió mal...", "danger")
    flash("Este es solo un aviso", "warning")
    flash("Solo información para el usuario", "info")
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)