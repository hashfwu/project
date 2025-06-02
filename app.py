from flask import Flask, render_template, request, redirect, url_for

from routes.afectado_routes import afectado_bp
from routes.query_routes import query_bp

app = Flask(__name__)

app.register_blueprint(query_bp, url_prefix='/')
app.register_blueprint(afectado_bp, url_prefix='/afectado')


@app.route('/home')
def admin():
    return render_template('base/page/home.html')


@app.route('/')
def home():
    return render_template('home.html')

if __name__ == '__main__':
    app.run(debug=True)