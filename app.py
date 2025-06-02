from flask import Flask, render_template, request, redirect, url_for

from routes.afectado_routes import afectado_bp
from routes.query_routes import query_bp

app = Flask(__name__)

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

app.register_blueprint(query_bp, url_prefix='/')
app.register_blueprint(afectado_bp, url_prefix='/afectado')

@app.route('/home')
def admin():
    return render_template('base/page/home.html', secction='afectado-narvar', NAVBARS=NAVBARS)


@app.route('/')
def home():
    return render_template('home.html')

if __name__ == '__main__':
    app.run(debug=True)