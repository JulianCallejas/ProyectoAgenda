from datetime import date, time, timedelta, datetime


class Tarea:
    """Clase que representa a una tarea de la aplicación
    """
    def __init__(self, id_tarea:int, usuario:str,  creada_por:str, fecha:date, hora_inicio:str, hora_final:str,  titulo_tarea:str, 
                 descripcion:str,comentarios:str, estado:str, fecha_creacion:date, fecha_cierre:date, idAgenda:int) -> None:
        """Constructor de la clase tarea

        Args:
            id_tarea (int): La id de la tarea
            fecha_creacion(date): La fecha de creación de la tarea
            usuario (str): El nombre de usuario asignado a la tarea
            creada_por (str): El nombre de usuario que creo la tarea
            fecha (date): La fecha de modificación más reciente de la tarea
            hora_inicio (str): La hora de inicio de la tarea
            hora_final (str): La hora final de la tarea
            titulo_tarea (str): El titulo de la tarea
            descripcion (str): La descripción de la tarea
            comentarios (str): Los comentarios asociados a la tarea
            estado (str): El estado de la tarea
            fecha_cierre (date): La fecha en la que la tarea fue cerrada
        """
        self.__id_tarea = id_tarea
        self.__fecha_creacion = fecha_creacion
        self.__usuario = usuario
        self.__creada_por = creada_por
        self.__fecha = fecha
        self.__hora_inicio = hora_inicio
        self.__hora_final = hora_final
        self.__titulo_tarea = titulo_tarea
        self.__descripcion = descripcion
        self.__comentarios = comentarios
        self.__estado = estado
        self.__fecha_cierre = fecha_cierre
        self.__idAgenda = idAgenda 
        
    def __str__(self) -> str:
        """Retorna una cadena representativa de la tarea

        Returns:
            str: La cadena representativa de la tarea
        """
        return str(self.__id_tarea)+":"+self.__titulo_tarea+":"+self.__usuario
    
    '''
    Getters
    '''    
    
    @property
    def id_tarea(self)->int:
        """Retorna la id de la tarea

        Returns:
            int: La id de la tarea
        """
        return self.__id_tarea
    
    @property
    def fecha_creacion(self)->date:
        """Retorna la fecha de creación de la tarea

        Returns:
            date: La fecha de creación de la tarea
        """
        return self.__fecha_creacion

    @property
    def usuario(self)->str:
        """Retorna el nombre usuario que tiene asignada la tarea

        Returns:
            str: El nombre de usuario que tiene asignada la tarea
        """
        return self.__usuario

    @property
    def creada_por(self)->str:
        """Retorna el nombre de usuario que creo la tarea

        Returns:
            str: El nombr de usuario que creo la tarea
        """
        return self.__creada_por
    
    @property
    def fecha(self)->date:
        """Retorna la fecha de la ultima modificación

        Returns:
            date: La fecha de la ultima modificación
        """
        return self.__fecha
    
    @property
    def hora_inicio(self)->str:
        """Retorna la hora de inicio de la tarea

        Returns:
            time: La hora de inicio de la tarea
        """
        indice = self.__hora_inicio.find(":")
        if indice ==1: return str("0" + self.__hora_inicio)[0:5]

        return self.__hora_inicio[0:5]
    
    @property
    def hora_final(self)->str:
        """Retorna la fecha de finalización de la tarea

        Returns:
            time: La hora de finalización de la tarea
        """

        indice = self.__hora_final.find(":")
        if indice ==1: return str("0" + self.__hora_final)[0:5]

        return self.__hora_final
    
    @property
    def titulo_tarea(self)->str:
        """Retorna el titulo de la tarea

        Returns:
            str: El titulo de la tarea
        """
        return self.__titulo_tarea
    
    @property
    def descripcion(self)->str:
        """Retorna la descripción de la tarea

        Returns:
            str: La descripción de la tarea
        """
        return self.__descripcion
    
    @property
    def comentarios(self)->str:
        """Retorna los comentarios de la tarea

        Returns:
            str: Los comentarios de la tarea
        """
        return self.__comentarios
        
    @property
    def estado(self)->str:
        """Retorna el estado de la tarea

        Returns:
            str: El estado de la tarea
        """
        return self.__estado
    
    @property
    def fecha_cierre(self)->str:
        return self.__fecha_cierre


    @property
    def idAgenda(self)->int:
        """Retorna la id de la tarea

        Returns:
            int: La id de la tarea
        """
        return self.__idAgenda
    
    def compruebaHoraFinal(self):
        if self.hora_final:
            if self.hora_inicio:
                horafin= int(self.hora_final[0:2]) + float(int(self.hora_final[3:5])/60)
                horaini=int(self.hora_inicio[0:2]) + float(int(self.hora_inicio[3:5])/60)
                return False if horafin<horaini else True
            else: return False
        else: return True
        


    '''
    Setters
    '''
    
    @id_tarea.setter
    def id_tarea(self, id_tarea:int)->None:
        """Actualiza el id de la tarea

        Args:
            id_tarea (int): El nuevo id de la tarea
        """
        self.__id_tarea = id_tarea
    
    @fecha_creacion.setter
    def fecha_creacion(self, fecha_creacion:date)->None:
        """Actualiza la fecha de creación de la tarea

        Args:
            fecha_creacion (date): La fecha de creación de la tarea
        """
        self.__fecha_creacion=fecha_creacion
    
    @usuario.setter
    def usuario(self, usuario:str)->None:
        """Actualiza el usuario que tiene asignada la tarea

        Args:
            usuario (str): El nuevo usuario al que se le asigna la tarea
        """ 
        self.__usuario = usuario
    
    @creada_por.setter
    def creada_por(self, creada_por:str)->None:
        """Actualiza el usuario que creo la tarea

        Args:
            creada_por (str): El nuevo usuario que creo la tarea
        """
        self.__creada_por = creada_por
    
    @fecha.setter
    def fecha(self, fecha:date)->None:
        """Actualiza la ultima fecha de modificación de la tarea

        Args:
            fecha (date): La nueva ultima fecha de modificación de la tarea
        """
        self.__fecha = fecha
        
    @hora_inicio.setter
    def hora_inicio(self, hora_inicio:str)->None:
        """Actualiza la hora de inicio de la tarea

        Args:
            hora_inicio (time): La nueva hora de inicio de la tarea
        """
        self.__hora_inicio=hora_inicio
        
    @hora_final.setter
    def hora_final(self, hora_final:str)->None:
        """Actualiza la hora de finalización de la tarea

        Args:
            hora_final (time): La nueva hora final de la tarea
        """
        self.__hora_final = hora_final
    
    @titulo_tarea.setter
    def titulo_tarea(self, titulo_tarea:str)->None:
        """Actualiza el titulo de la tarea

        Args:
            titulo_tarea (str): El nuevo titulo de la tarea
        """
        self.__titulo_tarea = titulo_tarea
    
    @descripcion.setter
    def descripcion(self, descripcion:str)->None:
        """Actualiza la descripción de la tarea

        Args:
            descripcion (str): La nueva descripción de la tarea
        """
        self.__descripcion = descripcion
    
    @comentarios.setter
    def comentarios(self, comentarios:str)->None:
        """Actualiza los comentarios de la tarea

        Args:
            comentarios (str): Los nuevos comentarios de la tarea
        """
        self.__comentarios = comentarios
    
    @estado.setter
    def estado(self, estado:str)->None:
        """Actualiza el estado de la tarea

        Args:
            estado (str): El nuevo estado de la tarea
        """
        self.__estado = estado
    
    @fecha_cierre.setter
    def fecha_cierre(self, fecha_cierre:date)->None:
        """Actualiza la fecha de cierre de la tarea

        Args:
            fecha_cierre (date): La fecha de cierre de la tarea
        """
        self.__fecha_cierre = fecha_cierre


    @idAgenda.setter
    def idAgenda(self, idAgenda:int)->None:
        """Actualiza el id agenda

        Args:
            idAgenda (int): El nuevo id de la agenda
        """
        self.__idAgenda = idAgenda


    

