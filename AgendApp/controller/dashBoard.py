from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona

class DashBoardController():
    @classmethod
    def loginController(rq, db, logged_user):
        return render_template('DashBoard.html')