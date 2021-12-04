HOST = '81.70.17.32'
PORT = '3306'
DATABASE = 'buaa_course'
USERNAME = 'andoridDev'
PASSWORD = 'andorid'

DB_URI = "mysql+pymysql://{username}:{password}@{host}:{port}/{db}?charset=utf8".format(username=USERNAME,password=PASSWORD, host=HOST,port=PORT, db=DATABASE)

SQLALCHEMY_DATABASE_URI = DB_URI
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ECHO = True