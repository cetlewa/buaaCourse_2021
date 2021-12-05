from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR, Integer

class CosTea(Object):
    __tablename__ = "CosTea"
    ctId = Column(Integer, primary_key=True, autoincrement=True)
    cosId = Column(VARCHAR(100))
    teaId = Column(VARCHAR(20))