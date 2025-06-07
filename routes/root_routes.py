from flask import Blueprint, render_template, request, redirect, url_for
from database.connection import get_connection
from routes.settings import NAVBARS

root_bp = Blueprint('root', __name__)

@root_bp.route('/')
def home():
    return render_template('home.html', nav_secction='emtpy-root', NAVBARS=NAVBARS)