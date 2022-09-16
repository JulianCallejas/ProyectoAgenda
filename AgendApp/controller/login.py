from asyncio.windows_events import NULL
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona



class LoginController():
    @classmethod
    def loginController(rq,db):
        if request.method == 'POST':
            # print(request.form['username'])
            # print(request.form['password'])
            #user = User(0,request.form['username'], request.form['password'])
            user1 = request.form['username']
            passw1 = request.form['password']
            #logged_user = ModelUser.login(db, user)
            logged_user = ModelUser.login(db, user1, passw1)
            if logged_user != None:
                if logged_user.contrasena:
                    #login_user(logged_user)
                    #print('ingreso')
                    login_user(logged_user)
                    if logged_user.esAdmin:
                        #return redirect(url_for('home'))
                        #flash("ADMINISTRADOR")
                        #return render_template('Login.html')
                        return redirect(url_for('adminDashboard')), logged_user
                    else:
                        return redirect(url_for('dashBoard')), logged_user
                else:
                    flash("Usuario y contraseña incorrectos")
                    return render_template('Login.html'), logged_user
            else:
                flash("Usuario y contraseña incorrectos")
                #print('no se encontro usuario')
                return render_template('Login.html'), logged_user
        else:
            return render_template('Login.html'), NULL

