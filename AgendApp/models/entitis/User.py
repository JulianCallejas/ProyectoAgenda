from werkzeug.security import check_password_hash, generate_password_hash  #metodo para poder checar el password\
from flask_login import UserMixin

class User(UserMixin): #clase user hereda de User Mixin
    #metodo __init__ es el metodo constructor recibe el id user etc esta clase es un reflejo de la tabla user
    def __init__(self,  id, Usuario, Contrasena, Email="") -> None:
        self.id = id
        self.username = Usuario
        self.password = Contrasena
        self.fullname = Email
    @classmethod # este metodo quiero utilizarlo sin necesidad de instanciar la clase    
    def check_password(self, hashed_password, password ):#self hace referencia al propio objeto      
        return check_password_hash(hashed_password,password)
#genero el password
#print(generate_password_hash('vicio6')) 
