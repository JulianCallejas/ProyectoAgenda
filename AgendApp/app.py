from flask import Flask, render_template

app = Flask(__name__) #Inicializamos flask con la constate name

#Definimos la ruta principal cuando abrimos el servidor
@app.route('/')
def index():
     return render_template("index.html")

app.run(debug=True) # estamos en modo desarrollo
