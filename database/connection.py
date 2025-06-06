from flask import Flask, render_template, request, redirect, url_for
import pyodbc
from config import DB_CONFIG

app = Flask(__name__)


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
    print(DB_CONFIG)
    return conn