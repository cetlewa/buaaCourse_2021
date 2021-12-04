from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR, Integer

class StuComTea(Object):
    __tablename__ = "StuComTea"
    stuId = Column(VARCHAR(20), primary_key=True)
    comId = Column(Integer, autoincrement=True)
    teaId = Column(VARCHAR(20))