from DataBase.models.Object import Object
from sqlalchemy import Column, Integer, String, VARCHAR

class User(Object):
    __tablename__ = "User"
    userId = Column(VARCHAR(20), primary_key=True, autoincrement=True)
    userName = Column(VARCHAR(10), nullable=True)
    userPwd = Column(VARCHAR(32))
    userGender = Column(VARCHAR(10), nullable=True)
    userSchool = Column(VARCHAR(100), nullable=True)
    userGrade = Column(VARCHAR(100), nullable=True)
    userLocation = Column(VARCHAR(100), nullable=True)
    userTel = Column(VARCHAR(20), nullable=True)
    userMail = Column(VARCHAR(30), nullable=True)
