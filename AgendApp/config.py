class Config:
    SECRET_KEY = 'B121212'

class DevelopmentConfig(Config):
    DEBUG=True # estamos en modo desarrollo
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'alexander..' 
    MYSQL_DB = 'agendapp'
config={
    'development':DevelopmentConfig
}    
