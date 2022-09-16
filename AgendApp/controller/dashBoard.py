from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona

def cargaAgenda(db, logged_user):
        cursor=db.connection.cursor()
        sql = """CALL SP_AgendaByUser ('{}')""".format(logged_user.usuario)
        cursor.execute(sql)
        data = cursor.fetchall()
        return data




class DashBoardController():
    @classmethod
    def loginController(rq, db, logged_user):
        return render_template('DashBoard.html')