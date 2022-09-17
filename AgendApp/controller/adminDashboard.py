from asyncio.windows_events import NULL
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.persona import Persona

def cargarUsuarios(db):
        cursor=db.connection.cursor()
        sql = """CALL SP_SelectAllUsuarios()"""
        cursor.execute(sql)
        data = cursor.fetchall()
        return data

def cargarUsuariosFiltro(db, filtro):
        cursor=db.connection.cursor()
        sql = """CALL SP_SelectUsuariosWord('{}')""".format(filtro)
        cursor.execute(sql)
        data = cursor.fetchall()
        return data


class SettingsController():
    @classmethod
    def loginController(rq, db, logged_user, pagina):
        if logged_user.esAdmin:
            if request.method == 'POST':
                filtro = request.form['Busar_Usuario']
                data = cargarUsuariosFiltro(db, filtro)
                return render_template('admin-dashboard.html', usuarios = data, pagina = (pagina,len(data)), filtro = filtro)
            else:
                data = cargarUsuarios(db)
                return render_template('admin-dashboard.html', usuarios = data, pagina = (pagina,len(data)), filtro = NULL)
        else:
            flash("Debe ingresar como Administrador")
            return render_template('Login.html')

    @classmethod
    def loginControllerFiltro(rq, db, logged_user, pagina, filtro):
        if logged_user.esAdmin:
            data = cargarUsuariosFiltro(db, filtro)
            return render_template('admin-dashboard.html', usuarios = data, pagina = (pagina,len(data)))
        else:
            flash("Debe ingresar como Administrador")
            return render_template('Login.html')


