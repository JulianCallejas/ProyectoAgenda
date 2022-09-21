class Config:
    SECRET_KEY = 'B121212'

class DevelopmentConfig(Config):
    DEBUG=True # estamos en modo desarrollo
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = 'Felipe1148' 
    MYSQL_DB = 'agendapp'
    MYSQL_PORT = 3306
config={
    'development':DevelopmentConfig
}    
