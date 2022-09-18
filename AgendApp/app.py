from asyncio.windows_events import NULL
from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from config import config  # importamos la configurtacion
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user, logout_user, login_required


# Modelos:
from model.ModelUser import ModelUser

# Entidades:
#from models.entitis.User import User
from model.persona import Persona
from model.agenda import Agenda
from model.tarea import Tarea

#Controladores paginas:
from controller.login import LoginController
from controller.dashBoard import DashBoardController
from controller.adminDashboard import SettingsController
from controller.adminUsuario import editaUsuarioController, agregaUsuarioController


app = Flask(__name__)  # Inicializamos flask con la constate name
def new_func(app):
    db = MySQL(app)
    return db

db = new_func(app)
csrf = CSRFProtect()
logged_user = False

login_manager_app = LoginManager(app)
user1 = ""
passw1 = ""

@login_manager_app.user_loader
def load_user(id):
    return ModelUser.get_by_id(db, id)


@app.route('/')
def index():
    return redirect(url_for('login'))

# Definimos la ruta principal cuando abrimos el servidor


@app.route('/login', methods=['GET', 'POST'])
def login():
    global logged_user
    accion, logged_user = LoginController.loginController(db)
    return accion
   

@app.route ('/logout')
def logout():
    logout_user()
    return redirect(url_for('login'))  


@app.route('/dashBoard')
@login_required        
def dashBoard():
    global logged_user
    accion, logged_user.agenda = DashBoardController.loginController(db, logged_user)
    return accion
    #return render_template('DashBoard.html')


@app.route('/dashBoard/<string:user>')
@login_required        
def dashBoardUser(user):
    global logged_user
    logged_user.usuarioCon = user
    accion, logged_user.agenda = DashBoardController.loginController(db, logged_user)
    return accion


@app.route('/admin-dashboard', methods=['GET', 'POST'])
@login_required        
def adminDashboard():
    global logged_user
    accion = SettingsController.loginController(db, logged_user, 1)
    return accion


@app.route('/admin-dashboard/<int:pagina>', methods=['GET', 'POST'])
@login_required        
def adminDashboardPaginas(pagina):
    global logged_user
    accion = SettingsController.loginController(db, logged_user, pagina)
    return accion
  

@app.route('/agrega-usuario', methods=['GET', 'POST'])
@login_required        
def agregaUsuario():
    global logged_user
    if logged_user.esAdmin:
          accion = agregaUsuarioController.renderAgregaUsuario(db, logged_user)
          return accion
    else:
        return inicio()

@app.route('/edita-usuario/<string:user>', methods=['GET', 'POST'])
@login_required        
def editaUsuario(user):
    global logged_user
    accion = editaUsuarioController.renderEditaUsuario(db, logged_user, user)
    return accion


@app.route('/task/<string:idtask>')  
@login_required        
def task(idtask):
    global logged_user
    accion = crear-metodo-controlador-para-renderizar-la-pagina(db,logged_user,idtask)
    return accion
    

@app.route('/inicio')  
@login_required        
def inicio():
    global logged_user
    if logged_user.esAdmin:
        return adminDashboard()
    else:
        return dashBoard()
    

def status_401(error):
    return redirect(url_for('login'))
def status_404(error):
    return '<h1>Pagina no encontrada </h1>', 404        

if __name__ == '__main__':
    # esta es una forma de organizar las configuracion para desarrollo y para produccion
    app.config.from_object(config['development'])
    csrf.init_app(app)
    app.register_error_handler(401, status_401)
    app.register_error_handler(404, status_404)
    app.run()
    