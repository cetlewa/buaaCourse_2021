from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR, Integer

class CosStuSelect(Object):
    __tablename__ = "CosStuSelect"
    csId = Column(Integer, primary_key=True, autoincrement=True)
    cosId = Column(VARCHAR(100))
    stuId = Column(VARCHAR(20))