from dataclasses import dataclass
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.persona import Persona
from controller.manejoPassword import Contrasena


def crearUsuario(db, logged_user, nusuario):
    if nusuario.comprobarCamposCrearUsuario():
        try:
            cursor=db.connection.cursor()
            hcontrasena = Contrasena.gen_password(nusuario.contrasena)
            sql = """CALL SP_CreateUser('{}','{}','{}', {})""".format(nusuario.usuario,nusuario.email,hcontrasena, False)
            cursor.execute(sql)
            sql = """CALL SP_CreateEmpleados('{}','{}','{}', '{}', '{}')""".format(nusuario.id_persona, nusuario.usuario, nusuario.nombres, nusuario.apellidos, nusuario.cargo)
            cursor.execute(sql)

        except Exception as ex:
            err = 0
            err = "Email ya existe" if str(ex).find("Email_UNIQUE")!= -1 else err
            err = "Numero de identificacion ya existe" if str(ex).find("empleados.PRIMARY")!= -1 else err
            err = "Usuario ya existe" if str(ex).find("Usuario_UNIQUE")!= -1 else err
            err = str(ex) if err == 0 else err
            flash("Error: " + err)
            return False

        db.connection.commit()
        return True

    else:
        flash("Los campos con ** son obligatorios")
        return False


def editarUsuario(db, logged_user, eusuario):
    if eusuario.comprobarCamposCrearUsuario():
        try:
            cursor=db.connection.cursor()
            sql = """CALL SP_UpdateUser('{}','{}','{}', {})""".format(eusuario.usuario,eusuario.email,eusuario.contrasena, eusuario.esAdmin)
            cursor.execute(sql)
            sql = """CALL SP_CreateEmpleados('{}','{}','{}', '{}', '{}')""".format(nusuario.id_persona, nusuario.usuario, nusuario.nombres, nusuario.apellidos, nusuario.cargo)
            cursor.execute(sql)

        except Exception as ex:
            err = 0
            err = "Email ya existe" if str(ex).find("Email_UNIQUE")!= -1 else err
            err = "Numero de identificacion ya existe" if str(ex).find("empleados.PRIMARY")!= -1 else err
            err = "Usuario ya existe" if str(ex).find("Usuario_UNIQUE")!= -1 else err
            err = str(ex) if err == 0 else err
            flash("Error: " + err)
            return False

        db.connection.commit()
        return True

    else:
        flash("Los campos con ** son obligatorios")
        return False


def cargaUsuario(db, user):
    try:
        cursor=db.connection.cursor()
        sql = """CALL SP_UserData ('{}')""".format(user)
        cursor.execute(sql)
        row = cursor.fetchone()
        if row != None : 
            eusuario = Persona(row[0], row[5], row[6], row[7], row[3], row[1],row[2],row[4],row[8])
            return eusuario
        else:
            return None 

    except Exception as ex:
        raise Exception(ex)   


class agregaUsuarioController():
    @classmethod
    def renderAgregaUsuario(rq, db, logged_user):
        error = False
        if request.method == 'POST':
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
                flash("La contraseña no coincide")
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)
            if not (error):
                error = not (crearUsuario(db, logged_user, nusuario))
            if error:
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)
            else:
                flash("Usuario guardado con exito")
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)

        else:
            return render_template('Ususarios.html', usuario = "", error = False, agrega = True)
     

class editaUsuarioController():
    @classmethod
    def renderEditaUsuario(rq, db, logged_user, user):
        error = False
        eusuario = cargaUsuario(db, user)
        if request.method == 'POST':
            contrasena = request.form['fcontrasena']
            contrasena2 = request.form['fcontrasena2']
            if contrasena != contrasena2:
                error = True
                flash("La contraseña no coincide")
                return render_template('Ususarios.html', usuario = eusuario, error = error, agrega = False)
            
            eusuario.contrasena = Contrasena.gen_password(contrasena) if contrasena else eusuario.contrasena
            eusuario.id_persona = request.form['fnumeroid']
            eusuario.nombres = request.form['fnombre']
            eusuario.apellidos = request.form['fapellido']
            eusuario.email = request.form['femail']
            eusuario.cargo = request.form['fcargo']
            

            if not (error):
                error = not (editarUsuario(db, logged_user, eusuario))
            if error:
                return render_template('Ususarios.html', usuario = eusuario, error = error, agrega = False)
            else:
                flash("Usuario guardado con exito")
                return render_template('Ususarios.html', usuario = eusuario, error = error, agrega = False)

        else:
            if eusuario != ():
                return render_template('Ususarios.html', usuario = eusuario, error = False, agrega = False)
            else:
                return redirect(url_for('inicio'))
