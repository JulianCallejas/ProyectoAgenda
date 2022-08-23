from flask import Flask

app = Flask(__name__) #Inicializamos flask con la constate name

#Definimos la ruta principal cuando abrimos el servidor
@app.route('/')
def index():
    return '     Hola Mundo !!!!!   '

app.run(debug=True) # estamos en modo desarrollo
