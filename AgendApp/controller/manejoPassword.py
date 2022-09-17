from werkzeug.security import check_password_hash, generate_password_hash  #metodo para poder checar el password\
from flask_login import UserMixin

class Contrasena(UserMixin): #clase Contrasena hereda de User Mixin
    #metodo __init__ es el metodo constructor recibe el id user etc esta clase es un reflejo de la tabla user
    def __init__(self,  Contrasena) -> None:
        self.password = Contrasena
        
    @classmethod # este metodo quiero utilizarlo sin necesidad de instanciar la clase    
    def check_password(self, hashed_password, password ):#self hace referencia al propio objeto      
        return check_password_hash(hashed_password,password)

    @classmethod # este metodo quiero utilizarlo sin necesidad de instanciar la clase    
    def gen_password(self, password ):#self hace referencia al propio objeto      
        return generate_password_hash(password)

#genero el password
#print(generate_password_hash('vicio6')) 
