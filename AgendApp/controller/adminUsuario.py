from dataclasses import dataclass
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.persona import Persona
from controller.manejoPassword import Contrasena


def cargaUsuario(db, user):
    cursor=db.connection.cursor()
    sql = """CALL SP_UserData ('{}')""".format(user)
    cursor.execute(sql)
    data = cursor.fetchall()
    return data


def verificaNumeroId():
    return True



def verificarLlavesPrincipales(db, user):
    error = False
    if cargaUsuario(db, user.usuario):
        error = True
        flash("Usuario ya existe")
        return error 
    if verificaNumeroId():
        error = True



def crearUsuario(db, logged_user, nusuario):
    if nusuario.comprobarCamposCrearUsuario():
        try:
            cursor=db.connection.cursor()
            hcontrasena = Contrasena.gen_password(nusuario.contrasena)
            print(hcontrasena )
            sql = """CALL SP_CreateUser('{}','{}','{}', {})""".format(nusuario.usuario,nusuario.email,hcontrasena, False)
            cursor.execute(sql)
            db.connection.commit()
            cursor.close()
            return True

        except :
            return False
        
    else:
        return "Datos incompletos"



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
    def renderAgregaUsuario(rq, db, logged_user):
        if request.method == 'POST':
            error = False
            usuario = request.form['fusuario']
            contrasena = request.form['fcontrasena']
            numeroid = request.form['fnumeroid']
            nombre = request.form['fnombre']
            apellido = request.form['fapellido']
            email = request.form['femail']
            cargo = request.form['fcargo']
            nusuario = Persona(0, numeroid, nombre, apellido, email, usuario, contrasena, 0, cargo)
            error = verificarLlavesPrincipales(db, nusuario)
                
                
            #guardar = crearUsuario(db, logged_user, nusuario)
            print(error)
            flash("Usuario guardado con exito")
            return render_template('Ususarios.html', usuario = "", agrega = True)

        else:
            return render_template('Ususarios.html', usuario = "", agrega = True)
        