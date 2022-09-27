from dataclasses import dataclass
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.persona import Persona
from controller.manejoPassword import Contrasena


def crearUsuario(db, nusuario):
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


def editarUsuario(db, eusuario):
    if eusuario.comprobarCamposCrearUsuario():
        try:
            cursor=db.connection.cursor()
            sql = """CALL SP_UpdateUser('{}','{}','{}', {})""".format(eusuario.usuario,eusuario.email,eusuario.contrasena, eusuario.esAdmin)
            cursor.execute(sql)
            sql = """CALL SP_UpdateEmpleados('{}','{}','{}', '{}', '{}')""".format(eusuario.id_persona, eusuario.usuario, eusuario.nombres, eusuario.apellidos, eusuario.cargo)
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


def eliminarUsuario(db, eusuario):
        try:
            cursor=db.connection.cursor()
            sql = """CALL SP_DeleteUser('{}')""".format(eusuario.usuario)
            cursor.execute(sql)
        except Exception as ex:
            flash("Error: " + err)
            return False

        db.connection.commit()
        return True


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


class administraUsuarioController():
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
                error = not (crearUsuario(db, nusuario))
            if error:
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)
            else:
                flash("Usuario guardado con exito")
                return render_template('Ususarios.html', usuario = nusuario, error = error, agrega = True)

        else:
            return render_template('Ususarios.html', usuario = "", error = False, agrega = True)
     

    @classmethod
    def renderEditaUsuario(rq, db, logged_user, user):
        if logged_user.esAdmin or logged_user.usuario == user:
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
                    error = not (editarUsuario(db, eusuario))

                if not (error):
                    flash("Usuario guardado con exito")
  
                return render_template('Ususarios.html', usuario = eusuario, error = error, agrega = False)

            else:
                if eusuario != ():
                    return render_template('Ususarios.html', usuario = eusuario, error = False, agrega = False)
                else:
                    return redirect(url_for('inicio'))
        else:
            flash("No tiene acceso a esta usuario, debe entrar como administrado")
            return redirect(url_for('logout'))


    @classmethod
    def renderEliminaUsuario(rq, db, logged_user, user):
        error = False
        eusuario = cargaUsuario(db, user)
        if request.method == 'POST':
            error = not (eliminarUsuario(db,eusuario))
            if not (error):
                flash("Usuario eliminado con exito")

            return render_template('Ususarios.html', usuario = eusuario, error = error, agrega = False, elimina = True)
        else:
            if eusuario != ():
                return render_template('Ususarios.html', usuario = eusuario, error = False, agrega = False, elimina = True)
            else:
                return redirect(url_for('inicio'))