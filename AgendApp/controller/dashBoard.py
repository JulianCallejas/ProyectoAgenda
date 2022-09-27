from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona



def cargaAgenda(db, logged_user):
        cursor=db.connection.cursor()
        sql = """CALL SP_SelectTareasUsuario ('{}')""".format(logged_user.usuarioCon)
        cursor.execute(sql)
        data = cursor.fetchall()
        logged_user.agenda = data[0][3]
        return data, logged_user


class DashBoardController():
    @classmethod
    def loginController(rq, db, logged_user, pagina):
        if logged_user.esAdmin or logged_user.usuario == logged_user.usuarioCon:
            data, logged_user = cargaAgenda(db, logged_user)
            return render_template('DashBoard.html', tareas = data, user=logged_user.usuarioCon, pagina = (pagina,len(data))), logged_user.agenda
        else:
            flash("No tiene acceso a esta agenda, debe entrar como administrado")
            return redirect(url_for('logout')), 0