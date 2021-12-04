from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR, Integer

class StuComCos(Object):
    __tablename__ = "StuComCos"
    stuId = Column(VARCHAR(20), primary_key=True)
    comId = Column(Integer, autoincrement=True)
    cosId = Column(VARCHAR(20))