from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR, Integer

class StuComTea(Object):
    __tablename__ = "StuComTea"
    stuId = Column(VARCHAR(20))
    comId = Column(Integer, primary_key=True, autoincrement=True)
    teaId = Column(VARCHAR(20))