from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR

class CosTea(Object):
    __tablename__ = "CosTea"
    cosId = Column(VARCHAR(100), primary_key=True)
    teaId = Column(VARCHAR(20))