from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona

class SettingsController():
    @classmethod
    def loginController(rq, db, logged_user):
        if logged_user.esAdmin:
            flash("PANTALLA ADMINISTRADOR")
            return render_template('loginAngel.html')
        else:
            flash("Debe ingresar como Administrador")
            return render_template('Login.html')
