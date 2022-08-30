#from model.persona import Persona
from model.tarea import  Tarea


class Agenda:
    """Clase que representa la agenda de la aplicación
    """
    def __init__(self,id_agenda:int, usuario:str, tareas:list[Tarea]) -> None:
        """Constructor de la agenda de la aplicación

        Args:
            id_agenda (int): La id de la agenda
            usuario (str): El nombre del usuario asociado a esta agenda
            tareas (list[Tarea]): La lista de tareas de la agenda
        """
        self.__id_agenda = id_agenda
        self.__usuario = usuario
        self.__tareas = tareas
        
    def __str__(self) -> str:
        """Retorna la cadena representativa de la agenda

        Returns:
            str: La cadena representativa de la agenda formada por su id y su usuario
        """
        return self.__id_agenda+":"+self.__usuario
    
    '''
    Getters
    '''
    
    @property
    def id_agenda(self)->int:
        """Retorna el id de la agenda

        Returns:
            int: Le id de la agenda
        """
        return self.__id_agenda
    
    @property
    def usuario(self)->str:
        """Retorna el nombre de usuario de la agenda

        Returns:
            str: El nombre de usuario de la agenda
        """
        return self.__usuario
    
    @property
    def tareas(self)->list[Tarea]:
        """Retorna la lista de tareas de la agenda

        Returns:
            list[Tarea]: La lista de tareas de la agenda
        """
        return self.__tareas

    '''
    Setters
    '''
    @id_agenda.setter
    def id_agenda(self, id_agenda:int)->None:
        """Actualiza la id de la agenda

        Args:
            id_agenda (int): La nueva id de la agenda
        """
        self.__id_agenda = id_agenda
    
    @usuario.setter
    def usuario(self, usuario:str)->None:
        """Actualiza el nombre usuario de la agenda

        Args:
            usuario (str): El nuevo nombre del usuario de la agenda
        """
        self.__usuario = usuario
    
    @tareas.setter
    def tareas(self, tareas:list[Tarea]):
        """Actualiza la lista de tareas de la agenda

        Args:
            tareas (list[Tarea]): La nueva lista de tareas de la agenda
        """
        self.__tareas = tareas