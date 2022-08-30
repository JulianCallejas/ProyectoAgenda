from .entitis.User import User
from controller.ManejoPassword import Contrasena
from model.persona import Persona


class ModelUser():
    @classmethod
    def login(self, db, user1, passw1):
        try:
            cursor=db.connection.cursor()
            #sql = "SELECT Usuario, Email, Contraseña, Administrador FROM usuario WHERE Usuario = '{}'".format(user.usuario)
            #sql = """SELECT  id, usuario, contrasena, email FROM usuarios 
            #WHERE usuario = '{}'""".format(user.username)
            sql = """CALL SP_UserData ('{}')""".format(user1)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None : # si hemos encontrado un usario que exista
                #user=User(row[0],row[1],Contrasena.check_password(row[2],passw1),row[3])
                user = Persona(row[0], row[5], row[6], row[7], row[3], row[1],Contrasena.check_password(row[2],passw1),row[4],row[8])
                # print(repr(user))
                #user = User(row[0], row[1], User.check_password(row[2], user.password), row[3])
                return user
            else:
                return None 

        except Exception as ex:
            raise Exception(ex)   


    @classmethod
    def get_by_id(self, db, id):
        try:
            cursor = db.connection.cursor()
            #sql = "SELECT id, username, fullname FROM user WHERE id = {}".format(id)
            #sql = "SELECT id, Usuario, Email FROM usuarios WHERE id = {}".format(id)
            sql = """CALL SP_UserDataById ('{}')""".format(id)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None:
                return Persona(row[0], row[5], row[6], row[7], row[3], row[1], None ,row[4],row[8])
                #return User(row[0], row[1], None, row[2])

            else:
                return None
        except Exception as ex:
            raise Exception(ex)

          
        
