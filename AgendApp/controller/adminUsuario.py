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


def verificaNumeroId(db, numid):
    cursor=db.connection.cursor()
    sql = """CALL SP_SelectIdEmpleado ('{}')""".format(numid)
    cursor.execute(sql)
    data = cursor.fetchall()
    return data
    


def verificarLlavesPrincipales(db, nusuario):
    error = False
    if cargaUsuario(db, nusuario.usuario):
        error = True
        flash("Usuario ya existe")
        return error

    if verificaNumeroId(db, nusuario.id_persona):
        error = True
        flash("Numero de identificacion ya existe")
        return error

    if len(nusuario.contrasena)<4:
        error = True
        flash("la contraseña debe tener al menos 4 digitos")
        return error
    
    
    
    return error




def crearUsuario(db, logged_user, nusuario):
    if nusuario.comprobarCamposCrearUsuario():
        try:
            cursor=db.connection.cursor()
            hcontrasena = Contrasena.gen_password(nusuario.contrasena)
            sql = """CALL SP_CreateUser('{}','{}','{}', {})""".format(nusuario.usuario,nusuario.email,hcontrasena, False)
            cursor.execute(sql)
            db.connection.commit()
            print(nusuario.id_persona, nusuario.usuario, nusuario.nombres, nusuario.apellidos, nusuario.cargo)
            sql = """CALL SP_CreateEmpleados('{}','{}','{}', '{}', '{}')""".format(nusuario.id_persona, nusuario.usuario, nusuario.nombres, nusuario.apellidos, nusuario.cargo)
            cursor.execute(sql)
            db.connection.commit()
            
            cursor.close()
            return True

        except Exception:
            return Exception
        
    #else:
        #return "Datos incompletos"



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
            contrasena2 = request.form['fcontrasena2']
            numeroid = request.form['fnumeroid']
            nombre = request.form['fnombre']
            apellido = request.form['fapellido']
            email = request.form['femail']
            cargo = request.form['fcargo']
            nusuario = Persona(0, numeroid, nombre, apellido, email, usuario, contrasena, 0, cargo)
            if contrasena != contrasena2:
                error = True
                flash("Las contraseñas no coinciden")
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)
            error = verificarLlavesPrincipales(db, nusuario)
            error = not (crearUsuario(db, logged_user, nusuario))
            if error:
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)
            else:
                flash("Usuario guardado con exito")
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)

        else:
            return render_template('Ususarios.html', usuario = "", agrega = True)
        