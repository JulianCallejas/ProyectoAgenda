from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona



def cargaUsuarios(db):
        cursor=db.connection.cursor()
        sql = """CALL SP_SelectAllUsuarios()"""
        cursor.execute(sql)
        data = cursor.fetchall()
        return data


class SettingsController():
    @classmethod
    def loginController(rq, db, logged_user):
        if logged_user.esAdmin:
            data = cargaUsuarios(db)
            return render_template('admin-dashboard.html', usuarios = data)
        else:
            flash("Debe ingresar como Administrador")
            return render_template('Login.html')
