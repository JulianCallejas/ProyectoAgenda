from dataclasses import dataclass
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.persona import Persona

def cargaUsuario(db, logged_user, user):
    cursor=db.connection.cursor()
    sql = """CALL SP_TareaByUserIdtarea ('{}',{})""".format(logged_user.usuario, taskid)
    cursor.execute(sql)
    data = cursor.fetchall()
    return data

class editaUsuarioController():
    @classmethod
    def renderUsuario(rq, db, logged_user, user):
        #data = cargaUsuario(db, logged_user, user)
        data = 0
        if data != ():
            return render_template('Ususarios.html', usuario = data)
        else:
            return redirect(url_for('dashBoard'))

class agregaUsuarioController():
    @classmethod
    def renderUsuario(rq, db, logged_user):
        #data = cargaUsuario(db, logged_user, user)
        data = 0
        if data != ():
            return render_template('Ususarios.html', usuario = data)
        else:
            return redirect(url_for('dashBoard'))