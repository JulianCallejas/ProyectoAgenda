from asyncio.windows_events import NULL
from datetime import datetime
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from model.ModelUser import ModelUser
from model.persona import Persona
from model.tarea import Tarea



def cargarTarea(db, logged_user, idtask):
        cursor=db.connection.cursor()
        sql = """CALL SP_SelectTarea ('{}',{})""".format(logged_user.usuarioCon,idtask)
        cursor.execute(sql)
        data = cursor.fetchall()
        if data:
            task = Tarea(data[0][4], data[0][5], data[0][6], data[0][7], str(data[0][8]), str(data[0][9]), data[0][10], data[0][11], data[0][12], data[0][13], data[0][14], data[0][15], data[0][3] )
        else:
            task = data
        return task

    

def actualizarTarea(db, logged_user, task):
    if not (task.compruebaHoraFinal()):
        flash("La hora final debe ser mayor a la hora inicial")
        return False
    try:
        cursor=db.connection.cursor()
        sql = """CALL SP_UpdateTareas ({},'{}','{}','{}','{}','{}','{}','{}','{}')""".format(task.id_tarea, task.fecha, task.hora_inicio, task.hora_final, task.titulo_tarea,
                                                                                             task.descripcion,task.comentarios,task.estado, task.fecha_cierre)
        cursor.execute(sql)
    except Exception as ex:
        err = str(ex)
        flash("Error: " + err)
        return False
    db.connection.commit()    
    return True


def agregarTarea(db, logged_user, task):
    if not (task.compruebaHoraFinal()):
        flash("La hora final debe ser mayor a la hora inicial")
        return False
    try:
        cursor=db.connection.cursor()
        sql = """CALL SP_CreateTareas ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}', '2099-12-31',{})""".format(task.usuario, task.creada_por, task.fecha, task.hora_inicio, task.hora_final, task.titulo_tarea,
                                                                                             task.descripcion, task.comentarios, task.estado, task.fecha_creacion, task.idAgenda)
        cursor.execute(sql)

    except Exception as ex:
        flash(str(ex))
        return False
    db.connection.commit()
    return True


def borrarTarea(db, logged_user, idtask):
    try:
        cursor=db.connection.cursor()
        sql = """CALL SP_DeleteTareas ({})""".format(idtask)
        cursor.execute(sql)

    except Exception as ex:
        flash(str(ex))
        return False
    db.connection.commit()
    return True



class taskController():
    @classmethod
    def editarTarea(rq, db,logged_user, idtask):
        task  = cargarTarea(db, logged_user, idtask)
        if task:
            error = False
            if request.method == 'POST':
                try:

                    if (logged_user.usuario == task.creada_por) or (logged_user.esAdmin):
                        task.fecha = request.form['fecha_maxima']
                        task.titulo_tarea = request.form['titulo_tarea']
                        task.descripcion = str(request.form['descripcion'])[0:254]
                    task.hora_inicio = str(request.form['hora_inicio'])
                    task.hora_final = str(request.form['hora_final'])
                    task.comentarios = request.form['comentarios']
                    if task.estado != request.form['estado']:
                        task.estado = request.form['estado']
                        task.fecha_cierre = datetime.now()

                except Exception as ex:
                    error = True
                    flash("Error al cargar los datos del formulario")
                    flash(str(ex))
                    return render_template('NewTask.html', task = task, error = error, accion ="editar")

                error = not (actualizarTarea(db,logged_user, task))
                if not error:
                    flash("Tarea actualizada correctamente")

                return render_template('NewTask.html', task = task, error = error, accion ="editar")

            else:
                return render_template('NewTask.html', task = task, error = error, accion ="editar")
        else:
            return redirect(url_for('inicio'))


    @classmethod
    def crearTarea(rq, db,logged_user):
        error = False
        if request.method == 'POST':
            try:
                fecha = request.form['fecha_maxima']
                titulo_tarea = request.form['titulo_tarea']
                descripcion = str(request.form['descripcion'])[0:254]
                hora_inicio = str(request.form['hora_inicio'])
                hora_final = str(request.form['hora_final'])
                comentarios = request.form['comentarios']
                task = Tarea(0, logged_user.usuarioCon, logged_user.usuario, fecha, hora_inicio, hora_final, titulo_tarea, descripcion, comentarios, "Pendiente", datetime.now().date(), NULL, logged_user.agenda)
            except Exception as ex:
                error = True
                flash(str(ex))
            else:
                error = not (agregarTarea(db, logged_user, task))
                if not error:
                    flash("Tarea creada exitosamente")
            return render_template('NewTask.html', task = NULL, error = error, accion ="crear", hoy=datetime.now().date(), usuario = logged_user)
        else:
            return render_template('NewTask.html', task = NULL, error = False, accion ="crear", hoy=datetime.now().date(), usuario = logged_user)



    @classmethod
    def eliminarTarea(rq, db,logged_user,idtask):
        error = False
        if request.method == 'POST':
            task  = cargarTarea(db, logged_user, idtask)
            if task:
                if (logged_user.usuario == task.creada_por) or (logged_user.esAdmin):
                    error = not (borrarTarea(db, logged_user, idtask))
                else:
                    error = True
                    flash("No tiene permisos para borrar la tarea, contacte al administrador")
            else:
                error = True
                flash("Tarea no encontrada")

            if not error:
                flash("Tarea eliminada correctamente")

        else:
            error = True
            task = NULL
            flash("Debe confirmar eliminar tarea")
        
        return render_template('NewTask.html', task = task, error = error, accion ="eliminar")