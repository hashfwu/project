from flask import Flask, render_template, request, redirect, url_for
import pyodbc
from app.config import DB_CONFIG
from routes.afectado_routes import afectado_bp

app = Flask(__name__)

app.register_blueprint(afectado_bp, url_prefix='/afectado')

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