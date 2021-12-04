from DataBase.models.Object import Object
from sqlalchemy import Column, VARCHAR

class Teacher(Object):
    __tablename__ = "Teacher"
    teaId = Column(VARCHAR(20), primary_key=True)
    teaName = Column(VARCHAR(10), nullable=True)
    teaPwd = Column(VARCHAR(100))
    teaGender = Column(VARCHAR(10), nullable=True)
    teaTitle = Column(VARCHAR(100), nullable=True)
    teaSchool = Column(VARCHAR(100), nullable=True)
    teaTel = Column(VARCHAR(20), nullable=True)
    teaMail = Column(VARCHAR(30), nullable=True)
    teaIntro = Column(VARCHAR(255), nullable=True)