from DataBase.models.Object import Object
from sqlalchemy import Column, Integer, String, VARCHAR

class Student(Object):
    __tablename__ = "Student"
    stuId = Column(VARCHAR(20), primary_key=True)
    stuName = Column(VARCHAR(10), nullable=True)
    stuPwd = Column(VARCHAR(100))
    stuGender = Column(VARCHAR(10), nullable=True)
    stuSchool = Column(VARCHAR(100), nullable=True)
    stuGrade = Column(VARCHAR(100), nullable=True)
    stuLocation = Column(VARCHAR(100), nullable=True)
    stuTel = Column(VARCHAR(20), nullable=True)
    stuMail = Column(VARCHAR(30), nullable=True)
