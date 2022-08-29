from flask import Flask, flash, redirect, render_template, request, redirect, url_for
from config import config  # importamos la configurtacion
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user, logout_user, login_required


# Modelos:
from models.ModelUser import ModelUser

# Entidades:
from models.entitis.User import User


app = Flask(__name__)  # Inicializamos flask con la constate name
db = MySQL(app)
csrf = CSRFProtect()

login_manager_app = LoginManager(app)


@login_manager_app.user_loader
def load_user(id):
    return ModelUser.get_by_id(db, id)


@app.route('/')
def index():
    return redirect(url_for('login'))

# Definimos la ruta principal cuando abrimos el servidor


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # print(request.form['username'])
        # print(request.form['password'])
        user = User(0,request.form['username'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.password:
                #login_user(logged_user)
                print('ingreso')
                login_user(logged_user)
                return redirect(url_for('home'))

            else:
                flash("Clave Invalida...")
                return render_template('login.html')
        else:
            flash("Usuario no encontrado...")
            #print('no se encontro usuario')
            return render_template('login.html')
    else:
        return render_template('login.html')


@app.route ('/logout')
def logout():
    logout_user()
    return redirect(url_for('login'))  


@app.route('/home')
@login_required        
def home():
    return render_template('escritorio.html')

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
