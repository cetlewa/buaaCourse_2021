from DataBase.mysql import *
from app import app

def init():
    Base.metadata.create_all(engine)

if __name__ == '__main__':
    init()

    app.run(host='0.0.0.0', port=9000)
