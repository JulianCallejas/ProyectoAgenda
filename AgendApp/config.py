class Config:
    SECRET_KEY = 'B121212'

class DevelopmentConfig(Config):
    DEBUG=True # estamos en modo desarrollo
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'agendapp'
    MYSQL_PASSWORD = 'agendapp1' 
    MYSQL_DB = 'agendapp'
    MYSQL_PORT = 3307
config={
    'development':DevelopmentConfig
}    
