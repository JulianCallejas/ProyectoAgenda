from asyncio.windows_events import NULL
from os import get_terminal_size
from xmlrpc.client import Boolean, boolean
from model.agenda import Agenda
from flask_login import UserMixin



class Persona(UserMixin): #clase Persona hereda de User Mixin:
    """Clase que representa a una persona
    """
    def __init__(self, id:str, id_persona:str, nombres:str, apellidos:str, email:str, usuario:str, contrasena:str, esAdmin:int, cargo:str) -> None:
        """Constructor de la clase persona

        Args:
            id_persona (str): La identificación de la persona
            nombres (str): Los nombres de la persona
            apellidos (str): Los apellidos de la persona
            email (str): El email de la persona
            usuario (str): El usuario de la persona
            contrasena (str): La contraseña del usuario
            tareas (list): Las tareas que tiene la persona
            agenda (int): La agenda de la persona
        """
        self.id = id
        self.__id_persona = id_persona
        self.__nombres = nombres
        self.__apellidos = apellidos
        self.__email = email
        self.__usuario = usuario
        self.__contrasena = contrasena
        self.__esAdmin = esAdmin
        self.__cargo = cargo
        self.__usuarioCon = usuario


        self.__tareas = []
        self.__agenda = 0
        
    def __str__(self) -> str:
        """Método que retorna la cadena representativa de la persona

        Returns:
            str: Una cadena conformada por la identificación, nombres y apellidos de la persona
        """
        return self.__id_persona+":"+self.__nombres+":"+self.__apellidos
        
    '''
    Getters
    '''
    
    @property
    def id_persona(self)->str:
        """Retorna la identificación de la persona

        Returns:
            str: La identificación de la persona
        """
        return self.__id_persona
    
    @property
    def nombres(self)->str:
        """Retorna los nombres de la persona

        Returns:
            str: Los nombres de la persona
        """
        return self.__nombres
    
    @property
    def apellidos(self)->str:
        """Retorna los apellidos de la persona

        Returns:
            str: Los apellidos de la persona
        """
        return self.__apellidos
    
    @property
    def nombreCompleto(self)->str:
        """Retorna los nombres de la persona

        Returns:
            str: Los nombres de la persona
        """
        return self.__nombres + " " + self.__apellidos

    @property
    def email(self)->str:
        """Retorna el email de la persona

        Returns:
            str: El email de la persona
        """
        return self.__email
    
    @property
    def usuario(self)->str:
        """Retorna el usuario de la persona

        Returns:
            str: El usuario de la persona
        """
        return self.__usuario

    @property
    def usuarioCon(self)->str:
        """Retorna el usuario de la persona

        Returns:
            str: El usuario de la persona
        """
        return self.__usuarioCon
    
    @property
    def contrasena(self)->str:
        """Retorna la contraseña de la persona

        Returns:
            str: La contraseña de la persona
        """
        return self.__contrasena
    
    @property
    def tareas(self)->list:
        """Retorna la lista de tareas de la persona

        Returns:
            list: La lista de tareas de la persona
        """
        return self.__tareas
    
    @property
    def esAdmin(self)->int:
        """Retorna la lista de tareas de la persona

        Returns:
            list: La lista de tareas de la persona
        """
        return int.from_bytes(self.__esAdmin, 'little') == 1
        
    @property
    def agenda(self)->int:
        """Retorna el id de la agenda asociada al usuario

        Returns:
            int: id de la agenda asociada al usuario
        """
        return self.__agenda
    

    @property
    def cargo(self)->str:
        """Retorna la lista de tareas de la persona

        Returns:
            list: La lista de tareas de la persona
        """
        return self.__cargo



    '''
    Setters
    '''
    
    @id_persona.setter
    def id_persona(self, id_persona:str)->None:
        """Actualiza la identificación de la persona

        Args:
            id_persona (str): La nueva identificación de la persona
        """
        self.__id_persona = id_persona
    
    @nombres.setter
    def nombres(self, nombres:str)->None:
        """Actualiza los nombres de la persona

        Args:
            nombres (str): Los nuevos nombres de la persona
        """
        self.__nombres = nombres
    
    @apellidos.setter
    def apellidos(self, apellidos:str)->None:
        """Actualiza los apellidos de la persona

        Args:
            apellidos (str): Los nuevos apellidos de la persona
        """     
        self.__apellidos = apellidos

    @email.setter
    def email(self, email:str)->None:
        """Actualiza el email de la persona

        Args:
            email (str): El nueva email de la persona 
        """
        self.__email = email
    
    @usuario.setter
    def usuario(self, usuario:str)->None:
        """Actualiza el usuario de la persona

        Args:
            usuario (str): El nuevo usuario de la persona
        """
        self.__usuario=usuario

    @usuarioCon.setter
    def usuarioCon(self, usuario:str)->None:
        """Actualiza el usuario de la persona

        Args:
            usuario (str): El nuevo usuario de la persona
        """
        self.__usuarioCon=usuario
        
    @contrasena.setter
    def contrasena(self, contrasena:str)->None:
        """Actualiza la contrasena de la persona

        Args:
            contrasena (str): La nueva contrasena de la persona
        """
        self.__contrasena = contrasena
    

    @cargo.setter
    def cargo(self, cargo:str)->None:
        """Actualiza el cargo de la persona

        Args:
            cargo (str): cargo de la persona
        """
        self.__cargo = cargo


    @tareas.setter
    def tareas(self, tareas:list)->None:
        """Actualiza las tareas del usuario

        Args:
            tareas (list): La nueva lista de tareas del usuario
        """
        self.__tareas = tareas

    @agenda.setter
    def agenda(self, agenda:int)->None:
        """Actualiza el usuario de la persona

        Args:
            usuario (str): El nuevo usuario de la persona
        """
        self.__agenda = agenda

        
        
    '''
    Métodos
    '''   
    
    def comprobarCamposCrearUsuario(self)->bool: 
        return True if (self.__id_persona and self.__usuario and self.__contrasena and self.__email) else False
    



    def log_in():
        """Permite el ingreso de la persona al sistema
        """
        pass
    
    def log_out():
        """Permite la salida de la persona del sistema
        """
        pass
    
    def agregar_tarea():
        """Agrega una nueva tarea a la persona
        """
        pass
    
    def editar_tarea():
        """Modifica una tarea de la persona
        """
        pass
    
    def eliminar_tarea():
        """Elimina una tarea de la persona
        """
        pass
    
    def actualizar_contrasena():
        """Actualiza la contraseña de la persona
        """
        pass
    
    def actualizar_datos():
        """Actualiza los datos de la persona
        """
        pass
    
#------------------------------------------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------------------------------------

class Usuario(Persona):
    """Clase que representa a un usuario básico de la aplicación

    Args:
        Persona (class): La clase padre de usuario
        
    """
    
    def __init__(self, id_persona: str, nombres: str, apellidos: str, email: str, usuario: str, contrasena: str, tareas: list, agenda:int) -> None:
        """Constructor de la clase usuario, pasa los atributos recibidos al constructor de la clase padre e inicializa su agenda

        Args:
            id_persona (str): El id del usuario
            nombres (str): Los nombres del usuario
            apellidos (str): Los apellidos del usuario
            email (str): El email del usuario
            usuario (str): El username del usuario
            contrasena (str): La contrasena del usuario
            tareas (list): La lista de tareas del usuario
            agenda (int): La agenda del usuario básico
        """
        super().__init__(id_persona, nombres, apellidos, email, usuario, contrasena, tareas)
        self.__agenda = agenda
      
    '''
    Getters
    '''   
    @property
    def agenda(self)->int:
        """Retorna la agenda del usuario

        Returns:
            Agenda: La agenda del usuario
        """
        return self.__agenda
    
    '''
    Setters
    '''
    @agenda.setter
    def agenda(self, agenda:int)->None:
        """Actualiza la agenda del usuario

        Args:
            agenda (int): La nueva agenda del usuario
        """
        self.__agenda = agenda
    
    '''
    Métodos
    '''
    
    def consultar_agenda():
        """Retorna la agenda correspondiente al usuario
        """
        pass

#------------------------------------------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------------------------------------

class Administrador(Persona):
    """Clase que representa al administrador de la aplicación

    Args:
        Persona (class): La clase padre de administrador
    """

    def __init__(self, id_persona: str, nombres: str, apellidos: str, email: str, usuario: str, contrasena: str, tareas: list, agendas:list[int]) -> None:
        """Construtor del administrador, pasa los atributos recibidos al constructor de la clase padre e inicializa la lista de agendas

        Args:
            id_persona (str): La identificación del administrador
            nombres (str): Los nombres del administrador
            apellidos (str): Los appelidos del administrador
            email (str): El correo del administrador
            usuario (str): El username del administrador
            contrasena (str): La contrase{aa del administrador
            tareas (list): La lista de tareas del administrador
            agendas (list[int]): La lista de agendas a las que tiene acceso el administrador
        """
        super().__init__(id_persona, nombres, apellidos, email, usuario, contrasena, tareas)
        self.__agendas = agendas
    
    '''
    Getters
    '''
    @property
    def agendas(self)->list[int]:
        """Retorna la lista de agendas a las que tiene acceso el administrador

        Returns:
            list[int]: La lista de agendas a las que tiene acceso el administrador
        """
        return self.__agendas
    
    '''
    Setters
    '''
    @agendas.setter
    def agendas(self, agendas:list[int])->None:
        self.__agendas = agendas

    '''
    Métodos
    '''
    
    def consultar_agenda():
        """Retorna la agenda del administrador
        """
        pass
    
    def consultar_agenda_usuario():
        """Permite consultar la agenda de un usuario determinado
        """
        pass
    
    def restaurar_contrasena_usuario():
        """Permite restaurar la contraseña de un usuario
        """
        pass
    
    def crear_usuario():
        """Crea un nuevo usuario
        """
        pass
    
    def eliminar_usuario():
        """Elimina un usuario
        """
        pass
