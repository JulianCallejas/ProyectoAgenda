from .entitis.User import User


class ModelUser():
    @classmethod
    def login(self, db, user):
        try:
            cursor=db.connection.cursor()
            #sql = "SELECT Usuario, Email, Contraseña, Administrador FROM usuario WHERE Usuario = '{}'".format(user.usuario)
            sql = """SELECT  id, usuario, contrasena, email FROM usuarios 
            WHERE usuario = '{}'""".format(user.username)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None : # si hemos encontrado un usario que exista
                user=User(row[0],row[1],User.check_password(row[2],user.password),row[3])
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
            sql = "SELECT id, Usuario, Email FROM usuarios WHERE id = {}".format(id)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None:
                return User(row[0], row[1], None, row[2])
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

          
        
