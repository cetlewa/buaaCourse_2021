from DataBase.mysql import *
from emotionAnalysis.emotionAnalysis import *
from app import app

def init():
    Base.metadata.create_all(engine)
    # train_model()

if __name__ == '__main__':
    init()
    app.run(host='0.0.0.0', port=9000)